#!/usr/bin/env python
import os
# import matplotlib.pyplot as plt
import csv
import re
import sys
import argparse
import pdb
import logging
try:
    from customDebug import *
except:
    pass
#TODO: merge main and backup altimiters
# PATH = "/Users/AMP/Desktop/AIAA/NASA 2016/Final flight data"
PATH = "/Users/AMP/Desktop/AIAA/Personal rockets/L3/L3 Flight Data"
LABELS = ['Time','Altitude','Velocity','Temperature','Voltage']
DEFAULT_OUT = 'strat_data-1.txt'
# os.chdir(PATH)

class FlightData(object):
    '''
    --------------- parseOutput
    self.apogee
    self.elevation
    self.mainSet
    self.apogeeDelay
    self.drogueTime
    self.mainTime
    self.serial
    
    self.mainAlt
    self.drogueAlt
    self.aTime
    --------------
    self.bMainSet
    self.bApogeeDelay
    self.bDrogueTime
    self.bMainTime
    self.bMainAlt
    self.bDrogueAlt
    -------------- rawData
    self.times
    self.alts
    self.vels
    self.temps
    self.volts
    -------------- Processed data
    self.maxDV
    self.groundTime
    self.vDrogue
    self.vMain
    self.maxAcc
    --------------- Fuure data
    max dV
    '''

    def __init__(self, data, outfile):
        self.__dict__.update(data)
        self.processData()
        self.out = outfile

    def processData(self):
        self.maxDV =  max(self.volts) - min(self.volts)
        self.maxV = max(self.vels)
        self.mainAlt = self.alts[self.times.index(self.mainTime)]
        self.drogueAlt = self.alts[self.times.index(self.drogueTime)]
        self.aTime = self.times[self.alts.index(self.apogee)]
        self.drogueVelc()
        self.groundHit()
        self.mainVelc()
        self.launchAcc()
        


    def unpackFlightData(self,full_data_set):
        for d in full_data_set:
            self.time,self.altitude,self.velocity,self.temperature,self.voltage = full_data_set
    
    def calculateVelocity(self, t0, t1):
        # print(self.times)
        i = self.times.index(t0)
        j = self.times.index(t1)
        avg = sum(self.vels[i:j]) / len(self.vels[i:j])
        return avg

    def launchAcc(self):
        for i in self.alts:
            if i >= 8:
                t0 = self.times[self.alts.index(i)]
                break
        self.maxAcc = self.calculateAcc(t0, self.times[self.vels.index(self.maxV)])

    def calculateAcc(self, t0, t1):
        i = self.times.index(t0)
        j = self.times.index(t1)
        return (self.vels[j] - self.vels[i]) / (t1 - t0)

    def groundHit(self):
        velLog = []
        altLog = []
        startIndex = self.times.index(self.mainTime + 1)
        i = 0
        flag = False
        for a,v in zip(self.alts[startIndex:], self.vels[startIndex:]):
            altLog.append(a)
            velLog.append(v)
            if len(altLog) > 10:
                altLog.pop(0)
                velLog.pop(0)

                # not moving, and within 10 ft of launch level
                if avg(altLog) <= 10 and avg(velLog) <= 5:
                    flag = True
                # not moving, but stuck in a tree / hill
                elif avg(velLog) <= 4 and a <= 100:
                    flag = True

                if flag:
                    self.groundTime = self.times[self.alts.index(a)]
        try:
            self.groundTime + 1
        except Exception as e:
            print('Flight stopped recording before the ground')
            print('Or rocket landed > 100 ft above the ground')
            print('Try using a different altimiter\n')
            self.groundTime = None

    def drogueVelc(self):
        t0 = self.drogueTime + 1
        t1 = self.mainTime
        self.vDrogue = self.calculateVelocity(t0, t1)

    def mainVelc(self):
        t0 = self.mainTime + 1
        if self.groundTime is not None:
            t1 = self.groundTime
        else:
            t1 = self.times[-1]
        self.vMain = self.calculateVelocity(t0, t1)

    def writeOut(self):
        with open(self.out, 'w') as f:
            f.write('{:-^80}\n'.format(' Analyzed Flight Data '))
            f.write('{:-^80}\n\n'.format(' Written by Adam Poirier'))
            f.write('{:-^60}\n'.format(' Compiled Data '))
            f.write('Apogee: {:.0f}ft, {}s\n'.format(self.apogee, self.aTime))
            f.write('Drogue deployed at: {:.0f}ft, {}s\n'.format(self.drogueAlt, self.drogueTime))
            f.write('Backup drogue at {:.0f}ft, {}s\n'.format(self.bDrogueAlt, self.bDrogueTime))
            f.write('Apogee delay: {}s\n'.format(self.apogeeDelay))
            f.write('Backup apogee delay: {}s\n'.format(self.bApogeeDelay))
            f.write('Main deployment setting: {:.0f}ft\n'.format(self.mainSet))
            f.write('Main deployed at: {:.0f}ft, {}s\n'.format(self.mainAlt, self.mainTime))
            f.write('Backup main setting: {:.0f}ft\n'.format(self.bMainSet))
            f.write('Backup main deployed at: {:.0f}ft, {}s\n'.format(self.bMainAlt, self.bMainTime))
            f.write('{:-^60}\n'.format(' Processed data '))
            f.write('Decent speed under drogue: {:.2f}ft/s\n'.format(self.vDrogue))
            f.write('Decent speed under main: {:.2f}ft/s\n'.format(self.vMain))
            f.write('Max Gs (via barometer): {:.2f}g\n'.format(self.maxAcc/32.2))
            f.write('Full flight time: {}s\n'.format(self.groundTime))
            f.write('Ground Elevation: {:.0f}ft\n'.format(self.elevation))            
            f.write('Serial number: {}\n'.format(self.serial))
            f.write('Average temperature: {}f\n'.format(avg(self.temps)))
            f.write('Nominal voltage: {}v\n'.format(avg(self.volts)))
            f.write('Max voltage drop: {}v\n'.format(self.maxDV))
    def printOut(self):
        print('{:-^80}'.format(' Analyzed Flight Data '))
        
        print('{:-^60}'.format(' Compiled Data '))
        print('Apogee: {:.0f}ft, {}s'.format(self.apogee, self.aTime))
        print('Drogue deployed at: {:.0f}ft, {}s'.format(self.drogueAlt, self.drogueTime))
        print('Backup drogue at {:.0f}ft, {}s').format(self.bDrogueAlt, self.bDrogueTime)

        print('Apogee delay: {}s'.format(self.apogeeDelay))
        print('Backup apogee delay: {}s').format(self.bApogeeDelay)

        print('Main deployment setting: {:.0f}ft'.format(self.mainSet))
        print('Main deployed at: {:.0f}ft, {}s'.format(self.mainAlt, self.mainTime))

        print('Backup main setting: {:.0f}ft').format(self.bMainSet)
        print('Backup main deployed at: {:.0f}ft, {}s'.format(self.bMainAlt, self.bMainTime))
        print('{:-^60}'.format(' Processed data '))
        print('Decent speed under drogue: {:.2f}ft/s'.format(self.vDrogue))
        print('Decent speed under main: {:.2f}ft/s'.format(self.vMain))
        print('Max Gs (via barometer): {:.2f}g'.format(self.maxAcc/32.2))

        print('Full flight time: {}s'.format(self.groundTime))
        print('Ground Elevation: {:.0f}ft'.format(self.elevation))            
        print('Serial number: {}'.format(self.serial))
        print('Average temperature: {}f'.format(avg(self.temps)))
        print('Nominal voltage: {}v'.format(avg(self.volts)))
        print('Max voltage drop: {}v').format(self.maxDV)
        print('\n\n{:-^80}'.format(' Written by Adam Poirier'))

            # print('Apogee: {}'.format(self.apogee))
            # print('Apogee: {}'.format(self.apogee))
            # print('Apogee: {}'.format(self.apogee))

    def anomolousDeployment(self):
        # FUTURE:
        # detect large pressure drops, compare to known deployments, and characterize them
        # determine if motor charges or some other anomolous event
        pass

        
# argument parser class
class Args(object):
    def __init__(self):
        prog = 'AIAA Strat Analyzer'
        description = 'Post processing program for strat output'
        iHelp = 'Input one or more flight files, all will be handled seperately'
        mHelp = 'Input the main Strat (main controls primary charges)'
        bHelp = 'Input the backup Strat (backups usually have altitude delays)'
        helpDesc = 'Use -i to process several independent files, \
                    or -m and -b to process main and backups for one flight'
        oHelp = 'Define an output file for saving data'


        self.arg_parser = argparse.ArgumentParser(description=description, prog = prog, add_help=False)
        
        dafaults = self.arg_parser.add_argument_group('Default Args', '')
        mainBackup = self.arg_parser.add_mutually_exclusive_group(required=True)
        
        dafaults.add_argument('-h', '--help', action='help', help= iHelp)
        mainBackup.add_argument('-i', '--input', nargs = '+', type=str, help= iHelp)
        mainBackup.add_argument('-m', '--main', type = str, help= mHelp)
        dafaults.add_argument('-b', '--backup', type = str, help= iHelp)
        dafaults.add_argument('-o', '--out', type=str, default=DEFAULT_OUT, help=oHelp)
        dafaults.add_argument('-l', '--log', action='store_true')
        dafaults.add_argument('-p', '--plot', action='store_true')
        
        # TODO: Working on log file useage
        # with args.file as file: ...

    def parse(self):
        return self.arg_parser.parse_args()


def avg(lst):
    return sum(lst) / len(lst)

def get_intent():
    while True:
        try:
            ans = int(input('Press (1) for All files in folder, or (2) to select the files: '))
        except Exception as e:
            print('Please enter a number')
        if ans == 1 or ans == 2:
            return(ans)
            break
        else:
            print('Please follow instructions better')

def get_files():
    intent = get_intent()
    folder_files = [i.name for i in os.scandir() if not i.name.startswith('.') and i.is_file]
    if intent == 2:
        print('\nEnter the files you want to plot seperated by commas')
        print('Example:  1,4,6  will select files 1, 4, and 6')
        for i,ide in enumerate(folder_files): 
            print('{0}: {1}'.format(i+1,ide))
        while True:
            try:
                resp = str(input('Select the indexes you want: '))
                parsed = [int(i) for i in resp.split(',')]
                if set(parsed) < set(range(len(folder_files)+1)):
                    return [folder_files[i] for i in parsed]
                else:
                    print('Please enter an index number within range: ')
                
            except Exception as e:
                print('please enter a number')
                print(e)
    elif intent == 1:

        return folder_files



def parseRaw(fData):
    """Parses a sL output file to gather outputs"""
    apogee      = float(re.search(r'(?<=Apogee: )\d+', fData).group(0))
    elevation   = float(re.search(r'(?<=Elevation: )-?\d+', fData).group(0))
    mainSet     = float(re.search(r'(?<=Main Setting: )\d+', fData).group(0))
    apogeeDelay = float(re.search(r'(?<=Delay: )\d+', fData).group(0))
    drogueTime  = float(re.search(r'(?<=Drogue At: )\d+(\.\d*)?', fData).group(0))
    mainTime    = float(re.search(r'(?<=Main At: )\d+(\.\d*)?', fData).group(0))
    serial      = float(re.search(r'(?<=Serial Number: )\d+', fData).group(0))
    samps       = float(re.search(r'(?<=NumSamps: )\d+', fData).group(0))

    outs = {k:v for k,v in locals().items() if k is not 'fData'}

    # Parse the raw outputs
    times, alts, vels, temps, volts = [], [], [], [], []
    if re.findall('(\n)', fData) > re.findall('(\r)', fData):
        delim = '\n'
    else:
        delim = '\r'

    for line in fData.split(delim):
        if len(line.split(',')) == 5:
            dLine = line.split(',')
            try:
                times.append(float(dLine[0]))
                alts.append(float(dLine[1]))
                vels.append(float(dLine[2]))
                temps.append(float(dLine[3]))
                volts.append(float(dLine[4]))
            except:
                pass
    raws =  {'times': times, 'alts':alts, 'vels':vels, 'temps':temps, 'volts':volts} 
    outs.update(raws)

    return outs


def parseOutput(fData):
    apogee      = float(re.search(r'(?<=Apogee: )\d+', fData).group(0))
    elevation   = float(re.search(r'(?<=Elevation: )-?\d+', fData).group(0))
    mainSet     = float(re.search(r'(?<=Main Setting: )\d+', fData).group(0))
    apogeeDelay = float(re.search(r'(?<=Delay: )\d+', fData).group(0))
    drogueTime  = float(re.search(r'(?<=Drogue At: )\d+(\.\d*)?', fData).group(0))
    mainTime    = float(re.search(r'(?<=Main At: )\d+(\.\d*)?', fData).group(0))
    serial      = float(re.search(r'(?<=Serial Number: )\d+', fData).group(0))

    retData = {k:v for k,v in locals().items() if k is not 'fData'}
    return retData

def mergeData(main, backup, out):
    main['apogee'] = int((main['apogee'] + backup['apogee']) / 2)
    main['elevation'] = int((main['elevation'] + backup['elevation']) / 2)
    # main['bMainSet'] = min(main['mainSet'], backup['mainSet'])
    # main['bApogeeDelay'] = max(main['apogeeDelay'], backup['apogeeDelay'])
    main['bMainSet'] = backup['mainSet']
    main['bApogeeDelay'] = backup['apogeeDelay']
    main['bDrogueTime'] = backup['drogueTime']
    main['bMainTime'] = backup['mainTime']

    # if the backup altimeter has more data, use it
    if backup['samps'] > main['samps'] + 50:
        i = len(main['times'])
        # may be discontinuities in data sets (besides time), but it's alright
        main['times']   += backup['times'][i:]
        main['alts']    += backup['alts'][i:]
        main['vels']    += backup['vels'][i:]
        main['temps']   += backup['temps'][i:]
        main['volts']   += backup['volts'][i:]
        main['samps'] = len(main['times'])

    main['bMainAlt'] = backup['alts'][backup['times'].index(backup['mainTime'])]
    main['bDrogueAlt'] = backup['alts'][backup['times'].index(backup['drogueTime'])]

    return FlightData(main, out)


def processInputs(inFiles, out):
    fData = []

    for file in inFiles:
        with open(file, 'r') as f:
            file_data = f.read()

        parsedData = parseRaw(file_data)
        parsedData['bMainSet'] = None
        parsedData['bApogeeDelay'] = None
        parsedData['bDrogueTime'] = None
        parsedData['bMainTime'] = None
        parsedData['bMainAlt'] = None
        parsedData['bDrogueTime'] = None
        fData.append(FlightData(parsedData, out))
        # TODO: fix this so that the out file is right
        fData[-1].printOut()
        fData[-1].writeOut()
    pass

def processMain(main, backup, out):
    with open(main, 'r') as f:
        mainText = f.read()
    with open(backup, 'r') as f:
        backupText = f.read()

    mainRaw = parseRaw(mainText)
    backupRaw = parseRaw(backupText)

    # mainData = FlightData(mainRaw)
    # backupData = FlightData(backupRaw)

    data = mergeData(mainRaw, backupRaw, out)
    data.printOut()
    data.writeOut()

def outName(gOut):
    if gOut == DEFAULT_OUT:
        files = os.listdir(os.getcwd())
        nums = [int(x.split('-')[-1][:-4]) for x in files if x.startswith(DEFAULT_OUT[:-6])]
        if nums != []:
            out = DEFAULT_OUT[:-6] + '-' + str(max(nums) + 1) + '.txt'
        else:
            out = args.out
    else:
        if not gOut.lower().endswith('.txt'):
            out = gOut + '.txt'
        else:
            out = gOut
    out = os.path.expanduser(out)
    return out

def main():
    out = outName(args.out)

    # file_data = get_files()
    if args.input:
        processInputs(args.input, out)    
    else:
        if not args.backup:
            print('Please include the backup altimeter with the -b <file> argument')
            exit()
        processMain(args.main, args.backup, out)

    
    # print(data)
    # decentRate(parsed_data, addData)

    # plotter(parsed_data)



def oldQ():
    files = [x.name for x in os.scandir(PATH) if x.name[0] == 'X']
    lil = [ [] for x in files]
    for ind,i in enumerate(files):
        with open(i) as f:
            reader = csv.reader(f)
            for lineNum,line in enumerate(reader):
                lil[ind].append(line[1])
    maxes = [max(i) for i in lil]
    # x = [range(i) for i in lil]
    # y = [[]for i in lil]


    # for ind,i in enumerate(lil):
        # x[ind] = range(i)
        
    # for ind,o in enumerate(x):
    #     plt.plot(x[ind],lil[ind],label=files[ind])
    # plt.legend()
    # plt.show()
if __name__ == '__main__':
    print('')
    args = Args().parse()
    if args.log:
        logging.basicConfig(filename='log.log', level=logging.INFO, filemode='w')

    if args.plot:
        try:
            import matplotlib.pyplot as plt
        except:
            print('Error: do not have matplotlib installed')
            print('use "pip install matplotlib" to install')
            exit()

    main()
''' 
Unit curve creation tool
Author: Adam Poirier

Current functionality: converts thrust curves into unit thrust curves, for scaling curve to fit different impulses

later will be used to scale selected curves to specified impulse

ISTRUCTIONS:

python3 thrustTool.py -i path/to/file 



'''


import os
import pdb
import argparse
import copy
import re

try:
    import matplotlib.pyplot as plt
    pplt = True
except:
    pplt = False

TARGET_IMPULSE = 21000

impulsePerCubicInch = 21000 / 500
implusePerInch = 21000 / 48
impulsePerKg = 1927
casingMass = 3.5
casingMassPerInch = 3.5 / 48
effciency = .9

oPath = 'origCurves/'
name = 'O3400-IM-XX.txt'
fname = os.path.join(oPath, name)

# DIRECTORIES
unitFolder = 'UnitCurves/'
scaledFolder = 'ScaledCurves/'


# Main Required inputs
fHelp = '-f File location of the main motor file to parse'
mHelp = '-m list of motors to parse and scale — NOTE, if dashes in name, put motor in quotes, “J357-P”'
aHelp = '-a Assemble motor into one single motor file'

# OTIONALS:
oHelp = '-o <fileName.txt> Specify output name and location to put files'
tHelp = '-t <inpulse> Specify the target impulse in newton seconds'
sHelp = '-s <scale>  number to scale the time domain by (i.e 1.25'
dHelp = '-d <duration>   number of seconds for the motor to burn — don’t use with -s'
uHelp = '-u  toggle saving unit thrust curves as well. Default option is false'



iHelp = '''Alternate usage (can still be used with main usage)
-i <motorFile.txt Motor2.txt ext.txt>   Input several individual motor files to process. ONLY 1 PER FILE'''
nHelp = 'Name of master file to append to'

# Program arguments
parser = argparse.ArgumentParser(description = 'Main usage: python thrustTool.py -f raspMotorFile.eng -m J357 L1115 -a')
parser.add_argument('-i', '--input', type=str, nargs = '+', required = False, help = iHelp)
parser.add_argument('-m', '--motors', type=str, nargs = '+', help = mHelp)
parser.add_argument('-f', '--file', type=str, help = fHelp)
parser.add_argument('-t', '--target_impulse', type=float, default = TARGET_IMPULSE, help = tHelp)
parser.add_argument('-d', '--duration', type=float, default = 0, help = dHelp)
parser.add_argument('-s', '--scale', type=float, default = 1, help = sHelp)       # time wise
parser.add_argument('-a', '--append', action = 'store_true', default = False, help = aHelp)       # append all of the motors into one file
parser.add_argument('-u', '--unit', action = 'store_true', default = False, help = uHelp)       # append all of the motors into one file
parser.add_argument('-n', '--name', type=str, help = nHelp)   # name of master file to append to
# parser.add_argument('-f', '--file-name', default='processed_ras.txt')
parser.add_argument('-o', '--out', type=str, default='', help = oHelp)
# parser.add_argument('-l', '--legacy', action = 'store_true')
args = parser.parse_args()


if not os.path.exists(unitFolder):
    os.mkdir(args.out)

if not os.path.exists(scaledFolder):
    os.mkdir(scaledFolder)



def makeMotorFile(comments, dataLine, times, thrusts, unit = False):
        ret = ''
        ret += '\n'.join(comments) + '\n'
        ret += dataLine
        if unit:
            ret += '\n'.join(['{0} {1}'.format(x,y) for x,y in zip(times, thrusts)])
        else:
            ret += '\n'.join(['{0:.2f} {1:.2f}'.format(x,y) for x,y in zip(times, thrusts)])
        ret += '\n;\n'
        return ret


def newDataLineBuilder(oirgName, diam = 98, length = 1810, pMass = 1, tMass = 4.5, manu = 'Karman_AIAA', unitBool = False):
    # create a new data line with the new information
    # newDataLine = copy.copy(infoLine)
    newDataLine = []
    if unitBool:
        oirgName = 'UNIT-CURVE-' + oirgName

    return '{} {:.0f} {:.0f} P {:.3f} {:.3f} {}\n'.format(oirgName, diam, length, pMass, tMass, manu)




def parseMotor(data):
    fLine = True
    times = []
    thrusts = []
    comments = []
    onComment = True

    # parse the data from the file, gather the comments and separate them along with the info line
    for line in data.split('\n'):
        if (line == '' or line == ' ' or line == '\n') and fLine == False:
            break
        if line.strip(' ').startswith(';'):
            comments.append(line.strip(' '))
        else:
            if fLine:
                onComment = False
                infoLine = line.strip(' ').split(' ')
                fLine = False
                # print(line)
            else: 
                # print(line)
                
                x,y = line.strip(' ').split(' ')
                times.append(float(x))
                thrusts.append(float(y))
        
            
    
    return comments, infoLine, times, thrusts



# grabs the motor data from the file
# matches anything after the supplie motor file, i.e. :
# 'O3400' will match both 'O3400' and 'O3400-IM', but 'O3400-IM' wont match 'O3400'
def returnMotors(fullFile):
    motorFiles = []
    for motor in args.motors:
        motorFiles += re.findall(r'^' + re.escape(motor) + '.*?(?=;)', fullFile, re.MULTILINE | re.DOTALL)

    return motorFiles
        
        


# trapezoidal integration
def integrate(x, y):
    result = 0

    for i in range(len(x) - 1):
        result += (x[i+1] - x[i]) * (y[i] + y[i+1]) / 2
    return result

# unit impulse curve is determined by dividing thrust values by total impulse
def returnUnitValues(x, y):
    integral = integrate(x,y)
    unitYs = [yy / integral for yy in y]
    return unitYs


# process and individual motor
def processIMotor(allMotorStings):
    scaledWriteable = ''    # a combined output

    for inputData in allMotorStings:


        comments, infoLine, times, thrust = parseMotor(inputData)

        # scale the time - before integration for proper unit conversions
        if args.duration != 0:
            scale = duration / max(times)
        else:
            scale = args.scale   

        times = [x * scale for x in times]

        unitThrust = returnUnitValues(times, thrust)



        if args.unit:
            # create a new data line with the new information
            # newDataLine = copy.copy(infoLine)
            ndl = newDataLineBuilder(infoLine[0], 98, 1828, 1, 3.5)

            # a comment to be inserted
            insertText = ';Unit Thrust Curve - multiply each thrust by desired impulse for integral to equal impulse\n'

            # build the return string for the unit thrust curve
            unitFile = makeMotorFile(comments, ndl, times, unitThrust, unit = True)

            # handle the data output
            unitName = unitFolder + 'unit-' + infoLine[0]
            with open(unitName, 'w') as f:
                f.write(unitFile)

        # ========================
        # scaling to specified

        thrustScaled = [ x * args.target_impulse for x in unitThrust]
        
        propMass = TARGET_IMPULSE / impulsePerKg
        newLength = (TARGET_IMPULSE / implusePerInch) * 25.4
        casingMass = casingMassPerInch * (newLength / 25.4)
        totalMass = casingMass + propMass
        
      
        sdl = newDataLineBuilder('Scaled-' + infoLine[0], 98, newLength, propMass, totalMass)

        scaledOutput = makeMotorFile(comments, sdl, times, thrustScaled)
        
        # Don't make spparate files if you're appending the file
        if not args.append:
            fnameScaled = scaledFolder + infoLine[0] + '-ScaledTo-{:.0f}.txt'.format(TARGET_IMPULSE)
            engScaled = fnameScaled[:-4] + '.eng'

            with open(fnameScaled, 'w') as f:
                f.write(scaledOutput)

            with open(engScaled, 'w') as f:
                f.write(scaledOutput)

        scaledWriteable += scaledOutput

        
        # Save images
        if pplt:
            plt.plot(times, thrustScaled)
            plt.xlabel('Time (s)')
            plt.ylabel('Thrust (N)')
            plt.title('Thrust curve for {} scaled to {:.2f} ns'.format(infoLine[0], TARGET_IMPULSE))
            plt.savefig(scaledFolder + infoLine[0] + '-to-{:.0f}.png'.format(TARGET_IMPULSE))
            plt.clf()


        print('Unit and thrust curves exported successful for: ' + infoLine[0])





    if args.append:
        appendFileName = args.out if args.out != '' else scaledFolder + 'KarmanMaster-{:.0f}-impulse.txt'.format(TARGET_IMPULSE)
        appendFileName = appendFileName +'.txt' if not appendFileName.lower().endswith('.txt') else appendFileName
        
        with open(appendFileName, 'w') as f:
            f.write(scaledWriteable)

        with open(appendFileName[:-4] + '.eng', 'w') as f:
            f.write(scaledWriteable)



def main():
    # list of motor data file strings
    print('Thrust curve generation tool\n')
    print('Processing input files')


    motorData = []
    if args.input:
        for ff in args.input:
            print('Processing ' + ff)
            with open(ff, 'r') as f:
                motorData.append(f.read())
    
    if args.file:
        with open(args.file, 'r') as f:
            data = f.read()

        motorData += returnMotors(data)

    processIMotor(motorData)
    
main()



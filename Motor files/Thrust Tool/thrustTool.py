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


# Program arguments
parser = argparse.ArgumentParser(description = 'Parsing stuff')
parser.add_argument('-i', '--input', type=str, nargs = '+', required = True, help = 'Input the name of the file with "-i path/to/filename.txt"')
parser.add_argument('-t', '--target_impulse', type=float, default = TARGET_IMPULSE)
parser.add_argument('-d', '--duration', type=float, default = 0)
parser.add_argument('-s', '--scale', type=float, default = 1)       # time wise
# parser.add_argument('-f', '--file-name', default='processed_ras.txt')
parser.add_argument('-o', '--out', type=str, default='UnitCurves/', help = 'output folder, optional')
# parser.add_argument('-l', '--legacy', action = 'store_true')
args = parser.parse_args()


if not os.path.exists(args.out):
    os.mkdir(args.out)




def writeFile(comments, dataLine, times, thrusts, unit = False):
        ret = ''
        ret += '\n'.join(comments) + '\n'
        ret += dataLine
        if unit:
            ret += '\n'.join(['{0} {1}'.format(x,y) for x,y in zip(times, thrusts)])
        else:
            ret += '\n'.join(['{0:.2f} {1:.2f}'.format(x,y) for x,y in zip(times, thrusts)])
        ret += '\n;\n'
        return ret


def newDataLineBuilder(oirgName, diam = 98, length = 1810, pMass = 1, cMass = casingMass, manu = 'Karman_AIAA', unitBool = False):
    # create a new data line with the new information
    # newDataLine = copy.copy(infoLine)
    newDataLine = []
    if unitBool:
        oirgName = 'UNIT-CURVE-' + oirgName

    return '{} {:.0f} {:.0f} P {:.3f} {:.3f} {}\n'.format(oirgName, diam, length, pMass, cMass, manu)
    
    #     newDataLine.append(oirgName)
    # newDataLine.append(diam)            # diameter in mm
    # newDataLine.append(length)          # length in mm
    # newDataLine.append('P')             # delay
    # newDataLine.append(pMass)            # prop mass
    # newDataLine.append(cMass)           # casing mass
    # newDataLine.append(namu + '\n')      # manufacturer
    # return = ' '.join(newDataLine)             # join the line with spaces






for inputFile in args.input:


    # read the data
    with open (inputFile, 'r') as f:
        data = f.read()
        # pdb.set_trace()


    fLine = True
    times = []
    thrust = []
    comments = []


    # parse the data from the file, gather the comments and separate them along with the info line
    for line in data.split('\n'):
        if not line.strip(' ').startswith(';'):
            if fLine:
                infoLine = line.strip(' ').split(' ')
                fLine = False
                # print(line)
            else: 
                # print(line)
                x,y = line.strip(' ').split(' ')
                times.append(float(x))
                thrust.append(float(y))
        else:
            comments.append(line.strip(' '))


    # scale the time - before integration for proper unit conversions
    if args.duration != 0:
        scale = duration / max(times)
    else:
        scale = args.scale   

    times = [x * scale for x in times]


    # Trapezoidal integration 
    impulse = 0

    for i in range(len(times) - 1):
        impulse += (times[i+1] - times[i]) * (thrust[i] + thrust[i+1]) / 2


    # create the unit impulse by dividing the thrust by the total impulse
    unitThrust = [t / impulse for t in thrust]


    # create a new data line with the new information
    # newDataLine = copy.copy(infoLine)

    ndl = newDataLineBuilder(infoLine[0], 98, 1828, 1, 3.5)

    # a comment to be inserted
    insertText = ';Unit Thrust Curve - times each thrust by desired impulse for integral to equal impulse\n'

    # build the return string for the unit thrust curve
    ret = writeFile(comments, ndl, times, unitThrust, unit = True)

    # handle the data output
    outName = args.out + 'unit-' + os.path.basename(inputFile)
    with open(outName, 'w') as f:
        f.write(ret)

    # ========================
    # scaling to specified

    thrustScaled = [ x * args.target_impulse for x in unitThrust]
    
    propMass = TARGET_IMPULSE / impulsePerKg
    casingMass = newLength / casingMassPerInch
    newLength = (TARGET_IMPULSE / implusePerInch) * 25.4
  
    sdl = newDataLineBuilder('Scaled-' + infoLine[0], 98, newLength, propMass, casingMass)

    scaledOutput = writeFile(comments, sdl, times, thrustScaled)
    
    fnameScaled = args.out + 'ScaledTo-{:.0f}-from-'.format(TARGET_IMPULSE) + os.path.basename(inputFile)

    with open(fnameScaled, 'w') as f:
        f.write(scaledOutput)


    # 
    print('Unit and thrust curves exported successful')

    # TODO: write log file




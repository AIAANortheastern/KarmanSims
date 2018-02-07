''' 
Unit curve creation tool
Author: Adam Poirier

Current functionality: converts thrust curves into unit thrust curves, for scaling curve to fit different impulses

later will be used to scale selected curves to specified impulse


'''


import os
import pdb
import argparse
import copy


TARGET_IMPULSE = 21000

impulsePerCubicInch = 5
implusePerInch = 437
impulsePerKg = 1000
casingMass = 2


oPath = 'origCurves/'
name = 'O3400-IM-XX.txt'
fname = os.path.join(oPath, name)


# Program arguments
parser = argparse.ArgumentParser(description = 'Parsing stuff')
parser.add_argument('-i', '--input', type=str, required = True, help = 'Input the name of the file with "-i path/to/filename.txt"')
parser.add_argument('-t', '--target-impulse', type=float, default = TARGET_IMPULSE)
# parser.add_argument('-f', '--file-name', default='processed_ras.txt')
parser.add_argument('-o', '--out', type=str, default='UnitCurves/', help = 'output folder, optional')
# parser.add_argument('-l', '--legacy', action = 'store_true')
args = parser.parse_args()


if not os.path.exists(args.out):
    os.mkdir(args.out)


# read the data
with open (args.input, 'r') as f:
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


# Trapezoidal integration 
impulse = 0
for i in range(len(times) - 1):
    impulse += (times[i+1] - times[i]) * (thrust[i] + thrust[i+1]) / 2


# create the unit impulse by dividing the thrust by the total impulse
unit = [t / impulse for t in thrust]


# create a new data line with the new information
newDataLine = copy.copy(infoLine)
newDataLine.append('UNIT-CURVE-' + infoLine[0])
newDataLine.append('98')            # diameter in mm
newDataLine.append('1828')          # length in mm
newDataLine.append('P')             # delay
newDataLine.append('01')            # prop mass
newDataLine.append('3.5')           # casing mass
newDataLine.append('Karman_AIAA\n')      # manufacturer
ndl = ' '.join(newDataLine)             # join the line with spaces

# a comment to be inserted
insertText = ';Unit Thrust Curve - times each thrust by desired impulse for integral to equal impulse\n'

# build the return string for the unit thrust curve
ret = ''
ret += '\n'.join(comments) + '\n'
ret += ndl
ret += '\n'.join(['{0} {1}'.format(x,y) for x,y in zip(times, unit)])
ret += '\n;\n'

# handle the data output
outName = args.out + 'unit-' + os.path.basename(args.input)
with open(outName, 'w') as f:
    f.write(ret)



# 
print('\n Original Impulse: {:.2f}'.format(impulse))
print('Unit curve exported successful. File: {}'.format(outName))

# unit = thrust / impulse



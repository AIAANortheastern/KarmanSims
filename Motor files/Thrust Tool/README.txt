How to use thrustTool.py


EDIT: 

The important bits:

python thrustTool.py -f raspMotorFile.eng -m J357 L1115 -a

-f File location of the main motor file to parse
-m list of motors to parse and scale — NOTE, if dashes in name, put motor in quotes, “J357-P”
-a Assemble motor into one single motor file

OTIONALS:
-o <fileName.txt> Specify output name and location to put files
-t <inpulse> Specify the target impulse in newton seconds
-s <scale>	number to scale the time domain by (i.e 1.25
-d <duration> 	number of seconds for the motor to burn — don’t use with -s
-u 	toggle saving unit thrust curves as well. Default option is false
-h 	Display help message and exit 


Alternate usage (can still be used with main usage)
-i <motorFile.txt Motor2.txt ext.txt>	Input several individual motor files to process. ONLY 1 PER FILE


———————

From terminal, change your directory to this folder:

OSX: open the terminal, and type the commands...
cd path/to/this/folder

That is wherever the folder is. You can also type "cd " then drag the folder into terminal then hit enter


Windows - best bet is to install a python IDE and run the program that way! Sorry windows can be rough!


Once you are in the folder, you can run it from terminal with the following command:
python thrustTool.py -i fileNameOfThrustCurve.txt
where you replace fileName... with your file name. For cleanliness put your file in origCurves and use:
python thrustTool.py -i origCurves/fileNameOfThrustCurve.txt

(yes python 3 does work)



input arguments are:
-i inputFile            - required
-o outputFolder         - optional
-t targetImpulse        - optional


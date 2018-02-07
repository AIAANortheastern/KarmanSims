How to use thrustTool.py


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
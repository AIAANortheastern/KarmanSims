EESchema Schematic File Version 2
LIBS:NH_PCB-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:teensy
LIBS:adafruit_BOBs
LIBS:master_custom
LIBS:NH_PCB-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BARREL_JACK J4
U 1 1 595A3659
P 4800 4750
F 0 "J4" H 4800 4945 50  0000 C CNN
F 1 "BARREL_JACK" H 4800 4595 50  0000 C CNN
F 2 "custom_master:BARREL_JACK_W_Header_Holes" H 4800 4750 50  0001 C CNN
F 3 "" H 4800 4750 50  0001 C CNN
	1    4800 4750
	-1   0    0    -1  
$EndComp
$Comp
L CONN_02X05 J1
U 1 1 595A37A4
P 4500 6500
F 0 "J1" H 4500 6800 50  0000 C CNN
F 1 "Xbee-Conn" H 4500 6200 50  0000 C CNN
F 2 "Connectors:IDC_Header_Straight_10pins" H 4500 5300 50  0001 C CNN
F 3 "" H 4500 5300 50  0001 C CNN
	1    4500 6500
	1    0    0    -1  
$EndComp
Text Notes 4250 7100 0    60   ~ 0
BLACK - 1
Text Notes 4300 6950 0    60   ~ 0
GPS-BOB
Text Notes 4350 6100 0    60   ~ 0
BLACK
Text Label 4250 6300 2    60   ~ 0
TX-GPS
Text Label 4750 6300 0    60   ~ 0
GND_
Text Label 4250 6400 2    60   ~ 0
TX-XB
Text Label 4750 6400 0    60   ~ 0
RX-XB
Text Label 4250 6500 2    60   ~ 0
RX-GPS
Text Label 4750 6500 0    60   ~ 0
CTS-XB
$Comp
L ACCL_BOB_A1413 U2
U 1 1 595E746A
P 9700 5350
F 0 "U2" H 9650 6100 60  0000 C CNN
F 1 "ACCL_BOB_A1413" H 9700 5150 60  0000 C CNN
F 2 "adafruit_BOBs:Accel_BOB_A1413" H 9700 5350 60  0001 C CNN
F 3 "" H 9700 5350 60  0001 C CNN
	1    9700 5350
	-1   0    0    -1  
$EndComp
NoConn ~ 9300 5050
Text Notes 5400 1850 0    60   ~ 0
STRAT
Text Label 5850 1550 0    60   ~ 0
TX_STRAT
Text Label 6600 1850 2    60   ~ 0
CTS-XB
Text Label 5150 2350 2    60   ~ 0
CS_TS2
Text Label 6600 2250 2    60   ~ 0
TX-XB
Text Label 6600 2350 2    60   ~ 0
RX-XB
Text Label 6600 2450 2    60   ~ 0
TX-GPS
Text Label 6600 2550 2    60   ~ 0
RX-GPS
Text Label 5500 2750 2    60   ~ 0
DIN
Text Label 6600 2650 2    60   ~ 0
DOUT
Text Label 6600 5350 2    60   ~ 0
CLK
Text Label 8600 5550 0    60   ~ 0
SDA
Text Label 8600 5450 0    60   ~ 0
SCL
$Comp
L CONN_01X03 J5
U 1 1 5961A470
P 9750 1950
F 0 "J5" H 9750 2100 50  0000 C CNN
F 1 "SPI_debug" V 9850 1950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 9750 1950 50  0001 C CNN
F 3 "" H 9750 1950 50  0001 C CNN
	1    9750 1950
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X02 J6
U 1 1 5961A545
P 9750 2500
F 0 "J6" H 9750 2650 50  0000 C CNN
F 1 "I2C_Debug" V 9850 2500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 9750 2500 50  0001 C CNN
F 3 "" H 9750 2500 50  0001 C CNN
	1    9750 2500
	-1   0    0    -1  
$EndComp
Text Notes 9550 1600 0    60   ~ 0
Debug headers
Text Label 9950 1850 0    60   ~ 0
DIN
Text Label 9950 1950 0    60   ~ 0
DOUT
Text Label 9950 2450 0    60   ~ 0
SCL
Text Label 9950 2550 0    60   ~ 0
SDA
Text Notes 4350 5200 0    60   ~ 0
3.7 - 10V in
$Comp
L 10DOF_A1604 U3
U 1 1 5962443D
P 5700 5000
F 0 "U3" H 5650 6300 60  0000 C CNN
F 1 "10DOF_A1604" H 5650 4950 60  0000 C CNN
F 2 "adafruit_BOBs:10DOF_BOB_ADA16014" H 5700 5000 60  0001 C CNN
F 3 "" H 5700 5000 60  0001 C CNN
	1    5700 5000
	1    0    0    -1  
$EndComp
$Comp
L TCA-ADA-269 TC2
U 1 1 5962447A
P 4600 1750
F 0 "TC2" H 4550 1600 60  0000 C CNN
F 1 "TCA-ADA-269" H 4600 2500 60  0000 C CNN
F 2 "adafruit_BOBs:TCA_BOB_ADA269" H 4600 1750 60  0001 C CNN
F 3 "" H 4600 1750 60  0001 C CNN
	1    4600 1750
	0    -1   -1   0   
$EndComp
$Comp
L TCA-ADA-269 TC1
U 1 1 596244C7
P 4600 3600
F 0 "TC1" H 4550 3450 60  0000 C CNN
F 1 "TCA-ADA-269" H 4600 4350 60  0000 C CNN
F 2 "adafruit_BOBs:TCA_BOB_ADA269" H 4600 3600 60  0001 C CNN
F 3 "" H 4600 3600 60  0001 C CNN
	1    4600 3600
	0    -1   1    0   
$EndComp
Text Label 5150 2500 2    60   ~ 0
CS-TC1
Text Label 6150 4150 0    60   ~ 0
SCL
Text Label 6150 4250 0    60   ~ 0
SDA
Text Label 6150 4050 0    60   ~ 0
GND_
Text Label 4900 2900 0    60   ~ 0
CLK
$Comp
L Teensy3.5 U1
U 1 1 595E6F00
P 7600 3550
F 0 "U1" H 7600 5850 60  0000 C CNN
F 1 "Teensy3.6" H 7600 1250 60  0000 C CNN
F 2 "Teensy:Teensy35_36" H 7600 3550 60  0001 C CNN
F 3 "" H 7600 3550 60  0000 C CNN
	1    7600 3550
	1    0    0    -1  
$EndComp
NoConn ~ 6150 3850
NoConn ~ 6600 1650
NoConn ~ 6600 1750
NoConn ~ 4500 4750
NoConn ~ 6600 3750
NoConn ~ 6600 3650
NoConn ~ 6600 3450
NoConn ~ 6600 1950
NoConn ~ 6600 3350
NoConn ~ 6600 3550
NoConn ~ 6600 4150
NoConn ~ 8600 2250
NoConn ~ 8600 3150
NoConn ~ 8600 2550
NoConn ~ 8600 2350
NoConn ~ 8600 2450
NoConn ~ 8600 2950
NoConn ~ 8600 3250
NoConn ~ 8600 2650
NoConn ~ 8600 3050
NoConn ~ 8600 2750
NoConn ~ 8600 2850
NoConn ~ 6600 3950
NoConn ~ 6600 4050
NoConn ~ 8600 2050
NoConn ~ 8600 1750
NoConn ~ 8600 1850
NoConn ~ 8600 1550
NoConn ~ 8600 1650
NoConn ~ 8600 1450
NoConn ~ 8600 1950
NoConn ~ 8600 2150
NoConn ~ 8600 3350
NoConn ~ 8600 3450
NoConn ~ 8600 3550
NoConn ~ 6600 5550
NoConn ~ 6600 5250
NoConn ~ 6600 5050
NoConn ~ 6600 4250
NoConn ~ 6600 5450
NoConn ~ 6600 5150
NoConn ~ 6600 4850
NoConn ~ 6600 4950
NoConn ~ 6600 5650
NoConn ~ 8600 4050
NoConn ~ 8600 4250
NoConn ~ 8600 3850
NoConn ~ 8600 4150
NoConn ~ 8600 4350
NoConn ~ 8600 3750
NoConn ~ 8600 3650
NoConn ~ 8600 3950
NoConn ~ 8600 4450
NoConn ~ 8600 5050
NoConn ~ 8600 5350
NoConn ~ 8600 4950
NoConn ~ 9300 4750
$Comp
L PWR_FLAG #FLG01
U 1 1 5964E87C
P 4100 4650
F 0 "#FLG01" H 4100 4725 50  0001 C CNN
F 1 "PWR_FLAG" H 4100 4800 50  0000 C CNN
F 2 "" H 4100 4650 50  0001 C CNN
F 3 "" H 4100 4650 50  0001 C CNN
	1    4100 4650
	1    0    0    -1  
$EndComp
Text Label 5350 3000 0    60   ~ 0
3.3V
NoConn ~ 4000 2150
NoConn ~ 4000 3200
Text Label 8850 4550 0    60   ~ 0
3.3V
$Comp
L D_Schottky D2
U 1 1 5967AD6A
P 2350 4650
F 0 "D2" H 2350 4750 50  0000 C CNN
F 1 "D_Schottky" H 2350 4550 50  0000 C CNN
F 2 "Diodes_THT:Diode_DO-41_SOD81_Vertical_AnodeUp" H 2350 4650 50  0001 C CNN
F 3 "" H 2350 4650 50  0001 C CNN
	1    2350 4650
	1    0    0    -1  
$EndComp
$Comp
L D_Schottky D1
U 1 1 5967ADC6
P 1200 3050
F 0 "D1" H 1200 3150 50  0000 C CNN
F 1 "D_Schottky" H 1200 2950 50  0000 C CNN
F 2 "Diodes_THT:Diode_DO-41_SOD81_Vertical_AnodeUp" H 1200 3050 50  0001 C CNN
F 3 "" H 1200 3050 50  0001 C CNN
	1    1200 3050
	0    -1   -1   0   
$EndComp
$Comp
L Jumper JP1
U 1 1 5967F5C8
P 1200 3700
F 0 "JP1" H 1200 3850 50  0000 C CNN
F 1 "VUSB_Jump" H 1200 3620 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1200 3700 50  0001 C CNN
F 3 "" H 1200 3700 50  0001 C CNN
	1    1200 3700
	0    -1   -1   0   
$EndComp
Text Label 8600 4650 0    60   ~ 0
VUSB
Text Label 8600 4750 0    60   ~ 0
Vin
Wire Wire Line
	9300 5150 8600 5150
Wire Wire Line
	9300 5250 8600 5250
Wire Wire Line
	9050 4850 9050 4950
Wire Wire Line
	9050 4950 9300 4950
Wire Wire Line
	9300 5350 8950 5350
Wire Wire Line
	8950 5350 8950 5650
Wire Wire Line
	8950 5650 8600 5650
Wire Wire Line
	4200 2150 4200 3200
Wire Wire Line
	4300 2150 4300 3200
Wire Wire Line
	4500 2150 4500 3200
Connection ~ 4200 2400
Wire Wire Line
	6600 2750 4300 2750
Connection ~ 4300 2750
Wire Wire Line
	4400 2500 5350 2500
Wire Wire Line
	5350 2500 5350 2150
Wire Wire Line
	5350 2150 6600 2150
Wire Wire Line
	4400 2350 5250 2350
Wire Wire Line
	5250 2350 5250 2050
Wire Wire Line
	5250 2050 6600 2050
Wire Wire Line
	4500 2900 4900 2900
Connection ~ 4500 2900
Wire Wire Line
	4400 2350 4400 2150
Wire Wire Line
	4400 2500 4400 3200
Wire Wire Line
	6150 4450 6600 4450
Wire Wire Line
	6150 4350 6600 4350
Wire Wire Line
	6600 4550 6150 4550
Wire Wire Line
	6150 4650 6600 4650
Wire Wire Line
	6600 4750 6150 4750
Wire Wire Line
	8600 4850 9050 4850
Wire Wire Line
	5500 1550 6600 1550
Wire Wire Line
	9150 4550 9150 4850
Wire Wire Line
	9150 4850 9300 4850
Wire Wire Line
	1800 2400 4200 2400
Wire Wire Line
	4100 2150 4100 3200
Wire Wire Line
	6250 3950 6150 3950
Wire Wire Line
	3550 3000 6250 3000
Wire Wire Line
	9150 4550 8600 4550
Text Label 1200 2800 2    60   ~ 0
VUSB
Text Notes 1000 1650 0    60   ~ 0
Power in via USB
Text Notes 4200 5300 0    60   ~ 0
7.4V nominal (2S lipo)
$Comp
L L4931 Reg1
U 1 1 596AE3A0
P 1650 5400
F 0 "Reg1" H 1800 5500 60  0000 C CNN
F 1 "L4931" H 1800 6000 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 1650 5400 60  0001 C CNN
F 3 "https://cdn-shop.adafruit.com/product-files/2166/2166datasheet.pdf" H 1650 5400 60  0001 C CNN
	1    1650 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6250 3000 6250 3950
$Comp
L CONN_01X03 J3
U 1 1 596AF251
P 2700 3550
F 0 "J3" H 2700 3750 50  0000 C CNN
F 1 "Pow_byp" V 2800 3550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 2700 3550 50  0001 C CNN
F 3 "" H 2700 3550 50  0001 C CNN
	1    2700 3550
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 596AFECC
P 1950 5450
F 0 "C2" H 1800 5550 50  0000 L CNN
F 1 "10µf" H 1750 5350 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 1988 5300 50  0001 C CNN
F 3 "" H 1950 5450 50  0001 C CNN
	1    1950 5450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR02
U 1 1 596B0134
P 1950 5600
F 0 "#PWR02" H 1950 5350 50  0001 C CNN
F 1 "GND" H 1950 5450 50  0000 C CNN
F 2 "" H 1950 5600 50  0001 C CNN
F 3 "" H 1950 5600 50  0001 C CNN
	1    1950 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2500 4100 2500
Connection ~ 4100 2500
NoConn ~ 6600 2850
Text Label 8850 4850 0    60   ~ 0
GND_
$Comp
L Jumper JP2
U 1 1 596B98ED
P 1200 4700
F 0 "JP2" H 1200 4850 50  0000 C CNN
F 1 "33_Jump" H 1200 4620 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1200 4700 50  0001 C CNN
F 3 "" H 1200 4700 50  0001 C CNN
	1    1200 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2500 4650 3500 4650
Wire Wire Line
	2600 4650 2600 5150
Connection ~ 2600 4650
Wire Wire Line
	1750 5050 2800 5050
$Comp
L LED D4
U 1 1 596BD04F
P 2750 4250
F 0 "D4" H 2750 4350 50  0000 C CNN
F 1 "LED" H 2750 4150 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 2750 4250 50  0001 C CNN
F 3 "" H 2750 4250 50  0001 C CNN
	1    2750 4250
	-1   0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 596BD141
P 2450 4250
F 0 "R1" V 2530 4250 50  0000 C CNN
F 1 "180" V 2450 4250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2380 4250 50  0001 C CNN
F 3 "" H 2450 4250 50  0001 C CNN
	1    2450 4250
	0    1    1    0   
$EndComp
Connection ~ 3050 4650
$Comp
L GND #PWR03
U 1 1 596BD49E
P 3150 4300
F 0 "#PWR03" H 3150 4050 50  0001 C CNN
F 1 "GND" H 3150 4150 50  0000 C CNN
F 2 "" H 3150 4300 50  0001 C CNN
F 3 "" H 3150 4300 50  0001 C CNN
	1    3150 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 596BD4EE
P 3600 4950
F 0 "#PWR04" H 3600 4700 50  0001 C CNN
F 1 "GND" H 3600 4800 50  0000 C CNN
F 2 "" H 3600 4950 50  0001 C CNN
F 3 "" H 3600 4950 50  0001 C CNN
	1    3600 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4950 1750 4950
Wire Wire Line
	1950 2500 1950 5300
Text Notes 1450 4650 0    60   ~ 0
3.3V\nReg
Connection ~ 1950 4950
Wire Wire Line
	2100 4650 2200 4650
Wire Wire Line
	2100 3150 2100 4650
Text Notes 10400 7050 0    60   ~ 0
Adam Poirier
Text Notes 7000 6900 0    60   ~ 0
Northeastern AIAA\nProject Karman telemetry system\nVersion 2, Rev 4
Text Notes 10600 7650 0    60   ~ 0
4
Connection ~ 1800 5050
Wire Wire Line
	1800 2400 1800 5050
Wire Wire Line
	1200 2650 1200 2900
Wire Wire Line
	1200 3200 1200 3400
Wire Wire Line
	1200 4000 1200 4400
Text Notes 1100 5800 0    60   ~ 0
Power to 3.3\nvia VUSB\nw/ jumper byp
Wire Wire Line
	1950 3550 2500 3550
Wire Wire Line
	1800 3650 2500 3650
Wire Wire Line
	2100 3450 2500 3450
Wire Wire Line
	1200 4250 2300 4250
Connection ~ 2100 4250
Wire Wire Line
	1200 5000 1200 5500
Wire Wire Line
	1200 5500 1800 5500
Wire Wire Line
	1800 5500 1800 5150
Connection ~ 1800 5150
Connection ~ 1200 4250
$Comp
L D_Schottky D3
U 1 1 596CB54F
P 2300 5150
F 0 "D3" H 2300 5250 50  0000 C CNN
F 1 "D_Schottky" H 2300 5050 50  0000 C CNN
F 2 "Diodes_THT:Diode_DO-41_SOD81_Vertical_AnodeUp" H 2300 5150 50  0001 C CNN
F 3 "" H 2300 5150 50  0001 C CNN
	1    2300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5150 2150 5150
Wire Wire Line
	2600 5150 2450 5150
Wire Wire Line
	2100 3150 2650 3150
Connection ~ 2100 3450
Text Label 2650 3150 0    60   ~ 0
Vin
Connection ~ 1950 3550
Connection ~ 1800 3650
Text Label 2400 2400 0    60   ~ 0
GND_
Text Label 2800 2500 0    60   ~ 0
3.3V
Wire Wire Line
	3550 3000 3550 2500
Connection ~ 3550 2500
$Comp
L CONN_01X05 J2
U 1 1 596CD6EE
P 5150 1350
F 0 "J2" H 5150 1050 50  0000 C CNN
F 1 "STRAT_CONN" V 5250 1350 50  0000 C CNN
F 2 "Connectors_JST:JST_SH_SM05B-SRSS-TB_05x1.00mm_Angled" H 5150 1350 50  0001 C CNN
F 3 "" H 5150 1350 50  0001 C CNN
	1    5150 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3550 1000 3550 2400
Connection ~ 3550 2400
Wire Wire Line
	5550 1450 6600 1450
Wire Wire Line
	3550 1000 5800 1000
Wire Wire Line
	5800 1000 5800 1450
Connection ~ 5800 1450
Text Notes 1100 6150 0    60   ~ 0
Power: Normally in via barrel jack via bat\nDiode to protect bat\nSplit bat power to 3.3v reg to power sensors\n
Text Notes 1100 6550 0    60   ~ 0
VUSB is 5V from USB, normally disconnected\nConnect Jumper 1 to power teensy w/o bat\nConnect Jumper 2 to power sensors via 3.3V
$Comp
L PWR_FLAG #FLG05
U 1 1 596CF3AC
P 3800 3000
F 0 "#FLG05" H 3800 3075 50  0001 C CNN
F 1 "PWR_FLAG" H 3800 3150 50  0000 C CNN
F 2 "" H 3800 3000 50  0001 C CNN
F 3 "" H 3800 3000 50  0001 C CNN
	1    3800 3000
	1    0    0    -1  
$EndComp
Connection ~ 3800 3000
$Comp
L PWR_FLAG #FLG06
U 1 1 596CF47F
P 1200 2650
F 0 "#FLG06" H 1200 2725 50  0001 C CNN
F 1 "PWR_FLAG" H 1200 2800 50  0000 C CNN
F 2 "" H 1200 2650 50  0001 C CNN
F 3 "" H 1200 2650 50  0001 C CNN
	1    1200 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 596CF69D
P 8850 4850
F 0 "#PWR07" H 8850 4600 50  0001 C CNN
F 1 "GND" H 8850 4700 50  0000 C CNN
F 2 "" H 8850 4850 50  0001 C CNN
F 3 "" H 8850 4850 50  0001 C CNN
	1    8850 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4650 4500 4650
Wire Wire Line
	2800 4950 4400 4950
Wire Wire Line
	4400 4950 4400 4850
Wire Wire Line
	4400 4850 4500 4850
Connection ~ 3600 4950
Wire Wire Line
	2800 5050 2800 4950
$Comp
L C C3
U 1 1 596D1765
P 4100 4800
F 0 "C3" H 4125 4900 50  0000 L CNN
F 1 "100nF" H 4125 4700 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 4138 4650 50  0001 C CNN
F 3 "" H 4100 4800 50  0001 C CNN
	1    4100 4800
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 596D1A99
P 3050 4800
F 0 "C1" H 3075 4900 50  0000 L CNN
F 1 "10µF" H 3075 4700 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 3088 4650 50  0001 C CNN
F 3 "" H 3050 4800 50  0001 C CNN
	1    3050 4800
	1    0    0    -1  
$EndComp
Text Notes 3300 5250 0    60   ~ 0
5V converter
Wire Wire Line
	2900 4250 3150 4250
Wire Wire Line
	3150 4250 3150 4300
Connection ~ 3050 4950
Connection ~ 4100 4950
Text Label 4250 6600 2    60   ~ 0
Xbee_1
Text Label 4750 6600 0    60   ~ 0
Xbee_2
Text Label 4250 6700 2    60   ~ 0
Xbee_3
Text Label 4750 6700 0    60   ~ 0
Xbee_4
Text Label 6600 2950 2    60   ~ 0
Xbee_1
Text Label 6600 3050 2    60   ~ 0
Xbee_2
Text Label 6600 3150 2    60   ~ 0
Xbee_3
Text Label 6600 3250 2    60   ~ 0
Xbee_4
$Comp
L L7805AC REG1
U 1 1 596E2290
P 3600 4500
F 0 "REG1" H 3600 4800 60  0000 C CNN
F 1 "L7805AC" H 3600 4250 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220_Vertical" H 3700 4500 60  0001 C CNN
F 3 "" H 3700 4500 60  0001 C CNN
	1    3600 4500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3600 4650 3600 4950
Connection ~ 4100 4650
Text Label 9950 2050 0    60   ~ 0
CLK
Wire Wire Line
	5500 1550 5500 1450
Wire Wire Line
	5500 1450 5350 1450
Wire Wire Line
	5550 1450 5550 1500
Wire Wire Line
	5550 1500 5450 1500
Wire Wire Line
	5450 1500 5450 1550
Wire Wire Line
	5450 1550 5350 1550
NoConn ~ 5350 1350
NoConn ~ 5350 1250
NoConn ~ 5350 1150
$Comp
L Battery_Cell BT1
U 1 1 5974E856
P 5700 5700
F 0 "BT1" H 5800 5800 50  0000 L CNN
F 1 "Battery_Cell" H 5800 5700 50  0000 L CNN
F 2 "custom_master:CR1220_Conn_TH_MPD" V 5700 5760 50  0001 C CNN
F 3 "" V 5700 5760 50  0001 C CNN
	1    5700 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5974EA65
P 5700 6050
F 0 "#PWR08" H 5700 5800 50  0001 C CNN
F 1 "GND" H 5700 5900 50  0000 C CNN
F 2 "" H 5700 6050 50  0001 C CNN
F 3 "" H 5700 6050 50  0001 C CNN
	1    5700 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 6050 5700 5800
Wire Wire Line
	5700 5500 5700 5150
Wire Wire Line
	5700 5150 6450 5150
Wire Wire Line
	6450 5150 6450 3850
Wire Wire Line
	6450 3850 6600 3850
$EndSCHEMATC

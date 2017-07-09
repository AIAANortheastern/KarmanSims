EESchema Schematic File Version 2
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
LIBS:Untitled-cache
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
L Teensy3.2 U?
U 1 1 59597309
P 4900 3250
F 0 "U?" H 4900 4750 60  0000 C CNN
F 1 "Teensy3.2" H 4900 1750 60  0000 C CNN
F 2 "" H 4900 2450 60  0000 C CNN
F 3 "" H 4900 2450 60  0000 C CNN
	1    4900 3250
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X05 J?
U 1 1 5959735F
P 4200 5900
F 0 "J?" H 4200 6200 50  0000 C CNN
F 1 "CONN_02X05" H 4200 5600 50  0000 C CNN
F 2 "" H 4200 4700 50  0001 C CNN
F 3 "" H 4200 4700 50  0001 C CNN
	1    4200 5900
	1    0    0    -1  
$EndComp
$Comp
L Micro_SD_BOB_A254 B?
U 1 1 595A3597
P 1550 3450
F 0 "B?" H 1350 4150 60  0000 C CNN
F 1 "Micro_SD_BOB_A254" H 1350 3250 60  0000 C CNN
F 2 "" H 1550 3450 60  0001 C CNN
F 3 "" H 1550 3450 60  0001 C CNN
	1    1550 3450
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK J?
U 1 1 595A3659
P 8650 2050
F 0 "J?" H 8650 2245 50  0000 C CNN
F 1 "BARREL_JACK" H 8650 1895 50  0000 C CNN
F 2 "" H 8650 2050 50  0001 C CNN
F 3 "" H 8650 2050 50  0001 C CNN
	1    8650 2050
	-1   0    0    -1  
$EndComp
$Comp
L CONN_02X03 J?
U 1 1 595A37A4
P 2200 4900
F 0 "J?" H 2200 5100 50  0000 C CNN
F 1 "CONN_02X03" H 2200 4700 50  0000 C CNN
F 2 "" H 2200 3700 50  0001 C CNN
F 3 "" H 2200 3700 50  0001 C CNN
	1    2200 4900
	1    0    0    -1  
$EndComp
$Comp
L CONN_JST_2Pin CO?
U 1 1 595A3A65
P 1650 2450
F 0 "CO?" H 1700 2950 60  0000 C CNN
F 1 "CONN_JST_2Pin" H 1700 2600 60  0000 C CNN
F 2 "" H 1650 2450 60  0001 C CNN
F 3 "" H 1650 2450 60  0001 C CNN
	1    1650 2450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 J?
U 1 1 595A3AB4
P 2100 4100
F 0 "J?" H 2100 4350 50  0000 C CNN
F 1 "CONN_01X04" V 2200 4100 50  0000 C CNN
F 2 "" H 2100 4100 50  0001 C CNN
F 3 "" H 2100 4100 50  0001 C CNN
	1    2100 4100
	-1   0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 595A3B64
P 7900 2050
F 0 "C?" H 7925 2150 50  0000 L CNN
F 1 "CP" H 7925 1950 50  0000 L CNN
F 2 "" H 7938 1900 50  0001 C CNN
F 3 "" H 7900 2050 50  0001 C CNN
	1    7900 2050
	-1   0    0    -1  
$EndComp
$Comp
L ACCL_BOB_A1413 U?
U 1 1 595A3D1B
P 8000 4500
F 0 "U?" H 7950 5250 60  0000 C CNN
F 1 "ACCL_BOB_A1413" H 8000 4300 60  0000 C CNN
F 2 "" H 8000 4500 60  0001 C CNN
F 3 "" H 8000 4500 60  0001 C CNN
	1    8000 4500
	-1   0    0    -1  
$EndComp
Text Label 7600 1900 2    60   ~ 0
5V
Text Label 7450 2200 2    60   ~ 0
GND_
Text Label 7150 3900 2    60   ~ 0
5V
Text Label 7150 4100 2    60   ~ 0
GND_
Text Label 3100 1700 1    60   ~ 0
GND_
Text Label 2150 2850 3    60   ~ 0
5V
Text Label 3350 4050 0    60   ~ 0
SD_CS
Text Label 3450 3850 0    60   ~ 0
CLK
Text Label 3100 4450 3    60   ~ 0
CLK
NoConn ~ 1750 2950
NoConn ~ 1750 3550
Text Label 3300 4450 3    60   ~ 0
DOUT
Text Label 3300 3000 1    60   ~ 0
DIN
Wire Wire Line
	8050 1900 8350 1950
Wire Wire Line
	7600 1900 7900 1900
Wire Wire Line
	7900 1900 8050 1900
Wire Wire Line
	8350 2150 7950 2150
Wire Wire Line
	7950 2150 7900 2200
Connection ~ 7900 1900
Wire Wire Line
	7900 2200 7450 2200
Wire Wire Line
	7600 4100 7150 4100
Wire Wire Line
	7600 3900 7150 3900
Wire Wire Line
	2300 3050 1750 3050
Wire Wire Line
	3100 2150 3100 1950
Wire Wire Line
	3100 1950 3100 1700
Wire Wire Line
	2300 2150 2300 3050
Wire Wire Line
	3100 1950 3900 1950
Connection ~ 3100 1950
Wire Wire Line
	1750 2850 2150 2850
Wire Wire Line
	1750 3150 3100 3150
Wire Wire Line
	3100 3150 3100 3850
Wire Wire Line
	3100 3850 3100 4450
Wire Wire Line
	3100 3850 3900 3850
Wire Wire Line
	1750 3250 3300 3250
Wire Wire Line
	3300 3250 3900 3250
Wire Wire Line
	1750 3350 3300 3350
Wire Wire Line
	3300 3350 3650 3350
Wire Wire Line
	3650 3350 3650 3150
Wire Wire Line
	3650 3150 3900 3150
Wire Wire Line
	1750 3450 3000 3450
Wire Wire Line
	3000 3450 3000 4050
Wire Wire Line
	3000 4050 3900 4050
Connection ~ 3100 3850
Wire Wire Line
	3300 3350 3300 4450
Connection ~ 3300 3350
Wire Wire Line
	3300 3250 3300 3000
Connection ~ 3300 3250
Wire Wire Line
	5900 4050 6150 4050
Text Label 6150 4050 0    60   ~ 0
5V
Wire Wire Line
	3950 4550 3650 4550
Wire Wire Line
	3650 4550 3650 4900
Wire Wire Line
	3650 4900 3850 4900
Text Label 3850 4900 0    60   ~ 0
ACC_X
Text Label 7100 4650 2    60   ~ 0
ACC_X
Wire Wire Line
	7100 4650 7300 4650
Wire Wire Line
	7300 4650 7300 4500
Wire Wire Line
	7300 4500 7600 4500
Wire Wire Line
	5900 4550 6800 4550
Wire Wire Line
	6800 4550 6800 4400
Wire Wire Line
	6800 4400 7600 4400
Wire Wire Line
	6600 4300 7600 4300
Wire Wire Line
	6600 4300 6600 4450
Wire Wire Line
	6600 4450 5900 4450
Wire Wire Line
	5900 4150 6150 4150
Text Label 6150 4150 0    60   ~ 0
GND_
Text Notes 7650 1800 0    60   ~ 0
POWER IN - 5V RREGULATED
Text Label 3950 5700 2    60   ~ 0
CLK
Text Notes 3750 5550 0    60   ~ 0
BLACK - 1
Text Notes 3900 6500 0    60   ~ 0
From 10DOF\nD-SUB-9
Text Label 4450 5700 0    60   ~ 0
CS-TC1
Text Label 3950 5800 2    60   ~ 0
DIN
Text Label 4450 5800 0    60   ~ 0
GND_
Text Label 3950 5900 2    60   ~ 0
SCL
Text Label 4450 5900 0    60   ~ 0
SDA
Text Label 3950 6000 2    60   ~ 0
GIN
Text Label 4450 6000 0    60   ~ 0
GIND
Text Label 3950 6100 2    60   ~ 0
CS-TC2
Text Label 4450 6100 0    60   ~ 0
XTRA
Wire Wire Line
	3900 2650 3750 2650
Text Label 3750 2650 2    60   ~ 0
CS-TC1
Text Label 3650 4450 2    60   ~ 0
SCL
Wire Wire Line
	3650 4450 3900 4450
Text Label 3600 4350 2    60   ~ 0
SDA
Wire Wire Line
	3600 4350 3900 4350
Wire Wire Line
	3900 2550 3750 2550
Text Label 3750 2550 2    60   ~ 0
CS_TS2
Text Notes 1550 2450 0    60   ~ 0
STRAT
Wire Wire Line
	1950 2150 2300 2150
Wire Wire Line
	2300 2150 3100 2150
Connection ~ 2300 2150
Wire Wire Line
	1950 2050 3900 2050
Text Label 2600 2050 0    60   ~ 0
TX_STRAT
Text Notes 2000 5250 0    60   ~ 0
GPS-BOB
Text Notes 1700 4600 0    60   ~ 0
BLACK
Text Label 1950 4800 2    60   ~ 0
TX_GPS
Text Label 2450 4800 0    60   ~ 0
GND_
Text Label 1950 4900 2    60   ~ 0
TX-XB
Text Label 2450 4900 0    60   ~ 0
RX-XB
Text Label 1950 5000 2    60   ~ 0
RX-GPS
Text Label 2450 5000 0    60   ~ 0
CTS-XB
Text Label 3900 2350 2    60   ~ 0
CTS-XB
Text Label 3900 2850 2    60   ~ 0
RX-XB
Text Label 3900 2750 2    60   ~ 0
TX-XB
Text Label 3900 2950 2    60   ~ 0
TX-GPS
Text Label 3900 3050 2    60   ~ 0
RX-GPS
$EndSCHEMATC

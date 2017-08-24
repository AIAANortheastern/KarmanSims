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
LIBS:master_custom
LIBS:adafruit_BOBs
LIBS:Xbee_GPS-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "JARVIS 2.0 - MCU"
Date "2017-07-31"
Rev "2"
Comp "AIAA Notheastern - Project Karman"
Comment1 "Project Karman Telemetry System"
Comment2 "Secondary board - GPS and communication module (board 2/2)"
Comment3 "Adam Poirier"
Comment4 ""
$EndDescr
$Comp
L CONN_02X05 J2
U 1 1 59753BC2
P 3400 4450
F 0 "J2" H 3400 4750 50  0000 C CNN
F 1 "CONN_02X05" H 3400 4150 50  0000 C CNN
F 2 "Connectors:IDC_Header_Straight_10pins" H 3400 3250 50  0001 C CNN
F 3 "" H 3400 3250 50  0001 C CNN
	1    3400 4450
	1    0    0    -1  
$EndComp
Text Label 3150 4250 2    60   ~ 0
TX_GPS
Text Label 3150 4350 2    60   ~ 0
TX-XB
Text Label 3150 4450 2    60   ~ 0
RX-GPS
Text Label 3150 4550 2    60   ~ 0
GPS-FIX
Text Label 3150 4650 2    60   ~ 0
Xbee_SS
Text Label 3650 4250 0    60   ~ 0
GND_
Text Label 3650 4350 0    60   ~ 0
RX-XB
Text Label 3650 4450 0    60   ~ 0
CTS-XB
Text Label 3650 4550 0    60   ~ 0
Xbee_CLK
Text Label 3650 4650 0    60   ~ 0
Xbee_ATTN
$Comp
L Xbee_Pro_S3B_XSC RF1
U 1 1 59754613
P 7200 5100
F 0 "RF1" H 7450 6350 60  0000 C CNN
F 1 "Xbee_Pro_S3B_XSC" H 7500 5000 60  0000 C CNN
F 2 "custom_master:Xbee_Pro_S3B" H 7200 5100 60  0001 C CNN
F 3 "" H 7200 5100 60  0001 C CNN
	1    7200 5100
	1    0    0    -1  
$EndComp
Text Label 8550 4900 0    60   ~ 0
CTS-XB
$Comp
L C C1
U 1 1 59755C48
P 5900 3950
F 0 "C1" H 5925 4050 50  0000 L CNN
F 1 "10µF" H 5925 3850 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 5938 3800 50  0001 C CNN
F 3 "" H 5900 3950 50  0001 C CNN
	1    5900 3950
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 59755C76
P 6200 3950
F 0 "C2" H 6225 4050 50  0000 L CNN
F 1 "1µF" H 6225 3850 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 6238 3800 50  0001 C CNN
F 3 "" H 6200 3950 50  0001 C CNN
	1    6200 3950
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 59755C96
P 6500 3950
F 0 "C3" H 6525 4050 50  0000 L CNN
F 1 "47pF" H 6525 3850 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L4.6mm_W2.0mm_P2.50mm_MKS02_FKP02" H 6538 3800 50  0001 C CNN
F 3 "" H 6500 3950 50  0001 C CNN
	1    6500 3950
	1    0    0    -1  
$EndComp
$Comp
L LD1117V33 regul1
U 1 1 59756062
P 4550 3400
F 0 "regul1" H 4350 3450 60  0000 C CNN
F 1 "LD1117V33" H 4300 3850 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Vertical" H 4550 3400 60  0001 C CNN
F 3 "" H 4550 3400 60  0001 C CNN
	1    4550 3400
	0    -1   1    0   
$EndComp
$Comp
L BARREL_JACK J1
U 1 1 59756136
P 2450 3700
F 0 "J1" H 2450 3895 50  0000 C CNN
F 1 "BARREL_JACK" H 2450 3545 50  0000 C CNN
F 2 "custom_master:BARREL_JACK_W_Header_Holes" H 2450 3700 50  0001 C CNN
F 3 "" H 2450 3700 50  0001 C CNN
	1    2450 3700
	1    0    0    -1  
$EndComp
$Comp
L GPS_BOB_ADA-746 BOB1
U 1 1 597574A1
P 3500 5600
F 0 "BOB1" H 3500 5250 60  0000 C CNN
F 1 "GPS_BOB_ADA-746" H 3550 5900 60  0000 C CNN
F 2 "adafruit_BOBs:GPS_BOB_A746" H 3500 5600 60  0001 C CNN
F 3 "" H 3500 5600 60  0001 C CNN
	1    3500 5600
	1    0    0    -1  
$EndComp
$Comp
L Battery_Cell BT1
U 1 1 5975791A
P 8550 2700
F 0 "BT1" H 8650 2800 50  0000 L CNN
F 1 "Battery_Cell" H 8650 2700 50  0000 L CNN
F 2 "custom_master:CR1220_Conn_TH_MPD" V 8550 2760 50  0001 C CNN
F 3 "" V 8550 2760 50  0001 C CNN
	1    8550 2700
	1    0    0    -1  
$EndComp
Text Label 8750 2350 0    60   ~ 0
Vbat
$Comp
L GND #PWR01
U 1 1 597579CA
P 8550 3000
F 0 "#PWR01" H 8550 2750 50  0001 C CNN
F 1 "GND" H 8550 2850 50  0000 C CNN
F 2 "" H 8550 3000 50  0001 C CNN
F 3 "" H 8550 3000 50  0001 C CNN
	1    8550 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 597579F9
P 3500 3800
F 0 "#PWR02" H 3500 3550 50  0001 C CNN
F 1 "GND" H 3500 3650 50  0000 C CNN
F 2 "" H 3500 3800 50  0001 C CNN
F 3 "" H 3500 3800 50  0001 C CNN
	1    3500 3800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR03
U 1 1 59757B29
P 3900 5050
F 0 "#PWR03" H 3900 4900 50  0001 C CNN
F 1 "+3.3V" H 3900 5190 50  0000 C CNN
F 2 "" H 3900 5050 50  0001 C CNN
F 3 "" H 3900 5050 50  0001 C CNN
	1    3900 5050
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG04
U 1 1 59757BD7
P 3500 3600
F 0 "#FLG04" H 3500 3675 50  0001 C CNN
F 1 "PWR_FLAG" H 3500 3750 50  0000 C CNN
F 2 "" H 3500 3600 50  0001 C CNN
F 3 "" H 3500 3600 50  0001 C CNN
	1    3500 3600
	1    0    0    -1  
$EndComp
Text Label 3050 5650 2    60   ~ 0
Vbat
$Comp
L GS3 J5
U 1 1 59761B97
P 5700 4750
F 0 "J5" H 5750 4950 50  0000 C CNN
F 1 "GS3" H 5750 4551 50  0000 C CNN
F 2 "Connectors:GS3" V 5788 4676 50  0001 C CNN
F 3 "" H 5700 4750 50  0001 C CNN
	1    5700 4750
	-1   0    0    1   
$EndComp
$Comp
L GS3 J3
U 1 1 59761D6D
P 5100 4300
F 0 "J3" H 5150 4500 50  0000 C CNN
F 1 "GS3" H 5150 4101 50  0000 C CNN
F 2 "Connectors:GS3" V 5188 4226 50  0001 C CNN
F 3 "" H 5100 4300 50  0001 C CNN
	1    5100 4300
	-1   0    0    1   
$EndComp
Text Label 8250 4300 0    60   ~ 0
Xbee_CLK
Text Label 8250 4200 0    60   ~ 0
Xbee_ATTN
NoConn ~ 3050 5550
NoConn ~ 3950 5750
NoConn ~ 3950 5650
NoConn ~ 2750 3700
$Comp
L GND #PWR05
U 1 1 5976268A
P 8500 5050
F 0 "#PWR05" H 8500 4800 50  0001 C CNN
F 1 "GND" H 8500 4900 50  0000 C CNN
F 2 "" H 8500 5050 50  0001 C CNN
F 3 "" H 8500 5050 50  0001 C CNN
	1    8500 5050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 J4
U 1 1 5976315D
P 5450 2150
F 0 "J4" H 5450 2500 50  0000 C CNN
F 1 "FTDI_Header" V 5550 2150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 5450 2150 50  0001 C CNN
F 3 "" H 5450 2150 50  0001 C CNN
	1    5450 2150
	0    -1   -1   0   
$EndComp
Text Notes 4700 2200 0    60   ~ 0
Black
$Comp
L D_Shockley D2
U 1 1 59763451
P 3800 3050
F 0 "D2" H 3800 3150 50  0000 C CNN
F 1 "D_Shockley" H 3800 2950 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3800 3050 50  0001 C CNN
F 3 "" H 3800 3050 50  0001 C CNN
	1    3800 3050
	0    -1   -1   0   
$EndComp
$Comp
L D_Shockley D1
U 1 1 597634AA
P 3100 3600
F 0 "D1" H 3100 3700 50  0000 C CNN
F 1 "D_Shockley" H 3100 3500 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 3100 3600 50  0001 C CNN
F 3 "" H 3100 3600 50  0001 C CNN
	1    3100 3600
	-1   0    0    1   
$EndComp
$Comp
L Jumper JP1
U 1 1 597636CF
P 4500 2700
F 0 "JP1" H 4500 2850 50  0000 C CNN
F 1 "FTDI_VCC_Jump" H 4500 2620 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4500 2700 50  0001 C CNN
F 3 "" H 4500 2700 50  0001 C CNN
	1    4500 2700
	1    0    0    -1  
$EndComp
Text Label 5950 4300 0    60   ~ 0
TX_EX
Text Label 6200 4200 0    60   ~ 0
RX_EX
Text Notes 5750 2900 0    60   ~ 0
1 (Black) - pin 10 ground\n2 (Brown) - pin 12 cts\n3 (Red) - 5V - VCC (convert to 3.3)\n4 (Orange) - pin 3 tx to din\n5 (Yellow) - pin 2 rx to dout\n6 (Green) - pin 16 rts
Text Notes 2200 3400 0    60   ~ 0
15 - 5V in
Text Label 8250 4400 0    60   ~ 0
Xbee_SS
NoConn ~ 6650 4500
NoConn ~ 6650 4700
NoConn ~ 6650 4800
NoConn ~ 6650 4900
NoConn ~ 8250 4800
NoConn ~ 8250 4600
NoConn ~ 8250 4100
NoConn ~ 6650 4600
Text Label 3600 3600 0    60   ~ 0
VCC
Text Label 3750 3800 0    60   ~ 0
GND_
Text Label 4500 4100 0    60   ~ 0
3.3V
Text Label 6600 3600 0    60   ~ 0
RTS
Text Label 6100 5350 0    60   ~ 0
MOSI
Text Label 6250 4400 0    60   ~ 0
MISO
Text Label 2800 3600 0    60   ~ 0
PWR
Wire Wire Line
	4400 4250 3650 4250
Wire Wire Line
	4400 3600 4400 5550
Wire Wire Line
	4400 5000 6650 5000
Wire Wire Line
	4750 4350 3650 4350
Wire Wire Line
	2600 4350 3150 4350
Wire Wire Line
	4300 4100 6650 4100
Connection ~ 6200 4100
Connection ~ 5900 4100
Connection ~ 6200 3800
Connection ~ 5900 3800
Connection ~ 4400 4250
Connection ~ 4400 3800
Wire Wire Line
	3950 5450 4050 5450
Wire Wire Line
	4050 5450 4050 5150
Wire Wire Line
	4050 5150 2750 5150
Wire Wire Line
	2750 5150 2750 4450
Wire Wire Line
	2750 4450 3150 4450
Wire Wire Line
	3150 4250 2300 4250
Wire Wire Line
	2300 4250 2300 5850
Wire Wire Line
	2300 5850 3050 5850
Wire Wire Line
	3050 5750 2500 5750
Wire Wire Line
	2500 5750 2500 4550
Wire Wire Line
	2500 4550 3150 4550
Wire Wire Line
	8550 2500 8550 2350
Wire Wire Line
	8550 2350 8750 2350
Connection ~ 3500 3800
Wire Wire Line
	4400 5550 3950 5550
Connection ~ 4400 5000
Wire Wire Line
	8550 2800 8550 3000
Wire Wire Line
	3050 5450 2950 5450
Wire Wire Line
	2950 5450 2950 5050
Wire Wire Line
	2950 5050 4300 5050
Connection ~ 3900 5050
Connection ~ 3500 3600
Wire Wire Line
	4750 4350 4750 4750
Wire Wire Line
	4750 4750 5550 4750
Wire Wire Line
	5850 4650 5950 4650
Wire Wire Line
	5950 4650 5950 4300
Wire Wire Line
	5500 4300 6650 4300
Wire Wire Line
	5250 4200 6650 4200
Wire Wire Line
	4850 4300 4950 4300
Wire Wire Line
	8250 5000 8250 5350
Wire Wire Line
	8250 5350 5500 5350
Wire Wire Line
	5500 5350 5500 4400
Wire Wire Line
	5500 4400 5250 4400
Wire Wire Line
	6050 4400 6650 4400
Wire Wire Line
	6050 4400 6050 4850
Wire Wire Line
	6050 4850 5850 4850
Wire Wire Line
	8500 4700 8500 5050
Wire Wire Line
	4300 5050 4300 3600
Wire Wire Line
	2600 4350 2600 4800
Wire Wire Line
	2600 4800 4850 4800
Wire Wire Line
	4850 4800 4850 4300
Connection ~ 4300 4100
Wire Wire Line
	2750 3800 6500 3800
Wire Wire Line
	5200 2350 5200 3800
Connection ~ 5200 3800
Wire Wire Line
	5300 2350 5300 3500
Wire Wire Line
	5300 3500 9000 3500
Wire Wire Line
	9000 3500 9000 4900
Wire Wire Line
	5400 2350 5400 2700
Wire Wire Line
	3800 2700 3800 2900
Wire Wire Line
	3800 3600 3800 3200
Connection ~ 3800 3600
Wire Wire Line
	2750 3600 2950 3600
Wire Wire Line
	3250 3600 4200 3600
Wire Wire Line
	5400 2700 4800 2700
Wire Wire Line
	4200 2700 3800 2700
Wire Wire Line
	5500 2350 5500 4300
Connection ~ 5950 4300
Connection ~ 6500 4100
Wire Wire Line
	5600 2350 5600 4200
Connection ~ 5600 4200
Wire Wire Line
	8250 4700 8500 4700
Wire Wire Line
	9000 4900 8250 4900
Wire Wire Line
	8250 4500 8900 4500
Wire Wire Line
	8900 4500 8900 3600
Wire Wire Line
	8900 3600 5700 3600
Wire Wire Line
	5700 3600 5700 2350
$Comp
L CONN_01X02 J6
U 1 1 5983C507
P 1900 4050
F 0 "J6" H 1900 4200 50  0000 C CNN
F 1 "Pow_conn" V 2000 4050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 1900 4050 50  0001 C CNN
F 3 "" H 1900 4050 50  0001 C CNN
	1    1900 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2100 4000 2850 4000
Wire Wire Line
	2850 4000 2850 3600
Connection ~ 2850 3600
Wire Wire Line
	2100 4100 3100 4100
Wire Wire Line
	3100 4100 3100 3800
Connection ~ 3100 3800
$EndSCHEMATC

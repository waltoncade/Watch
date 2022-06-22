EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8600 1150 1025 650 
U 626A0AD6
F0 "leds" 50
F1 "watch_leds.sch" 50
F2 "SDA" I L 8600 1425 50 
F3 "SCL" I L 8600 1600 50 
$EndSheet
$Comp
L UltraLibrarian:ATSAM4LS2AA-AU U101
U 1 1 626A3982
P 2600 3725
F 0 "U101" H 3600 4112 60  0000 C CNN
F 1 "ATSAM4LS2AA-AU" H 3600 4006 60  0000 C CNN
F 2 "UltraLibrary_Parts:ATSAM4LS2AA-AU" H 3600 3965 60  0001 C CNN
F 3 "" H 2600 3725 60  0000 C CNN
	1    2600 3725
	1    0    0    -1  
$EndComp
Text Label 6275 1825 0    50   ~ 0
SDA
Text Label 6275 1725 0    50   ~ 0
SCL
Text Label 8600 1600 2    50   ~ 0
SCL
Text Label 8600 1425 2    50   ~ 0
SDA
$Comp
L SamacSys_Parts:PT7C4563BQ1WEX IC101
U 1 1 62927C7B
P 5175 1525
F 0 "IC101" H 5725 1790 50  0000 C CNN
F 1 "PT7C4563BQ1WEX" H 5725 1699 50  0000 C CNN
F 2 "SOIC127P600X175-8N" H 6125 1625 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/PT7C4563BQ.pdf" H 6125 1525 50  0001 L CNN
F 4 "Real Time Clock Real Time Clock SO-8 T&R 2.5K" H 6125 1425 50  0001 L CNN "Description"
F 5 "1.75" H 6125 1325 50  0001 L CNN "Height"
F 6 "Diodes Inc." H 6125 1225 50  0001 L CNN "Manufacturer_Name"
F 7 "PT7C4563BQ1WEX" H 6125 1125 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "621-PT7C4563BQ1WEX" H 6125 1025 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Diodes-Incorporated/PT7C4563BQ1WEX?qs=P1JMDcb91o5VwflV1V69pA%3D%3D" H 6125 925 50  0001 L CNN "Mouser Price/Stock"
F 10 "PT7C4563BQ1WEX" H 6125 825 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/pt7c4563bq1wex/diodes-incorporated?region=nac" H 6125 725 50  0001 L CNN "Arrow Price/Stock"
	1    5175 1525
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC_T3 Y101
U 1 1 6292CDA1
P 5075 1625
F 0 "Y101" H 5725 1450 50  0000 L CNN
F 1 "CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC_T3" H 5025 1350 50  0000 L CNN
F 2 "CM8V32768TA020125" H 5725 1725 50  0001 L CNN
F 3 "https://www.mouser.de/datasheet/2/530/CM8V_T1A-1510858.pdf" H 5725 1625 50  0001 L CNN
F 4 "CM8V-T1A Tuning Fork Crystal 32.768 kHz" H 5725 1525 50  0001 L CNN "Description"
F 5 "0.6" H 5725 1425 50  0001 L CNN "Height"
F 6 "Micro Crystal AG" H 5725 1325 50  0001 L CNN "Manufacturer_Name"
F 7 "CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC T3" H 5725 1225 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "428-202684-MC03" H 5725 1125 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Micro-Crystal/CM8V-T1A-32768kHz-4pF-20PPM-TA-QC-T3?qs=DPoM0jnrROXyasaC3wHYWA%3D%3D" H 5725 1025 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 5725 925 50  0001 L CNN "Arrow Part Number"
F 11 "" H 5725 825 50  0001 L CNN "Arrow Price/Stock"
	1    5075 1625
	-1   0    0    1   
$EndComp
Wire Wire Line
	5175 1525 5125 1525
Wire Wire Line
	5175 1625 5075 1625
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62934E1E
P 5125 1025
AR Path="/626A0AD6/62934E1E" Ref="C?"  Part="1" 
AR Path="/62934E1E" Ref="C101"  Part="1" 
F 0 "C101" H 5400 800 50  0000 C CNN
F 1 "?uF" H 5400 875 50  0000 C CNN
F 2 "CAPC1005X55N" H 5475 1075 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 5475 975 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 5475 875 50  0001 L CNN "Description"
F 5 "0.55" H 5475 775 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 5475 675 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 5475 575 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 5475 475 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 5475 375 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 5475 275 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 5475 175 50  0001 L CNN "Arrow Price/Stock"
	1    5125 1025
	0    1    1    0   
$EndComp
Connection ~ 5125 1525
Wire Wire Line
	5125 1525 5075 1525
$Comp
L power:+3.3V #PWR0109
U 1 1 6293955C
P 6400 1375
F 0 "#PWR0109" H 6400 1225 50  0001 C CNN
F 1 "+3.3V" H 6415 1548 50  0000 C CNN
F 2 "" H 6400 1375 50  0001 C CNN
F 3 "" H 6400 1375 50  0001 C CNN
	1    6400 1375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 6293A3D3
P 5100 2000
F 0 "#PWR0110" H 5100 1750 50  0001 C CNN
F 1 "GND" H 5105 1827 50  0000 C CNN
F 2 "" H 5100 2000 50  0001 C CNN
F 3 "" H 5100 2000 50  0001 C CNN
	1    5100 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2000 5100 1825
Wire Wire Line
	5100 1825 5175 1825
Wire Wire Line
	6275 1525 6400 1525
Wire Wire Line
	6400 1525 6400 1375
Text Notes 5275 1100 0    50   ~ 0
NOT DONE! Check Datasheet for cap settings.
$Comp
L Battery_Management:MCP73831-2-OT U102
U 1 1 62B3324A
P 1975 1500
F 0 "U102" H 2150 1775 50  0000 C CNN
F 1 "MCP73831-2-OT" H 1550 1775 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 2025 1250 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 1825 1450 50  0001 C CNN
	1    1975 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 62B39238
P 1975 1800
F 0 "#PWR0111" H 1975 1550 50  0001 C CNN
F 1 "GND" H 1980 1627 50  0000 C CNN
F 2 "" H 1975 1800 50  0001 C CNN
F 3 "" H 1975 1800 50  0001 C CNN
	1    1975 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 62B3ACC0
P 1575 1900
F 0 "#PWR0112" H 1575 1650 50  0001 C CNN
F 1 "GND" H 1580 1727 50  0000 C CNN
F 2 "" H 1575 1900 50  0001 C CNN
F 3 "" H 1575 1900 50  0001 C CNN
	1    1575 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62B3D333
P 1575 1750
AR Path="/626A0AD6/62B3D333" Ref="R?"  Part="1" 
AR Path="/62B3D333" Ref="R101"  Part="1" 
F 0 "R101" V 1575 1750 50  0000 C CNN
F 1 "10k" V 1500 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_01005_0402Metric" V 1505 1750 50  0001 C CNN
F 3 "~" H 1575 1750 50  0001 C CNN
	1    1575 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 62B3FAF0
P 1975 1100
F 0 "#PWR0113" H 1975 950 50  0001 C CNN
F 1 "+5V" H 1990 1273 50  0000 C CNN
F 2 "" H 1975 1100 50  0001 C CNN
F 3 "" H 1975 1100 50  0001 C CNN
	1    1975 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1975 1100 1975 1200
$Comp
L power:+BATT #PWR0114
U 1 1 62B697C7
P 2750 1400
F 0 "#PWR0114" H 2750 1250 50  0001 C CNN
F 1 "+BATT" V 2765 1528 50  0000 L CNN
F 2 "" H 2750 1400 50  0001 C CNN
F 3 "" H 2750 1400 50  0001 C CNN
	1    2750 1400
	0    1    1    0   
$EndComp
$EndSCHEMATC

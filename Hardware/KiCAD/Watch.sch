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
S 8875 2925 1025 650 
U 626A0AD6
F0 "leds" 50
F1 "watch_leds.sch" 50
F2 "SDA" I L 8875 3200 50 
F3 "SCL" I L 8875 3375 50 
$EndSheet
$Comp
L UltraLibrarian:ATSAM4LS2AA-AU U101
U 1 1 626A3982
P 2050 1625
F 0 "U101" H 3050 2012 60  0000 C CNN
F 1 "ATSAM4LS2AA-AU" H 3050 1906 60  0000 C CNN
F 2 "UltraLibrary_Parts:ATSAM4LS2AA-AU" H 3050 1865 60  0001 C CNN
F 3 "" H 2050 1625 60  0000 C CNN
	1    2050 1625
	1    0    0    -1  
$EndComp
Text Label 9925 1975 0    50   ~ 0
SDA
Text Label 9925 1875 0    50   ~ 0
SCL
Text Label 8875 3375 2    50   ~ 0
SCL
Text Label 8875 3200 2    50   ~ 0
SDA
$Comp
L SamacSys_Parts:PT7C4563BQ1WEX IC101
U 1 1 62927C7B
P 8825 1675
F 0 "IC101" H 9375 1940 50  0000 C CNN
F 1 "PT7C4563BQ1WEX" H 9375 1849 50  0000 C CNN
F 2 "SOIC127P600X175-8N" H 9775 1775 50  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/PT7C4563BQ.pdf" H 9775 1675 50  0001 L CNN
F 4 "Real Time Clock Real Time Clock SO-8 T&R 2.5K" H 9775 1575 50  0001 L CNN "Description"
F 5 "1.75" H 9775 1475 50  0001 L CNN "Height"
F 6 "Diodes Inc." H 9775 1375 50  0001 L CNN "Manufacturer_Name"
F 7 "PT7C4563BQ1WEX" H 9775 1275 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "621-PT7C4563BQ1WEX" H 9775 1175 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Diodes-Incorporated/PT7C4563BQ1WEX?qs=P1JMDcb91o5VwflV1V69pA%3D%3D" H 9775 1075 50  0001 L CNN "Mouser Price/Stock"
F 10 "PT7C4563BQ1WEX" H 9775 975 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/pt7c4563bq1wex/diodes-incorporated?region=nac" H 9775 875 50  0001 L CNN "Arrow Price/Stock"
	1    8825 1675
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC_T3 Y101
U 1 1 6292CDA1
P 8725 1775
F 0 "Y101" H 9375 1600 50  0000 L CNN
F 1 "CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC_T3" H 8675 1500 50  0000 L CNN
F 2 "CM8V32768TA020125" H 9375 1875 50  0001 L CNN
F 3 "https://www.mouser.de/datasheet/2/530/CM8V_T1A-1510858.pdf" H 9375 1775 50  0001 L CNN
F 4 "CM8V-T1A Tuning Fork Crystal 32.768 kHz" H 9375 1675 50  0001 L CNN "Description"
F 5 "0.6" H 9375 1575 50  0001 L CNN "Height"
F 6 "Micro Crystal AG" H 9375 1475 50  0001 L CNN "Manufacturer_Name"
F 7 "CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC T3" H 9375 1375 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "428-202684-MC03" H 9375 1275 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Micro-Crystal/CM8V-T1A-32768kHz-4pF-20PPM-TA-QC-T3?qs=DPoM0jnrROXyasaC3wHYWA%3D%3D" H 9375 1175 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 9375 1075 50  0001 L CNN "Arrow Part Number"
F 11 "" H 9375 975 50  0001 L CNN "Arrow Price/Stock"
	1    8725 1775
	-1   0    0    1   
$EndComp
Wire Wire Line
	8825 1675 8775 1675
Wire Wire Line
	8825 1775 8725 1775
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62934E1E
P 8775 1175
AR Path="/626A0AD6/62934E1E" Ref="C?"  Part="1" 
AR Path="/62934E1E" Ref="C101"  Part="1" 
F 0 "C101" H 9050 950 50  0000 C CNN
F 1 "?uF" H 9050 1025 50  0000 C CNN
F 2 "CAPC1005X55N" H 9125 1225 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 9125 1125 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 9125 1025 50  0001 L CNN "Description"
F 5 "0.55" H 9125 925 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 9125 825 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 9125 725 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 9125 625 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 9125 525 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 9125 425 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 9125 325 50  0001 L CNN "Arrow Price/Stock"
	1    8775 1175
	0    1    1    0   
$EndComp
Connection ~ 8775 1675
Wire Wire Line
	8775 1675 8725 1675
$Comp
L power:+3.3V #PWR0109
U 1 1 6293955C
P 10050 1525
F 0 "#PWR0109" H 10050 1375 50  0001 C CNN
F 1 "+3.3V" H 10065 1698 50  0000 C CNN
F 2 "" H 10050 1525 50  0001 C CNN
F 3 "" H 10050 1525 50  0001 C CNN
	1    10050 1525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 6293A3D3
P 8750 2150
F 0 "#PWR0110" H 8750 1900 50  0001 C CNN
F 1 "GND" H 8755 1977 50  0000 C CNN
F 2 "" H 8750 2150 50  0001 C CNN
F 3 "" H 8750 2150 50  0001 C CNN
	1    8750 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 2150 8750 1975
Wire Wire Line
	8750 1975 8825 1975
Wire Wire Line
	9925 1675 10050 1675
Wire Wire Line
	10050 1675 10050 1525
Text Notes 8925 1250 0    50   ~ 0
NOT DONE! Check Datasheet for cap settings.
$EndSCHEMATC

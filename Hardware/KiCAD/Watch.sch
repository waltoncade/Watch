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
$Comp
L UltraLibrarian:ATSAM4LS2AA-AU U101
U 1 1 626A3982
P 1800 3250
F 0 "U101" H 2800 3637 60  0000 C CNN
F 1 "ATSAM4LS2AA-AU" H 2800 3531 60  0000 C CNN
F 2 "UltraLibrary_Parts:ATSAM4LS2AA-AU" H 2800 3490 60  0001 C CNN
F 3 "" H 1800 3250 60  0000 C CNN
	1    1800 3250
	1    0    0    -1  
$EndComp
Text Label 8775 1975 0    50   ~ 0
SDA
Text Label 8775 1875 0    50   ~ 0
SCL
Text Label 7475 3275 2    50   ~ 0
SCL
Text Label 7475 3100 2    50   ~ 0
SDA
$Comp
L SamacSys_Parts:CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC_T3 Y101
U 1 1 6292CDA1
P 7575 1775
F 0 "Y101" H 7925 1500 50  0000 L CNN
F 1 "CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC_T3" H 6475 1175 50  0000 L CNN
F 2 "CM8V32768TA020125" H 8225 1875 50  0001 L CNN
F 3 "https://www.mouser.de/datasheet/2/530/CM8V_T1A-1510858.pdf" H 8225 1775 50  0001 L CNN
F 4 "CM8V-T1A Tuning Fork Crystal 32.768 kHz" H 8225 1675 50  0001 L CNN "Description"
F 5 "0.6" H 8225 1575 50  0001 L CNN "Height"
F 6 "Micro Crystal AG" H 8225 1475 50  0001 L CNN "Manufacturer_Name"
F 7 "CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC T3" H 8225 1375 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "428-202684-MC03" H 8225 1275 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Micro-Crystal/CM8V-T1A-32768kHz-4pF-20PPM-TA-QC-T3?qs=DPoM0jnrROXyasaC3wHYWA%3D%3D" H 8225 1175 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 8225 1075 50  0001 L CNN "Arrow Part Number"
F 11 "" H 8225 975 50  0001 L CNN "Arrow Price/Stock"
	1    7575 1775
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 6293955C
P 9425 1025
F 0 "#PWR0109" H 9425 875 50  0001 C CNN
F 1 "+3.3V" H 9440 1198 50  0000 C CNN
F 2 "" H 9425 1025 50  0001 C CNN
F 3 "" H 9425 1025 50  0001 C CNN
	1    9425 1025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 6293A3D3
P 7500 2150
F 0 "#PWR0110" H 7500 1900 50  0001 C CNN
F 1 "GND" H 7505 1977 50  0000 C CNN
F 2 "" H 7500 2150 50  0001 C CNN
F 3 "" H 7500 2150 50  0001 C CNN
	1    7500 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2150 7500 1975
Wire Wire Line
	7500 1975 7575 1975
Wire Wire Line
	9425 1675 9425 1625
$Comp
L Battery_Management:MCP73831-2-OT U102
U 1 1 62B3324A
P 1975 1650
F 0 "U102" H 2150 1925 50  0000 C CNN
F 1 "MCP73831-2-OT" H 2375 2000 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 2025 1400 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 1825 1600 50  0001 C CNN
	1    1975 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 62B39238
P 1975 1950
F 0 "#PWR0111" H 1975 1700 50  0001 C CNN
F 1 "GND" H 1980 1777 50  0000 C CNN
F 2 "" H 1975 1950 50  0001 C CNN
F 3 "" H 1975 1950 50  0001 C CNN
	1    1975 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 62B3ACC0
P 1575 2050
F 0 "#PWR0112" H 1575 1800 50  0001 C CNN
F 1 "GND" H 1580 1877 50  0000 C CNN
F 2 "" H 1575 2050 50  0001 C CNN
F 3 "" H 1575 2050 50  0001 C CNN
	1    1575 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62B3D333
P 1575 1900
AR Path="/626A0AD6/62B3D333" Ref="R?"  Part="1" 
AR Path="/62B3D333" Ref="R101"  Part="1" 
F 0 "R101" V 1575 1900 50  0000 C CNN
F 1 "10k" V 1500 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 1505 1900 50  0001 C CNN
F 3 "~" H 1575 1900 50  0001 C CNN
	1    1575 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0113
U 1 1 62B3FAF0
P 1975 900
F 0 "#PWR0113" H 1975 750 50  0001 C CNN
F 1 "+5V" H 1990 1073 50  0000 C CNN
F 2 "" H 1975 900 50  0001 C CNN
F 3 "" H 1975 900 50  0001 C CNN
	1    1975 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0114
U 1 1 62B697C7
P 3275 1550
F 0 "#PWR0114" H 3275 1400 50  0001 C CNN
F 1 "+BATT" V 3290 1678 50  0000 L CNN
F 2 "" H 3275 1550 50  0001 C CNN
F 3 "" H 3275 1550 50  0001 C CNN
	1    3275 1550
	0    1    1    0   
$EndComp
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62CD6321
P 675 1875
AR Path="/626A0AD6/62CD6321" Ref="C?"  Part="1" 
AR Path="/62CD6321" Ref="C101"  Part="1" 
F 0 "C101" H 950 1650 50  0000 C CNN
F 1 "4.7uF" H 950 1725 50  0000 C CNN
F 2 "CAPC1005X55N" H 1025 1925 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 1025 1825 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 1025 1725 50  0001 L CNN "Description"
F 5 "0.55" H 1025 1625 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 1025 1525 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 1025 1425 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 1025 1325 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 1025 1225 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 1025 1125 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 1025 1025 50  0001 L CNN "Arrow Price/Stock"
	1    675  1875
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 62CDC2EE
P 675 1875
F 0 "#PWR0105" H 675 1625 50  0001 C CNN
F 1 "GND" H 680 1702 50  0000 C CNN
F 2 "" H 675 1875 50  0001 C CNN
F 3 "" H 675 1875 50  0001 C CNN
	1    675  1875
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62CE2D8C
P 2675 2050
AR Path="/626A0AD6/62CE2D8C" Ref="C?"  Part="1" 
AR Path="/62CE2D8C" Ref="C102"  Part="1" 
F 0 "C102" H 2950 1825 50  0000 C CNN
F 1 "4.7uF" H 2950 1900 50  0000 C CNN
F 2 "CAPC1005X55N" H 3025 2100 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 3025 2000 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 3025 1900 50  0001 L CNN "Description"
F 5 "0.55" H 3025 1800 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 3025 1700 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 3025 1600 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 3025 1500 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 3025 1400 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 3025 1300 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 3025 1200 50  0001 L CNN "Arrow Price/Stock"
	1    2675 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 62CE51B7
P 2675 2050
F 0 "#PWR0116" H 2675 1800 50  0001 C CNN
F 1 "GND" H 2680 1877 50  0000 C CNN
F 2 "" H 2675 2050 50  0001 C CNN
F 3 "" H 2675 2050 50  0001 C CNN
	1    2675 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62CE5C8E
P 1225 2200
AR Path="/626A0AD6/62CE5C8E" Ref="R?"  Part="1" 
AR Path="/62CE5C8E" Ref="R102"  Part="1" 
F 0 "R102" V 1225 2200 50  0000 C CNN
F 1 "470" V 1150 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 1155 2200 50  0001 C CNN
F 3 "~" H 1225 2200 50  0001 C CNN
	1    1225 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1750 2375 1750
Wire Wire Line
	1975 900  1975 1275
Wire Wire Line
	675  1375 675  1275
Connection ~ 1975 1275
Wire Wire Line
	1975 1275 1975 1350
$Comp
L SamacSys_Parts:LTST-C191KRKT LED?
U 1 1 62CEF15F
P 1225 1875
AR Path="/626A0AD6/62CEF15F" Ref="LED?"  Part="1" 
AR Path="/62CEF15F" Ref="LED101"  Part="1" 
F 0 "LED101" H 1250 2000 50  0000 C CNN
F 1 "LTST-C191KRKT" H 1500 1700 50  0000 C CNN
F 2 "LEDC1608X55N" H 1725 2025 50  0001 L BNN
F 3 "http://www.mouser.com/ds/2/239/S_110_LTST-C191KRKT-539838.pdf" H 1725 1925 50  0001 L BNN
F 4 "Standard LEDs - SMD Red Clear 631nm" H 1725 1825 50  0001 L BNN "Description"
F 5 "0.55" H 1725 1725 50  0001 L BNN "Height"
F 6 "Lite-On" H 1725 1625 50  0001 L BNN "Manufacturer_Name"
F 7 "LTST-C191KRKT" H 1725 1525 50  0001 L BNN "Manufacturer_Part_Number"
F 8 "859-LTST-C191KRKT" H 1725 1425 50  0001 L BNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Lite-On/LTST-C191KRKT?qs=BAIUz4Y8PJBLfOhzue0q%252BA%3D%3D" H 1725 1325 50  0001 L BNN "Mouser Price/Stock"
F 10 "LTST-C191KRKT" H 1725 1225 50  0001 L BNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/ltst-c191krkt/lite-on-technology?region=nac" H 1725 1125 50  0001 L BNN "Arrow Price/Stock"
	1    1225 1875
	0    -1   -1   0   
$EndComp
Connection ~ 1225 1275
Wire Wire Line
	675  1275 1225 1275
Wire Wire Line
	1225 1875 1225 2050
Wire Wire Line
	1225 2350 2500 2350
Wire Wire Line
	2500 2350 2500 1750
Text Notes 9250 6350 0    50   ~ 0
10uA/decade -> 0.56V/decade\n100 lux = 56k * 20uA = 1.12V\n1000 lux = 56k * 30uA = 1.68V
$Comp
L SamacSys_Parts:PCF85063AT_AY IC102
U 1 1 62CFAF48
P 7575 1675
F 0 "IC102" H 8175 1940 50  0000 C CNN
F 1 "PCF85063AT_AY" H 8175 1849 50  0000 C CNN
F 2 "SOIC127P600X175-8N" H 8625 1775 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/2/PCF85063AT_AY.pdf" H 8625 1675 50  0001 L CNN
F 4 "Real Time Clock Low Power Real time clocks" H 8625 1575 50  0001 L CNN "Description"
F 5 "1.75" H 8625 1475 50  0001 L CNN "Height"
F 6 "NXP" H 8625 1375 50  0001 L CNN "Manufacturer_Name"
F 7 "PCF85063AT/AY" H 8625 1275 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "771-PCF85063AT/AY" H 8625 1175 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/NXP-Semiconductors/PCF85063AT-AY?qs=Yna0arPQ0CSwctr%252Bb0ls0Q%3D%3D" H 8625 1075 50  0001 L CNN "Mouser Price/Stock"
F 10 "PCF85063AT/AY" H 8625 975 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/pcf85063atay/nxp-semiconductors?region=nac" H 8625 875 50  0001 L CNN "Arrow Price/Stock"
	1    7575 1675
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 1550 2675 1550
Text Notes 2825 1550 0    50   ~ 0
4.2V
$Comp
L Connector_Generic:Conn_01x02 J101
U 1 1 6417BAB6
P 7975 4150
F 0 "J101" H 8055 4142 50  0000 L CNN
F 1 "Conn_01x02" H 8055 4051 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 7975 4150 50  0001 C CNN
F 3 "~" H 7975 4150 50  0001 C CNN
	1    7975 4150
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0117
U 1 1 6417DE68
P 8175 4050
F 0 "#PWR0117" H 8175 3900 50  0001 C CNN
F 1 "+BATT" V 8190 4178 50  0000 L CNN
F 2 "" H 8175 4050 50  0001 C CNN
F 3 "" H 8175 4050 50  0001 C CNN
	1    8175 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 6417E379
P 8175 4150
F 0 "#PWR0118" H 8175 3900 50  0001 C CNN
F 1 "GND" H 8180 3977 50  0000 C CNN
F 2 "" H 8175 4150 50  0001 C CNN
F 3 "" H 8175 4150 50  0001 C CNN
	1    8175 4150
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:TCR2LF33,LM_CT IC101
U 1 1 64189B4E
P 4600 1575
F 0 "IC101" H 5250 1840 50  0000 C CNN
F 1 "TCR2LF33,LM_CT" H 5250 1749 50  0000 C CNN
F 2 "TCR2LF33LMCT" H 5750 1675 50  0001 L CNN
F 3 "https://www.mouser.es/datasheet/2/408/TCR2LF10_datasheet_en_20141106-760799.pdf" H 5750 1575 50  0001 L CNN
F 4 "Linear Voltage Regulator IC Positive Fixed 1 Output 200mA SMV" H 5750 1475 50  0001 L CNN "Description"
F 5 "1.4" H 5750 1375 50  0001 L CNN "Height"
F 6 "Toshiba" H 5750 1275 50  0001 L CNN "Manufacturer_Name"
F 7 "TCR2LF33,LM(CT" H 5750 1175 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "757-TCR2LF33LMCT" H 5750 1075 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Toshiba/TCR2LF33LMCT?qs=lX6dEUlT%252BgfjY8NAoxAO5A%3D%3D" H 5750 975 50  0001 L CNN "Mouser Price/Stock"
F 10 "TCR2LF33,LM(CT" H 5750 875 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/tcr2lf33lm-ct/toshiba?region=nac" H 5750 775 50  0001 L CNN "Arrow Price/Stock"
	1    4600 1575
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0119
U 1 1 6418BCEE
P 4150 1575
F 0 "#PWR0119" H 4150 1425 50  0001 C CNN
F 1 "+BATT" V 4165 1703 50  0000 L CNN
F 2 "" H 4150 1575 50  0001 C CNN
F 3 "" H 4150 1575 50  0001 C CNN
	1    4150 1575
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 6418CC08
P 4600 1675
F 0 "#PWR0120" H 4600 1425 50  0001 C CNN
F 1 "GND" H 4605 1502 50  0000 C CNN
F 2 "" H 4600 1675 50  0001 C CNN
F 3 "" H 4600 1675 50  0001 C CNN
	1    4600 1675
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 1575 4300 1575
Wire Wire Line
	4300 1575 4300 1775
Connection ~ 4300 1575
Wire Wire Line
	4300 1575 4150 1575
Connection ~ 4300 1775
$Comp
L power:GND #PWR0121
U 1 1 64190446
P 4300 2275
F 0 "#PWR0121" H 4300 2025 50  0001 C CNN
F 1 "GND" H 4305 2102 50  0000 C CNN
F 2 "" H 4300 2275 50  0001 C CNN
F 3 "" H 4300 2275 50  0001 C CNN
	1    4300 2275
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0122
U 1 1 641912C9
P 6275 1575
F 0 "#PWR0122" H 6275 1425 50  0001 C CNN
F 1 "+3.3V" V 6290 1703 50  0000 L CNN
F 2 "" H 6275 1575 50  0001 C CNN
F 3 "" H 6275 1575 50  0001 C CNN
	1    6275 1575
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 64193661
P 6175 2075
F 0 "#PWR0123" H 6175 1825 50  0001 C CNN
F 1 "GND" H 6180 1902 50  0000 C CNN
F 2 "" H 6175 2075 50  0001 C CNN
F 3 "" H 6175 2075 50  0001 C CNN
	1    6175 2075
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 641978CD
P 9275 2175
AR Path="/626A0AD6/641978CD" Ref="C?"  Part="1" 
AR Path="/641978CD" Ref="C105"  Part="1" 
F 0 "C105" H 9550 1950 50  0000 C CNN
F 1 "0.1uF" H 9550 2025 50  0000 C CNN
F 2 "CAPC1005X55N" H 9625 2225 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 9625 2125 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 9625 2025 50  0001 L CNN "Description"
F 5 "0.55" H 9625 1925 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 9625 1825 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 9625 1725 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 9625 1625 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 9625 1525 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 9625 1425 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 9625 1325 50  0001 L CNN "Arrow Price/Stock"
	1    9275 2175
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8775 1675 9275 1675
Connection ~ 9275 1675
Wire Wire Line
	9275 1675 9425 1675
$Comp
L power:GND #PWR0124
U 1 1 64199052
P 9275 2175
F 0 "#PWR0124" H 9275 1925 50  0001 C CNN
F 1 "GND" H 9280 2002 50  0000 C CNN
F 2 "" H 9275 2175 50  0001 C CNN
F 3 "" H 9275 2175 50  0001 C CNN
	1    9275 2175
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6419B8F1
P 5975 2950
AR Path="/626A0AD6/6419B8F1" Ref="R?"  Part="1" 
AR Path="/6419B8F1" Ref="R103"  Part="1" 
F 0 "R103" V 5975 2950 50  0000 C CNN
F 1 "10k" V 5900 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5905 2950 50  0001 C CNN
F 3 "~" H 5975 2950 50  0001 C CNN
	1    5975 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6419B8F7
P 5975 3250
AR Path="/626A0AD6/6419B8F7" Ref="R?"  Part="1" 
AR Path="/6419B8F7" Ref="R104"  Part="1" 
F 0 "R104" V 5975 3250 50  0000 C CNN
F 1 "10k" V 5900 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5905 3250 50  0001 C CNN
F 3 "~" H 5975 3250 50  0001 C CNN
	1    5975 3250
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 6419B8FD
P 6125 3100
AR Path="/626A0AD6/6419B8FD" Ref="#PWR?"  Part="1" 
AR Path="/6419B8FD" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 6125 2950 50  0001 C CNN
F 1 "+3.3V" H 6140 3273 50  0000 C CNN
F 2 "" H 6125 3100 50  0001 C CNN
F 3 "" H 6125 3100 50  0001 C CNN
	1    6125 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	6125 2950 6125 3100
Connection ~ 6125 3100
Wire Wire Line
	6125 3100 6125 3250
$Comp
L SamacSys_Parts:CUS520,H3F D101
U 1 1 641A3777
P 9425 1625
F 0 "D101" V 9771 1495 50  0000 R CNN
F 1 "CUS520,H3F" V 9680 1495 50  0000 R CNN
F 2 "SOD2513X115N" H 9875 1625 50  0001 L CNN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=7041&prodName=CUS520" H 9875 1525 50  0001 L CNN
F 4 "Schottky Diodes & Rectifiers Single Low Leakge" H 9875 1425 50  0001 L CNN "Description"
F 5 "1.15" H 9875 1325 50  0001 L CNN "Height"
F 6 "Toshiba" H 9875 1225 50  0001 L CNN "Manufacturer_Name"
F 7 "CUS520,H3F" H 9875 1125 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "757-CUS520H3F" H 9875 1025 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Toshiba/CUS520H3F?qs=cW4DzVrAanMh8DRQGiUcZw%3D%3D" H 9875 925 50  0001 L CNN "Mouser Price/Stock"
F 10 "CUS520,H3F" H 9875 825 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cus520h3f/toshiba" H 9875 725 50  0001 L CNN "Arrow Price/Stock"
	1    9425 1625
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 1775 4600 1775
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62CDF1E1
P 4300 2275
AR Path="/626A0AD6/62CDF1E1" Ref="C?"  Part="1" 
AR Path="/62CDF1E1" Ref="C103"  Part="1" 
F 0 "C103" H 4575 2050 50  0000 C CNN
F 1 "0.1uF" H 4575 2125 50  0000 C CNN
F 2 "CAPC1005X55N" H 4650 2325 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 4650 2225 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 4650 2125 50  0001 L CNN "Description"
F 5 "0.55" H 4650 2025 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 4650 1925 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 4650 1825 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 4650 1725 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 4650 1625 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 4650 1525 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 4650 1425 50  0001 L CNN "Arrow Price/Stock"
	1    4300 2275
	0    -1   -1   0   
$EndComp
Connection ~ 6175 1575
Wire Wire Line
	6275 1575 6175 1575
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 6419281E
P 6175 2075
AR Path="/626A0AD6/6419281E" Ref="C?"  Part="1" 
AR Path="/6419281E" Ref="C104"  Part="1" 
F 0 "C104" H 6450 1850 50  0000 C CNN
F 1 "0.1uF" H 6450 1925 50  0000 C CNN
F 2 "CAPC1005X55N" H 6525 2125 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 6525 2025 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 6525 1925 50  0001 L CNN "Description"
F 5 "0.55" H 6525 1825 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 6525 1725 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 6525 1625 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 6525 1525 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 6525 1425 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 6525 1325 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 6525 1225 50  0001 L CNN "Arrow Price/Stock"
	1    6175 2075
	0    -1   -1   0   
$EndComp
$Comp
L SamacSys_Parts:RSCSK2043R3D01004T C106
U 1 1 641AE090
P 10150 1675
F 0 "C106" V 10354 1805 50  0000 L CNN
F 1 "RSCSK2043R3D01004T" V 10445 1805 50  0000 L CNN
F 2 "RSCSK2043R3D01004T" H 10500 1725 50  0001 L CNN
F 3 "https://www.elna.co.jp/en/capacitor/double_layer/catalog/pdf/C15-CS1,CSK_e.pdf" H 10500 1625 50  0001 L CNN
F 4 "Supercapacitors / Ultracapacitors 0.2F 3.3V -20+80" H 10500 1525 50  0001 L CNN "Description"
F 5 "1.8" H 10500 1425 50  0001 L CNN "Height"
F 6 "Elna" H 10500 1325 50  0001 L CNN "Manufacturer_Name"
F 7 "RSCSK2043R3D01004T" H 10500 1225 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "555-DSK3R3H204T614H2" H 10500 1125 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Elna/RSCSK2043R3D01004T?qs=4ASt3YYao0W6joWWDTvrLg%3D%3D" H 10500 1025 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 10500 925 50  0001 L CNN "Arrow Part Number"
F 11 "" H 10500 825 50  0001 L CNN "Arrow Price/Stock"
	1    10150 1675
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 641B05BF
P 10150 2175
F 0 "#PWR0126" H 10150 1925 50  0001 C CNN
F 1 "GND" H 10155 2002 50  0000 C CNN
F 2 "" H 10150 2175 50  0001 C CNN
F 3 "" H 10150 2175 50  0001 C CNN
	1    10150 2175
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 641B131A
P 9775 1675
AR Path="/626A0AD6/641B131A" Ref="R?"  Part="1" 
AR Path="/641B131A" Ref="R105"  Part="1" 
F 0 "R105" V 9775 1675 50  0000 C CNN
F 1 "10k" V 9700 1675 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9705 1675 50  0001 C CNN
F 3 "~" H 9775 1675 50  0001 C CNN
	1    9775 1675
	0    1    1    0   
$EndComp
Wire Wire Line
	9625 1675 9425 1675
Connection ~ 9425 1675
Wire Wire Line
	10150 1675 9925 1675
Wire Notes Line
	6775 2525 11175 2525
Wire Notes Line
	11175 2525 11175 775 
Wire Notes Line
	11175 775  6775 775 
Wire Notes Line
	6775 775  6775 2525
Text Notes 6825 900  0    50   ~ 0
RTC Circuit with SuperCap
Wire Notes Line
	3750 2525 6675 2525
Wire Notes Line
	6675 2525 6675 900 
Wire Notes Line
	6675 900  3750 900 
Wire Notes Line
	3750 900  3750 2525
Text Notes 3800 1025 0    50   ~ 0
DC/DC Linear Regulator
Wire Notes Line
	550  650  550  2525
Wire Notes Line
	550  2525 3675 2525
Wire Notes Line
	3675 2525 3675 650 
Wire Notes Line
	3675 650  550  650 
Text Notes 575  775  0    50   ~ 0
Lithium Charge Controller
Connection ~ 2675 1550
Text Label 5650 3250 2    50   ~ 0
SCL
Text Label 5650 2950 2    50   ~ 0
SDA
Wire Wire Line
	5825 2950 5650 2950
Wire Wire Line
	5825 3250 5650 3250
$Comp
L Device:R R?
U 1 1 641E491F
P 8950 5875
AR Path="/626A0AD6/641E491F" Ref="R?"  Part="1" 
AR Path="/641E491F" Ref="R106"  Part="1" 
F 0 "R106" V 8950 5875 50  0000 C CNN
F 1 "56k" V 8850 5875 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8880 5875 50  0001 C CNN
F 3 "~" H 8950 5875 50  0001 C CNN
	1    8950 5875
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 641E5F44
P 10475 5825
F 0 "#PWR0127" H 10475 5575 50  0001 C CNN
F 1 "GND" H 10480 5652 50  0000 C CNN
F 2 "" H 10475 5825 50  0001 C CNN
F 3 "" H 10475 5825 50  0001 C CNN
	1    10475 5825
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 641E6513
P 10475 5725
AR Path="/626A0AD6/641E6513" Ref="#PWR?"  Part="1" 
AR Path="/641E6513" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 10475 5575 50  0001 C CNN
F 1 "+3.3V" H 10490 5898 50  0000 C CNN
F 2 "" H 10475 5725 50  0001 C CNN
F 3 "" H 10475 5725 50  0001 C CNN
	1    10475 5725
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:SFH_5711-2_3-Z IC103
U 1 1 641EA5F4
P 9275 5725
F 0 "IC103" H 9875 5990 50  0000 C CNN
F 1 "SFH_5711-2_3-Z" H 9875 5899 50  0000 C CNN
F 2 "SFH571123Z" H 10325 5825 50  0001 L CNN
F 3 "https://dammedia.osram.info/media/resource/hires/osram-dam-2496447/SFH%205711.pdf" H 10325 5725 50  0001 L CNN
F 4 "Ambient Light Sensors PHOTO IC (ALS) SMT" H 10325 5625 50  0001 L CNN "Description"
F 5 "1.25" H 10325 5525 50  0001 L CNN "Height"
F 6 "OSRAM" H 10325 5425 50  0001 L CNN "Manufacturer_Name"
F 7 "SFH 5711-2/3-Z" H 10325 5325 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "720-SFH5711-2/3-Z" H 10325 5225 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/OSRAM-Opto-Semiconductors/SFH-5711-2-3-Z?qs=K5ta8V%252BWhtZqF99oIrrnNw%3D%3D" H 10325 5125 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 10325 5025 50  0001 L CNN "Arrow Part Number"
F 11 "" H 10325 4925 50  0001 L CNN "Arrow Price/Stock"
	1    9275 5725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 641ECD94
P 9275 5825
F 0 "#PWR0129" H 9275 5575 50  0001 C CNN
F 1 "GND" H 9280 5652 50  0000 C CNN
F 2 "" H 9275 5825 50  0001 C CNN
F 3 "" H 9275 5825 50  0001 C CNN
	1    9275 5825
	1    0    0    -1  
$EndComp
Wire Wire Line
	9275 5725 8950 5725
$Comp
L power:GND #PWR0130
U 1 1 641EE21D
P 8950 6025
F 0 "#PWR0130" H 8950 5775 50  0001 C CNN
F 1 "GND" H 8955 5852 50  0000 C CNN
F 2 "" H 8950 6025 50  0001 C CNN
F 3 "" H 8950 6025 50  0001 C CNN
	1    8950 6025
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 641F7666
P 1175 4950
AR Path="/626A0AD6/641F7666" Ref="#PWR?"  Part="1" 
AR Path="/641F7666" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 1175 4800 50  0001 C CNN
F 1 "+3.3V" H 1190 5123 50  0000 C CNN
F 2 "" H 1175 4950 50  0001 C CNN
F 3 "" H 1175 4950 50  0001 C CNN
	1    1175 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 4950 1700 4950
$Comp
L power:GND #PWR0132
U 1 1 641FAA5E
P 3900 3350
F 0 "#PWR0132" H 3900 3100 50  0001 C CNN
F 1 "GND" H 3905 3177 50  0000 C CNN
F 2 "" H 3900 3350 50  0001 C CNN
F 3 "" H 3900 3350 50  0001 C CNN
	1    3900 3350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 641FB60E
P 3800 5350
F 0 "#PWR0133" H 3800 5100 50  0001 C CNN
F 1 "GND" H 3805 5177 50  0000 C CNN
F 2 "" H 3800 5350 50  0001 C CNN
F 3 "" H 3800 5350 50  0001 C CNN
	1    3800 5350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 641FBCFB
P 1800 3750
F 0 "#PWR0134" H 1800 3500 50  0001 C CNN
F 1 "GND" H 1805 3577 50  0000 C CNN
F 2 "" H 1800 3750 50  0001 C CNN
F 3 "" H 1800 3750 50  0001 C CNN
	1    1800 3750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 641FCBDD
P 1800 4850
F 0 "#PWR0135" H 1800 4600 50  0001 C CNN
F 1 "GND" H 1805 4677 50  0000 C CNN
F 2 "" H 1800 4850 50  0001 C CNN
F 3 "" H 1800 4850 50  0001 C CNN
	1    1800 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 5050 1700 5050
Wire Wire Line
	1700 5050 1700 4950
Connection ~ 1700 4950
Wire Wire Line
	1700 4950 1175 4950
$Comp
L power:+3.3V #PWR?
U 1 1 641FE5D0
P 1175 3950
AR Path="/626A0AD6/641FE5D0" Ref="#PWR?"  Part="1" 
AR Path="/641FE5D0" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 1175 3800 50  0001 C CNN
F 1 "+3.3V" H 1190 4123 50  0000 C CNN
F 2 "" H 1175 3950 50  0001 C CNN
F 3 "" H 1175 3950 50  0001 C CNN
	1    1175 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 3950 1175 3950
$Comp
L power:+3.3V #PWR?
U 1 1 641FFC17
P 4325 5250
AR Path="/626A0AD6/641FFC17" Ref="#PWR?"  Part="1" 
AR Path="/641FFC17" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 4325 5100 50  0001 C CNN
F 1 "+3.3V" H 4340 5423 50  0000 C CNN
F 2 "" H 4325 5250 50  0001 C CNN
F 3 "" H 4325 5250 50  0001 C CNN
	1    4325 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	4325 5250 3800 5250
$Comp
L power:+3.3V #PWR?
U 1 1 642018C2
P 4350 4150
AR Path="/626A0AD6/642018C2" Ref="#PWR?"  Part="1" 
AR Path="/642018C2" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 4350 4000 50  0001 C CNN
F 1 "+3.3V" H 4365 4323 50  0000 C CNN
F 2 "" H 4350 4150 50  0001 C CNN
F 3 "" H 4350 4150 50  0001 C CNN
	1    4350 4150
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 642037E2
P 4350 3650
AR Path="/626A0AD6/642037E2" Ref="#PWR?"  Part="1" 
AR Path="/642037E2" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 4350 3500 50  0001 C CNN
F 1 "+3.3V" H 4365 3823 50  0000 C CNN
F 2 "" H 4350 3650 50  0001 C CNN
F 3 "" H 4350 3650 50  0001 C CNN
	1    4350 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 3650 3800 3650
Wire Wire Line
	4350 4150 3800 4150
$Comp
L power:+1V8 #PWR0140
U 1 1 64206EEB
P 1450 3850
F 0 "#PWR0140" H 1450 3700 50  0001 C CNN
F 1 "+1V8" V 1465 3978 50  0000 L CNN
F 2 "" H 1450 3850 50  0001 C CNN
F 3 "" H 1450 3850 50  0001 C CNN
	1    1450 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 3850 1450 3850
Text Label 9025 5725 0    50   ~ 0
vLUX
Wire Notes Line
	8675 6375 8675 5225
Wire Notes Line
	8675 5225 10925 5225
Wire Notes Line
	10925 5225 10925 6375
Wire Notes Line
	10925 6375 8675 6375
Text Notes 8750 5375 0    50   ~ 0
Light Sensor
$Comp
L Device:R R?
U 1 1 6421D723
P 9875 3700
AR Path="/626A0AD6/6421D723" Ref="R?"  Part="1" 
AR Path="/6421D723" Ref="R107"  Part="1" 
F 0 "R107" V 9875 3700 50  0000 C CNN
F 1 "10k" V 9800 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9805 3700 50  0001 C CNN
F 3 "~" H 9875 3700 50  0001 C CNN
	1    9875 3700
	1    0    0    -1  
$EndComp
Text Label 9250 3900 0    50   ~ 0
SW2
$Comp
L power:+3.3V #PWR?
U 1 1 6421D733
P 9875 3500
AR Path="/626A0AD6/6421D733" Ref="#PWR?"  Part="1" 
AR Path="/6421D733" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 9875 3350 50  0001 C CNN
F 1 "+3.3V" H 9890 3673 50  0000 C CNN
F 2 "" H 9875 3500 50  0001 C CNN
F 3 "" H 9875 3500 50  0001 C CNN
	1    9875 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J102
U 1 1 64225629
P 10200 3900
F 0 "J102" H 10280 3942 50  0000 L CNN
F 1 "Conn_01x01" H 10280 3851 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 10200 3900 50  0001 C CNN
F 3 "~" H 10200 3900 50  0001 C CNN
	1    10200 3900
	1    0    0    -1  
$EndComp
Connection ~ 9875 3900
Wire Wire Line
	9875 3900 10000 3900
Wire Wire Line
	9875 3900 9875 3850
Wire Wire Line
	9875 3550 9875 3500
$Comp
L Device:R R?
U 1 1 64230E74
P 9875 4475
AR Path="/626A0AD6/64230E74" Ref="R?"  Part="1" 
AR Path="/64230E74" Ref="R108"  Part="1" 
F 0 "R108" V 9875 4475 50  0000 C CNN
F 1 "10k" V 9800 4475 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9805 4475 50  0001 C CNN
F 3 "~" H 9875 4475 50  0001 C CNN
	1    9875 4475
	1    0    0    -1  
$EndComp
Text Label 9275 4675 0    50   ~ 0
SW1
$Comp
L power:+3.3V #PWR?
U 1 1 64230E7B
P 9875 4275
AR Path="/626A0AD6/64230E7B" Ref="#PWR?"  Part="1" 
AR Path="/64230E7B" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 9875 4125 50  0001 C CNN
F 1 "+3.3V" H 9890 4448 50  0000 C CNN
F 2 "" H 9875 4275 50  0001 C CNN
F 3 "" H 9875 4275 50  0001 C CNN
	1    9875 4275
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J103
U 1 1 64230E81
P 10200 4675
F 0 "J103" H 10280 4717 50  0000 L CNN
F 1 "Conn_01x01" H 10280 4626 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x01_P1.27mm_Vertical" H 10200 4675 50  0001 C CNN
F 3 "~" H 10200 4675 50  0001 C CNN
	1    10200 4675
	1    0    0    -1  
$EndComp
Connection ~ 9875 4675
Wire Wire Line
	9875 4675 10000 4675
Wire Wire Line
	9875 4675 9875 4625
Wire Wire Line
	9875 4325 9875 4275
Wire Notes Line
	9175 4950 9175 3075
Wire Notes Line
	9175 3075 10900 3075
Wire Notes Line
	10900 3075 10900 4950
Wire Notes Line
	10900 4950 9175 4950
Text Notes 9225 3225 0    50   ~ 0
Offboard Buttons
Text Notes 7525 3925 0    50   ~ 0
Battery Connector Pads
Text Label 1700 4250 2    50   ~ 0
vLUX
Text Label 3800 4650 0    50   ~ 0
SW2
Text Label 3800 4550 0    50   ~ 0
SW1
$Comp
L power:+BATT #PWR0143
U 1 1 6429C5F1
P 6400 4050
F 0 "#PWR0143" H 6400 3900 50  0001 C CNN
F 1 "+BATT" V 6415 4178 50  0000 L CNN
F 2 "" H 6400 4050 50  0001 C CNN
F 3 "" H 6400 4050 50  0001 C CNN
	1    6400 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6429E238
P 6400 4300
AR Path="/626A0AD6/6429E238" Ref="R?"  Part="1" 
AR Path="/6429E238" Ref="R113"  Part="1" 
F 0 "R113" V 6400 4300 50  0000 C CNN
F 1 "1Meg" V 6325 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6330 4300 50  0001 C CNN
F 3 "~" H 6400 4300 50  0001 C CNN
	1    6400 4300
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 6429F31C
P 6400 4650
AR Path="/626A0AD6/6429F31C" Ref="R?"  Part="1" 
AR Path="/6429F31C" Ref="R114"  Part="1" 
F 0 "R114" V 6400 4650 50  0000 C CNN
F 1 "1MEG" V 6325 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5750 4550 50  0001 C CNN
F 3 "~" H 6400 4650 50  0001 C CNN
	1    6400 4650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 642A01EF
P 6400 4900
F 0 "#PWR0144" H 6400 4650 50  0001 C CNN
F 1 "GND" H 6405 4727 50  0000 C CNN
F 2 "" H 6400 4900 50  0001 C CNN
F 3 "" H 6400 4900 50  0001 C CNN
	1    6400 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4050 6400 4150
Wire Wire Line
	6400 4800 6400 4900
Text Label 6525 4475 0    50   ~ 0
BattSns
Text Label 1700 4350 2    50   ~ 0
BattSns
Wire Wire Line
	6400 4450 6400 4475
Wire Wire Line
	6525 4475 6400 4475
Connection ~ 6400 4475
Wire Wire Line
	6400 4475 6400 4500
$Comp
L SamacSys_Parts:LTST-C191KRKT LED?
U 1 1 642B53DA
P 7450 5775
AR Path="/626A0AD6/642B53DA" Ref="LED?"  Part="1" 
AR Path="/642B53DA" Ref="LED102"  Part="1" 
F 0 "LED102" H 7475 5900 50  0000 C CNN
F 1 "LTST-C191KRKT" H 7725 5600 50  0000 C CNN
F 2 "LEDC1608X55N" H 7950 5925 50  0001 L BNN
F 3 "http://www.mouser.com/ds/2/239/S_110_LTST-C191KRKT-539838.pdf" H 7950 5825 50  0001 L BNN
F 4 "Standard LEDs - SMD Red Clear 631nm" H 7950 5725 50  0001 L BNN "Description"
F 5 "0.55" H 7950 5625 50  0001 L BNN "Height"
F 6 "Lite-On" H 7950 5525 50  0001 L BNN "Manufacturer_Name"
F 7 "LTST-C191KRKT" H 7950 5425 50  0001 L BNN "Manufacturer_Part_Number"
F 8 "859-LTST-C191KRKT" H 7950 5325 50  0001 L BNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Lite-On/LTST-C191KRKT?qs=BAIUz4Y8PJBLfOhzue0q%252BA%3D%3D" H 7950 5225 50  0001 L BNN "Mouser Price/Stock"
F 10 "LTST-C191KRKT" H 7950 5125 50  0001 L BNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/ltst-c191krkt/lite-on-technology?region=nac" H 7950 5025 50  0001 L BNN "Arrow Price/Stock"
	1    7450 5775
	1    0    0    -1  
$EndComp
$Sheet
S 7475 2825 1025 650 
U 626A0AD6
F0 "leds" 50
F1 "watch_leds.sch" 50
F2 "SDA" I L 7475 3100 50 
F3 "SCL" I L 7475 3275 50 
F4 "SDB" I L 7475 3400 50 
$EndSheet
$Comp
L power:+3.3V #PWR0145
U 1 1 642C32BA
P 8050 5775
F 0 "#PWR0145" H 8050 5625 50  0001 C CNN
F 1 "+3.3V" V 8065 5903 50  0000 L CNN
F 2 "" H 8050 5775 50  0001 C CNN
F 3 "" H 8050 5775 50  0001 C CNN
	1    8050 5775
	0    1    1    0   
$EndComp
Text Notes 7075 6200 0    50   ~ 0
I don't think this will work. \nMax Sink is 3.2mA. Will be very feint
Text Label 7075 5775 0    50   ~ 0
LED_STAT
Wire Wire Line
	7450 5775 7075 5775
Text Label 1700 3450 2    50   ~ 0
LED_STAT
Text Label 3900 4050 0    50   ~ 0
SDA
Text Label 3900 3950 0    50   ~ 0
SCL
Text Label 7475 3400 2    50   ~ 0
SDB
Text Label 3900 4250 0    50   ~ 0
SDB
Wire Wire Line
	1800 3450 1700 3450
Wire Wire Line
	1800 4250 1700 4250
Wire Wire Line
	1800 4350 1700 4350
Wire Wire Line
	3900 3850 3800 3850
Wire Wire Line
	3900 3950 3800 3950
Wire Wire Line
	3900 4050 3800 4050
Text Label 1700 3550 2    50   ~ 0
JTAG_RESET
Wire Wire Line
	1800 3550 1700 3550
Text Label 1700 4050 2    50   ~ 0
JTAG_TCK
Wire Wire Line
	1800 4050 1700 4050
Text Label 1700 4150 2    50   ~ 0
JTAG_TMS
Wire Wire Line
	1800 4150 1700 4150
Text Label 3900 3850 0    50   ~ 0
JTAG_TDO
Wire Wire Line
	3900 4250 3800 4250
Text Label 3900 3750 0    50   ~ 0
JTAG_TDI
Wire Wire Line
	3900 3750 3800 3750
Wire Wire Line
	3900 3350 3800 3350
Wire Wire Line
	3800 3250 3800 3350
Connection ~ 3800 3350
$Comp
L power:+3.3V #PWR0148
U 1 1 6431488A
P 5525 4125
F 0 "#PWR0148" H 5525 3975 50  0001 C CNN
F 1 "+3.3V" V 5540 4253 50  0000 L CNN
F 2 "" H 5525 4125 50  0001 C CNN
F 3 "" H 5525 4125 50  0001 C CNN
	1    5525 4125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0149
U 1 1 6431BE6C
P 5525 4800
F 0 "#PWR0149" H 5525 4550 50  0001 C CNN
F 1 "GND" H 5530 4627 50  0000 C CNN
F 2 "" H 5525 4800 50  0001 C CNN
F 3 "" H 5525 4800 50  0001 C CNN
	1    5525 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J105
U 1 1 64348139
P 7975 4850
F 0 "J105" H 8055 4842 50  0000 L CNN
F 1 "Conn_01x02" H 8055 4751 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 7975 4850 50  0001 C CNN
F 3 "~" H 7975 4850 50  0001 C CNN
	1    7975 4850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 64348145
P 8175 4850
F 0 "#PWR0150" H 8175 4600 50  0001 C CNN
F 1 "GND" H 8180 4677 50  0000 C CNN
F 2 "" H 8175 4850 50  0001 C CNN
F 3 "" H 8175 4850 50  0001 C CNN
	1    8175 4850
	1    0    0    -1  
$EndComp
Text Notes 7525 4625 0    50   ~ 0
Charging Connector Pads
$Comp
L power:+5V #PWR0151
U 1 1 64352DC6
P 8175 4750
F 0 "#PWR0151" H 8175 4600 50  0001 C CNN
F 1 "+5V" H 8190 4923 50  0000 C CNN
F 2 "" H 8175 4750 50  0001 C CNN
F 3 "" H 8175 4750 50  0001 C CNN
	1    8175 4750
	0    1    1    0   
$EndComp
Text Notes 4125 5750 0    50   ~ 0
JTAG
Wire Notes Line
	6825 7650 4050 7650
Wire Notes Line
	6825 5600 6825 7650
Wire Notes Line
	4050 5600 6825 5600
Wire Notes Line
	4050 7650 4050 5600
Text Label 6300 6425 0    50   ~ 0
JTAG_RESET
Wire Wire Line
	5225 6425 6300 6425
Text Notes 5275 5950 0    50   ~ 0
Potential to DNP pull-ups
Wire Wire Line
	6050 6925 5225 6925
Connection ~ 6050 6925
Wire Wire Line
	6050 6300 6050 6925
Wire Wire Line
	5850 6825 6300 6825
Connection ~ 5850 6825
Wire Wire Line
	5850 6300 5850 6825
Wire Wire Line
	5650 6725 5225 6725
Connection ~ 5650 6725
Wire Wire Line
	5650 6300 5650 6725
Wire Wire Line
	5450 6625 6300 6625
Connection ~ 5450 6625
Wire Wire Line
	5450 6300 5450 6625
Connection ~ 5850 6000
Wire Wire Line
	6050 6000 5850 6000
$Comp
L Device:R R?
U 1 1 642EF4CB
P 6050 6150
AR Path="/626A0AD6/642EF4CB" Ref="R?"  Part="1" 
AR Path="/642EF4CB" Ref="R112"  Part="1" 
F 0 "R112" V 6050 6150 50  0000 C CNN
F 1 "10k" V 5975 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5980 6150 50  0001 C CNN
F 3 "~" H 6050 6150 50  0001 C CNN
	1    6050 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 6925 6050 6925
Wire Wire Line
	5225 6825 5850 6825
Wire Wire Line
	6300 6725 5650 6725
Wire Wire Line
	5225 6625 5450 6625
Wire Wire Line
	5850 6000 5650 6000
Wire Wire Line
	5650 6000 5450 6000
Connection ~ 5650 6000
Wire Wire Line
	5450 6000 4725 6000
Connection ~ 5450 6000
Wire Wire Line
	4725 6000 4725 6125
Connection ~ 4725 6000
Wire Wire Line
	4725 5875 4725 6000
$Comp
L Device:R R?
U 1 1 642DDE79
P 5850 6150
AR Path="/626A0AD6/642DDE79" Ref="R?"  Part="1" 
AR Path="/642DDE79" Ref="R111"  Part="1" 
F 0 "R111" V 5850 6150 50  0000 C CNN
F 1 "10k" V 5775 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5780 6150 50  0001 C CNN
F 3 "~" H 5850 6150 50  0001 C CNN
	1    5850 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 642DDB9B
P 5650 6150
AR Path="/626A0AD6/642DDB9B" Ref="R?"  Part="1" 
AR Path="/642DDB9B" Ref="R110"  Part="1" 
F 0 "R110" V 5650 6150 50  0000 C CNN
F 1 "10k" V 5575 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5580 6150 50  0001 C CNN
F 3 "~" H 5650 6150 50  0001 C CNN
	1    5650 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 642DC195
P 5450 6150
AR Path="/626A0AD6/642DC195" Ref="R?"  Part="1" 
AR Path="/642DC195" Ref="R109"  Part="1" 
F 0 "R109" V 5450 6150 50  0000 C CNN
F 1 "10k" V 5375 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 5380 6150 50  0001 C CNN
F 3 "~" H 5450 6150 50  0001 C CNN
	1    5450 6150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 642A98F5
P 4725 5875
AR Path="/626A0AD6/642A98F5" Ref="#PWR?"  Part="1" 
AR Path="/642A98F5" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 4725 5725 50  0001 C CNN
F 1 "+3.3V" H 4740 6048 50  0000 C CNN
F 2 "" H 4725 5875 50  0001 C CNN
F 3 "" H 4725 5875 50  0001 C CNN
	1    4725 5875
	1    0    0    -1  
$EndComp
Text Label 6300 6625 0    50   ~ 0
JTAG_TCK
Text Label 6300 6725 0    50   ~ 0
JTAG_TMS
Text Label 6300 6825 0    50   ~ 0
JTAG_TDO
Text Label 6300 6925 0    50   ~ 0
JTAG_TDI
Connection ~ 4725 7325
Wire Wire Line
	4725 7375 4725 7325
Wire Wire Line
	4625 7325 4725 7325
$Comp
L power:GND #PWR0146
U 1 1 642A22A2
P 4725 7375
F 0 "#PWR0146" H 4725 7125 50  0001 C CNN
F 1 "GND" H 4730 7202 50  0000 C CNN
F 2 "" H 4725 7375 50  0001 C CNN
F 3 "" H 4725 7375 50  0001 C CNN
	1    4725 7375
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_ARM_JTAG_SWD_10 J104
U 1 1 642A0C11
P 4725 6725
F 0 "J104" H 5350 6350 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 6075 6275 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD" H 4725 6725 50  0001 C CNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.ddi0314h/DDI0314H_coresight_components_trm.pdf" V 4375 5475 50  0001 C CNN
	1    4725 6725
	1    0    0    -1  
$EndComp
Wire Wire Line
	2675 1550 3275 1550
Wire Wire Line
	1225 1275 1975 1275
Wire Wire Line
	9275 4675 9875 4675
Wire Wire Line
	9250 3900 9875 3900
Wire Wire Line
	6050 1575 6175 1575
Wire Wire Line
	5900 1575 6050 1575
Connection ~ 6050 1575
$Comp
L Connector:TestPoint TP103
U 1 1 6437C10E
P 6050 1575
F 0 "TP103" H 6108 1693 50  0000 L CNN
F 1 "TestPoint" H 6100 1775 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 6250 1575 50  0001 C CNN
F 3 "~" H 6250 1575 50  0001 C CNN
	1    6050 1575
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 64312E36
P 5525 4725
AR Path="/626A0AD6/64312E36" Ref="C?"  Part="1" 
AR Path="/64312E36" Ref="C107"  Part="1" 
F 0 "C107" H 5800 4500 50  0000 C CNN
F 1 "0.1uF" H 5800 4575 50  0000 C CNN
F 2 "CAPC1005X55N" H 5875 4775 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 5875 4675 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 5875 4575 50  0001 L CNN "Description"
F 5 "0.55" H 5875 4475 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 5875 4375 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 5875 4275 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 5875 4175 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 5875 4075 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 5875 3975 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 5875 3875 50  0001 L CNN "Arrow Price/Stock"
	1    5525 4725
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5525 4125 5525 4225
Wire Wire Line
	5525 4725 5525 4800
$EndSCHEMATC

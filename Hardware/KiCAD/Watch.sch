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
P 2600 3400
F 0 "U101" H 3600 3787 60  0000 C CNN
F 1 "ATSAM4LS2AA-AU" H 3600 3681 60  0000 C CNN
F 2 "UltraLibrary_Parts:ATSAM4LS2AA-AU" H 3600 3640 60  0001 C CNN
F 3 "" H 2600 3400 60  0000 C CNN
	1    2600 3400
	1    0    0    -1  
$EndComp
Text Label 6375 1825 0    50   ~ 0
SDA
Text Label 6375 1725 0    50   ~ 0
SCL
Text Label 8600 1600 2    50   ~ 0
SCL
Text Label 8600 1425 2    50   ~ 0
SDA
$Comp
L SamacSys_Parts:CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC_T3 Y101
U 1 1 6292CDA1
P 5175 1625
F 0 "Y101" H 5825 1450 50  0000 L CNN
F 1 "CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC_T3" H 4850 575 50  0000 L CNN
F 2 "CM8V32768TA020125" H 5825 1725 50  0001 L CNN
F 3 "https://www.mouser.de/datasheet/2/530/CM8V_T1A-1510858.pdf" H 5825 1625 50  0001 L CNN
F 4 "CM8V-T1A Tuning Fork Crystal 32.768 kHz" H 5825 1525 50  0001 L CNN "Description"
F 5 "0.6" H 5825 1425 50  0001 L CNN "Height"
F 6 "Micro Crystal AG" H 5825 1325 50  0001 L CNN "Manufacturer_Name"
F 7 "CM8V-T1A-32.768kHz-4pF-20PPM-TA-QC T3" H 5825 1225 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "428-202684-MC03" H 5825 1125 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Micro-Crystal/CM8V-T1A-32768kHz-4pF-20PPM-TA-QC-T3?qs=DPoM0jnrROXyasaC3wHYWA%3D%3D" H 5825 1025 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 5825 925 50  0001 L CNN "Arrow Part Number"
F 11 "" H 5825 825 50  0001 L CNN "Arrow Price/Stock"
	1    5175 1625
	-1   0    0    1   
$EndComp
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62934E1E
P 6900 1525
AR Path="/626A0AD6/62934E1E" Ref="C?"  Part="1" 
AR Path="/62934E1E" Ref="C101"  Part="1" 
F 0 "C101" H 7175 1300 50  0000 C CNN
F 1 "?uF" H 7175 1375 50  0000 C CNN
F 2 "CAPC1005X55N" H 7250 1575 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 7250 1475 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 7250 1375 50  0001 L CNN "Description"
F 5 "0.55" H 7250 1275 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 7250 1175 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 7250 1075 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 7250 975 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 7250 875 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 7250 775 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 7250 675 50  0001 L CNN "Arrow Price/Stock"
	1    6900 1525
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 6293955C
P 7025 1375
F 0 "#PWR0109" H 7025 1225 50  0001 C CNN
F 1 "+3.3V" H 7040 1548 50  0000 C CNN
F 2 "" H 7025 1375 50  0001 C CNN
F 3 "" H 7025 1375 50  0001 C CNN
	1    7025 1375
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
	6900 1525 7025 1525
Wire Wire Line
	7025 1525 7025 1375
Text Notes 5950 1100 0    50   ~ 0
NOT DONE! Check Datasheet for cap settings.
$Comp
L Battery_Management:MCP73831-2-OT U102
U 1 1 62B3324A
P 1975 1500
F 0 "U102" H 2150 1775 50  0000 C CNN
F 1 "MCP73831-2-OT" H 2375 1850 50  0000 C CNN
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
P 1975 750
F 0 "#PWR0113" H 1975 600 50  0001 C CNN
F 1 "+5V" H 1990 923 50  0000 C CNN
F 2 "" H 1975 750 50  0001 C CNN
F 3 "" H 1975 750 50  0001 C CNN
	1    1975 750 
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0114
U 1 1 62B697C7
P 3275 1400
F 0 "#PWR0114" H 3275 1250 50  0001 C CNN
F 1 "+BATT" V 3290 1528 50  0000 L CNN
F 2 "" H 3275 1400 50  0001 C CNN
F 3 "" H 3275 1400 50  0001 C CNN
	1    3275 1400
	0    1    1    0   
$EndComp
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62CD6321
P 675 1725
AR Path="/626A0AD6/62CD6321" Ref="C?"  Part="1" 
AR Path="/62CD6321" Ref="C?"  Part="1" 
F 0 "C?" H 950 1500 50  0000 C CNN
F 1 "4.7uF" H 950 1575 50  0000 C CNN
F 2 "CAPC1005X55N" H 1025 1775 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 1025 1675 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 1025 1575 50  0001 L CNN "Description"
F 5 "0.55" H 1025 1475 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 1025 1375 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 1025 1275 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 1025 1175 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 1025 1075 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 1025 975 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 1025 875 50  0001 L CNN "Arrow Price/Stock"
	1    675  1725
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62CDC2EE
P 675 1725
F 0 "#PWR?" H 675 1475 50  0001 C CNN
F 1 "GND" H 680 1552 50  0000 C CNN
F 2 "" H 675 1725 50  0001 C CNN
F 3 "" H 675 1725 50  0001 C CNN
	1    675  1725
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62CDF1E1
P 3050 1900
AR Path="/626A0AD6/62CDF1E1" Ref="C?"  Part="1" 
AR Path="/62CDF1E1" Ref="C?"  Part="1" 
F 0 "C?" H 3325 1675 50  0000 C CNN
F 1 "4.7uF" H 3325 1750 50  0000 C CNN
F 2 "CAPC1005X55N" H 3400 1950 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 3400 1850 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 3400 1750 50  0001 L CNN "Description"
F 5 "0.55" H 3400 1650 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 3400 1550 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 3400 1450 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 3400 1350 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 3400 1250 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 3400 1150 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 3400 1050 50  0001 L CNN "Arrow Price/Stock"
	1    3050 1900
	0    -1   -1   0   
$EndComp
$Comp
L SamacSys_Parts:CL05A104KA5NNNC C?
U 1 1 62CE2D8C
P 2675 1900
AR Path="/626A0AD6/62CE2D8C" Ref="C?"  Part="1" 
AR Path="/62CE2D8C" Ref="C?"  Part="1" 
F 0 "C?" H 2950 1675 50  0000 C CNN
F 1 "4.7uF" H 2950 1750 50  0000 C CNN
F 2 "CAPC1005X55N" H 3025 1950 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/Datasheets-DGA10/2409293.pdf" H 3025 1850 50  0001 L CNN
F 4 "Samsung Electro-Mechanics 0402 CL 100nF Ceramic Multilayer Capacitor, 25 V, +85C, X5R Dielectric, +/-10% SMD" H 3025 1750 50  0001 L CNN "Description"
F 5 "0.55" H 3025 1650 50  0001 L CNN "Height"
F 6 "Samsung Electro-Mechanics" H 3025 1550 50  0001 L CNN "Manufacturer_Name"
F 7 "CL05A104KA5NNNC" H 3025 1450 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "187-CL05A104KA5NNNC" H 3025 1350 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Samsung-Electro-Mechanics/CL05A104KA5NNNC?qs=X6jEic%2FHinDlkqz9npJeOg%3D%3D" H 3025 1250 50  0001 L CNN "Mouser Price/Stock"
F 10 "CL05A104KA5NNNC" H 3025 1150 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/cl05a104ka5nnnc/samsung-electro-mechanics" H 3025 1050 50  0001 L CNN "Arrow Price/Stock"
	1    2675 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62CE51B7
P 2675 1900
F 0 "#PWR?" H 2675 1650 50  0001 C CNN
F 1 "GND" H 2680 1727 50  0000 C CNN
F 2 "" H 2675 1900 50  0001 C CNN
F 3 "" H 2675 1900 50  0001 C CNN
	1    2675 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 62CE589B
P 3050 1900
F 0 "#PWR?" H 3050 1650 50  0001 C CNN
F 1 "GND" H 3055 1727 50  0000 C CNN
F 2 "" H 3050 1900 50  0001 C CNN
F 3 "" H 3050 1900 50  0001 C CNN
	1    3050 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 62CE5C8E
P 1225 2050
AR Path="/626A0AD6/62CE5C8E" Ref="R?"  Part="1" 
AR Path="/62CE5C8E" Ref="R?"  Part="1" 
F 0 "R?" V 1225 2050 50  0000 C CNN
F 1 "470" V 1150 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_01005_0402Metric" V 1155 2050 50  0001 C CNN
F 3 "~" H 1225 2050 50  0001 C CNN
	1    1225 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1600 2375 1600
Wire Wire Line
	1975 750  1975 1125
Wire Wire Line
	675  1225 675  1125
Connection ~ 1975 1125
Wire Wire Line
	1975 1125 1975 1200
$Comp
L SamacSys_Parts:LTST-C191KRKT LED?
U 1 1 62CEF15F
P 1225 1725
AR Path="/626A0AD6/62CEF15F" Ref="LED?"  Part="1" 
AR Path="/62CEF15F" Ref="LED?"  Part="1" 
F 0 "LED?" H 1250 1850 50  0000 C CNN
F 1 "LTST-C191KRKT" H 1500 1550 50  0000 C CNN
F 2 "LEDC1608X55N" H 1725 1875 50  0001 L BNN
F 3 "http://www.mouser.com/ds/2/239/S_110_LTST-C191KRKT-539838.pdf" H 1725 1775 50  0001 L BNN
F 4 "Standard LEDs - SMD Red Clear 631nm" H 1725 1675 50  0001 L BNN "Description"
F 5 "0.55" H 1725 1575 50  0001 L BNN "Height"
F 6 "Lite-On" H 1725 1475 50  0001 L BNN "Manufacturer_Name"
F 7 "LTST-C191KRKT" H 1725 1375 50  0001 L BNN "Manufacturer_Part_Number"
F 8 "859-LTST-C191KRKT" H 1725 1275 50  0001 L BNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Lite-On/LTST-C191KRKT?qs=BAIUz4Y8PJBLfOhzue0q%252BA%3D%3D" H 1725 1175 50  0001 L BNN "Mouser Price/Stock"
F 10 "LTST-C191KRKT" H 1725 1075 50  0001 L BNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/ltst-c191krkt/lite-on-technology?region=nac" H 1725 975 50  0001 L BNN "Arrow Price/Stock"
	1    1225 1725
	0    -1   -1   0   
$EndComp
Connection ~ 1225 1125
Wire Wire Line
	1225 1125 1975 1125
Wire Wire Line
	675  1125 1225 1125
Wire Wire Line
	1225 1725 1225 1900
Wire Wire Line
	1225 2200 2500 2200
Wire Wire Line
	2500 2200 2500 1600
Text Notes 7025 4000 0    50   ~ 0
Need light sensor
$Comp
L SamacSys_Parts:PCF85063AT_AY IC?
U 1 1 62CFAF48
P 5175 1525
F 0 "IC?" H 5775 1790 50  0000 C CNN
F 1 "PCF85063AT_AY" H 5775 1699 50  0000 C CNN
F 2 "SOIC127P600X175-8N" H 6225 1625 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/2/PCF85063AT_AY.pdf" H 6225 1525 50  0001 L CNN
F 4 "Real Time Clock Low Power Real time clocks" H 6225 1425 50  0001 L CNN "Description"
F 5 "1.75" H 6225 1325 50  0001 L CNN "Height"
F 6 "NXP" H 6225 1225 50  0001 L CNN "Manufacturer_Name"
F 7 "PCF85063AT/AY" H 6225 1125 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "771-PCF85063AT/AY" H 6225 1025 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/NXP-Semiconductors/PCF85063AT-AY?qs=Yna0arPQ0CSwctr%252Bb0ls0Q%3D%3D" H 6225 925 50  0001 L CNN "Mouser Price/Stock"
F 10 "PCF85063AT/AY" H 6225 825 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/pcf85063atay/nxp-semiconductors?region=nac" H 6225 725 50  0001 L CNN "Arrow Price/Stock"
	1    5175 1525
	1    0    0    -1  
$EndComp
Wire Wire Line
	2375 1400 3275 1400
Wire Wire Line
	6900 1525 6375 1525
Connection ~ 6900 1525
$Comp
L power:GND #PWR?
U 1 1 63E00503
P 6900 2025
F 0 "#PWR?" H 6900 1775 50  0001 C CNN
F 1 "GND" H 6905 1852 50  0000 C CNN
F 2 "" H 6900 2025 50  0001 C CNN
F 3 "" H 6900 2025 50  0001 C CNN
	1    6900 2025
	1    0    0    -1  
$EndComp
$EndSCHEMATC

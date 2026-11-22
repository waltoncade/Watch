exec(open(r"C:\Projects\Watch\Hardware\KiCAD\_gen\gen_lib.py",encoding="utf-8").read())
def wire(x1,y1,x2,y2): items.append('(wire (pts (xy %s %s) (xy %s %s)) (stroke (width 0) (type default)) (uuid %s))'%(fmt(x1),fmt(y1),fmt(x2),fmt(y2),q(U())))
def junction(x,y): items.append('(junction (at %s %s) (diameter 0) (color 0 0 0 0) (uuid %s))'%(fmt(x),fmt(y),q(U())))
R0402="Resistor_SMD:R_0402_1005Metric"; C0402="Capacitor_SMD:C_0402_1005Metric"; L0402="Inductor_SMD:L_0402_1005Metric"
DS="SWRS272F CC2340R5 datasheet"; LP="LP-EM-CC2340R5 Rev A schematic (MCU108A) p1"
def C(ref,val,x,y,top,bot,src,dnp=False,extra=None):
    e={"Source":src}; e.update(extra or {})
    two("Device:C",ref,val,x,y,top,bot,C0402,extra=e,dnp=dnp)
# ---------------- MCU ----------------
UX,UY=170.18,50.8
place("CC2340:CC2340R52E0RKPR","U301","CC2340R52E0RKPR",UX,UY,fp="CC2340:RKP0040B-IPC_B",ds="https://www.ti.com/lit/ds/symlink/cc2340r5.pdf",
      extra={"Source":"TI CC2340R5 BLE MCU, VQFN-40 5x5 0.4mm pitch"},desc="BLE 5 wireless MCU 512kB flash")
P={}
P["28"]=("VDDD",None); P["1"]=("VDDR",None); P["34"]=("VDDR",None)
P["30"]=("DCDC_SW",None); P["35"]=("X48P",None); P["36"]=("X48N",None); P["25"]=("nRESET",None); P["37"]=("NC",None)
P["39"]=("RF_OUT",None); P["40"]=("GND",None); P["41"]=("GND",None)
P["26"]=("X32P",None); P["27"]=("X32N",None)
P["11"]=("SWDIO",None); P["12"]=("SWDCK",None)
P["13"]=("MOTOR_A","output"); P["14"]=("MOTOR_B","output")
P["9"]=("LED_STAT","output"); P["4"]=("BTN1","input"); P["3"]=("BTN2","input")
for n,(nm,pt,ty) in [(k,(v[3],v[4],None)) for k,v in PINS["CC2340:CC2340R52E0RKPR"].items()]:
    if n in P: conn("U301",n,P[n][0],P[n][1])
    elif nm.startswith("DIO"): conn("U301",n,"NC")
# VDDS pins 8,17,31,38 -> one +BATT via short wires
vy=[]
for n in ("8","17","31","38"):
    x,y,a=pinpos("U301",n); wire(x,y,x-5.08,y); vy.append(y)
vy.sort(); xb=UX-5.08
for i in range(len(vy)-1): wire(xb,vy[i],xb,vy[i+1])
for y in vy[1:-1]: junction(xb,y)
pwr("+BATT",xb,vy[0],90)
# ---------------- VDDS decoupling ----------------
text("VDDS decoupling: one 0.1uF per VDDS pin + 10uF bulk on pin 31 (place each at its pin)",20.32,15.24)
C("C301","0.1uF",25.4,30.48,"+BATT","GND",LP+" C99 (pin 8)")
C("C302","0.1uF",35.56,30.48,"+BATT","GND",LP+" C101 (pin 17)")
C("C303","0.1uF",45.72,30.48,"+BATT","GND",LP+" C102 (pin 38)")
C("C304","0.1uF",55.88,30.48,"+BATT","GND",LP+" C103 (pin 31)")
C("C305","10uF",66.04,30.48,"+BATT","GND",LP+" C104 (pin 31); "+DS+" 7.3 note 3: 10uF VDDS cap required for coin cell")
pwr("+BATT",81.28,25.4,90); pwr("FLAG",81.28,25.4,90)
pwr("GND",91.44,25.4,270); pwr("FLAG",91.44,25.4,90)
# ---------------- DCDC / VDDR / VDDD ----------------
text("DC/DC: place L301 and C306 close to pin 30 (TI). VDDR pins 1 & 34 each get 0.1uF. VDDD = internal 1.28V, 1uF only, do not load.",20.32,48.26)
two("Device:L","L301","10uH",25.4,63.5,"DCDC_SW","VDDR","Inductor_SMD:L_0603_1608Metric",
    extra={"Source":LP+" L1 10uH; "+DS+" 7.4 note 2 (10uH + 10uF on VDDR)","MPN":"MLZ1608N100LT000 (TI E2E-tested 0603 alt; verify Isat/DCR)"})
C("C306","10uF",35.56,63.5,"VDDR","GND",LP+" C105; "+DS+" 7.4 note 2")
C("C307","0.1uF",45.72,63.5,"VDDR","GND",LP+" C107 (pin 34)")
C("C308","0.1uF",55.88,63.5,"VDDR","GND",LP+" C106 (pin 1)")
C("C309","1uF",66.04,63.5,"VDDD","GND",LP+" C9 (pin 28 VDDD)")
pwr("FLAG",81.28,58.42,90); label("VDDR",81.28,58.42,0)
pwr("FLAG",96.52,58.42,90); label("VDDD",96.52,58.42,0)
# ---------------- Reset + crystals ----------------
text("Reset: 100k pull-up + 0.1uF (TI ref). 48MHz: internal adjustable load caps, C311/C312 DNM footprints. 32k: LP-EM uses 12pF/15pF.",20.32,83.82)
two("Device:R","R301","100k",25.4,96.52,"+BATT","nRESET",R0402,extra={"Source":LP+" R1"})
C("C310","0.1uF",35.56,96.52,"nRESET","GND",LP+" C92")
place("Device:Crystal_GND24","Y301","48MHz",60.96,96.52,fp="Crystal:Crystal_SMD_2016-4Pin_2.0x1.6mm",
      extra={"MPN":"TZ3908AAAO43","Source":DS+" 7.20.3.1 note 4 (validated), CL 7pF; "+LP+" Y2"})
conn("Y301","1","X48N"); conn("Y301","3","X48P"); conn("Y301","2","GND")
C("C311","DNM",48.26,96.52,"X48N","GND",LP+" C52 DNM (optional ext load cap, "+DS+" 7.20.3.1 note 1)",dnp=True)
C("C312","DNM",73.66,96.52,"X48P","GND",LP+" C53 DNM",dnp=True)
place("Device:Crystal","Y302","32.768kHz",106.68,96.52,fp="Crystal:Crystal_SMD_2012-2Pin_2.0x1.2mm",
      extra={"MPN":"TBD (CL 6-12pF per "+DS+" 7.20.3.3; must suit 12/15pF caps)","Source":LP+" Y1"})
conn("Y302","1","X32P"); conn("Y302","2","X32N")
C("C313","12pF",93.98,96.52,"X32P","GND",LP+" C81 (DIO3_X32P side)")
C("C314","15pF",119.38,96.52,"X32N","GND",LP+" C91 (DIO4_X32N side)")
# ---------------- RF ----------------
text("RF: TI filter C315/L302/C316 + DC block C317 = 50 ohm RF_ANT. C318/L303/C319 antenna match (LP-EM start values for its PCB antenna, retune for this board).",20.32,116.84)
C("C315","1.5pF",25.4,132.08,"RF_OUT","GND",LP+" C33")
two("Device:L","L302","2.8nH",35.56,132.08,"RF_OUT","RF_FILT",L0402,extra={"Source":LP+" L33"})
C("C316","1.5pF",45.72,132.08,"RF_FILT","GND",LP+" C34")
place("Device:D_TVS","D301","TPD1E0B04DPYR",55.88,132.08,rot=90,fp="Diode_SMD:D_0402_1005Metric",dnp=True,
      extra={"MPN":"TPD1E0B04DPYR","Source":LP+" CR10; TI E2E schematic review: only needed with external RF connector","Footprint_note":"TBD verify X1SON-2 DPY land pattern"})
conn("D301","2","RF_FILT"); conn("D301","1","GND")
C("C317","15pF",66.04,132.08,"RF_FILT","RF_ANT",LP+" CA2 (DC block)")
x,y,a=pinpos("C317","2")
C("C318","TBD",76.2,132.08,"RF_ANT_HL","GND",LP+" Z60 = 1.2pF (start value, antenna-specific)",extra={"Start_value":"1.2pF"})
# replace C318 top label by hierarchical label
items.pop(-2); 
xh,yh,ah=pinpos("C318","1"); hlabel("RF_ANT","bidirectional",xh,yh,ah)
two("Device:L","L303","TBD",86.36,132.08,"RF_ANT","ANT_FEED",L0402,extra={"Source":LP+" Z61 = 2nH (start value)","Start_value":"2nH"})
C("C319","TBD",96.52,132.08,"ANT_FEED","GND",LP+" Z62 = 0.7pF (start value)",extra={"Start_value":"0.7pF"})
place("Device:Antenna_Chip","AE301","2450AT18A100",111.76,129.54,fp="RF_Antenna:Johanson_2450AT18x100",
      extra={"MPN":"Johanson 2450AT18A100 (placeholder, TBD)","Source":"KiCad RF_Antenna lib placeholder; LP-EM uses PCB antenna ANT1"})
conn("AE301","1","ANT_FEED"); conn("AE301","2","NC")
# ---------------- SWD ----------------
text("SWD debug (ARM Cortex 10-pin 1.27mm, same footprint as J104). VTref = +BATT.",259.08,35.56)
place("Connector:Conn_ARM_JTAG_SWD_10","J301","Conn_ARM_JTAG_SWD_10",279.4,63.5,fp="Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD",
      extra={"Source":"matches existing J104 in Watch.kicad_sch"})
for n,net in [("1","+BATT"),("2","SWDIO"),("4","SWDCK"),("10","nRESET"),("6","NC"),("8","NC"),("3","GND"),("9","GND")]: conn("J301",n,net)
# ---------------- notes ----------------
text("CC2340R52E0RKPR MCU sheet (Rev 3). Sources: TI SWRS272F datasheet; TI LP-EM-CC2340R5 Rev A schematic.\nHigh-drive DIOs (RKP): 6 DIO12, 11, 12, 13 DIO18, 14 DIO19, 20 DIO24. MOTOR_A=DIO18, MOTOR_B=DIO19 (10mA max drive).\nBTN1=DIO10, BTN2=DIO9 (LaunchPad buttons; use internal pull-ups, switch to GND). LED_STAT=DIO14.\nUnused DIOs left NC (datasheet Table 6-20 preferred). VDDS 1.71-3.8V; DCDC needs >=2.2V, else GLDO.\nLP-EM 0R bead B1 (WMCU_VDD->VDDS) omitted.",20.32,160.02)
L=list(LIB.values())
out='(kicad_sch (version 20260306) (generator "eeschema") (generator_version "10.0") (uuid %s) (paper "A3")\n(title_block (title "CC2340R52 MCU + BLE") (rev "3") (company "Watch") (comment 1 "Generated from TI SWRS272F + LP-EM-CC2340R5 reference"))\n(lib_symbols\n%s\n)\n%s\n(sheet_instances (path "/" (page "1")))\n(embedded_fonts no)\n)\n'%(q(SHEET),"\n".join(L),"\n".join(items))
open(OUT,"w",encoding="utf-8",newline="\n").write(out)
print("wrote",OUT,len(out))
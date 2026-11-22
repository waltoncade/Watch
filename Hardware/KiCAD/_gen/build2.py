exec(open(r"C:\Projects\Watch\Hardware\KiCAD\_gen\gen_lib.py",encoding="utf-8").read())
import itertools
R0402="Resistor_SMD:R_0402_1005Metric"; C0402="Capacitor_SMD:C_0402_1005Metric"; L0402="Inductor_SMD:L_0402_1005Metric"
DS="SWRS272F CC2340R5 datasheet"; LP="LP-EM-CC2340R5 Rev A schematic (MCU108A) p1"
WIRES=[]; PINPTS=[]  # (x,y,ref,pin)
def fprop(name,value,x,y,hide=False,just=None,ang=0):
    j=' (justify %s)'%just if just else ''
    return '(property %s %s (at %s %s %d)%s (effects (font (size 1.27 1.27))%s))'%(q(name),q(value),fmt(x),fmt(y),ang,' (hide yes)' if hide else '',j)
def ppos(libid,x,y,rot,mirror,num):
    px,py,pa,_,_=PINS[libid][num]
    if mirror=='y': px=-px; pa=(180-pa)%360
    r=math.radians(rot); rx=px*math.cos(r)-py*math.sin(r); ry=px*math.sin(r)+py*math.cos(r)
    return round(x+rx,3), round(y-ry,3)
def P2(libid,ref,value,x,y,rot=0,mirror=None,fp="",extra=None,dnp=False,ds="~",desc="",tref=(2.54,-1.27,'left'),tval=(2.54,1.27,'left'),fang=0):
    need(libid); pw=ref.startswith('#')
    ps=[fprop("Reference",ref,x+tref[0],y+tref[1],hide=pw,just=tref[2],ang=fang),fprop("Value",value,x+tval[0],y+tval[1],just=tval[2],ang=fang),
        fprop("Footprint",fp,x,y,hide=True),fprop("Datasheet",ds,x,y,hide=True),fprop("Description",desc,x,y,hide=True)]
    for k,v in (extra or {}).items(): ps.append(fprop(k,v,x,y,hide=True))
    pinl=''.join('(pin %s (uuid %s))'%(q(n),q(U())) for n in PINS[libid])
    mir=' (mirror %s)'%mirror if mirror else ''
    items.append('(symbol (lib_id %s) (at %s %s %d)%s (unit 1) (body_style 1) (exclude_from_sim no) (in_bom %s) (on_board yes) (in_pos_files yes) (dnp %s) (uuid %s)\n  %s\n  %s\n  (instances (project "Watch" (path %s (reference %s) (unit 1)))))'
       %(q(libid),fmt(x),fmt(y),rot,mir,'no' if pw else 'yes','yes' if dnp else 'no',q(U()),'\n  '.join(ps),pinl,q('/'+SHEET),q(ref)))
    comps[ref]=(libid,x,y,rot,mirror)
    for n in PINS[libid]:
        X,Y=ppos(libid,x,y,rot,mirror,n); PINPTS.append((X,Y,ref,n))
def pp(ref,n):
    libid,x,y,rot,mir=comps[ref]; return ppos(libid,x,y,rot,mir,n)
pc=[0]
def PW(kind,x,y,rot=0):
    pc[0]+=1
    if kind=="GND": P2("power:GND","#PWR%03d"%(300+pc[0]),"GND",x,y,rot,tref=(0,6.35,None),tval=(0,3.81,None))
    elif kind=="+BATT": P2("power:+BATT","#PWR%03d"%(300+pc[0]),"+BATT",x,y,rot,tref=(0,6.35,None),tval=(0,3.81 if rot==180 else -3.81,None))
    else: P2("power:PWR_FLAG","#FLG%03d"%(300+pc[0]),"PWR_FLAG",x,y,0,tref=(0,6.35,None),tval=(0,-3.81,None))
def W(*pts):
    for a,b in zip(pts,pts[1:]):
        assert a[0]==b[0] or a[1]==b[1], (a,b)
        WIRES.append((a,b))
def NCF(x,y): nc(x,y)
def HL(net,shape,x,y,ang=0): hlabel(net,shape,x,y,ang)
def hang(libid,ref,val,x,ytop,fp,bot="GND",**kw):
    # vertical part, pin1 at ytop, pin2 at ytop+7.62
    P2(libid,ref,val,x,ytop+3.81,fp=fp,**kw)
    if bot=="GND": PW("GND",x,ytop+7.62)
    elif bot=="+BATT": pass
def Cap(ref,val,x,ytop,src,dnp=False,extra=None):
    e={"Source":src}; e.update(extra or {}); hang("Device:C",ref,val,x,ytop,C0402,extra=e,dnp=dnp)
def Hz(libid,ref,val,xc,y,fp,extra=None):
    P2(libid,ref,val,xc,y,rot=90,fp=fp,extra=extra,tref=(0,-6.99,None),tval=(0,-4.45,None),fang=90)
# ================= U301 =================
UX,UY=152.4,76.2
P2("CC2340:CC2340R52E0RKPR","U301","CC2340R52E0RKPR",UX,UY,fp="CC2340:RKP0040B-IPC_B",ds="https://www.ti.com/lit/ds/symlink/cc2340r5.pdf",
   extra={"Source":"TI CC2340R5 BLE MCU, VQFN-40 5x5 0.4mm pitch"},desc="BLE 5 wireless MCU 512kB flash",tref=(24.13,-8.89,None),tval=(24.13,-6.35,None))
up=lambda n: pp("U301",n)
used={"28","1","34","8","17","31","38","30","35","36","25","37","39","40","41","26","27","11","12","13","14","9","4","3"}
for n,v in PINS["CC2340:CC2340R52E0RKPR"].items():
    if n not in used: NCF(*up(n))
NCF(*up("37"))
for n,net,sh in [("13","MOTOR_A","output"),("14","MOTOR_B","output"),("9","LED_STAT","output"),("4","BTN1","input"),("3","BTN2","input")]:
    x,y=up(n); HL(net,sh,x,y,0)
# ---- VDDD (pin 28) ----
x,y=up("28"); W((x,y),(149.86,y),(149.86,50.8),(139.7,50.8))
Cap("C309","1uF",139.7,50.8,LP+" C9 (pin 28 VDDD)")
PW("FLAG",149.86,50.8)
# ---- VDDR (pins 1,34) + L301 + DCDC (pin 30) ----
x1,y1=up("1"); x2,y2=up("34")
W((x2,y2),(147.32,y2),(147.32,y1)); W((x1,y1),(147.32,y1),(147.32,66.04),(137.16,66.04),(127,66.04),(116.84,66.04),(93.98,66.04))
Cap("C308","0.1uF",137.16,66.04,LP+" C106 (pin 1)")
Cap("C307","0.1uF",127,66.04,LP+" C107 (pin 34)")
Cap("C306","10uF",116.84,66.04,LP+" C105; "+DS+" 7.4 note 2")
PW("FLAG",147.32,66.04)
P2("Device:L","L301","10uH",93.98,69.85,rot=180,fp="Inductor_SMD:L_0603_1608Metric",tref=(-5.08,-1.27,None),tval=(-5.08,1.27,None),
   extra={"Source":LP+" L1 10uH; "+DS+" 7.4 note 2 (10uH + 10uF on VDDR)","MPN":"MLZ1608N100LT000 (TI E2E-tested 0603 alt; verify Isat/DCR)"})
xd,yd=up("30"); W((93.98,73.66),(93.98,yd),(xd,yd))
# ---- VDDS (8,17,31,38) ----
ys=sorted(up(n)[1] for n in ("8","17","31","38"))
for y in ys: W((UX,y),(149.86,y))
W(*[(149.86,y) for y in ys])
W((149.86,ys[0]),(142.24,ys[0]),(132.08,ys[0]),(121.92,ys[0]),(111.76,ys[0]),(101.6,ys[0]))
Cap("C301","0.1uF",142.24,ys[0],LP+" C99 (pin 8)")
Cap("C302","0.1uF",132.08,ys[0],LP+" C101 (pin 17)")
Cap("C303","0.1uF",121.92,ys[0],LP+" C102 (pin 38)")
Cap("C304","0.1uF",111.76,ys[0],LP+" C103 (pin 31)")
Cap("C305","10uF",101.6,ys[0],LP+" C104 (pin 31); "+DS+" 7.3 note 3: 10uF VDDS cap required for coin cell")
PW("+BATT",101.6,ys[0])
# ---- 48 MHz (35 X48P, 36 X48N) ----
xp,yp=up("35"); xn,yn=up("36")
P2("Device:Crystal_GND24","Y301","48MHz",127,121.92,mirror='y',fp="Crystal:Crystal_SMD_2016-4Pin_2.0x1.6mm",tref=(0,-7.62,None),tval=(0,-5.08,None),
   extra={"MPN":"TZ3908AAAO43","Source":DS+" 7.20.3.1 note 4 (validated), CL 7pF; "+LP+" Y2"})
W((xn,yn),(137.16,yn),(137.16,121.92),pp("Y301","1"))
W((xp,yp),(116.84,yp),(116.84,121.92),pp("Y301","3"))
Cap("C311","DNM",137.16,121.92,LP+" C52 DNM (optional ext load cap, "+DS+" 7.20.3.1 note 1)",dnp=True)
Cap("C312","DNM",116.84,121.92,LP+" C53 DNM",dnp=True)
PW("GND",*pp("Y301","2"))
# ---- Reset (25) -> R301/C310 -> J301 ----
xr,yr=up("25")
W((xr,yr),(149.86,yr),(149.86,165.1)); W((149.86,165.1),(144.78,165.1),(139.7,165.1))
P2("Device:R","R301","100k",139.7,161.29,fp=R0402,extra={"Source":LP+" R1"}); PW("+BATT",139.7,157.48)
Cap("C310","0.1uF",144.78,165.1,LP+" C92")
JX,JY=251.46,up("11")[1]
P2("Connector:Conn_ARM_JTAG_SWD_10","J301","Conn_ARM_JTAG_SWD_10",JX,JY,rot=180,fp="Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical_SMD",
   tref=(22.86,-5.08,None),tval=(22.86,-2.54,None),extra={"Source":"matches existing J104 in Watch.kicad_sch"})
x10,y10=pp("J301","10")
W((149.86,165.1),(233.68,165.1),(233.68,y10),(x10,y10))
W(up("11"),pp("J301","2")); W(up("12"),pp("J301","4"))
NCF(*pp("J301","6")); NCF(*pp("J301","8"))
g3=pp("J301","3"); g9=pp("J301","9")
W(g3,(g3[0],101.6),(g9[0],101.6),(259.08,101.6)); W(g9,(g9[0],101.6)); PW("GND",259.08,101.6)
PW("+BATT",*pp("J301","1"),rot=180)
# ---- EP / RFGND ----
xe,ye=up("41"); xg,yg=up("40")
W((xe,ye),(203.2,ye)); W((xg,yg),(203.2,yg)); W((203.2,ye),(203.2,yg),(203.2,154.94)); PW("GND",203.2,154.94)
# ---- 32 kHz (26 X32P, 27 X32N) ----
P2("Device:Crystal","Y302","32.768kHz",223.52,68.58,fp="Crystal:Crystal_SMD_2012-2Pin_2.0x1.2mm",tref=(0,8.89,None),tval=(0,11.43,None),
   extra={"MPN":"TBD (CL 6-12pF per "+DS+" 7.20.3.3; must suit 12/15pF caps)","Source":LP+" Y1"})
a,b=up("26"); W((a,b),(205.74,b),(205.74,68.58),(210.82,68.58),pp("Y302","1"))
a,b=up("27"); W((a,b),(236.22,b),(236.22,68.58),pp("Y302","2")); W((236.22,68.58),(241.3,68.58))
Cap("C313","12pF",210.82,68.58,LP+" C81 (DIO3_X32P side)")
Cap("C314","15pF",241.3,68.58,LP+" C91 (DIO4_X32N side)")
# ---- RF chain (39 ANT) ----
a,b=up("39"); RY=50.8
W((a,b),(203.2,b),(203.2,RY),(208.28,RY))
Cap("C315","1.5pF",208.28,RY,LP+" C33")
Hz("Device:L","L302","2.8nH",220.98,RY,L0402,extra={"Source":LP+" L33"}); W((208.28,RY),pp("L302","1"))
W(pp("L302","2"),(231.14,RY),(241.3,RY))
Cap("C316","1.5pF",231.14,RY,LP+" C34")
P2("Device:D_TVS","D301","TPD1E0B04DPYR",241.3,RY+3.81,rot=90,fp="Diode_SMD:D_0402_1005Metric",dnp=True,tref=(8.89,2.54,None),tval=(11.43,5.08,None),fang=90,
   extra={"MPN":"TPD1E0B04DPYR","Source":LP+" CR10; TI E2E schematic review: only needed with external RF connector","Footprint_note":"TBD verify X1SON-2 DPY land pattern"})
PW("GND",*pp("D301","1"))
Hz("Device:C","C317","15pF",254,RY,C0402,extra={"Source":LP+" CA2 (DC block)"}); W((241.3,RY),pp("C317","1"))
W(pp("C317","2"),(264.16,RY))
Cap("C318","TBD",264.16,RY,LP+" Z60 = 1.2pF (start value, antenna-specific)",extra={"Start_value":"1.2pF"})
Hz("Device:L","L303","TBD",276.86,RY,L0402,extra={"Source":LP+" Z61 = 2nH (start value)","Start_value":"2nH"}); W((264.16,RY),pp("L303","1"))
W(pp("L303","2"),(287.02,RY))
Cap("C319","TBD",287.02,RY,LP+" Z62 = 0.7pF (start value)",extra={"Start_value":"0.7pF"})
P2("Device:Antenna_Chip","AE301","2450AT18A100",299.72,48.26,fp="RF_Antenna:Johanson_2450AT18x100",tref=(5.08,-3.81,'left'),tval=(5.08,-1.27,'left'),
   extra={"MPN":"Johanson 2450AT18A100 (placeholder, TBD)","Source":"KiCad RF_Antenna lib placeholder; LP-EM uses PCB antenna ANT1"})
W((287.02,RY),pp("AE301","1")); NCF(*pp("AE301","2"))
# ---- flags ----
PW("+BATT",30.48,30.48); pc[0]+=1; P2("power:PWR_FLAG","#FLG%03d"%(300+pc[0]),"PWR_FLAG",30.48,30.48,0,tref=(0,6.35,None),tval=(0,2.54,None)); PW("GND",45.72,30.48); PW("FLAG",45.72,30.48)
# ---- notes ----
text("CC2340R52E0RKPR MCU sheet (Rev 3). Sources: TI SWRS272F datasheet; TI LP-EM-CC2340R5 Rev A schematic.\nHigh-drive DIOs (RKP): 6 DIO12, 11, 12, 13 DIO18, 14 DIO19, 20 DIO24. MOTOR_A=DIO18, MOTOR_B=DIO19 (10mA max drive).\nBTN1=DIO10, BTN2=DIO9 (internal pull-ups, switch to GND). LED_STAT=DIO14. Unused DIOs NC (Table 6-20).\nLayout: L301 + C306 close to pin 30; one 0.1uF per VDDS pin; VDDD 1uF only (do not load). C318/L303/C319 = antenna match, LP-EM start values 1.2pF/2nH/0.7pF, retune.\nVDDS 1.71-3.8V; DCDC needs >=2.2V, else GLDO. LP-EM 0R bead B1 omitted.",20.32,185.42)
# ================= wires, junctions, checks =================
def onseg(p,a,b):
    (x,y),(x1,y1),(x2,y2)=p,a,b
    if x1==x2: return abs(x-x1)<1e-6 and min(y1,y2)-1e-6<=y<=max(y1,y2)+1e-6
    return abs(y-y1)<1e-6 and min(x1,x2)-1e-6<=x<=max(x1,x2)+1e-6
errs=[]
for a,b in WIRES:
    for v in a+b:
        if abs(v/1.27-round(v/1.27))>1e-3: errs.append("offgrid %s"%((a,b),))
    if a==b: errs.append("zero wire %s"%((a,b),))
for (a,b),(c,d) in itertools.combinations(WIRES,2):
    if (a[0]==b[0]==c[0]==d[0]):
        lo1,hi1=sorted((a[1],b[1])); lo2,hi2=sorted((c[1],d[1]))
        if min(hi1,hi2)-max(lo1,lo2)>1e-6: errs.append("overlap V %s %s"%((a,b),(c,d)))
    if (a[1]==b[1]==c[1]==d[1]):
        lo1,hi1=sorted((a[0],b[0])); lo2,hi2=sorted((c[0],d[0]))
        if min(hi1,hi2)-max(lo1,lo2)>1e-6: errs.append("overlap H %s %s"%((a,b),(c,d)))
    # T without vertex: endpoint of one on interior of other
    for p in (a,b):
        if onseg(p,c,d) and p not in (c,d): errs.append("T-mid %s on %s"%(p,(c,d)))
    for p in (c,d):
        if onseg(p,a,b) and p not in (a,b): errs.append("T-mid %s on %s"%(p,(a,b)))
endpins=[]
for a,b in WIRES:
    for (px,py,ref,n) in PINPTS:
        if onseg((px,py),a,b):
            if (px,py) in (a,b): endpins.append(((px,py),ref,n))
            else: errs.append("pin %s.%s on wire interior %s"%(ref,n,(a,b)))
# junctions
cnt={}
for a,b in WIRES:
    for p in (a,b): cnt[p]=cnt.get(p,0)+1
for p in list(cnt):
    k=cnt[p]+sum(1 for (px,py,r,n) in PINPTS if (px,py)==p and not (r=="Y301" and n=="4"))
    if k>=3: items.append('(junction (at %s %s) (diameter 0) (color 0 0 0 0) (uuid %s))'%(fmt(p[0]),fmt(p[1]),q(U())))
# dangling wire ends
for p,c in cnt.items():
    if c==1 and not any((px,py)==p for (px,py,r,n) in PINPTS): errs.append("dangling end %s"%(p,))
for a,b in WIRES: items.append('(wire (pts (xy %s %s) (xy %s %s)) (stroke (width 0) (type default)) (uuid %s))'%(fmt(a[0]),fmt(a[1]),fmt(b[0]),fmt(b[1]),q(U())))
print("CHECK errors:",len(errs)); [print(" ",e) for e in errs]
print("wire endpoints on pins:",len(endpins))
import collections
print(" ", sorted(set("%s.%s"%(r,n) for _,r,n in endpins)))
lock=os.path.join(PRJ,"~CC2340_MCU.kicad_sch.lck"); print("LOCK present:",os.path.exists(lock))
out='(kicad_sch (version 20260306) (generator "eeschema") (generator_version "10.0") (uuid %s) (paper "A3")\n(title_block (title "CC2340R52 MCU + BLE") (rev "3") (company "Watch") (comment 1 "Generated from TI SWRS272F + LP-EM-CC2340R5 reference"))\n(lib_symbols\n%s\n)\n%s\n(sheet_instances (path "/" (page "1")))\n(embedded_fonts no)\n)\n'%(q(SHEET),"\n".join(LIB.values()),"\n".join(items))
open(OUT,"w",encoding="utf-8",newline="\n").write(out); print("wrote",OUT,len(out))
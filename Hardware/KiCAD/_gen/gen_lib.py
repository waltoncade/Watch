import re
def tokenize(s):
    i=0;n=len(s);out=[]
    while i<n:
        c=s[i]
        if c in ' \t\r\n': i+=1
        elif c in '()': out.append(c); i+=1
        elif c=='"':
            j=i+1;buf=[]
            while s[j]!='"':
                if s[j]=='\\': buf.append(s[j+1]); j+=2
                else: buf.append(s[j]); j+=1
            out.append(('S',''.join(buf))); i=j+1
        else:
            j=i
            while j<n and s[j] not in ' \t\r\n()"': j+=1
            out.append(s[i:j]); i=j
    return out
def parse(s):
    toks=tokenize(s);stack=[[]]
    for t in toks:
        if t=='(': stack.append([])
        elif t==')': x=stack.pop(); stack[-1].append(x)
        else: stack[-1].append(t)
    return stack[0]
def val(t): return t[1] if isinstance(t,tuple) else t
def find_block(text, start_pat):
    i=text.find(start_pat)
    if i<0: return None
    d=0;j=i;instr=False
    while True:
        c=text[j]
        if instr:
            if c=='\\': j+=1
            elif c=='"': instr=False
        else:
            if c=='"': instr=True
            elif c=='(': d+=1
            elif c==')':
                d-=1
                if d==0: return text[i:j+1]
        j+=1
import uuid, math, sys, os
PRJ=r"C:\Projects\Watch\Hardware\KiCAD"
KS=r"C:\Program Files\KiCad\10.0\share\kicad\symbols"
OUT=os.path.join(PRJ,"CC2340_MCU.kicad_sch")
watch=open(os.path.join(PRJ,"Watch.kicad_sch"),encoding="utf-8").read()
libcache={}
def U(): return str(uuid.uuid4())
def get_lib(libid):
    blk=find_block(watch,'(symbol "%s"'%libid)
    if blk is None:
        lib,name=libid.split(":")
        t=libcache.get(lib) or open(os.path.join(KS,lib+".kicad_sym"),encoding="utf-8").read()
        libcache[lib]=t
        blk=find_block(t,'\t(symbol "%s"\n'%name) or find_block(t,'(symbol "%s"'%name)
        blk=blk.strip()
        if '(extends' in blk[:300]: raise Exception("extends "+libid)
        blk='(symbol "%s"'%libid+blk[len('(symbol "%s"'%name):]
    return blk
def pins_of(blk):
    tree=parse(blk)[0]; pins={}
    def walk(node, unit):
        for ch in node:
            if isinstance(ch,list) and ch and ch[0]=='symbol':
                nm=val(ch[1]); parts=nm.rsplit('_',2)
                u=int(parts[1]) if len(parts)==3 and parts[1].isdigit() else 0
                b=int(parts[2]) if len(parts)==3 and parts[2].isdigit() else 1
                if b in (0,1): walk(ch,u)
            elif isinstance(ch,list) and ch and ch[0]=='pin':
                at=[c for c in ch if isinstance(c,list) and c[0]=='at'][0]
                num=[c for c in ch if isinstance(c,list) and c[0]=='number'][0]
                nm=[c for c in ch if isinstance(c,list) and c[0]=='name'][0]
                pins[val(num[1])]=(float(at[1]),float(at[2]),float(at[3]),val(nm[1]),ch[1])
    walk(tree,0); return pins
LIB={}; PINS={}
def need(libid):
    if libid not in LIB:
        LIB[libid]=get_lib(libid); PINS[libid]=pins_of(LIB[libid])
items=[]; SHEET=U(); comps={}
pwr_n=[0]
def fmt(x): 
    s=("%.4f"%x).rstrip('0').rstrip('.'); return '0' if s in('-0','') else s
def q(s): return '"'+s.replace('\\','\\\\').replace('"','\\"').replace('\n','\\n')+'"'
def prop(name,value,x,y,hide=False,ang=0):
    return '(property %s %s (at %s %s %d)%s (effects (font (size 1.27 1.27))))'%(q(name),q(value),fmt(x),fmt(y),ang,' (hide yes)' if hide else '')
def place(libid,ref,value,x,y,rot=0,fp="",extra=None,dnp=False,ds="~",desc=""):
    need(libid)
    pw=ref.startswith('#')
    ps=[prop("Reference",ref,x+(0 if pw else 2.54),y-(2.54 if pw else 1.27),hide=pw),
        prop("Value",value,x+(0 if pw else 2.54),y+(3.81 if pw else 1.27)),
        prop("Footprint",fp,x,y,hide=True),prop("Datasheet",ds,x,y,hide=True),prop("Description",desc,x,y,hide=True)]
    for k,v in (extra or {}).items(): ps.append(prop(k,v,x,y,hide=True))
    pinl=''.join('(pin %s (uuid %s))'%(q(n),q(U())) for n in PINS[libid])
    s=('(symbol (lib_id %s) (at %s %s %d) (unit 1) (body_style 1) (exclude_from_sim no) (in_bom %s) (on_board yes) (in_pos_files yes) (dnp %s) (uuid %s)\n  %s\n  %s\n  (instances (project "Watch" (path %s (reference %s) (unit 1)))))'
       %(q(libid),fmt(x),fmt(y),rot,'no' if pw else 'yes','yes' if dnp else 'no',q(U()),'\n  '.join(ps),pinl,q('/'+SHEET),q(ref)))
    items.append(s); comps[ref]=(libid,x,y,rot,value,fp,extra,dnp)
    return ref
def pinpos(ref,num):
    libid,x,y,rot=comps[ref][:4]; px,py,pa,_,_=PINS[libid][num]
    r=math.radians(rot); rx=px*math.cos(r)-py*math.sin(r); ry=px*math.sin(r)+py*math.cos(r)
    return round(x+rx,4), round(y-ry,4), int((pa+rot+180)%360)
def pwr(kind,x,y,outdir):
    pwr_n[0]+=1
    if kind=='GND': place("power:GND","#PWR%03d"%(300+pwr_n[0]),"GND",x,y,rot=int((outdir-270)%360))
    elif kind=='+BATT': place("power:+BATT","#PWR%03d"%(300+pwr_n[0]),"+BATT",x,y,rot=int((outdir-90)%360))
    elif kind=='FLAG': place("power:PWR_FLAG","#FLG%03d"%(300+pwr_n[0]),"PWR_FLAG",x,y,rot=0)
def label(name,x,y,ang):
    just='left' if ang in (0,90) else 'right'
    items.append('(label %s (at %s %s %d) (effects (font (size 1.27 1.27)) (justify %s bottom)) (uuid %s))'%(q(name),fmt(x),fmt(y),ang,just,q(U())))
def hlabel(name,shape,x,y,ang):
    just='left' if ang in (0,90) else 'right'
    items.append('(hierarchical_label %s (shape %s) (at %s %s %d) (effects (font (size 1.27 1.27)) (justify %s)) (uuid %s))'%(q(name),shape,fmt(x),fmt(y),ang,just,q(U())))
def nc(x,y): items.append('(no_connect (at %s %s) (uuid %s))'%(fmt(x),fmt(y),q(U())))
def text(s,x,y,size=1.27):
    items.append('(text %s (exclude_from_sim no) (at %s %s 0) (effects (font (size %s %s)) (justify left top)) (uuid %s))'%(q(s),fmt(x),fmt(y),fmt(size),fmt(size),q(U())))
def conn(ref,num,net,shape=None):
    x,y,a=pinpos(ref,num)
    if net in ('GND','+BATT'): pwr(net,x,y,a)
    elif net=='NC': nc(x,y)
    elif shape: hlabel(net,shape,x,y,a)
    else: label(net,x,y,a)
def two(libid,ref,value,x,y,top,bot,fp,**kw):
    place(libid,ref,value,x,y,fp=fp,**kw); conn(ref,"1",top); conn(ref,"2",bot)

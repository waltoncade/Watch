import csv,re,collections
EXC=re.compile(r'^(TP\d+|LOGO\d+|H\d+)$')
def nat(s): return [int(t) if t.isdigit() else t for t in re.split(r'(\d+)',s)]
pos={r['Ref']:r for r in csv.DictReader(open('raw/pos_all.csv'))}
rows=[r for r in csv.DictReader(open('raw/bom_flat.csv')) if not EXC.match(r['Reference']) and r['Reference'] in pos and not r['DNP'] and not r['ExclBOM']]
g=collections.OrderedDict()
for r in sorted(rows,key=lambda r:nat(r['Reference'])):
    r['Value']=re.sub(r'(?i)meg$','M',r['Value']); fp=r['Footprint'].split(':')[-1]; lc=r['LCSC Part'] or r['LCSC'] or r['JLC'] or r['JLCPCB Part']
    g.setdefault((r['Value'],fp,lc),[]).append(r['Reference'])
with open('Watch_BOM_JLC.csv','w',newline='') as f:
    w=csv.writer(f,lineterminator='\r\n'); w.writerow(['Comment','Designator','Footprint','LCSC Part #'])
    for (v,fp,lc),refs in g.items(): w.writerow([v,','.join(refs),fp,lc])
refs=sorted({r['Reference'] for r in rows},key=nat)
with open('Watch_CPL_JLC.csv','w',newline='') as f:
    w=csv.writer(f,lineterminator='\r\n'); w.writerow(['Designator','Mid X','Mid Y','Layer','Rotation'])
    for ref in refs:
        p=pos[ref]; rot=float(p['Rot']); rot=rot-360 if rot>180 else rot
        w.writerow([ref,'%.4fmm'%float(p['PosX']),'%.4fmm'%float(p['PosY']),'Top' if p['Side']=='top' else 'Bottom','%g'%rot])
print(len(refs),'parts', sum(1 for r in refs if pos[r]['Side']=='top'),'top', sum(1 for r in refs if pos[r]['Side']!='top'),'bottom', len(g),'BOM lines')

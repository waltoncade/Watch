exec(open(r"C:\Projects\Watch\Hardware\KiCAD\_gen\gen_lib.py",encoding="utf-8").read().split("import uuid")[0])
t=parse(open(r"C:\Projects\Watch\Hardware\KiCAD\_gen\cc.net",encoding="utf-8").read())[0]
nets=[x for x in t if isinstance(x,list) and x[0]=="nets"][0][1:]
for n in nets:
    name=val([c for c in n if isinstance(c,list) and c[0]=="name"][0][1])
    nodes=[val([d for d in c if isinstance(d,list) and d[0]=="ref"][0][1])+"."+val([d for d in c if isinstance(d,list) and d[0]=="pin"][0][1]) for c in n if isinstance(c,list) and c[0]=="node"]
    if not name.startswith("unconnected"): print(name, " ".join(nodes))
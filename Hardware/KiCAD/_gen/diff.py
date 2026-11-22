exec(open(r"C:\Projects\Watch\Hardware\KiCAD\_gen\gen_lib.py",encoding="utf-8").read().split("import uuid")[0])
def nets(f):
    t=parse(open(f,encoding="utf-8").read())[0]
    ns=[x for x in t if isinstance(x,list) and x[0]=="nets"][0][1:]; out={}
    for n in ns:
        name=val([c for c in n if isinstance(c,list) and c[0]=="name"][0][1])
        nodes=frozenset(val([d for d in c if isinstance(d,list) and d[0]=="ref"][0][1])+"."+val([d for d in c if isinstance(d,list) and d[0]=="pin"][0][1]) for c in n if isinstance(c,list) and c[0]=="node")
        nodes=frozenset(x for x in nodes if not x.startswith("#"))
        out[nodes]=name
    return out
a=nets(r"C:\Projects\Watch\Hardware\KiCAD\_gen\cc_v1.net"); b=nets(r"C:\Projects\Watch\Hardware\KiCAD\_gen\cc_v2.net")
print("v1 nets",len(a),"v2 nets",len(b))
print("only in v1:",[ (a[k],sorted(k)) for k in a if k not in b])
print("only in v2:",[ (b[k],sorted(k)) for k in b if k not in a])
print("renamed:",[(a[k],b[k]) for k in a if k in b and a[k]!=b[k] and not a[k].startswith("unconnected")])
import json
for fn in ("drc_orig.json","drc.json"):
    d=json.load(open(fn))
    s=set((v["type"],v["description"]," / ".join(i["description"] for i in v["items"])) for v in d["violations"])
    globals()[fn[:-5]]=s
for x in sorted(drc-drc_orig): print("NEW",x)
print("gone:",len(drc_orig-drc), sorted(set(t for t,_,_ in drc_orig-drc)))

import json,collections
for fn in ["drc_orig.json","drc.json"]:
    d=json.load(open(fn)); c=collections.Counter(v["type"] for v in d["violations"])
    print(fn, dict(c), "unconnected:",len(d.get("unconnected_items",[])))
d=json.load(open("drc.json"))
for v in d["violations"]:
    if v["type"] in ("courtyards_overlap","copper_edge_clearance","edge_clearance","items_not_allowed","keepout","silk_edge_clearance","hole_clearance","clearance","malformed_courtyard","missing_courtyard"):
        print(v["type"],"|",v["description"],"|"," / ".join(i["description"] for i in v["items"]))

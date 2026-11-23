import json
d=json.load(open("drc.json"))
for v in d["violations"]:
    if v["type"] in ("isolated_copper","shorting_items","silk_overlap","silk_over_copper","hole_clearance","items_not_allowed"): print(v["type"],"|"," / ".join(i["description"] for i in v["items"]))

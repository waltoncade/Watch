import json
d=json.load(open("drc.json"))
for v in d["violations"]:
    if v["type"] in ("shorting_items","pth_inside_courtyard","solder_mask_bridge"):
        print(v["type"],"|"," / ".join(i["description"] for i in v["items"]))

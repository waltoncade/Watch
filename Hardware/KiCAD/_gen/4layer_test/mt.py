import pcbnew
P=r"C:\Projects\Watch\Hardware\KiCAD\_gen\4layer_test\Watch.kicad_pcb"
b=pcbnew.LoadBoard(P); CX,CY=145.83,88.27
for d in b.GetDrawings():
    if isinstance(d,pcbnew.PCB_TEXT) and d.GetText()=="v1.0 Cade Walton":
        o=d.GetPosition(); d.SetPosition(pcbnew.VECTOR2I(pcbnew.FromMM(CX),pcbnew.FromMM(CY-11.5))); print("moved text from (%.2f,%.2f) to (%.2f,%.2f)"%(pcbnew.ToMM(o.x),pcbnew.ToMM(o.y),CX,CY-11.5))
pcbnew.ZONE_FILLER(b).Fill(b.Zones()); pcbnew.SaveBoard(P,b)

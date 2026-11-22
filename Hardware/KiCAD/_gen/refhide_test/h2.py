import pcbnew
P=r"C:\Projects\Watch\Hardware\KiCAD\_gen\refhide_test\Watch.kicad_pcb"
b=pcbnew.LoadBoard(P); f=b.FindFootprintByReference("U1")
for it in f.GraphicalItems():
    if isinstance(it,pcbnew.PCB_TEXT) and it.GetText().startswith("Designator"): it.SetVisible(False); print("hid",it.GetText(),it.GetLayerName())
pcbnew.SaveBoard(P,b)

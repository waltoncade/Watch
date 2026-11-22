import pcbnew
P=r"C:\Projects\Watch\Hardware\KiCAD\_gen\refhide_test\Watch.kicad_pcb"
b=pcbnew.LoadBoard(P); f=b.FindFootprintByReference("U1")
for it in f.GraphicalItems():
    if isinstance(it,pcbnew.PCB_TEXT) and it.GetText().startswith("Designator"): it.SetLayer(pcbnew.F_Fab); print("moved to",it.GetLayerName())
pcbnew.SaveBoard(P,b)
# verify vs installed (pre-refhide) board
a=pcbnew.LoadBoard(r"C:\Projects\Watch\Hardware\KiCAD\_gen\backup_pre_refhide\Watch.kicad_pcb"); b=pcbnew.LoadBoard(P)
s=lambda bd:{f.GetReference():(f.GetPosition().x,f.GetPosition().y,f.GetOrientationDegrees(),f.IsFlipped(),f.GetValue(),f.Value().IsVisible(),f.Reference().GetText()) for f in bd.GetFootprints()}
sa,sb=s(a),s(b); assert sa==sb; print("positions/sides/rotations/values identical for",len(sa),"footprints; LED201-224 included:",all(("LED%d"%i) in sb for i in range(201,225)))
print("visible refs:",[f.GetReference() for f in b.GetFootprints() if f.Reference().IsVisible()])

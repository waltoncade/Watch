Watch PCB - JLCPCB fab outputs, rev 3 (generated 2026-11-24 13:05 PST, kicad-cli 10.0.8)
Source board: Watch.kicad_pcb sha256 1ADEAD66B432377E07951C9934BF608B0DF64E6FBE3BAC66C4F66D1D0A82FF61
Source schematic: Watch.kicad_sch sha256 B73F4CCC18327B7D42445E856B8043BA7D4C9FBE00E7EDD24DCBEB25DBCE6C7D
Previous outputs: rev 2 (board 3B6FEAEB...) in ..\fab_old_r2_20261124_1304\, rev 1 (board 7B45F760...) in ..\fab_old_20261124_1236\

Changes vs rev 2
- C107 1uF 0402 X5R 25V (Samsung CL05A105KA5NQNC, LCSC C52923, JLC basic) added on the bottom at IC1 VOUT (TCR2LF33 output cap;
  datasheet: ceramic COUT >= 0.1uF, mounted near the IC). 0.3 mm track to IC1 pin 5, own GND via. Also added to the schematic next to C104.
- C7 (10uF, VDDR/DCDC output) and C3 (0.1uF) swapped places on the bottom: C7 now sits at the L1.2 / U1 pin 34 via, C3 moves next to C5 at U1 pin 1.
- D502-COM hops to F.Cu for 2.6 mm above IC1 so the VOUT->C107 path is direct; the +3.3V via under C107 was removed.
- GND vias/stubs added at C7, C8, C11, C14, C107; C3/C5 and C10 tied to the U1 EP GND via; C13 tied to a nearby GND via.

Files
- Watch_gerbers_20261124_r3.zip : F/In1(GND)/In2(In2.Mixed)/B copper, F/B paste, silk, mask, Edge.Cuts (Protel ext, X2, no mask-subtract,
                                  absolute origin), Excellon mm PTH/NPTH split, drill maps (Gerber X2 + PDF), gerber job file.
- Watch_BOM_JLC.csv          : Comment, Designator, Footprint, LCSC Part # (grouped). Only U2, R101 and C107 have LCSC numbers - fill the rest.
- Watch_CPL_JLC.csv          : Designator, Mid X, Mid Y, Layer, Rotation (mm, KiCad coords, both sides, 82 parts: 50 top / 32 bottom).
Excluded: TP1-TP5, TP501-TP507 (test points), LOGO1, H1 (hand-shaft NPTH).

JLC order settings
- Layers 4, FR-4, 32.0 x 32.0 mm round, thickness 1.6 mm
- Impedance control: yes, stackup JLC04161H-7628 (7628 prepreg 0.2104 mm er 4.4, core 1.065 mm er 4.6, outer 1 oz, inner 0.5 oz)
- Min via hole/diameter: 0.2 mm / 0.4 mm option (JLC: 0.2 mm holes with <0.45 mm diameter cost extra). 277 vias, all 0.4/0.2.
- Min track 0.15 mm / clearance 0.15 mm
- Surface finish: ENIG
- Remove order number: "Specify a location" or "Yes (paid)".
- PCBA: both sides (top + bottom SMT).

Review before ordering
- Copper-to-edge (not changed in this rev): closest 0.225 mm; JLC asks >=0.2 mm (0.3 mm preferred).
- Antenna band: 4 LED nets (OUT16/17/18/21), +BATT and one +3.3V track still cross the band between AE1 and the edge on In2/B
  (unchanged from rev 1); planes are cut there now. See the fix report.
- CPL rotations: check JLC's placement preview (custom/SamacSys/EasyEDA footprints often need 90/180 deg corrections).

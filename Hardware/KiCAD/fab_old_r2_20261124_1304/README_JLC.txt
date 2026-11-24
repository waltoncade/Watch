Watch PCB - JLCPCB fab outputs, rev 2 (generated 2026-11-24 12:35 PST, kicad-cli 10.0.8)
Source board: Watch.kicad_pcb sha256 3B6FEAEB210DCDB3763A1F8AEA99FB2C7E01496DB148317E3A652942D2FF98BC
Source schematic: Watch.kicad_sch sha256 058F792DB113FB85D90F081AD557A21B0890BC137ECED4A11C5CF52DE8E46558
Previous outputs (board 7B45F760...) moved to ..\fab_old_20261124_1236\

Changes vs rev 1
- U3 BMA400 footprint BOS-L -> BOS-M pads (0.33 x 0.38 mm), U3 GND/SCL/+3.3V escapes rerouted.
- C105, C106 (0.1uF, U3 decoupling) added on the bottom - now in BOM/CPL.
- PCB DNP flag cleared on 34 SamacSys footprints (IC201, LEDs, C101-C104, C201, C202).
- R101 (charge-current PROG resistor) 10k -> 20k, LCSC C25765 (UNI-ROYAL 0402WGF2002TCE).
- AE1: In1 (GND) and In2 plane cutout extended to the board edge; SW1/SW2 rerouted around the antenna clearance.

Files
- Watch_gerbers_20261124_r2.zip : F/In1(GND)/In2(In2.Mixed)/B copper, F/B paste, silk, mask, Edge.Cuts (Protel ext, X2, no mask-subtract,
                                  absolute origin), Excellon mm PTH/NPTH split, drill maps (Gerber X2 + PDF), gerber job file.
- Watch_BOM_JLC.csv          : Comment, Designator, Footprint, LCSC Part # (grouped). Only U2 and R101 have LCSC numbers - fill the rest.
- Watch_CPL_JLC.csv          : Designator, Mid X, Mid Y, Layer, Rotation (mm, KiCad coords, both sides, 81 parts: 50 top / 31 bottom).
Excluded: TP1-TP5, TP501-TP507 (test points), LOGO1, H1 (hand-shaft NPTH).

JLC order settings
- Layers 4, FR-4, 32.0 x 32.0 mm round, thickness 1.6 mm
- Impedance control: yes, stackup JLC04161H-7628 (7628 prepreg 0.2104 mm er 4.4, core 1.065 mm er 4.6, outer 1 oz, inner 0.5 oz)
- Min via hole/diameter: 0.2 mm / 0.4 mm option (JLC: 0.2 mm holes with <0.45 mm diameter cost extra). 272 vias, all 0.4/0.2.
- Min track 0.15 mm / clearance 0.15 mm
- Surface finish: ENIG
- Remove order number: "Specify a location" or "Yes (paid)".
- PCBA: both sides (top + bottom SMT).

Review before ordering
- Copper-to-edge (not changed in this rev): closest 0.225 mm; JLC asks >=0.2 mm (0.3 mm preferred).
- Antenna band: 4 LED nets (OUT16/17/18/21), +BATT and one +3.3V track still cross the band between AE1 and the edge on In2/B
  (unchanged from rev 1); planes are cut there now. See the fix report.
- CPL rotations: check JLC's placement preview (custom/SamacSys/EasyEDA footprints often need 90/180 deg corrections).

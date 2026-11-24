Watch PCB - JLCPCB fab outputs (generated 2026-11-24 07:24 PST, kicad-cli 10.0.8)
Source board: Watch.kicad_pcb sha256 7B45F760242C387A9BBE63908AF39A35CFE991B8A845B6E80CC0D892301363A6 (unchanged; exported from a temp copy)

Files
- Watch_gerbers_20261124.zip : F/In1(GND)/In2(In2.Mixed)/B copper, F/B paste, silk, mask, Edge.Cuts (Protel ext, X2, no mask-subtract,
                               absolute origin), Excellon mm PTH/NPTH split, drill maps (Gerber X2 + PDF), gerber job file.
- Watch_BOM_JLC.csv          : Comment, Designator, Footprint, LCSC Part # (grouped). Only U2 has an LCSC number - fill the rest.
- Watch_CPL_JLC.csv          : Designator, Mid X, Mid Y, Layer, Rotation (mm, KiCad coords, both sides, 79 parts: 50 top / 29 bottom).
Excluded: TP1-TP5, TP501-TP507 (test points), LOGO1, H1 (hand-shaft NPTH); C105/C106 are in the schematic but not on the PCB.

JLC order settings
- Layers 4, FR-4, 32.0 x 32.0 mm round, thickness 1.6 mm (stackup sums to 1.606 mm incl. mask)
- Impedance control: yes, stackup JLC04161H-7628 (7628 prepreg 0.2104 mm er 4.4, core 1.065 mm er 4.6, outer 1 oz, inner 0.5 oz)
- Min via hole/diameter: 0.2 mm / 0.4 mm option (JLC: 0.2 mm holes with <0.45 mm diameter cost extra). 270 vias, all 0.4/0.2.
- Min track 0.15 mm / clearance 0.15 mm (well inside 3.5 mil standard)
- Surface finish: ENIG (fine-pitch QFNs U1/IC201/U3, 0402s, flat pads)
- Remove order number: "Specify a location" or "Yes (paid)" - otherwise JLC prints it on the front.
- PCBA: both sides (top + bottom SMT).

Review before ordering
- IC201 (LED driver) has the DNP flag set on its PCB footprint (not in the schematic). It is INCLUDED in BOM/CPL here.
- Copper-to-edge: closest is 0.225 mm (OUT21 via, F.Cu); In2 tracks OUT19/OUT14 0.24-0.26 mm; planes 0.295 mm.
  JLC asks for >=0.2 mm (0.3 mm preferred) to a routed edge. Board copper-to-edge rule is only 0.025 mm.
- CPL rotations: check JLC's placement preview; custom/SamacSys/EasyEDA footprints (IC1, IC201, U1, U2, U3, LED101-LED224,
  LED225, AE1, D501/D502, U102) often need 90/180 deg corrections. Bottom-side parts: verify in the preview too.

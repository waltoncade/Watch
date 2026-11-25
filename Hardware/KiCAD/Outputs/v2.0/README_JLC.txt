Watch PCB - JLCPCB fab outputs, rev 4 (generated 2026-11-24 15:55 PST, kicad-cli 10.0.8)
Source board: Watch.kicad_pcb sha256 41917F0BE0F66724BA9B19AB3D13C0F3424FB3AEFCE491A3B429332BC30D67EE
Source schematic: Watch.kicad_sch sha256 8A5A24FC65D1A2CB57FCF4EDA4AE0558985C28BE2D3D8B44AB64F105DAFD517A
  CC2340_MCU.kicad_sch sha256 C88DBA88FF3A45C9503ABAF48C702621778B8B6117384555E591788220E9B474
  watch_leds.kicad_sch sha256 5A019158460BE80BFAB41D8118D3E3457831957C3B7F9F0D4B77B36C26204454
Previous outputs: rev 3 (board 1ADEAD66...) in ..\fab_old_r3_20261124_1555, rev 2 in ..\fab_old_r2_20261124_1304, rev 1 in ..\fab_old_20261124_1236

Changes vs rev 3
- BOM fill (review A3): LCSC / MPN / manufacturer fields added on every placed part except AE1.
  Copper and component placement are unchanged. C17 and C18 are now DNP (footprints kept, omitted from BOM and CPL).
  L3 is a 0 ohm 0402 jumper. Y1 MPN changed because TZ3908AAAO43 is out of stock at JLC.
- 80 placed parts in the CPL (50 top / 30 bottom); 32 BOM lines. C17/C18 dropped vs rev 3 (was 82 / 32 bottom).
- Only AE1 (Johanson 2450AT18A100) still has no LCSC number: JLC listing C89334 (2450AT18A100E) is discontinued, stock 0.
  Consign the antenna, or buy it elsewhere. Do not substitute a different Johanson AT18D part without redoing the match network.
- Low JLC stock, worth confirming before ordering: IC201 IS31FL3235A-QFLS2-TR C2678735 (79), U1 CC2340R52E0RKPR C5914214 (208),
  IC1 TCR2LF33,LM(CT C7067110 (248). U3 BMA400 C437655 is an LGA-12 2x2 (stock 771) — check the JLC placement preview.

Files
- Watch_gerbers_20261124_r4.zip : F/In1(GND)/In2(In2.Mixed)/B copper, F/B paste, silk, mask, Edge.Cuts (Protel ext, X2, no mask-subtract,
                                  absolute origin), Excellon mm PTH/NPTH split, drill maps (Gerber X2 + PDF), gerber job file.
- Watch_BOM_JLC.csv          : Comment, Designator, Footprint, LCSC Part # (grouped). Every BOM line has an LCSC number except AE1 (see above).
- Watch_CPL_JLC.csv          : Designator, Mid X, Mid Y, Layer, Rotation (mm, KiCad coords, both sides, 80 parts: 50 top / 30 bottom).
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

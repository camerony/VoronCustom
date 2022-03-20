# MiniAfterBlockhead to V0.1 (Alpha)

Modified Mini After-LGX-Lite (Olof Ogland) to use 3010 Blower as Hotend Fan
This requires the use of other parts from the original sources for installation (see below)

## Why??
Better hotend cooling to reduce heat creep/clogging.  Tested for 9hr 47min printing PLA with a flow of .75mm/s with 75% fan that was fully enclosed without clogging using a Dragonfly BMO hotend.


*** Extruders ***
- Direct Mounts
    - Sherpa Mini Extruder - With Modified Mid-Body (sherpa_mini_mid_flipped)
    - LGX Lite Extruder

*** Hotend Mount ***
- See Mini After-LGX-Lite Repo for your hotend mount (see below)

### X-Carriage or use the Mini After-LGX-Lite X-Carriage
V01_MiniAfterHybrid_XCarriage.stl  

## Bill of materials
- 2x M3×35mm FHCS, BHCS, or SHCS
- 2× M3×5×4mm heatset inserts
- 3× 3010 Blower fans (tested with GDSTime 24v)
- 1x JST 2-Pin connector to rewire for FAN1
- 2x M3×25mm FHCS, BHCS, or SHCS for Sherpa Mini Extruder

![](images/CAD.png)
![](images/CAD2.png)
![](images/CAD3.png)
![](images/CADSherpaMini.png)

![](images/Photo.png)

### NOTE: Wiring ###
Be sure to rewire to the FAN1 if you using a 24v blower fan.

### Sources for other required parts
Source for Mini After-LGX-Lite: https://github.com/BondtechAB/VoronUsers/tree/master/printer_mods/Bondtech/Mini_After-LGX-Lite

Source for Klicky integration: https://github.com/jlas1/Klicky-Probe

Source for Sherpa Mini: https://github.com/Annex-Engineering/Sherpa_Mini-Extruder

Credits: 
Olof Ogland
Nemgrea
DaveR
JosAr




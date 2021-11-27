; ### Marlin K-Factor Calibration Pattern ###
; -------------------------------------------
;
; Printer: printer name
; Filament: filament name
; Created: Mon Nov 22 2021 06:07:35 GMT-0800 (Pacific Standard Time)
;
; Settings Printer:
; Filament Diameter = 1.75 mm
; Nozzle Diameter = 0.4 mm
; Nozzle Temperature = 240 °C
; Bed Temperature = 80 °C
; Retraction Distance = 1 mm
; Layer Height = 0.25 mm
; Extruder = 0 
; Fan Speed = 0 %
; Z-axis Offset = 0 mm
;
; Settings Print Bed:
; Bed Shape = Rect
; Bed Size X = 120 mm
; Bed Size Y = 120 mm
; Origin Bed Center = false
;
; Settings Speed:
; Slow Printing Speed = 1200 mm/min
; Fast Printing Speed = 7200 mm/min
; Movement Speed = 7200 mm/min
; Retract Speed = 1800 mm/min
; Unretract Speed = 1800 mm/min
; Printing Acceleration = 1500 mm/s^2
; Jerk X-axis =  firmware default
; Jerk Y-axis =  firmware default
; Jerk Z-axis =  firmware default
; Jerk Extruder =  firmware default
;
; Settings Pattern:
; Linear Advance Version = 1.5
; Starting Value Factor = 0
; Ending Value Factor = 0.1
; Factor Stepping = 0.005
; Test Line Spacing = 4 mm
; Test Line Length Slow = 20 mm
; Test Line Length Fast = 40 mm
; Print Pattern = Standard
; Print Frame = true
; Number Lines = true
; Print Size X = 88 mm
; Print Size Y = 105 mm
; Print Rotation = 0 degree
;
; Settings Advance:
; Nozzle / Line Ratio = 1.2
; Bed leveling = 0
; Use FWRETRACT = false
; Extrusion Multiplier = 1
; Prime Nozzle = false
; Prime Extrusion Multiplier = 2.5
; Prime Speed = 1800
; Dwell Time = 0 s
;
; prepare printing
;
;TYPE:Custom
; M190 S0
; M109 S0 ; uncomment to remove set&wait temp gcode added automatically after this start gcode
G28
G90 ; use absolute coordinates
M83 ; extruder relative mode
; Set Extruder and Bed Temperature
M104 S235
M140 S80

G1 X60 Y60 Z75

M190 S80
M109 S235

; With the Nozzle at Temperature and any Filament Remains stuck to it soft perform second G28 for the Z-Axis.
G28 Z
; Go outside Print Area <- Start of actual Purge / Prime Line.
G1 Y0.4 F8000.0
G1 Z0.4 F8000.0
; Purge Line
G1 X55.0 E20.0 F1073.0
G1 X5.0 E13.0 F1800.0
G1 X55.0 E8.0 F2000.0
G1 Z0.3 F1000.0
G92 E0.0
G1 X120.0 E20.0 F2200.0
G1 Y1.4 F1000.0
G1 X55.0 E20 F1400.0
G1 Z0.20 F3000.0
G1 X5.0 E4.0 F1000.0

G21 ; Millimeter units
G90 ; Absolute XYZ
M83 ; Relative E
T0 ; Switch to tool 0
M104 S240 ; Set nozzle temperature (no wait)
M190 S80 ; Set bed temperature (wait)
G28 ; Home all axes
G1 Z5 F100 ; Z raise
M109 S240 ; Wait for nozzle temp
M204 P1500 ; Acceleration
G92 E0 ; Reset extruder distance
M106 P0 S0
G1 X60 Y60 F7200 ; move to start
G1 Z0.25 F1200 ; Move to layer height
;
; print anchor frame
;
G1 X16 Y4.5 F7200 ; move to start
G1 X16 Y90.5 E4.7196 F1200 ; print line
G1 X16.48 Y90.5 F7200 ; move to start
G1 X16.48 Y4.5 E4.7196 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X96 Y4.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X96 Y90.5 E4.7196 F1200 ; print line
G1 X95.52 Y90.5 F7200 ; move to start
G1 X95.52 Y4.5 E4.7196 F1200 ; print line
G1 E-1 F1800 ; retract
;
; start the Test pattern
;
G1 X16 Y7.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0 ; set K-factor
M117 K0 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y7.5 E0.9978 F1200 ; print line
G1 X76 Y7.5 E1.9956 F7200 ; print line
G1 X96 Y7.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y11.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.005 ; set K-factor
M117 K0.005 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y11.5 E0.9978 F1200 ; print line
G1 X76 Y11.5 E1.9956 F7200 ; print line
G1 X96 Y11.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y15.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.01 ; set K-factor
M117 K0.01 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y15.5 E0.9978 F1200 ; print line
G1 X76 Y15.5 E1.9956 F7200 ; print line
G1 X96 Y15.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y19.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.015 ; set K-factor
M117 K0.015 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y19.5 E0.9978 F1200 ; print line
G1 X76 Y19.5 E1.9956 F7200 ; print line
G1 X96 Y19.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y23.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.02 ; set K-factor
M117 K0.02 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y23.5 E0.9978 F1200 ; print line
G1 X76 Y23.5 E1.9956 F7200 ; print line
G1 X96 Y23.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y27.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.025 ; set K-factor
M117 K0.025 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y27.5 E0.9978 F1200 ; print line
G1 X76 Y27.5 E1.9956 F7200 ; print line
G1 X96 Y27.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y31.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.03 ; set K-factor
M117 K0.03 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y31.5 E0.9978 F1200 ; print line
G1 X76 Y31.5 E1.9956 F7200 ; print line
G1 X96 Y31.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y35.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.035 ; set K-factor
M117 K0.035 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y35.5 E0.9978 F1200 ; print line
G1 X76 Y35.5 E1.9956 F7200 ; print line
G1 X96 Y35.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y39.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.04 ; set K-factor
M117 K0.04 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y39.5 E0.9978 F1200 ; print line
G1 X76 Y39.5 E1.9956 F7200 ; print line
G1 X96 Y39.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y43.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.045 ; set K-factor
M117 K0.045 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y43.5 E0.9978 F1200 ; print line
G1 X76 Y43.5 E1.9956 F7200 ; print line
G1 X96 Y43.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y47.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.05 ; set K-factor
M117 K0.05 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y47.5 E0.9978 F1200 ; print line
G1 X76 Y47.5 E1.9956 F7200 ; print line
G1 X96 Y47.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y51.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.055 ; set K-factor
M117 K0.055 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y51.5 E0.9978 F1200 ; print line
G1 X76 Y51.5 E1.9956 F7200 ; print line
G1 X96 Y51.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y55.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.06 ; set K-factor
M117 K0.06 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y55.5 E0.9978 F1200 ; print line
G1 X76 Y55.5 E1.9956 F7200 ; print line
G1 X96 Y55.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y59.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.065 ; set K-factor
M117 K0.065 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y59.5 E0.9978 F1200 ; print line
G1 X76 Y59.5 E1.9956 F7200 ; print line
G1 X96 Y59.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y63.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.07 ; set K-factor
M117 K0.07 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y63.5 E0.9978 F1200 ; print line
G1 X76 Y63.5 E1.9956 F7200 ; print line
G1 X96 Y63.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y67.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.075 ; set K-factor
M117 K0.075 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y67.5 E0.9978 F1200 ; print line
G1 X76 Y67.5 E1.9956 F7200 ; print line
G1 X96 Y67.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y71.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.08 ; set K-factor
M117 K0.08 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y71.5 E0.9978 F1200 ; print line
G1 X76 Y71.5 E1.9956 F7200 ; print line
G1 X96 Y71.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y75.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.085 ; set K-factor
M117 K0.085 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y75.5 E0.9978 F1200 ; print line
G1 X76 Y75.5 E1.9956 F7200 ; print line
G1 X96 Y75.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y79.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.09 ; set K-factor
M117 K0.09 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y79.5 E0.9978 F1200 ; print line
G1 X76 Y79.5 E1.9956 F7200 ; print line
G1 X96 Y79.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y83.5 F7200 ; move to start
SET_PRESSURE_ADVANCE ADVANCE=0.095 ; set K-factor
M117 K0.095 ; 
G1 E1 F1800 ; un-retract
G1 X36 Y83.5 E0.9978 F1200 ; print line
G1 X76 Y83.5 E1.9956 F7200 ; print line
G1 X96 Y83.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X16 Y87.5 F7200 ; move to start
;
; Mark the test area for reference
M117 K0
SET_PRESSURE_ADVANCE ADVANCE=0 ; Set K-factor 0
G1 X36 Y92.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X36 Y112.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 X76 Y92.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X76 Y112.5 E0.9978 F1200 ; print line
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
;
; print K-values
;
G1 X98 Y5.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y5.5 E0.0998 F1200 ; 0
G1 X100 Y7.5 E0.0998 F1200 ; 0
G1 X100 Y9.5 E0.0998 F1200 ; 0
G1 X98 Y9.5 E0.0998 F1200 ; 0
G1 X98 Y7.5 E0.0998 F1200 ; 0
G1 X98 Y5.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y13.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y13.5 E0.0998 F1200 ; 0
G1 X100 Y15.5 E0.0998 F1200 ; 0
G1 X100 Y17.5 E0.0998 F1200 ; 0
G1 X98 Y17.5 E0.0998 F1200 ; 0
G1 X98 Y15.5 E0.0998 F1200 ; 0
G1 X98 Y13.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y13.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y13.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y13.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y13.5 E0.0998 F1200 ; 0
G1 X104 Y15.5 E0.0998 F1200 ; 0
G1 X104 Y17.5 E0.0998 F1200 ; 0
G1 X102 Y17.5 E0.0998 F1200 ; 0
G1 X102 Y15.5 E0.0998 F1200 ; 0
G1 X102 Y13.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y13.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X105 Y15.5 E0.0998 F1200 ; 1
G1 X105 Y17.5 E0.0998 F1200 ; 1
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y21.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y21.5 E0.0998 F1200 ; 0
G1 X100 Y23.5 E0.0998 F1200 ; 0
G1 X100 Y25.5 E0.0998 F1200 ; 0
G1 X98 Y25.5 E0.0998 F1200 ; 0
G1 X98 Y23.5 E0.0998 F1200 ; 0
G1 X98 Y21.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y21.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y21.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y21.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y21.5 E0.0998 F1200 ; 0
G1 X104 Y23.5 E0.0998 F1200 ; 0
G1 X104 Y25.5 E0.0998 F1200 ; 0
G1 X102 Y25.5 E0.0998 F1200 ; 0
G1 X102 Y23.5 E0.0998 F1200 ; 0
G1 X102 Y21.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y21.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X105 Y23.5 F7200 ; move to start
G1 X105 Y25.5 F7200 ; move to start
G1 X107 Y25.5 E0.0998 F1200 ; 2
G1 X107 Y23.5 E0.0998 F1200 ; 2
G1 X105 Y23.5 E0.0998 F1200 ; 2
G1 X105 Y21.5 E0.0998 F1200 ; 2
G1 X107 Y21.5 E0.0998 F1200 ; 2
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y29.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y29.5 E0.0998 F1200 ; 0
G1 X100 Y31.5 E0.0998 F1200 ; 0
G1 X100 Y33.5 E0.0998 F1200 ; 0
G1 X98 Y33.5 E0.0998 F1200 ; 0
G1 X98 Y31.5 E0.0998 F1200 ; 0
G1 X98 Y29.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y29.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y29.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y29.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y29.5 E0.0998 F1200 ; 0
G1 X104 Y31.5 E0.0998 F1200 ; 0
G1 X104 Y33.5 E0.0998 F1200 ; 0
G1 X102 Y33.5 E0.0998 F1200 ; 0
G1 X102 Y31.5 E0.0998 F1200 ; 0
G1 X102 Y29.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y29.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X105 Y31.5 F7200 ; move to start
G1 X105 Y33.5 F7200 ; move to start
G1 X107 Y33.5 E0.0998 F1200 ; 3
G1 X107 Y31.5 E0.0998 F1200 ; 3
G1 X107 Y29.5 E0.0998 F1200 ; 3
G1 X105 Y29.5 E0.0998 F1200 ; 3
G1 X105 Y31.5 F7200 ; move to start
G1 X107 Y31.5 E0.0998 F1200 ; 3
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y37.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y37.5 E0.0998 F1200 ; 0
G1 X100 Y39.5 E0.0998 F1200 ; 0
G1 X100 Y41.5 E0.0998 F1200 ; 0
G1 X98 Y41.5 E0.0998 F1200 ; 0
G1 X98 Y39.5 E0.0998 F1200 ; 0
G1 X98 Y37.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y37.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y37.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y37.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y37.5 E0.0998 F1200 ; 0
G1 X104 Y39.5 E0.0998 F1200 ; 0
G1 X104 Y41.5 E0.0998 F1200 ; 0
G1 X102 Y41.5 E0.0998 F1200 ; 0
G1 X102 Y39.5 E0.0998 F1200 ; 0
G1 X102 Y37.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y37.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X105 Y39.5 F7200 ; move to start
G1 X105 Y41.5 F7200 ; move to start
G1 X105 Y39.5 E0.0998 F1200 ; 4
G1 X107 Y39.5 E0.0998 F1200 ; 4
G1 X107 Y41.5 F7200 ; move to start
G1 X107 Y39.5 E0.0998 F1200 ; 4
G1 X107 Y37.5 E0.0998 F1200 ; 4
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y45.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y45.5 E0.0998 F1200 ; 0
G1 X100 Y47.5 E0.0998 F1200 ; 0
G1 X100 Y49.5 E0.0998 F1200 ; 0
G1 X98 Y49.5 E0.0998 F1200 ; 0
G1 X98 Y47.5 E0.0998 F1200 ; 0
G1 X98 Y45.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y45.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y45.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y45.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y45.5 E0.0998 F1200 ; 0
G1 X104 Y47.5 E0.0998 F1200 ; 0
G1 X104 Y49.5 E0.0998 F1200 ; 0
G1 X102 Y49.5 E0.0998 F1200 ; 0
G1 X102 Y47.5 E0.0998 F1200 ; 0
G1 X102 Y45.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y45.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X107 Y45.5 E0.0998 F1200 ; 5
G1 X107 Y47.5 E0.0998 F1200 ; 5
G1 X105 Y47.5 E0.0998 F1200 ; 5
G1 X105 Y49.5 E0.0998 F1200 ; 5
G1 X107 Y49.5 E0.0998 F1200 ; 5
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y53.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y53.5 E0.0998 F1200 ; 0
G1 X100 Y55.5 E0.0998 F1200 ; 0
G1 X100 Y57.5 E0.0998 F1200 ; 0
G1 X98 Y57.5 E0.0998 F1200 ; 0
G1 X98 Y55.5 E0.0998 F1200 ; 0
G1 X98 Y53.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y53.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y53.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y53.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y53.5 E0.0998 F1200 ; 0
G1 X104 Y55.5 E0.0998 F1200 ; 0
G1 X104 Y57.5 E0.0998 F1200 ; 0
G1 X102 Y57.5 E0.0998 F1200 ; 0
G1 X102 Y55.5 E0.0998 F1200 ; 0
G1 X102 Y53.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y53.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X105 Y55.5 F7200 ; move to start
G1 X107 Y55.5 E0.0998 F1200 ; 6
G1 X107 Y53.5 E0.0998 F1200 ; 6
G1 X105 Y53.5 E0.0998 F1200 ; 6
G1 X105 Y55.5 E0.0998 F1200 ; 6
G1 X105 Y57.5 E0.0998 F1200 ; 6
G1 X107 Y57.5 E0.0998 F1200 ; 6
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y61.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y61.5 E0.0998 F1200 ; 0
G1 X100 Y63.5 E0.0998 F1200 ; 0
G1 X100 Y65.5 E0.0998 F1200 ; 0
G1 X98 Y65.5 E0.0998 F1200 ; 0
G1 X98 Y63.5 E0.0998 F1200 ; 0
G1 X98 Y61.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y61.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y61.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y61.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y61.5 E0.0998 F1200 ; 0
G1 X104 Y63.5 E0.0998 F1200 ; 0
G1 X104 Y65.5 E0.0998 F1200 ; 0
G1 X102 Y65.5 E0.0998 F1200 ; 0
G1 X102 Y63.5 E0.0998 F1200 ; 0
G1 X102 Y61.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y61.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X105 Y63.5 F7200 ; move to start
G1 X105 Y65.5 F7200 ; move to start
G1 X107 Y65.5 E0.0998 F1200 ; 7
G1 X107 Y63.5 E0.0998 F1200 ; 7
G1 X107 Y61.5 E0.0998 F1200 ; 7
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y69.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y69.5 E0.0998 F1200 ; 0
G1 X100 Y71.5 E0.0998 F1200 ; 0
G1 X100 Y73.5 E0.0998 F1200 ; 0
G1 X98 Y73.5 E0.0998 F1200 ; 0
G1 X98 Y71.5 E0.0998 F1200 ; 0
G1 X98 Y69.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y69.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y69.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y69.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y69.5 E0.0998 F1200 ; 0
G1 X104 Y71.5 E0.0998 F1200 ; 0
G1 X104 Y73.5 E0.0998 F1200 ; 0
G1 X102 Y73.5 E0.0998 F1200 ; 0
G1 X102 Y71.5 E0.0998 F1200 ; 0
G1 X102 Y69.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y69.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X105 Y71.5 F7200 ; move to start
G1 X107 Y71.5 E0.0998 F1200 ; 8
G1 X107 Y69.5 E0.0998 F1200 ; 8
G1 X105 Y69.5 E0.0998 F1200 ; 8
G1 X105 Y71.5 E0.0998 F1200 ; 8
G1 X105 Y73.5 E0.0998 F1200 ; 8
G1 X107 Y73.5 E0.0998 F1200 ; 8
G1 X107 Y71.5 E0.0998 F1200 ; 8
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
G1 X98 Y77.5 F7200 ; move to start
G1 Z0.25 F1200 ; zHop
G1 E1 F1800 ; un-retract
G1 X100 Y77.5 E0.0998 F1200 ; 0
G1 X100 Y79.5 E0.0998 F1200 ; 0
G1 X100 Y81.5 E0.0998 F1200 ; 0
G1 X98 Y81.5 E0.0998 F1200 ; 0
G1 X98 Y79.5 E0.0998 F1200 ; 0
G1 X98 Y77.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X101 Y77.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X101 Y77.9 E0.02 F1200 ; dot
G1 E-1 F1800 ; retract
G1 X102 Y77.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X104 Y77.5 E0.0998 F1200 ; 0
G1 X104 Y79.5 E0.0998 F1200 ; 0
G1 X104 Y81.5 E0.0998 F1200 ; 0
G1 X102 Y81.5 E0.0998 F1200 ; 0
G1 X102 Y79.5 E0.0998 F1200 ; 0
G1 X102 Y77.5 E0.0998 F1200 ; 0
G1 E-1 F1800 ; retract
G1 X105 Y77.5 F7200 ; move to start
G1 E1 F1800 ; un-retract
G1 X107 Y77.5 E0.0998 F1200 ; 9
G1 X107 Y79.5 E0.0998 F1200 ; 9
G1 X105 Y79.5 E0.0998 F1200 ; 9
G1 X105 Y81.5 E0.0998 F1200 ; 9
G1 X107 Y81.5 E0.0998 F1200 ; 9
G1 X107 Y79.5 E0.0998 F1200 ; 9
G1 E-1 F1800 ; retract
G1 Z0.35 F1200 ; zHop
;
; FINISH
;
M107 ; Turn off fan
M400 ; Finish moving
M104 S0 ; Turn off hotend
M140 S0 ; Turn off bed
G1 Z30 X120 Y120 F7200 ; Move away from the print
M84 ; Disable motors
M501 ; Load settings from EEPROM
;
# PRINT_START Macro

The PRINT_START macro is typically called before the start of every print job. It is used primarily to configure the printer to a known state in terms of the temperatures of its various components, specifically the extruder temperature and the bed temperature.

Plenty of other things might find their way into this macro. 
- Calibrating or loading a bed mesh
- Quad-Gantry-Levelling (QGL)
- Nozzle Cleaning
- Nozzle Priming

As with all the Macros provided here, be sure to examine them thoroughly and carefully and comment/uncomment the various parts as needed. 

***DISCLAIMER: While every effort is made to ensure that these work well in the vast majority of cases, typos or other mistakes made in these macros can lead to bad things happening. Be sure to thoroughly test any changes you make.***

```
####################################
# PRINT_START macro
####################################
[gcode_macro PRINT_START]
gcode:
    # Get the extruder temperature expected for this print job
    # This will typically be a value in the range 220-260C, for example
    {% set temp_extruder  = params.EXTRUDER|default(260)|int %}

    # Home the printer (X, Y, and Z)
    G28

    # Reset the length of filament extruded to zero
    G92 E0      

    # This starts the Quad-Gantry-Levelling process, aka QGL
    # Several additional steps may be performed here as well
    # Be sure to check the G32 Macro for specifics, but this
    # will typically include setting the temp to 150C
    G32       

    # One of these is used to either load a previously generated
    # bed mesh set, or create a new bed mesh set each time.
    # If you change build plates constantly, or if you have a
    # Beacon or similar probe that is very quick, performing
    # a bed mesh for each print is a pretty good idea. Note
    # that the bed mesh data is stored in printer.cfg
    #BED_MESH_CALIBRATE PROFILE=mesh1 METHOD=automatic
    BED_MESH_PROFILE LOAD=mesh1

    # Change printer to absolute positioning mode
    G90

    # Move to middle of the print bed (assuming a 350mm x 350mm bed)
    G1 X175 Y175

    # Set extruder temperature to value from start (the print temperature)
    M109 S{temp_extruder}

    # One last clean 
    NOZZLE_CLEAN

    # One last home
    G28
```

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
    # This will typically be a value in the range 220-260C
    {% set temp_extruder  = params.EXTRUDER|default(260)|int %}

    # Set extruder temp initially (without waiting) initially
    M104 S{temp_extruder}       # No Waiting
    #M109 S{temp_extruder}      # Waiting

    # Get the bed temperature expected for this print job
    # This will typically be a value in the range 50-110C 
    {% set temp_bed  = params.BED|default(100)|int %}

    # Set the bed temperature (without waiting) initially
    M140 S{temp_bed}            # No Waiting
    # M190 S{temp_bed}          # Waiting

    # Home the printer (X, Y, and Z)
    G28

    # Reset the length of filament extruded to zero
    G92 E0      

    # Now we wait for the extruder temp to do a NOZZLE_CLEAN
    # then turn on the part fan so it gets back down to 150C
    # for the next step
    M109 S{temp_extruder}       # Wait for extruder to get to temp
    NOZZLE_CLEAN                # Clean nozzle
    M106                        # Set part cooling fan to max
    M104 S150                   # Set extruder temp to 150C (no waiting)
      
    # This starts the Quad-Gantry-Levelling process, aka QGL
    # Several additional steps may be performed here as well
    # Be sure to check the G32 Macro for specifics, but this
    # will typically include setting the temp to 150C and
    # running NOZZLE_CLEAN in addition to the QGL.
    G32       

    # Turn off part cooling fan we turned on earlier
    M106 S0

    # One of these is used to either load a previously generated
    # bed mesh, or create a new bed mesh each time.
    # If you change build plates constantly, or if you have a
    # Beacon or similar probe that is very quick, performing
    # a bed mesh for each print is a pretty good idea.
    # Otherwise, it can take a lot of time per print.
    # NOTE: Bed mesh data is stored at end of printer.cfg
    #BED_MESH_CALIBRATE PROFILE=mesh1 METHOD=automatic
    BED_MESH_PROFILE LOAD=mesh1

    # Change printer to absolute positioning mode
    G90

    # Move to middle of the print bed (assuming a 350mm x 350mm bed)
    G1 X175 Y175

    # Wait for extruder to get to print temp
    M109 S{temp_extruder}

    # Wait for bed to get to print temp
    M190 S{temp_bed}

    # One last clean 
    NOZZLE_CLEAN

    # One last home
    G28
    
```

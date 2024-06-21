# PRINT_START Macro

The PRINT_START macro is typically called at the start of every print job. It is used primarily to configure the printer to a known state in terms of the temperatures of its various components, specifically the extruder (hotend) temperature and the bed temperature. 
It also looks after moving the toolhead to a known position along with various position-related calibration steps.

There are many elements that may be added to such a macro depending on the available hardware, some of which are included in the PRINT_START macro shown below.
- Homing X, Y, and Z 
- Quad-Gantry-Levelling (QGL)
- Nozzle cleaning and priming
- Configure chamber temperatures/heaters
- Initialize custom lighting options
- Initialize custom camera settings
- Log timing or other data

The PRINT_START macro as shown below tries to speed up the process by first setting the temperature targets for the extruder and the bed without waiting for them to reach temperature before continuing. 
This allows for non-heat-related items, like homing the toolhead, to continue while they reach temperature. 
However, it is likely that the slicer will generate the non-wait versions of these very same commands in the generated gcode, even before calling PRINT_START. 
In Orca, for example, these are set in the top-most printer settings under "Machine G-code". Be sure to remove those commands in the generated gcode to take advantage of this optimization.

NOTE: The PRINT_START macro call is added to the gcode sent to the printer by the slicer software. For example, in Orca, it looks like this, which can be found in Print Settings > Machine G-cocde > Machine Start G-code. 
This is where the values for EXTRUDER and BED are derived from in the script.
```
PRINT_START EXTRUDER=[nozzle_temperature_initial_layer] BED=[bed_temperature_initial_layer_single]
```

NOTE: Sometimes there is also a START_PRINT macro defined in printer.cfg. Unless it is being called by your slicer or by another macro, it can be safely removed.

As with all the Macros provided here, be sure to examine them thoroughly and comment/uncomment the various parts as needed. Also, note that if there are more console log entries than you'd like to see,
the console log typically has the ability to have filters applied. In Mainsail, you can find these under the Interface Settings (gear icon in the top-right corner), at the bottom of the Console page.

***DISCLAIMER: While every effort is made to ensure that these macros work well in the vast majority of cases, typos or other mistakes made in these macros can lead to bad things happening. 
Please be sure to thoroughly test any changes you make to your own printer configuration, and also be sure to factor in any modifications you have made from your stock configuration.***

```
####################################
# PRINT_START macro
####################################
[gcode_macro PRINT_START]
description: Prepare the printer for a new print job
gcode:

    # Start a timer (Note: Requires TIMER macros)
    # RUN_SHELL_COMMAND CMD=shell_get_current_datetime
    # RUN_SHELL_COMMAND CMD=shell_log_current_datetime PARAMS='PRINT_START'
    # RUN_SHELL_COMMAND CMD=shell_log_current_datetime PARAMS='__COMPLETED'
    # RUN_SHELL_COMMAND CMD=shell_log_current_datetime PARAMS='__CANCELLED'

    # Get the extruder temperature expected for this print job
    # This will typically be a value in the range 220-260C
    {% set temp_extruder  = params.EXTRUDER|default(260)|int %}

    # Set extruder temperature (without waiting) initially
    M104 S{temp_extruder}       # No Waiting
    # M109 S{temp_extruder}     # Waiting

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
    # BED_MESH_CALIBRATE PROFILE=mesh1 METHOD=automatic
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

    # Show elapsed time (Note: Requires TIMER macros)
    # RUN_SHELL_COMMAND CMD=shell_get_elapsed_time PARAMS='PRINT_START'
    
```
## Why 150C?
Finally, a note about 150C. The QGL and potentially the bed levelling that occurs is generally performed at 150C. So in essence, we have a situation where the following occurs.
- Increase nozzle temperature to printing value, say 260C (depends on filament)
- Nozzle clean
- Reduce nozzle temperature to 150C
- QGL
- Increase nozzle temperature to back to printing value
- Nozzle Clean
- Print

If you have a fast nozzle heater, like a ceramic heater, this happens very quickly. If you don't, this can take an agonizingly long time. But why do this at all?

Well, the nozzle is ideally set at printing temperature to ensure it can be properly cleaned. Any filament stuck to the tip of the nozzle might not come off otherwise. In practice, filament tends to be not stuck to the nozzle but rather simply extruded and thus dangling, and it would get removed when doing a nozzle clean at any temperature.

The QGL and, optionally, the bed levelling, is done at 150C. One reason given is that this is to prevent damage to the build plate or even the underlying base plate. Constant TAP contact at high temperatures at identical points will lead to damage, and a lower temperature will reduce the that possibility. It may also be that build plaltes have improved, and TAP itself has improved, likely to the point where this isn't an issue. Another reason given is to have a low enough temperature to ensure that a TAP doesn't lead to filament coming out of the nozzle. As the nozzle is the primary sensor in play with TAP, having material extruded while TAPing would be a serious problem.  150C is below the temperature at which this occurs for PLA. So if you never use PLA, thien this value can be set significantly higher, thus reducing the time to get to/from the printing temperature.


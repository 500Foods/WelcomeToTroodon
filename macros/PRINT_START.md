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

***NOTE: It is critically important that the call to PRINT_START and its parameters supplied by your [slicer](https://github.com/500Foods/WelcomeToTroodon/tree/main?tab=readme-ov-file#%EF%B8%8F-slicers-quick-reference) 
match the PRINT_START macro in your printer.cfg. Also, review whatever else is being added by your slicer as this may have changed during an update, and may be duplicating some of the work of the PRINT_START macro. 
See the [Orca](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/orca.md) page for more information on that particular slicer software.***
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

    # Log the start of the script
    M118 PRINT_START has started

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
    # NOTE: Bed mesh data is stored at the end of printer.cfg
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

    # Try a print
    # NOZZLE_PRIME

    # One last home
    G28

    # Show elapsed time (Note: Requires TIMER macros)
    # RUN_SHELL_COMMAND CMD=shell_get_elapsed_time PARAMS='PRINT_START'

    # Log the end of the script
    M118 PRINT_START has ended
```
## Why 150C?
Finally, a note about 150C. The QGL and potentially the bed leveling that occurs is generally performed at 150C. So in essence, we have a situation where the following occurs.
- Increase nozzle temperature to printing value, say 260C (depends on filament)
- Nozzle clean
- Reduce nozzle temperature to 150C
- QGL
- Increase nozzle temperature to back to printing value
- Nozzle Clean
- Print

If you have a fast nozzle heater, like a ceramic heater, this happens very quickly. If you don't, this can take an agonizingly long time. But why do this at all?

Well, the nozzle is ideally set at printing temperature to ensure it can be properly cleaned. Any filament stuck to the tip of the nozzle might not come off otherwise. In practice, filament tends to be not stuck to the nozzle but rather simply extruded and thus dangling, and it would get removed when doing a nozzle clean at any temperature.

The QGL and, optionally, the bed levelling, is done at 150C. One reason given is that this is to prevent damage to the build plate or even the underlying base plate. Constant TAP contact at high temperatures at identical points will lead to damage, and a lower temperature will reduce that possibility. It may also be that build plates have improved, and TAP itself has improved, likely to the point where this isn't an issue. Another reason given is to have a low enough temperature to ensure that a TAP doesn't lead to filament coming out of the nozzle. As the nozzle is the primary sensor in play with TAP, having material extruded while TAPing would be a serious problem.  150C is below the temperature at which this occurs for PLA. So if you never use PLA, then this value can be set significantly higher, thus reducing the time to get to/from the printing temperature.

NOTE: The 150C QGL temperature is set explicitly in the PRINT_START script above, but it is likely also set when running a QGL, which can be found in the G32 macro in printer.cfg.

## Troubleshooting
Here are a few additional notes to help with troubleshooting the PRINT_START macro. These are intended specifically for new users of the Troodon 2.0 Pro which ships with a macro that doesn't quite work properly with current versions of Orca.

- Double-check that the [Orca settings](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/orca.md) for calling PRINT_START with the EXTRUDER and BED parameters match the same parameters in the PRINT_START macro.
- Double-check that the [Orca settings](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/orca.md) don't also include temperature commands as all the necessary commands for the bed and extruder are included in PRINT_START already. Remove any extraneous M109 commands, for example.
- The PRINT_START macro was recently updated with extra "PRINT_START has started" and "PRINT_START has ended" messages output to the console so you can confirm that it is in fact this version of the macro that is running.
- This was also to address the problem of people editing printer.cfg and not saving the changes, or not rebooting after, or updating a different printer.cfg file.
- Any and all changes to printer.cfg require rebooting Klipper to have the changes take effect. If you edit the printer.cfg file while Klipper is currently printing, it will allow you to save the file, but you will still have to restart Klipper after the print completes for the updated printer.cfg changes to take effect.
- There are often several printer.cfg files with timestamps. These are generated whenever you do a new bed mesh levelling, so be careful not to make changes to those as only the base "printer.cfg" file is actually used by Klipper.
- The PRINT_START macro can be run directly from the web interface without using Orca at all. It will do the same steps - heating to print temperature, then to 150C to do a QGL, and then back to print temperature. Running the macro in this way may help track down issues with the macro itself. Note that by default, the NOZZLE_PRIME command is commented out, so the PRINT_START macro does not actually attempt to extrude anything and as such should never give an extruder temperature error.
- When running the PRINT_START macro from the web interface, it will end with the extruder at 260C and the bed at 100C as per the defaults in the PRINT_START macro.
- You can change those defaults by editing the printer.cfg file and editing the macro itself.
- When running the PRINT_START macro from the web interface, you can also enter the EXTRUDER and BED values directly by clicking on the arrow on the right side of the macro button.
- As part of the PRINT_START sequence of commands, it loads a pre-existing "mesh1" bed mesh. If you've not yet done a bed mesh leveling, use the "mesh leveling" and "save mesh" macros to generate one. The "mesh1" name is used by default.
- Check that there is only one PRINT_START macro defined in printer.cfg. Comment out or remove any others.
- Check that there is no START_PRINT macro defined in printer.cfg. Comment out or delete any that are present.

#
Parent: [Macros Quick Reference](https://github.com/500Foods/WelcomeToTroodon#%EF%B8%8F-macros-quick-reference)

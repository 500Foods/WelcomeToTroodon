# CANCEL_PRINT
A print generally ends in one of two ways - either it is successful and completes normally, or something goes awry and you cancel it. Klipper can be configured to do different things in each case.
Here, we're addressing what to do when a print is prematurely cancelled. Note that if an "emergency stop" mechanism is used, this macro will not be executed.

The main things we're doing here are calling the timer to log the elapsed time, if the TIMER macros are being used, and then positioning the toolhead out of the way. In this example, it is moved
to the front of the printer, center-top, so it is easy to have a look at the nozzle and see if anything is amiss. This can also as a visual cue that the print was cancelled. 
Note that a print could be cancelled automatically due to missed temperature targets and that kind of thing.

```
#######################################
# CANCEL_PRINT
#######################################

[gcode_macro CANCEL_PRINT]
description: Cancel print abruptly
rename_existing: BASE_CANCEL_PRINT
gcode:

    # Show elapsed time (Note: Requires TIMER macros)
    # RUN_SHELL_COMMAND CMD=shell_log_current_datetime PARAMS='__CANCELLED'
   
    # Retract filament
    G91                   # Relative positioning
    G1 E-5.00 F1000       # Retract 5mm of filament

    # Pick a final position - Assuming a 350mm x 350mm x 310mm print volume
    # Here, the toolhead is presented for inspection following a failure
    G90                   # Absolute positioning
    G1 Z310               # Max Z first
    G1 X175               # Center X
    G1 Y10                # Front Y
    
    CLEAR_PAUSE
    BASE_CANCEL_PRINT
```

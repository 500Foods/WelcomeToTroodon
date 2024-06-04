# Orca
Depending on how a printer was originally configured in Orca, there may be a lot of information sent along with the G-code to Klipper, or there may be very little. 
And within Orca's normal settings, there are options to be more or less verbose when generating G-code. 
These are all things to be aware of if you're trying to get data into your Klipper macros or even over to Linux Bash scripts using the gcode_shell_command extension.
There are also features within Klipper that won't work properly without support enabled in Orca.

Note: These screenshots are from Orca 2.1 (beta) running under Fedora. 

## G-code Labels
If you routinely send prints with multiple objects, a recent Klilpper update provides a mechanism to exclude objects individually. This can be helpful if one of them gets knocked out of position or fails in some other way. 
If you've got a plate full of objects, this allows the print to continue along and complete the rest of the objects. Very handy. But in order for it to work, the objects need to be labeled in G-code. This setting can be
found on the 'Others' tab when the Advanced option is enabled.

![image](https://github.com/500Foods/WelcomeToTroodon/assets/41052272/00e287a3-2fd8-4dce-baba-8c7f35e10970)

## Machine start G-code
This is code that Orca includes in the G-code sent to the printer at the beginning of every print. The parameters we're expecting in our [PRINT_START] macro are provided by this mechanism. This can be found under the main
printer settings in the Machine G-code tab.

![image](https://github.com/500Foods/WelcomeToTroodon/assets/41052272/087a84f8-6117-4588-a245-e9b9706cc150)

In this case, the PRINT_START macro is called, and an extra setting is passed - the total number of layers in the print job. This makes the value available to Klipper macros, in case you want to use some kind of progress
calculation, or pass this value out to a Linux Bash script.
```
PRINT_START EXTRUDER=[nozzle_temperature_initial_layer] BED=[bed_temperature_initial_layer_single]
SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count]
```

## Layer change G-code
Scrolling down the Machine G-code tab a little further, there is this section which is inserted into the G-code whenever the slicer moves to a new layer. If you're using the Timelapse module with Klipper, you'll already
have the function call to trigger that module to generate a new image. 

![image](https://github.com/500Foods/WelcomeToTroodon/assets/41052272/ed066106-f669-47b7-b2ed-899f465a7a40)


In this case, in addition to the Timelapse call, there's another Klipper mechanism to set the value for the current layer. As before, this makes it possible to do things in Klipper related to progress or to kick off something
when certain layers are achieved. Perhaps a fan or heater can be turned on or off once a few layers are down, or different lighting modes can be enabled as the print progresses through 25%, 50%, and so on.
```
;AFTER_LAYER_CHANGE
;[layer_z]
SET_PRINT_STATS_INFO CURRENT_LAYER={layer_num + 1} 
TIMELAPSE_TAKE_FRAME
```
Note: lines beginning with a ; will still be inserted into the G-code, which you can see in the slicer output. But they aren't executed or visible by Klipper macros.

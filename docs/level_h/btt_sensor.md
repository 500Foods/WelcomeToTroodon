# BTT Smart Filament Sensor

*User Critical Paint - Justin, from the #troodon_2 Discord, has provided the following information on setting up this sensor in a Troodon 2.0 Pro printer.*
*The BTT Smart Filament Sensor is similar to the stock filament runout sensor, but it also has an extra encoder used to track how much filament is moving through the sensor.*

*Normally while printing, filament will move through the sensor at a steady rate. It will abruptly stop when there is a clog (the "printing air" situation). 
It might also stop when the filament has run out, but the end of the filament is still fixed to the spool. Neither scenario will be picked up by the stock runout sensor.*

Ok. So my initial plan was to configure and set a delay of 'X' seconds after the purge line to ensure the print would start and not pause because of the filament not moving from the purge line to where the print starts.
I couldn't get this working mainly because the macro was giving me no end of grief. So, I was shown by someone in the Klipper discord to just disable and enable the switch via startup gcode.
 
Originally, I was trying to use the exp1 slot on the stock Troodon board but could not define the pin properly for the macros to work, which led me to use the 'spare' ports on the LDO Nite Hawk.
 
![Image](https://github.com/user-attachments/assets/49c57ca8-bb0f-4f85-9ae6-e55fed338a59)
 
I configured this as follows.
 
- GPIO3 = Green
- GPIO2 = Blue
- GND = Black
- 3V3 = Red
 
The cables were fed down the x-chain, the y-chain, and the z-chain, and the wires were fed through the base of the machine, out the back grill, and then up the cable management tube.
 
## First Problem
The stealth burner is a snug unit, and where the ports on the Nitehawk sit, you need to make some room.
I only realized AFTER I soldered the pins that I can plug the cables in. So if you can, get a low profile set of pins and connectors, or you will have to cut a section out of the stealth burner to accommodate.
If I wasn't upgrading I would have been a bit gentler, but my disdain for the stealth burner prompted my decision to get medieval on its arse. 

## Second Problem
So, once the cables and everything were installed, we got to the code. I have this as the module for defining and enabling the BTT SFSv2 in my printer.cfg

 ```
#####################################################################
#   Filament Runout Sensor
#####################################################################
[filament_switch_sensor switch_sensor]
switch_pin: nhk:gpio2
pause_on_runout: False
runout_gcode:
 PAUSE # [pause_resume] is required in printer.cfg
 M117 Filament switch runout
insert_gcode:
 M117 Filament switch inserted
 
[filament_motion_sensor encoder_sensor]
switch_pin: nhk:gpio3
detection_length: 3.5 # accuracy of motion sensor 2.88mm
extruder: extruder
pause_on_runout: False
runout_gcode:
 PAUSE # [pause_resume] is required in printer.cfg
 M117 Filament encoder runout
insert_gcode:
 M117 Filament encoder inserted
```
 
The important bit is the macros for this to do its thing.
 
Here is the print start 
```
#####################################################################
# Macro-Print_Start
#####################################################################
#   Use PRINT_START for the slicer starting script - please customise for your slicer of choice
[gcode_macro PRINT_START]
gcode:
   # disable the sensor
    SET_FILAMENT_SENSOR SENSOR=encoder_sensor ENABLE=0
    # rest of the magic
    G32                            ; home all axes
    G90                            ; absolute positioning
    G1 Z20 F3000                   ; move nozzle away from bed
    NOZZLE_PRIME
    #Enable Filament Sensor
    SET_FILAMENT_SENSOR SENSOR=encoder_sensor ENABLE=1
  
#   Use PRINT_END for the slicer ending script - please customise for your slicer of choice
``` 
 
You do not really need anything for the print end, as the commands are simply turning on and turning off the switch in question.
 
How this works is 
1.	A job is set to print,
2.	The sensor is switched off,
3.	The printer homes,
4.	The printer goes through the heat up routine,
5.	The printer goes through the quad gantry level.
6.	The printer primes the nozzle.
7.	The sensor is switched on,
8.	The print moves to position and starts printing.
 
Note: I have set my detection length to 3.5mm instead of the 2.88mm as the default.
This is long enough (for my scenario) to not always trigger the pause function.
As it depends on speed, flow rate, squish, etc, this will require the most testing for your environment. I did this by printing a '9 square bed level test'. It is small and doesn't use a lot of filament and it is done in 10 minutes 
 
This setup will pause on filament runout and when the filament stops moving for any reason, which is exactly what I wanted. I hope this helps those who were in the same boat as me.


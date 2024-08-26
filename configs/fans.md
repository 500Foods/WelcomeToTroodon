# Fans
There are numerous fans running inside of a typical modern 3D printer. Some of them are critical - a failure of the fan could result in damage to the printer. Or worse. 
Some of them are necessary - a failure could lead to an unsuccessful print. 
And some of them are just nice to have - speeding up print times or reducing the noxious fumes emanating from the printer when printing with certain filaments like ABS or ASA.

There are of course different sizes and styles of fans with distinct performance characteristics. Some fans are really small, just big enough to get air flowing over a chip to keep it cool, as is the case with fans on the printer toolhead.
Chamber exhaust fans, on the other hand, are intended to move a much larger volume of air through an activated carbon filter, and as they are mounted on the enclosure, they can be much larger, spin more slowly, and thus be much quieter.
Part-cooling fans get most of the attention. These are generally high-performance fans - blowers, typically - designed specifically to maximize airflow over the part so that it can be cooled before the next layer comes around. 
High-speed PLA printing requires part-cooling fans, with an almost unlimited need for more airflow. When printing ABS or ASA on the other hand, the part-cooling fan is almost unnecessary.

Communicating with fans, what we're primarily interested in here, can take many forms as well. Some fans just run when the printer has power - no communication of any kind. Some can be turned on or off, but run at a set speed. 
Some can have their speed set manually or controlled automatically based on a related heater or thermistor output. And, the most rare, some can report their speeds using a built-in tachometer so you can see exactly how fast they are spinning or if indeed they are spinning at all.

One clue as to whether a fan has these extra capabilities can be found in the number of pins or wires running to the fan. 2-pin fans might be of the on/off variety, but using PWM (pulse width modulation), some fans can be controlled by quickly cycling the voltage to the fan. 
A 3-pin fan might use the third pin for this PWM function, whereas using just the first two pins would convert it to an on/off style fan. Some 3-pin fans use the third pin as the tachometer. And then there are 4-pin fans with separate PWM and tach pins. And, for all of these,
fans can run at 5V, 12V, or 24V. 3D printers tend to use 24V, or in a pinch, 5V.

As with all the parts of a typical printer, there are cheap fans and expensive fans. And, for the most part, printers ship with fans that work well enough for the print jobs the printer was designed for. 
But they are also good candidates for upgrading when more performance is required, or even when more fans are needed. The main differentiators, aside from the physical size, pins, and voltage, relate to the amount of airflow, usually advertised in CFM, the amount of noise generated, 
measured in dB, and the maximum power draw, in amps. 

## Klipper [fan] sections
Within Klipper's printer.cfg, there will be a section for each fan that Klipper knows about, and this [fan] section will determine to some degree how the fan works within the rest of the Klipper environment. 
Naturally, the configuration for the fan has to match the hardware characteristics of the fan. If you're using a 2-pin fan, it is unlikely that you'll be able to get a tachometer reading from it, for example, no matter how much you'd like to see one. 
Also, just because a fan hasn't been listed in printer.cfg doesn't mean that it can't be added. The fan on an MCU or CPU (or both!) are good candidates to add to printer.cfg if they're already there. 
Likewise, just because a fan has been configured a certain way by default doesn't mean that you can't change it to work a different way.

The main complication with [fan] configuration comes up when you want the fan to be controlled automatically by something else. For example, turning on a particular fan when a heater is turned on, for example. We'll see some examples of this in the sections below.
As usual, refer to the [Klipper Documentation - Fans](https://www.klipper3d.org/Config_Reference.html#fans) for the latest information on how to configure even the most complex fan arrangement.

## [fan_generic] Exhaust Fan
Sometimes referred to as the chamber fan, this is typically the fan at the back of the printer that draws air out of the chamber and pushes it through an activated carbon filter. Why activated carbon? 
Well, the VOCs that are created when printing with filaments like ABS or ASA are too small for a HEPA filter to catch. We're calling it the exhaust fan here because "chamber fan" describes another kind of fan discussed below.

***Note: Activated carbon doesn't last all that long, so if you're finding that your printer is a little more unpleasant to spend time around than normal, it might be a good idea to consider replacing the activated carbon filter.***

On a Troodon 2.0 Pro, this is a 60mm x 60mm x 20mm 24V 2-pin PWM fan. Which means we can control the speed, but we can't tell how quickly it is spinning. In the default Troodon printer.cfg, this fan is configured to turn on automatically when the bed heater rises above 60C.
In this automated configuration, there's no way to set the exhaust fan speed, either through the UI or through any other means - it just does what it's told. 
And as this is done in Klipper.cfg, this means that the configuration (and thus the fan speed) cannot be changed without restarting Klipper. Not so fun.

```
##  Exhaust fan - FAN3
[heater_fan exhaust_fan]
pin: PE5
max_power: 1.0
shutdown_speed: 0.0
kick_start_time: 5.0
heater: heater_bed
heater_temp: 60
fan_speed: 1.0
```
Let's instead change this configuration to use a different Klipper fan mode - moving from [heater_fan] to [fan_generic]. In this mode, the fan shows up in the Klipper UI with a slider to control the speed as a percentage.
```
##  Exhaust fan - FAN3
[fan_generic exhaust_fan]
pin: PE5
max_power: 0.7
shutdown_speed: 0.0
kick_start_time: 5.0
```
As an added benefit, we can also control this fan now using G-code macros. Perhaps we want to change the exhaust fan speed at different points in a print. 

For example, when printing with ABS or ASA, we generally want the exhaust fan speed to be low, around 30% or so, so that a high chamber temperature can be maintained, but still filter the air slowly. 
But when the print is done, we want the chamber to cool down more quickly, and filtering as much of the air as possible becomes the priority. with [fan_generic] fans, we can just set the fan speed directly.
```
[PRINT_START]
...
    # Exhaust fan to low (Note: Requires [fan_generic exhaust_fan] configured)
    SET_FAN_SPEED FAN=exhaust_fan SPEED=0.3  # Exhaust fan to low -> don't want to cool the chamber 
...

[PRINT_END]
...
    # Exhaust fan to max (Note: Requires [fan_generic exhaust_fan] configured)
    SET_FAN_SPEED FAN=exhaust_fan SPEED=1.0  # Exhaust fan to max -> cool chamber fast
...
```

## [controller_fan] MCU and CPU Fans
These are auxiliary fans that are attached, respectively, to the MCU and the CPU and will vary from printer to printer.

In addition to being able to control these fans, we'd also like to know something about what they are attached to.
So in these instances, we're also interested in Klipper [[temperature_sensor]](https://www.klipper3d.org/Config_Reference.html#builtin-micro-controller-temperature-sensor) sections. 

For our typical Troodon printer, this might look like the following. Note that the min_temp and max_temp values are hard limits. If they are exceeded, Klipper will abruptly shutdown. 
And that only the MCU fan is controlled here - simply turned on whenever the heater_bed is turned on, which is almost always the case when printing nearly anything.

```
##  Controller fan - FAN2
[controller_fan octopus_controller_fan]
pin: PC6
kick_start_time: 0.5
heater: heater_bed

#####################################################################
#   Host CPU Temperature
#####################################################################
[temperature_sensor BTT-CB1]
sensor_type: temperature_host
min_temp: 0
max_temp: 100

#####################################################################
#   Controller MCU Temperature
#####################################################################
[temperature_sensor Octopus]
sensor_type: temperature_mcu
min_temp: 0
max_temp: 100
```
With these in place, the MCU and CPU temperatures will be included in the Klipper temperature graph, and the MCU fan will be listed among the other fans, showing whether or not it is running.

## [heater_fan] Hotend Fan
Here we're referring to the fan that is in the toolhead. Normally, this will be running at 100% whenever the extruder heater is on. 
This is a critical fan, as without it the heat from the heat block will slowly creep up into the extruder and start melting things that are not supposed to be melted.
The unchecked failure of this fan will likely result in having to only replace parts of the toolhead, if you're lucky enough to catch it in time.

```
##  Hotend Fan - FAN1
[heater_fan hotend_fan]
pin: PB8
max_power: 1.0
kick_start_time: 0.5
heater: extruder
heater_temp: 50.0
##  If you are experiencing back flow, you can reduce fan_speed
#fan_speed: 1.0
```
Generally speaking, this is going to turn on to 100% as soon as the toolhead heater (the extruder in Klipper's terms) turns on, and will remain at 100% so long as that heater is running.
It isn't a very large or noisy fan, so this isn't likely to be of concern. What is of concern is paying attention to whether it is working or not. If your extruder starts doing odd things,
like not being able to maintain consistent temperatures, having a quick check to ensure this fan is working would be at the very top of the list. Just takes a bit of debris to get jammed
into the fan to have it stop working, with a melted toolhead as the result.

## [fan] Part-Cooling Fan
This is the fan (or perhaps more than one) that tends to get all the attention, and why it is listed as [fan] without any kind of qualifier. Perhaps in some of the earliest 3D printers.
this was the only fan that could be controlled, or needed to be controlled. 
```
#  Print Cooling Fan - FAN0
[fan] 
pin: PB7
kick_start_time: 0.5
##  Depending on your fan, you may need to increase this value
##  if your fan will not start. Can change cycle_time (increase)
##  if your fan is not able to slow down effectively
off_below: 0.10
```
The use of this fan isn't really something that is managed in Klipper's printer.cfg because it most often is controlled more precisely by the G-code for the print job. 
As a print progresses through different layers, the speed of this fan is often adjusted to compensate for various issues. Overhangs and bridging might require more aggressive cooling, 
as would very short layer times. On the other hand, if it is a big print job and the layer times are really long at various points, then the part-cooling requirements are reduced.

## [temperature_fan] Chamber Fan
The final Klipper [fan] mode is one that isn't defined in a stock Troodon configuration, but would likely appear in one that has been upgraded to have chamber fans.
What are chamber fans? These are auxiliary fans, like nevermore or The Fan, that circulate air within the chamber, typically through their own additional activated carbon filters.
Why? Two primary reasons. More VOC filtering and higher chamber temperatures.

For the VOC side, having an in-chamber fan/filter combination allows the air inside the chamber to pass through the activated carbon filter potentially many times before exiting via the exhaust fan.
This can dramatically reduce the VOCs present in the exhaust. Having several such fans/filters in the chamber can multiply this even further. Projects like nevermore and The Fan support two, three,
or even four in-chamber fans.

For the chamber temperature issue, the goal is to incease the overall chamber temperature to around 50C - 60C when printing with filaments like ABS or ASA. This higher chamber temperature helps to
reduce the warping that can occur with these filaments, as the change in temperature between the already printed component of the print and the new plastic laid down on top is significantly reduced.
And this is what causes the warping in the first place. The higher layers are laid down at a cooler temperature, so they shrink a little more, pulling up on the corners, causing the print to warp.

There are other considerations, like having a fully enclosed and properly sealed chamber to begin with. As well as having accurate chamber thermistors. And that's where the [temperature_fan] part comes in - by monitoring the 
chamber temperature, these fans, typically placed under the heated bed, distribute the heat from the bed heater to the rest of the printer. This greatly reduces the time needed to get the chamber
to the desired temperature, and also for heat-soaking the printer, where that temperature is maintained for a short time (say, 20 minutes) before printing begins.




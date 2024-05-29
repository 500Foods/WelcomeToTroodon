# 🙂 PID Tuning
A critical component in any 3D printer is the hotend. In particular, the heater at the bottom of the toolhead, just above the nozzle, is where the filament is melted just prior to being pushed out through the nozzle. 
Maintaining a constant temperature here is important to ensure a smooth and consist flow of filament. 

The way the heater works is rather simple. Power is applied to a heating element, perhaps a 24V core that is bolted inside of an aluminum block. Or maybe its a ceramic heater. 
Regardless, when power is applied or increased, the heater gets hotter. When power is removed or decreased, the heater gets cooler. The ***rate*** at which the heater changes temperature is the important part. 
And each part of the heater contributes to how this rate changes. Ceramic heaters can heat up surprisingly fast, for example, whereas a large aluminum block might take some time to reach the same temperature.

To deal with these kinds of variants, Klipper uses something called PID Tuning, where PID stands for "proportional-integral-derivative". Sounds a lot like calculus because, well, it is. The idea is to have the
printer itself run through a series of heating and cooling cycles to determine the relationship between the power being applied (or removed) and the resulting temperature. The end result is a few cryptic values
that get stored in printer.cfg that describe that precise relationship. This helps ensure that the printer can maintain a constant temperature throughout the entire print job.

## When to run a PID Tune?
Extruder PID Tuning should be performed anytime there is a significant change in the toolhead. A different heater, obviously, but also if you're using a different kind of nozzle or a different thermistor, etc. 
Basically, anything that would have an impact on that power-temperature relationship. 

The clue that a PID Tune is necessary is when the temperature graph for either the extruder or the bed is no longer smooth. If the temperature oscillates when it is suppose to be stable, or if it overshoots the
target temperature when heating (or cooling), then this is a good sign that a PID Tune would be helpful.

## PID Tuning - Extruder
Lots of words, but how do we actually kick off a PID Tuning session? Pretty easy, as it turns out.

- Start when the printer and print bed are at room temperature
- Home the printer as you normally would, with the toolhead in the middle of the build plate
- Raise the Z axis off the bed around 50mm so the bed temperature isn't affecting the extruder
- Determine the TARGET temperature for the PID Tune - the temperature you most often print at
- Run the following command in the Klipper console, setting TARGET to that temperature 
```
PID_CALIBRATE HEATER=extruder TARGET=260
```
The printer will then heat up the extruder to that temperature and then oscillate a handful of times. This might take a few minutes,
depending on what kind of heating element is available. 
When complete, it will output a message indicating the optimal values it has determined from its calibration run. To save these
values in printer.cfg, run the SAVE_CONFIG command as indicated. Klipper will then immediately restart and use these values.

## PID Tuning - Bed Heater
The bed heater works the same way, just usually a little slower than the extruder heater. PID Tuning can be done here using the same approach. Use whatever bed temperature here that you normally use for printing.
ABS/ASA prints are typically run with a 100C bed, for example.
```
PID_CALIBRATE HEATER=heater_bed TARGET=100
```
Changing the bed heater or anything related to the components involved in maintaining a consistent bed temperature would be a good time to run this calibration.

Next: [First Prints](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_1/first_prints.md)

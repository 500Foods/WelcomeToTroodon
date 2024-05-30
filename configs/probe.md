# [probe]
This is used to configure the Voron TAP probe found on Troodon printers and others. If you've got a different probe, then by all means follow the documentation and disregard these settings.

The TAP probe uses the nozzle directly, so the x_offset and y_offset are both set to zero.

***NOTE: Setting z_offset as suggested in the documentation seems to set it globally, meaning that it changes the z_offset for your printer which is absolutely not what is intended, So this value is deliberately not included here. I've got a wonderfully engraved first layer in a glass bed as a testament to this.***
```
#####################################################################
# Voron TAP config (probe IS the nozzle)
#####################################################################
[probe]
pin: PF4

x_offset: 0    # Distance between the probe and the nozzle in mm
y_offset: 0    # Distance between the probe and the nozzle in mm

speed: 10.0                     # z-axis speed when probing (max=10 mm/s)
lift_speed: 100.0               # z-axis lift speed when probing (max=100 mm/s)

samples: 3                      # Number of times to probe each point
samples_result: average         # Median or average calculation for multiple samples
samples_tolerance: 0.005        # Maximum tolerance between probe values
samples_tolerance_retries: 10   # Number of times to retry before giving up
sample_retract_dist: 2.0        # Distance to lift between each probe (mm)
```

References:
- [Voron TAP GitHub Repository](https://github.com/VoronDesign/Voron-Tap) - Software and links to CAD drawings, etc.
- [Voron TAP Assembly Manual](https://github.com/VoronDesign/Voron-Tap/blob/main/Manual/Assembly_Manual_Tap.pdf) - If you want to assemble or repair the Voron TAP probe
- [TAP Documentation ](https://www.klipper3d.org/Config_Reference.html#probe)- List of available parameters
  

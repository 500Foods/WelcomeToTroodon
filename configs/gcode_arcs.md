# [gcode_arcs]

To enable support for G2/G3 commmands, add the following to printer.cfg
```
[gcode_arcs]
#resolution: 1.0
#   An arc will be split into segments. Each segment's length will
#   equal the resolution in mm set above. Lower values will produce a
#   finer arc, but also more work for your machine. Arcs smaller than
#   the configured value will become straight lines. The default is
#   1mm.
```
NOTE: For Orca, there's a corresponding setting found under `Quality > Precision > Arc fitting`. The help for this option suggests leaving it
turned off as Klipper will convert arcs to segments anyway. 

If you're not using Orca, or if you have G-code files from somewhere else, this should allow Klipper to accept the G2/G3 comamnds.

## Reference
- [Klipper Documentation](https://github.com/Klipper3d/klipper/blob/master/docs/Config_Reference.md#gcode_arcs) - Configuration Reference

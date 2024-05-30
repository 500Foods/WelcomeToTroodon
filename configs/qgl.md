# [quad_gantry_levelling]
Quad Gantry Levelling (QGL) on a Troodon uses the stock Voron TAP mechanism to determine the relative positions of the four corners of the build plate. It then adjusts the motors in each of the four corners to ensure that they are level. 

The gantry can become tilted (not level) in various scenarios, such as when the printer has been off for an extended time, or if the gantry has been bumped or moved manually during maintenace. 
Manually adjusting the gantry should be done to within 1mm if possible in order for this levelling mechanism to work. To help with that, print a set of [gantry levelling supports](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_1/gantry_levelling.md).

Another consideration is to determine the positions on the print bed where the measurements are taken. By default, the configuration uses the extreme edges of the stock build plate. 
If the build plate is not positioned precisely, or if you have a slightly smaller build plate, it is entirely possible that the QGL points will miss the bed entirely. 
In the configuration below, the points are brought in 10mm to compensate for this.

Please make note of the limits and directions of each axis for your printer. For a typical CoreXY printer like a Troodon, this will be as follows.
- X axis runs from 0 at the left to max at the right
- Y axis runs from 0 at the front to max at the back
- Z axis runs from 0 at the bottom to max at the top

A key value is the retry_tolerance, shown below at 0.0075. Ideally this number will be as low as possible, but there are physical limits that come into play. 
If this value is set too low, the QGL process will continually cycle, taking a very long time and ultimately fail. 
If this value is set too high, you won't get all the benefits that are derived from the QGL in the first place - a perfectly level bed.

Ideally, the QGL will test the four points, make an adjustment, and complete. In some cases, it may make 2-3 rounds. If it routinely takes more than that, consider adjusting the retry tolerance. 

If the QGL fails unexpectedly, consider doing a little troubleshooting to see if something else is amiss.
- Out-of-level due to printer being off for an extended period
- Build plate not sufficiently stuck to underlying aluminum base plate
- Build plate not aligned properly with underlying aluminum base plate
- Belt tensioning issues

In most cases, a QGL should be automatically performed before every print. It is included in our [PRINT_START](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/PRINT_START.md) macro for just this purpose. 

```

#####################################################################
# Quad Gantry Levelling
#####################################################################
[quad_gantry_level]

#--------------------------------------------------------------------
## Example: Gantry Corners for 250mm Build
#--------------------------------------------------------------------
# gantry_corners:
#    -60,-10                # Front-left X/Y
#    310, 320               # Back-right X/Y
# points:
#    50,25                  # Front-left X/Y
#    50,175                 # Back-left X/Y
#    200,175                # Back-right X/Y
#    200,25                 # Front-right X/Y
#--------------------------------------------------------------------
## Example: Gantry Corners for 300mm Build
#--------------------------------------------------------------------
# gantry_corners:
#    -60,-10                # Front-left X/Y
#    360,370                # Back-right X/Y
# points:
#    50,25                  # Front-left X/Y
#    50,225                 # Back-left X/Y
#    250,225                # Back-right X/Y
#    250,25                 # Front-right X/Y
#--------------------------------------------------------------------

# Limts of gantry
gantry_corners:          
   -60,-10                # Front-left X/Y
   410,420                # Back-right X/Y

# Points to measure
points:        
   10,10                  # Front-left X/Y
   10,340                 # Back-left X/Y
   340,340                # Back-right X/Y
   340,10                 # Front-right X/Y

speed: 500                # Horizontal move speed between points
horizontal_move_z: 5      # Vertical movement between points
retry_tolerance: 0.0075   # When everything is very well calibrated
#retry_tolerance: 0.01    # When you want the QGL to complete more quickly
retries: 10               # Number of cycles to run
max_adjust: 10            # How much adjustment is acceptable
```

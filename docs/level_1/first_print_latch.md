# Stealthburner Latch
For Troodon printers, or any printer using the Voron Stealthburner toolhead. There is a latch that is part of the design of the ClockWork 2 extruder. 
When unlocked, it opens up the filament path, allowing for filament to proceed unobstructed through the extruder directly into the hotend. This can be helpful when changing filaments or troubleshooting problems. 
Generally, FILAMENT_LOAD and FILAMENT_UNLOAD macros should be used instead, removing the need to use the latch entirely.

The issue, however, is that the latch itself isn't particularly strong and is prone to breaking. And, once broken, the extruder is effectively disabled as there's nothing to force the gears into the correct position. 
And if you happen to have only one printer, printing a replacement latch is going to be problematic. Fortunately, a little crazy glue can help put a broken latch back together in most cases. But maybe it would be 
best to print up a couple in advance, and while we're at it, print a beefier version that is much less likely to be broken in the first place.

https://www.printables.com/model/508340-updated-latch-for-voron-stealthburner-clockwork-2-

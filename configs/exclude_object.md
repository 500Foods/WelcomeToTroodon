# [exclude_object]
A relatively recent addition to the Klipper ecosystem was the ability to exclude objects from the currently running print job. 
If your print job contains several objects and one or more of them gets knocked out of place, they can be excluded from that point forward. 
This will stop the printer from trying to print mid-air over a part that is no longer positioned properly, potentially salvaging the rest of the objects in that print job. Very handy!

In order to enable this feature, it is a simple addition of the following to the printer.cfg file.

```
#####################################################################
# Support for canceling objects while printing
#####################################################################
[exclude_object]
```

With that line in place, Mainsail (the web interface for Klipper) will now have a button at the top, where the pause/cancel button is, that will bring up an interface and allow you to exclude objects. 

NOTE: This also requires that your slicer includes labels for the objects and has "exclude objects" enabled as well. In Orca, this can be found under the "Others" tab when the Advanced option is enabled.

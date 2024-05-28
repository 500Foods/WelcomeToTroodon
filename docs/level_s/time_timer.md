# Time and Timer Commands
Klipper isn't particularly aware of anything to do with time. It doesn't even seem to currently support the M75 gcode command (start the print timer). Nor does it have any concept of what the current time is. 

To address this, a Klipper extension called gcode_shell_commands can be used. This can be easily installed using KIAUH. The extension provides a mechanism to run Linux commands and even pass parameters to them. The output of the commands can be displayed on the Klipper console. 
Currently there does not seem to be a way to get the output from the script into a gcode variable, but perhaps that will come along at some point. For our purposes, we're interested in displaying the current date/time in ISO8601 format. And we're interested in displaying a timer. 
In particular, it might be interesting to know how long the PRINT_START macro takes to run.
psed_time TIMER

# Time and Timer Shell Scripts
Klipper isn't particularly aware of anything to do with time. It doesn't even seem to currently support the M75 gcode command (start the print timer). Nor does it have any concept of what the current time is. 

To address this, a Klipper extension called [gcode_shell_command](https://github.com/dw-0/kiauh/blob/master/docs/gcode_shell_command.md) can be used. This can be easily installed using [KIAUH](https://github.com/dw-0/kiauh) which, itself, is also easy to install. The extension provides a mechanism to run Linux commands and even pass parameters to them. The output of the commands can be displayed on the Klipper console. 

Currently, there does not seem to be a way to get the output from the script into a gcode variable, but perhaps that will come along at some point. For our purposes, we're interested in displaying the current date/time in ISO8601 format. And we're especially interested in implementing a timer. In particular, it might be good to know how long the PRINT_START macro takes to run.

To start with, we'll need some Linux scripts to help with this. To keep things nice and performant, these are just a few Bash scripts. They could be implemented in Python or virtually any other language but as what they're doing is rather trivial, there's no need to reach for anything more complicated than this.

## Current Date/Time

First, we'll need a scrip that returns the current date and time - let's call it [get_current_datetime.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/get_current_datetime.sh). Let's put it in ~/scripts. All it is doing is calling the standard Linux 'date' function with a bunch of fancy parameters to get it to spit out an ISO8601-formatted date.

```
# echo "Current Date/Time:" `date +"%Y-%m-%dT%H:%M:%S%z"`
Current Date/Time: 2024-05-27T21:01:13-0700
```

Nothing too fancy about that. In order to call this from within a Klipper macro, we'll need to create a macro that defines the link to the script, and then a second macro that we can use as a button in the Klipper interface to call it.
```
[gcode_shell_command shell_get_current_datetime]
command: ~/scripts/get_current_datetime.sh
timeout: 2.
verbose: True

[gcode_macro current_date_time]
gcode:
    RUN_SHELL_COMMAND CMD=shell_get_current_datetime
```
The first stanza gives us a place to put in the full pathname to the script - the 'command' parameter. The 'timeout' parameter is used to ensure that the script doesn't run for too long. Most of what we're doing will execute in milliseconds, so nothing too troublesome. But if you're running scripts that do something more substantial, then this can help ensure that you don't end up with a lot of zombie processes running amok. And finally, the 'verbose' parameter is used to determine whether the output of our script is dumped into the Klipper console. In this case, we want to see the output, so this is 'True'.

With that installed, we've got a new button in the Klipper interface and when we click on it, the current date/time is shown in the Klipper console. we can also just enter the command 'current_date_time' into the console and get the same end result. Or we can add it to another macro anytime we want that macro to output the current date and time. Note that this is somewhat less than useful as the Klipper console logs the time anyway. 

<kbd><a href="URL"><img src=https://github.com/500Foods/WelcomeToTroodon/assets/41052272/fe789383-b277-4054-bdb0-860cb1f9e67d></a></kbd>

## Timers

With that in place, we can do something similar to get timers working. To make this more useful, we're going to pass a parameter to indicate the name of a timer. This will make it possible to have a separate timer running in different macros, or even just to have a manually-run timer for whatever purpose you want to have a timer for in Klipper. However, we've got a problem.  We can pass variables from Klipper to our script, but we can't get values back. So we'll use this parameter to store the current time in a local tmp file (using the parameter as part of the filename). And then use a second script to retrieve that value and show us the elapsed time.

For our first timer script, let's call it [log_current_datetime.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/log_current_datetime.sh). It writes out the current epoch value (number of seconds since January 1, 1970) to a temporary file that includes the parameter as part of the filename. In this case, we're using a built-in Bash feature that stores this value in a variable that we can just write out directly.
```
# echo $EPOCHSECONDS > /tmp/klipper-$1-epochtime.tmp
# cat /tmp/klipper-$1-epochtime.tmp
1716861043
```
For the second timer script, all we're doing is reading in this same value (at a later time, naturally) and displaying the difference, in seconds, using a more human-readable format. Let's call this one [get_elapsed_time.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/get_elapsed_time.sh).
```
now=`echo $EPOCHSECONDS`
then=`cat /tmp/klipper-$1-epochtime.tmp`
timediff=$(($now-$then))
echo "$1 Elapsed Time: " `date -ud @${timediff} +"$(( seconds/3600/24 ))d %-Hh %-Mm %-Ss" | sed -E 's/\b0(s|m|h|d) ?//g; s/ +$//; s/^$/0s/'`
```
The tricky bit here is in the formatting of the number of seconds as a nice '2m 16s' sort of thing. Don't worry, there won't be a quiz on the inner workings of sed. 

On the Klipper side, we'll set up two pairs of macros that work in the same way as our previous current date/time pair of macros worked.

```
# These start a timer by logging a timestamp to a tmp file
    
[gcode_shell_command shell_log_current_datetime]
command: ~/scripts/log_current_datetime.sh
timeout: 2.
verbose: False

[gcode_macro timer_start]
gcode:
    {% set TIMER=params.TIMER | default("Manual_Timer") | string %}
    RUN_SHELL_COMMAND CMD=shell_log_current_datetime PARAMS={TIMER}

# These calculate the eleapsed time by reading in a previous tmp file value

[gcode_shell_command shell_get_elapsed_time]
command: ~/scripts/get_elapsed_time.sh
timeout: 2.
verbose: True

[gcode_macro timer_elapsed]
gcode:
    {% set TIMER=params.TIMER | default("Manual_Timer") | string %}
    RUN_SHELL_COMMAND CMD=shell_get_elapsed_time PARAMS={TIMER}
```

## Macro Timing
To put it all together, then, we can add an extra command at the beginning of a macro to kick off one of these timers, giving it the name of the macro we're timing, for example. And then at the end of the macro we can retrieve the elapsed time. 
For our PRINT_START macro, we can add this at the beginning, being sure to indent it to be inline with the rest of the macro.
```
    # Start a timer (Note: Requires TIMER macros)
    RUN_SHELL_COMMAND CMD=shell_log_current_datetime PARAMS='PRINT_START'
```
And at the end of the macro, we can make the call to output the elapsed time to the Klipper console.
```
    # Show elpased time (NOTE: Requires TIMER macros)
    RUN_SHELL_COMMAND CMD=shell_get_elapsed_time PARAMS='PRINT_START'
```
Now, once the PRINT_START macro completes, you'll see a message something like this in the console.

<kbd><a href="URL"><img src=https://github.com/500Foods/WelcomeToTroodon/assets/41052272/2a4a8850-b9e3-4bbb-91c9-559647912ae4></a></kbd>

#
Parent: [Scripts Quick Reference](https://github.com/500Foods/WelcomeToTroodon#-scripts-quick-reference)

# TIMER Macros

An explanation for how to use these can be found [here](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_s/time_timer.md). Note that these macros rely on several supporting ](https://github.com/500Foods/WelcomeToTroodon/tree/main#time-and-timer-shell-commands)..

```
####################################
# TIMER macros
####################################

# These log the current date/time in ISO8601 format

[gcode_shell_command shell_get_current_datetime]
command: ~/scripts/get_current_datetime.sh
timeout: 2.
verbose: True

[gcode_macro current_date_time]
gcode:
    RUN_SHELL_COMMAND CMD=shell_get_current_datetime


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


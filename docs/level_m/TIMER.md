# TIMER Macros

```
####################################
# TIMER macros
####################################
[gcode_shell_command shell_get_current_datetime]
command: ~/scripts/get_current_datetime.sh
timeout: 2.
verbose: True

[gcode_macro current_date_time]
gcode:
    RUN_SHELL_COMMAND CMD=shell_get_current_datetime

    
[gcode_shell_command shell_log_current_datetime]
command: ~/scripts/log_current_datetime.sh
timeout: 2.
verbose: False

[gcode_macro timer_start]
gcode:
    {% set TIMER=params.TIMER | default("Manual_Timer") | string %}
    RUN_SHELL_COMMAND CMD=shell_log_current_datetime PARAMS={TIMER}


[gcode_shell_command shell_get_elapsed_time]
command: ~/scripts/get_elapsed_time.sh
timeout: 2.
verbose: True

[gcode_macro timer_elapsed]
gcode:
    {% set TIMER=params.TIMER | default("Manual_Timer") | string %}
    RUN_SHELL_COMMAND CMD=shell_get_elapsed_time PARAMS={TIMER}
```


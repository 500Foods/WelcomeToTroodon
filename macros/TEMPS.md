# TEMPS
Sometimes it can take a while for Klipper to "accept" that a new temperature has been reached, either for the extruder temperature or the bed heater temperature. 
It tries to wait for the temperature to "stabilize" but in some instances, that stabilization takes a long time, or might not even be reached. This is particularly the case when using faster heaters or if the PID calibration hasn't been performed recently.

To get around this, and to make the whole process quicker, Klipper can be configured to instead simply wait for the temperature to be reached, rather than to be stabilized. This is achieved by replacing Klipper macros with different versions.

```
[gcode_macro M109]
rename_existing: M99109
gcode:
    #Parameters
    {% set s = params.S|float %}
    
    M104 {% for p in params %}{'%s%s' % (p, params[p])}{% endfor %}  ; Set hotend temp
    {% if s != 0 %}
        TEMPERATURE_WAIT SENSOR=extruder MINIMUM={s} MAXIMUM={s+1}   ; Wait for hotend temp (within 1 degree)
    {% endif %}

[gcode_macro M190]
rename_existing: M99190
gcode:
    #Parameters
    {% set s = params.S|float %}

    M140 {% for p in params %}{'%s%s' % (p, params[p])}{% endfor %}   ; Set bed temp
    {% if s != 0 %}
        TEMPERATURE_WAIT SENSOR=heater_bed MINIMUM={s} MAXIMUM={s+1}  ; Wait for bed temp (within 1 degree)
    {% endif %}
```
# Reference
- Ellis' Print Tuning Guide - [Replace M109/M190 With TEMPERATURE_WAIT](https://ellis3dp.com/Print-Tuning-Guide/articles/useful_macros/replace_m109_m190_with_temp_wait.html)

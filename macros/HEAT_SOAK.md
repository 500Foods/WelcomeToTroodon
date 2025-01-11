# HEAT_SOAK
For some filaments, like ASA or ABS, it is helpful to have the printer set up with as high a chamber temperature as possible. Naturally this applies to enclosed printers only.
In addition, it helps if the printer is at that temperature for a period of time so that all of the compnents also reach the same temperature.
This is known as "heat soaking" the printer, and generally leads to improved (aka more consistent) prints. Particularly compared to starting the printer cold.

Discord #troodon_2 user @Chase has provided the following macros for just this purpose. Using the UI, the desired temperature and duration can be set. 
For a stock Troodon 2.0 Pro, a chamber temperature of 40C for 20 minutes would be a good place to start.

![image](https://github.com/user-attachments/assets/5afbb14d-b862-445b-8f37-bae725516256)

```
[gcode_macro HEAT_SOAK]
description: heats the bed for a while

variable_target_temp: 0
variable_stage: None ## heating -> soaking -> done -> None

## in seconds
variable_check_interval: 10
variable_soak_time_remaining: 0
variable_total_time_elapsed: 0

gcode:
    {% set TARGET = params.TARGET | default(0) | float %}
    {% set DURATION = (params.DURATION | default(5) | int) * 60 %} ## minutes to seconds

    SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=target_temp         VALUE={ TARGET }
    SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=stage               VALUE="'heating'"
    SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=soak_time_remaining VALUE={ DURATION }
    SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=total_time_elapsed  VALUE=0

    ;; fire up the heater
    SET_HEATER_TEMPERATURE HEATER=heater_bed TARGET={ TARGET }

    ;; run the parts fan to circulate air
    M106 S255

    ;; put the bed and nozzle where they're a safe distance apart
    G28


    M84 ;; turn off steppers

    UPDATE_DELAYED_GCODE ID=heat_soaker DURATION={ check_interval }

[gcode_macro CANCEL_HEAT_SOAK]
description: cancels an in-progress HEAT_SOAK cycle
gcode:
    SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=stage VALUE="'cancel'"
    UPDATE_DELAYED_GCODE ID=heat_soaker DURATION=1

[delayed_gcode heat_soaker]
; ## debug
; { action_respond_info( printer['gcode_macro HEAT_SOAK'] | tojson )}
gcode:
    {% set heat_soak = printer['gcode_macro HEAT_SOAK'] %}

    ## update total time elapsed
    {% set total_time_elapsed = heat_soak.total_time_elapsed + heat_soak.check_interval %}
    SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=total_time_elapsed VALUE={ total_time_elapsed }

    {% set stage = heat_soak.stage %}
    {% if stage == "heating" and printer.heater_bed.temperature >= heat_soak.target_temp %}
        {% set stage = "soaking" %}
    {% endif %}

    {% if stage == "soaking" %}
        ## update soak countdown
        {% set soak_time_remaining = [heat_soak.soak_time_remaining - heat_soak.check_interval, 0] | max %}
        SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=soak_time_remaining VALUE={ soak_time_remaining }

        {% if soak_time_remaining == 0 %}
            {% set stage = "done" %}
        {% endif %}
    {% endif %}

    SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=stage VALUE="'{ stage }'"

    {% if stage in ("done", "cancel") %}

        {% if stage == "cancel" %}
            {% set stage = "done" %}
            TURN_OFF_HEATERS
            M107 ; turn off fan

            M117 { "soak cancelled after ~%.1fm" | format(total_time_elapsed / 60.0) }
        {% else %}
            M117 { "soak complete after %.1fm" | format(total_time_elapsed / 60.0) }
        {% endif %}

        ## reset all state vars, except stage, which may be queried via the api
        SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=target_temp         VALUE=0
        SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=soak_time_remaining VALUE=0
        SET_GCODE_VARIABLE MACRO=HEAT_SOAK VARIABLE=total_time_elapsed  VALUE=0

    {% else %}

        {% if total_time_elapsed % 90 == 0 %}
            ## output status periodically
            {% if stage == "heating" %}
                M117 { "heating -- %.1fm elapsed" | format(total_time_elapsed / 60.0) }
            {% elif stage == "soaking" %}
                M117 { "soaking -- %.1fm remaining" | format(soak_time_remaining / 60.0) }
            {% endif %}
        {% endif %}

        ## trigger ourselves again
        UPDATE_DELAYED_GCODE ID=heat_soaker DURATION={ heat_soak.check_interval }

        ## dwell for 1ms to prevent from going idle
        G4 P1

    {% endif %}
```
#

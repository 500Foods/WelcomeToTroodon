# LIGHTS_TOGGLE
Many printers, including specifically the Troodon, have a chamber light. This is usually an LED light bar of some kind. It is usually wired up to a pin on the MCU so that it can be programmatically turned on and off. By default, it is turned on when the printer is turned on, and that's
often the end of it. In Mainsail, there's a "chamber light" button you can use to turn the light on or off, but that's about it. So let's expand on that a bit.

In printer.cfg, the pin assigned to the chamber light is assigned. Let's add a macro there to turn it on if it is off, or turn it off if it is on.

```
#####################################################################
# Chamber Lights
#####################################################################
[output_pin case_light]
pin: PE6               // MCU PIN
pwm: false             // Set up pin to work with digital values
shutdown_value: 0      // Turn off when shutting down
value: 1               // Turn on normally

[gcode_macro LIGHTS_TOGGLE]
description: Toggle Chamber Lights
gcode:
    {% if (printer["output_pin case_light"].value)|int == 1 %}
        SET_PIN PIN=case_light VALUE=0
    {% else %}
        SET_PIN PIN=case_light VALUE=1
    {% endif %}
```

We can also take this a step further by adding a light button to KlipperScreen. Changes to KlipperScreen are made in the KlipperScreen.conf file. By default, there's nothing in there other than the "don't change anything below this line" message. 
To add a new menu button to the main page, and then have it call the macro that was just created, add the following section to the very top of KlipperScreen.conf.
```
[menu __main light]
name: Chamber Light
icon: light
method: printer.gcode.script
params: {"script":"LIGHTS_TOGGLE"}
```

After KlipperScreen restarts (and Klipper itself is restarted to enable the macro), there should be a new button on the main screen that can be used to toggle the chamber light.

[![LIGHTS_TOGGLE](https://github.com/500Foods/WelcomeToTroodon/assets/41052272/e698e328-119f-48d2-8448-b3598d6212f5)](https://github.com/500Foods/WelcomeToTroodon/assets/41052272/e698e328-119f-48d2-8448-b3598d6212f5)

NOTE: Klipper processes macros in a sequential and single-threaded manner. If a long-running macro is currently running, such as a PRINT_START macro, other macros will queue up behind it, and not get executed until it is finished.
Put another way, this means that while something like PRINT_START is running, the light button will appear to not work. But tapping it will queue up the request which will be executed after.

#
Parent: [Macros Quick Reference](https://github.com/500Foods/WelcomeToTroodon#%EF%B8%8F-macros-quick-reference)

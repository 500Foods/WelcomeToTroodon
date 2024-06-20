
Skip to content
Navigation Menu

    500Foods
    /
    WelcomeToTroodon

Code
Issues
Pull requests
Discussions
Actions
Projects
Wiki
Security
Insights

    Settings

Editing README.md in WelcomeToTroodon
Breadcrumbs

    WelcomeToTroodon

/
in
main

Indent mode
Indent size
Line wrap mode
Editing README.md file contents
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
## 🔨 Level Two - Get to Work!
This list is aimed at those who might be planning for a more production-oriented environment. Maybe you're using your printer in a business. Maybe you have an Etsy store. Maybe you print a lot of the same things over and over again. Or maybe you just like to tinker. Here are modifications that can help ensure reliable prints day in and day out. And again, we're not touching anything in the main filament path of the printer but instead focused on everything around it. Often, small updates or modifications can make a big difference in the day-to-day experience. These are intended to be on the less expensive and easy-to-implement side of the fence, accessible to most everyone without too much of a learning curve.

- 🔨 [TAP Upgrades](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/tap_upgrades.md) - Replace the plastic TAP mount with a metal CNC part
- 🥇 [TAP Alternatives](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/tap_alternatives.md) - Upgrade to an entirely different bed mesh sensor
- 🙂 [Alternative Build Plates](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/build_plates.md) - Explore different print surfaces
- 🙂 [Chamber Fans and Filters](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/chamber_fans.md) - Upgrade VOC filtering, higher chamber temperatures
- 🔨 [Chamber Lighting](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/chamber_lighting.md) - Improve the lighting for better visibility, timelapse videos, etc.
- 🥇 [Multi-material and Multi-Color Options](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/mmu_options.md) - Print with a mix of colors and materials at the same time
- 🥇 [Toppers](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/toppers.md) - Increase the top height or add mounting points for other accessories
- 🙂 [Advanced Calibration](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/advanced_calibration.md) - For when you want that extra bit of performance
- 🙂 [Klipper TMC Auto Tune](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_2/klipper_tmc_auto_tune.md) - Let's quiet things down a little
  
## 🥇 Level Three - More Speed!  
Once everything is up and running smoothly, your gaze will quickly turn toward faster print speeds. No end to the available options here. Let's have a look at some of the most popular and effective options in these categories.

- 🥇 [CAN Bus](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_3/canbus.md) - Greatly simplify the wiring in your printer
- 🥇 [Umbilicals](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_3/umbilicals.md) - A different cable path option
- 🥇 [Extruders](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_3/extruders.md) - Simpler - Lighter - Stronger - Lots of options
- 🔨 [Hotends](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_3/hotends.md) - Increased filament flow is the primary objective here
- 🔨 [Cooling](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_3/cooling.md) - High-speed printing often calls for high-speed cooling
- 🥇 [Controller Boards](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_3/controllers.md) - No shortage of options here
- 🥇 [Computer Boards](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_3/computer.md) - When your printer needs to do a little more than just print

## ⏰ Routine Maintenance
As complex as they are, 3D printers do require some amount of ongoing routine maintenance. Both in terms of software/firmware, as well as hardware - physical maintenance. How much maintenance depends largely on how much printing is going on. But even printers sitting idle will need maintenance - perhaps even more than if they are used regularly. 

- [Notifications](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_m/notifications.md) - Items that need your immediate attention
- [Between Every Print](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_m/every_print.md) - Good habits will save a lot of trouble down the road
- [Weekly Maintenance (Every 100 Print Hours)](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_m/weekly.md) - Or every 100 print hours
- [Monthly Maintenance (Every 500 Print Hours)](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_m/monthly.md) - Or every 500 print hours
- [Seasonal Maintenace (Every 2,000 Print Hours)](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_m/seasonal.md) - Or every 2,000 print hours

## 🪛 Configuration Quick Reference
Configuration items are typically defined in the printer.cfg file. Be careful with these customizations as the hardware in your printer may be very different than what is assumed here. Note that any changes to Klipper's printer.cfg file will require a reboot to take effect.
- printer.cfg [[probe]](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/probe.md) - Voron TAP optimizations
- printer.cfg [[quad_gantry_level]](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/qgl.md) - Improve the QGL process
- printer.cfg [Stock Troodon printer.cfg 1.2/2023-02-09](https://github.com/YGK3D/Troodon-2-Klipper/blob/main/Troodon2-Klipper-YGK3D-v1_2-printer.cfg) - Roll back to the starting point if things get messed up
    
## ✂️ Macros Quick Reference
Macros are typically defined in the printer.cfg file and these macros in particular are probably already present. Be sure to comment out any existing macro while testing changes, so you can revert back to the prior version if you encounter any problems.
- [PRINT_START](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/PRINT_START.md) - Runs whenever a new print job is sent to the printer
- [PRINT_CANCEL](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/PRINT_CANCEL.md) - Runs whenever a new print job is canceled, manually or otherwise
- [TIMER](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/TIMER.md) - Adds support for adding timers to other macros, particularly to PRINT_START

## :sword Slicers Quick Reference
Popular slicer software like Orca will generally work pretty well out of the box, as it comes with presets for a vast array of printers, including Troodon printers. Always room for improvement though.
- [Orca](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/orca.md) - Check that Klipper is being supplied with as much information as it can

## 🪚 Scripts Quick Reference
Typically these would be installed in ~/scripts on the BTT-CB1 or Raspberry Pi or wherever Klipper is running. Some of the scripts are intended for use with the [gcode_shell_command](https://github.com/dw-0/kiauh/blob/master/docs/gcode_shell_command.md) extension that can be very easily installed using [KIAUH](https://github.com/dw-0/kiauh). As its name implies, this extension allows for running Linux shell commands directly as gcode commands within, for example, printer.cfg. Rather useful. Note that most interfaces to the Klipper log allow you to filter entries, which comes in handy here in particular. 
Note also that Linux scripts can be written in multiple languages, but most commonly Bash and Python in this environment.

- ### [Time and Timer Shell Scripts](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_s/time_timer.md)
  - [get_current_datetime.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/get_current_datetime.sh) - Output the current date/time in Klipper logs in ISO8601 format
  - [log_current_datetime.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/log_current_datetime.sh) - Start a timer within Klipper
  - [get_elapsed_time.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/get_elapsed_time.sh) - Show the elapsed time 

## 💣 Experimental Projects
And something for the brave souls who made it to the end of the page. Stuff that isn't ready for primetime but may still be useful. The usual disclaimers apply - enter at your own risk, here be dragons, not for the squeamish, etc., etc. 
- [Philement/carbon](https://github.com/500Foods/Philement/blob/main/elements/006-carbon/README.md) - On-device print failure monitoring using Timelapse images
  
## 📏 Repository Information 
[![Count Lines of Code](https://github.com/500Foods/WelcomeToTroodon/actions/workflows/main.yml/badge.svg)](https://github.com/500Foods/WelcomeToTroodon/actions/workflows/main.yml)
<!--CLOC-START -->
```
Last updated at 2024-06-20 15:18:02 UTC
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Markdown                        84            312              2           1197
YAML                             1              8             13             33
Bourne Shell                     4              6             39             19
-------------------------------------------------------------------------------
SUM:                            89            326             54           1249
-------------------------------------------------------------------------------
2 Files (without source code) were skipped
```
<!--CLOC-END-->

Use Control + Shift + m to toggle the tab key moving focus. Alternatively, use esc then tab to move to the next interactive element on the page.
Attach files by dragging & dropping, selecting or pasting them.
Editing WelcomeToTroodon/README.md at main · 500Foods/WelcomeToTroodon
 

# 🪛 Quick Reference - Configuration
Configuration items are typically defined in the printer.cfg file. Be careful with these customizations as the hardware in your printer may be very different than what is assumed here. 

***Note: Any changes to Klipper's printer.cfg file will require a reboot to take effect.***

***Note: Before copying and replacing large sections of a printer.cfg file, be mindful that there is typically a printer-specific serial number appearing near the beginning of the file. 
This is tied to the serial number of the MCU board (an Octopus F407 board in the case of the Troodon 2.0 Pro). Be careful not to overwrite that line.***

- printer.cfg [[exclude_object]](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/exclude_object.md) - Enable option for excluding failed objects from the currently running print job
- printer.cfg [[gcode_arcs]](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/gcode_arcs.md) - Enable support for G2/G3 G-Code commands
- printer.cfg [[probe]](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/probe.md) - Voron TAP optimizations
- printer.cfg [[quad_gantry_level]](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/qgl.md) - Improve the QGL process
- printer.cfg [[fan]](https://github.com/500Foods/WelcomeToTroodon/blob/main/configs/fans.md) - View more fan data, control fans directly

## Troodon Configurations from Discord #troodon_2 users
- [@Don_Duce](https://github.com/donduce/Troodon-2.0-Pro-350mm) - Clean setup, with macros.cfg separated out, suitable for stock Troodon 2.0 Pro with SB + TAP

## Stock Configuration Files
- [Stock Troodon printer.cfg](https://github.com/YGK3D/Troodon-2-Klipper/blob/main/Troodon2-Klipper-YGK3D-v1_2-printer.cfg) - Version 1.2 Released 02/09/23 (before TAP was added to stock)
- [Stock Troodon printer.cfg - 2024 Edition](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/original_troodon_2.0_pro_with_tap_printer.cfg) - This is the version shipped with CNC TAP machines
#
Next: [Quick Reference - Macros](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/macros.md)

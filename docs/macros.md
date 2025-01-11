# ✂️ Quick Reference - Macros
Macros are typically defined in the printer.cfg file. Some of these macros may already present - particularly PRINT_START and PRINT_END. Be sure to comment out any existing macro while testing changes, so you can revert back to the prior version if you encounter any problems.
- [HEAT_SOAK](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/HEAT_SOAK.md) - Heat soak the printer for more consistent prints
- [LIGHTS_TOGGLE](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/LIGHTS_TOGGLE.md) - Turn the main chamber light on or off via a macro or a KlipperScreen button
- [PRINT_START](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/PRINT_START.md) - Runs whenever a new print job is sent to the printer
- [PRINT_CANCEL](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/PRINT_CANCEL.md) - Runs whenever a new print job is canceled, manually or otherwise
- [TIMER](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/TIMER.md) - Adds support for adding timers to other macros, particularly to PRINT_START
- [TEMPS](https://github.com/500Foods/WelcomeToTroodon/blob/main/macros/TEMPS.md) - Change how Klipper monitors temperatures to more of a "temp reached" rather than "temp stable" mode

# 🪚 Scripts Quick Reference
Typically these would be installed in ~/scripts on the BTT-CB1 or Raspberry Pi or wherever Klipper is running. Some of the scripts are intended for use with the [gcode_shell_command](https://github.com/dw-0/kiauh/blob/master/docs/gcode_shell_command.md) extension that can be very easily installed using [KIAUH](https://github.com/dw-0/kiauh). As its name implies, this extension allows for running Linux shell commands directly as gcode commands within, for example, printer.cfg. Rather useful. Note that most interfaces to the Klipper log allow you to filter entries, which comes in handy here in particular. 
Note also that Linux scripts can be written in multiple languages, but most commonly Bash and Python in this environment.

- ### [Time and Timer Shell Scripts](https://github.com/500Foods/WelcomeToTroodon/blob/main/docs/level_s/time_timer.md)
  - [get_current_datetime.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/get_current_datetime.sh) - Output the current date/time in Klipper logs in ISO8601 format
  - [log_current_datetime.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/log_current_datetime.sh) - Start a timer within Klipper
  - [get_elapsed_time.sh](https://github.com/500Foods/WelcomeToTroodon/blob/main/scripts/get_elapsed_time.sh) - Show the elapsed time 

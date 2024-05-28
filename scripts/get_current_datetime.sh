#!/usr/bin/bash
#
# get_current_datetime.sh
#
# Returns the current date/time in ISO8601 format.
# This is intended to be run from Klipper via the gcode_shell_command
# extension, which can be installed using KIAUH.

echo "Current Date/Time:" `date +"%Y-%m-%dT%H:%M:%S%z"`

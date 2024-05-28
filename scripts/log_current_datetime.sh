#!/usr/bin/bash
#
# log_current_datetime.sh {IDENTIFIER}
#
# This logs the current Linux epoch time (number of seconds since
# January 1, 1970) into a tmp file indicated by the parameter.
# This can then be referenced later get_elapsed.time.sh script
# which will read in this value and calculate the differenced between
# this stored time and the current time.
#
# The parameter is used to help with supporting multiple concurrent
# such timers.
#
# This is intended to be run from Klipper via the gcode_shell_command
# extension, which can be installed using KIAUH.

echo $EPOCHSECONDS > /tmp/klipper-$1-epochtime.tmp

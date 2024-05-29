#!/usr/bin/bash
#
# get_elapsed_time.sh {IDENTIFIER}
#
# This reads in a previously stored time and compares it to the current
# time to determine the number of seconds elapsed. This is then output in
# a nice format to show, for example, 5m 14s instead of just a number.
#
# This is used in combination with th log_current_datetime.sh script
# which creates the file that this script ultimately reads.
#
# The parameter is used to help with supporting multiple concurrent
# such timers.
#
# This is intended to be run from Klipper via the gcode_shell_command
# extension, which can be installed using KIAUH.

now=`echo $EPOCHSECONDS`
then=`cat /tmp/klipper-$1-epochtime.tmp`
timediff=$(($now-$then))
echo "$1 Elapsed Time: " `date -ud @${timediff} +"$(( seconds/3600/24 ))d %-Hh %-Mm %-Ss" | sed -E 's/\b0(s|m|h|d) ?//g; s/ +$//; s/^$/0s/'`

# To record these values indefinitely, enable this command
echo `date +"%Y-%m-%dT%H:%M:%S%z"` "$1 Elapsed Time: " `date -ud @${timediff} +"$(( seconds/3600/24 ))d %-Hh %-Mm %-Ss" | sed -E 's/\b0(s|m|h|d) ?//g; s/ +$//; s/^$/0s/'` >> ~/printer_data/logs/timers.log

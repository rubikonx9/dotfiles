#!/bin/bash

# Always available'
echo 'export MONITOR_LAPTOP=eDP1'
echo 'export MONITOR_EDID_LAPTOP=E43003FC00000000'

# If at home'
echo 'export MONITOR_RIGHT=DP2'
echo 'export MONITOR_EDID_RIGHT=TODO'

# If in the office'
echo 'export MONITOR_LEFT=DP2'
echo 'export MONITOR_EDID_LEFT=B31A085100005BC5'

# If in the office'
echo 'export MONITOR_MIDDLE=DP3'
echo 'export MONITOR_EDID_MIDDLE=B31A085100036C14'

echo 'export MONITORS_COUNT_STANDALONE=1'
echo 'export MONITORS_COUNT_AT_HOME=2'
echo 'export MONITORS_COUNT_IN_THE_OFFICE=3'

MONITORS=($(xrandr | perl -ne 'print "$1 " if $_ =~ m/ (\S+) \s+ connected/xms'))
MONITORS_COUNT=${#MONITORS[*]}

echo "export MONITORS=(${MONITORS[*]})"
echo "export MONITORS_COUNT=($MONITORS_COUNT)"

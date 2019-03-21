#!/bin/bash

echo 'export MONITOR_LAPTOP=eDP1' # Always available'
echo 'export MONITOR_RIGHT=DP2'   # If at home'
echo 'export MONITOR_LEFT=DP2'    # If in the office'
echo 'export MONITOR_MIDDLE=DP3'  # If in the office'

echo 'export MONITORS_COUNT_STANDALONE=1'
echo 'export MONITORS_COUNT_AT_HOME=2'
echo 'export MONITORS_COUNT_IN_THE_OFFICE=3'

echo 'export MONITORS=$(xrandr --listmonitors | pcregrep "\d+:" | awk "{ print \$NF }")'
echo 'export MONITORS_COUNT=$(echo "${MONITORS}" | wc -l)'

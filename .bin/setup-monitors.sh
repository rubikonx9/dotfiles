#!/bin/bash

eval "$(monitors)"

sleep 1

case "${MONITORS_COUNT}" in
    "${MONITORS_COUNT_STANDALONE}")
        echo "Switching to 1-monitor mode... (only laptop)"
        xrandr --output "$MONITOR_LEFT"   --off
        xrandr --output "$MONITOR_MIDDLE" --off
        xrandr --output "$MONITOR_RIGHT"  --off
        xrandr --output "$MONITOR_LAPTOP" --mode 1600x900 --primary
    ;;

    "${MONITORS_COUNT_AT_HOME}")
        echo "Switching to 2-monitor mode... (home)"

        xrandr --output "$MONITOR_LEFT"   --off
        xrandr --output "$MONITOR_MIDDLE" --off
        xrandr --output "$MONITOR_LAPTOP" --mode 1600x900
        xrandr --output "$MONITOR_RIGHT"  --mode 1920x1080 --primary --right-of "$MONITOR_LAPTOP"
    ;;

    "${MONITORS_COUNT_IN_THE_OFFICE}")
        echo "Switching to 3-monitor mode... (office)"

        xrandr --output "$MONITOR_RIGHT"  --off
        xrandr --output "$MONITOR_LEFT"   --mode 1920x1080
        xrandr --output "$MONITOR_MIDDLE" --mode 1920x1080 --right-of "$MONITOR_LEFT" --primary
        xrandr --output "$MONITOR_LAPTOP" --mode 1600x900  --right-of "$MONITOR_MIDDLE"
    ;;

    *) # Fallback
        echo "Switching to 1-monitor mode... (fallback)"

        xrandr --output "$MONITOR_LAPTOP" --mode 1600x900 --primary
        xrandr --output "$MONITOR_LEFT"   --off
        xrandr --output "$MONITOR_MIDDLE" --off
        xrandr --output "$MONITOR_RIGHT"  --off
    ;;
esac

sleep 3

polybar-launch

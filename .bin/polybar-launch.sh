#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do
    sleep 1;
done

eval "$(monitors)"

case "${MONITORS_COUNT}" in
    $MONITORS_COUNT_STANDALONE)
        MONITOR=$MONITOR_LAPTOP polybar base-with-tray &
    ;;

    $MONITORS_COUNT_AT_HOME)
        MONITOR=$MONITOR_RIGHT  polybar base-with-tray &
        MONITOR=$MONITOR_LAPTOP polybar base           &
    ;;

    $MONITORS_COUNT_IN_THE_OFFICE)
        MONITOR=$MONITOR_LEFT   polybar base           &
        MONITOR=$MONITOR_MIDDLE polybar base-with-tray &
        MONITOR=$MONITOR_LAPTOP polybar base           &
    ;;

    *) # Fallback
        MONITOR=$MONITOR_LAPTOP polybar base-with-tray &
    ;;
esac

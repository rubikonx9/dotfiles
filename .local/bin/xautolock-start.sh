#!/bin/bash

if pgrep --exact xautolock > /dev/null; then
    dunstify "Locker already running";
else
    xautolock -locker i3lock-multimonitor-wrapper -time 3 -killtime 10 -killer "xset dpms force off" &
fi

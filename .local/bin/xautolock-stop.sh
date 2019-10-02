#!/bin/bash

if pgrep --exact xautolock > /dev/null; then
    killall xautolock;
else
    dunstify "Locker not running";
fi

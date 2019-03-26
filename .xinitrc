#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb -merge "$HOME/.Xresources"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setup-monitors
nitrogen --restore
xautolock -locker i3lock-multimonitor-wrapper -time 3 -killtime 10 -killer "xset dpms force off" &

exec i3

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
xautolock-start

exec i3

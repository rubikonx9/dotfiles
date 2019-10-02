#!/bin/bash

LABEL_CANCEL=" Cancel"
LABEL_RESTART_POLYBAR=" Restart Polybar"
LABEL_RESTART_I3=" Restart i3"
LABEL_EXIT_I3=" Exit i3"
LABEL_SETUP_MONITORS_AUTO=" Setup monitors automatically"
LABEL_SETUP_MONITORS_MANUAL=" Setup monitors manually"
LABEL_DISABLE_SCREEN_LOCK=" Disable lock screen"
LABEL_ENABLE_SCREEN_LOCK=" Enable lock screen"
LABEL_LOCK=" Lock screen"
LABEL_SUSPEND=" Suspend"
LABEL_REBOOT=" Reboot"
LABEL_POWEROFF=" Poweroff"

ACTION=$( (echo "${LABEL_CANCEL}"                \
        && echo "${LABEL_SETUP_MONITORS_AUTO}"   \
        && echo "${LABEL_SETUP_MONITORS_MANUAL}" \
        && echo "${LABEL_DISABLE_SCREEN_LOCK}"   \
        && echo "${LABEL_ENABLE_SCREEN_LOCK}"    \
        && echo "${LABEL_RESTART_POLYBAR}"       \
        && echo "${LABEL_RESTART_I3}"            \
        && echo "${LABEL_EXIT_I3}"               \
        && echo "${LABEL_LOCK}"                  \
        && echo "${LABEL_POWEROFF}"              \
        && echo "${LABEL_REBOOT}"                \
        && echo "${LABEL_SUSPEND}") | rofi -dmenu -p "Power menu" -matching fuzzy -no-custom)

case "${ACTION}" in
    $LABEL_CANCEL)
        ;;
    $LABEL_LOCK)
        xautolock -locknow || dunstify "Locker not running"
        ;;
    $LABEL_RESTART_I3)
        i3-msg restart
        ;;
    $LABEL_EXIT_I3)
        i3-msg exit
        ;;
    $LABEL_SETUP_MONITORS_AUTO)
        setup-monitors
        ;;
    $LABEL_DISABLE_SCREEN_LOCK)
        xautolock-stop
        ;;
    $LABEL_ENABLE_SCREEN_LOCK)
        xautolock-start
        ;;
    $LABEL_SETUP_MONITORS_MANUAL)
        arandr
        ;;
    $LABEL_RESTART_POLYBAR)
        polybar-launch
        ;;
    $LABEL_SUSPEND)
        xautolock -locknow && systemctl suspend
        ;;
    $LABEL_REBOOT)
        systemctl reboot
        ;;
    $LABEL_POWEROFF)
        systemctl poweroff
        ;;
esac

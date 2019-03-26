#!/bin/bash

LABEL_LOCK=" Lock"
LABEL_SUSPEND=" Suspend"
LABEL_REBOOT=" Reboot"
LABEL_POWEROFF=" Poweroff"

ACTION=$( (echo "${LABEL_LOCK}"    \
        && echo "${LABEL_SUSPEND}" \
        && echo "${LABEL_REBOOT}"  \
        && echo "${LABEL_POWEROFF}") | rofi -dmenu -p "Power management" -matching fuzzy -no-custom)

case "${ACTION}" in
    $LABEL_LOCK)
        xautolock -locknow
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

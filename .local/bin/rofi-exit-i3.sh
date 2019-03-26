#!/bin/bash

LABEL_CANCEL=" Cancel"
LABEL_EXIT=" Exit"

ACTION=$( (echo "${LABEL_CANCEL}" \
        && echo "${LABEL_EXIT}") | rofi -dmenu -p "Exit i3" -matching fuzzy -no-custom)

case "${ACTION}" in
    $LABEL_CANCEL)
        ;;
    $LABEL_EXIT)
        i3-msg exit
        ;;
esac

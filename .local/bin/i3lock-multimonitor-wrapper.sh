#!/bin/bash

exec i3lock-multimonitor -i "${HOME}/.local/wallpaper.jpg" -a "\
    --nofork --ignore-empty-password --indicator \
    --insidevercolor=00000055 --insidewrongcolor=00000055 --insidecolor=00000055 \
    --ringvercolor=337d00ff --ringwrongcolor=7d3300ff --ringcolor=337d00ff \
    --linecolor=00000055 \
    --locktext=... --veriftext=Hmm... --wrongtext=Wrong! --noinputtext="

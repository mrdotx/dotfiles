#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# Path:     ~/.config/polybar/gesturestoggle.sh
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles

if [ "$(pgrep -f /usr/bin/libinput-gestures)" ]
then
        libinput-gestures-setup stop && notify-send "LibInput" "LibInput Gestures stopped!" && exit 0
else
        libinput-gestures-setup start >/dev/null 2>&1 & notify-send "LibInput" "LibInput Gestures started!" && exit 0
fi

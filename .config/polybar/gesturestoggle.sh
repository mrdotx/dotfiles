#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/gesturestoggle.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-03 17:54:20

if [ "$(pgrep -f /usr/bin/libinput-gestures)" ]
then
        libinput-gestures-setup stop && notify-send "LibInput" "LibInput Gestures stopped!" && exit 0
else
        libinput-gestures-setup start >/dev/null 2>&1 & notify-send "LibInput" "LibInput Gestures started!" && exit 0
fi

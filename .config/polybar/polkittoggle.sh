#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# Path:     ~/.config/polybar/polkittoggle.sh
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles

if [ "$(pgrep -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1)" ]
then
        killall /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 && notify-send "Polkit" "Gnome Authentication Agent stopped!" && exit 0
else
        /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1 & notify-send "Polkit" "Gnome Authentication Agent started!" && exit 0
fi

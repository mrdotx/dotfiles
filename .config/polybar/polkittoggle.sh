#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/polkittoggle.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-17 13:52:19

if [ "$(pgrep -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1)" ]
then
        killall /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 && notify-send -i "$HOME/.config/polybar/icons/polkit.png" "Polkit" "Gnome Authentication Agent stopped!" && exit 0
else
        /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1 & notify-send -i "$HOME/.config/polybar/icons/polkit.png" "Polkit" "Gnome Authentication Agent started!" && exit 0
fi

#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# Path:     ~/.config/polybar/polkit.sh
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles

if [ "$(pgrep -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1)" ]
then
	echo "%{F#dfdfdf}%{o#00ff00}%{o-}%{F-}"
else
	echo "%{F#dfdfdf}%{o#ff0000}%{o-}%{F-}"
fi

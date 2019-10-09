#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# Path:     ~/.config/polybar/gestures.sh
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles

if [ "$(pgrep -f /usr/bin/libinput-gestures)" ]
then
	echo "%{F#dfdfdf}%{o#00ff00}%{o-}%{F-}"
else
	echo "%{F#dfdfdf}%{o#ff0000}%{o-}%{F-}"
fi

#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/gestures.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-12 21:22:19

if [ "$(pgrep -f /usr/bin/libinput-gestures)" ]
then
	echo "%{F#dfdfdf}%{o#00b200}%{o-}%{F-}"
else
	echo "%{F#dfdfdf}%{o#ff5555}%{o-}%{F-}"
fi

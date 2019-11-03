#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/bluetooth.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-03 17:53:15

if [ "$(systemctl is-active bluetooth.service)" = "active" ]
then
	echo "%{F#dfdfdf}%{o#00ff00}%{o-}%{F-}"
else
	echo "%{F#dfdfdf}%{o#ff0000}%{o-}%{F-}"
fi

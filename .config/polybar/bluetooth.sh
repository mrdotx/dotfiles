#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/bluetooth.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-12 21:21:28

if [ "$(systemctl is-active bluetooth.service)" = "active" ]
then
	echo "%{F#dfdfdf}%{o#00b200}%{o-}%{F-}"
else
	echo "%{F#dfdfdf}%{o#ff5555}%{o-}%{F-}"
fi

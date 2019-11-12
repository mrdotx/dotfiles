#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/printer.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-12 21:22:42

if [ "$(systemctl is-active org.cups.cupsd.service)" = "active" ]
then
	echo "%{F#dfdfdf}%{o#00b200}%{o-}%{F-}"
else
	echo "%{F#dfdfdf}%{o#ff5555}%{o-}%{F-}"
fi

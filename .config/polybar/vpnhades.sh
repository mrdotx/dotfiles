#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/vpnhades.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-12 21:23:06

VPN=hades

if [ "$(nmcli connection show --active $VPN)" ]
then
	echo "%{F#dfdfdf}%{o#00b200}%{o-}%{F-}"
else
	echo "%{F#dfdfdf}%{o#ff5555}%{o-}%{F-}"
fi

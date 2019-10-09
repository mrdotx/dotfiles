#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# Path:     ~/.config/polybar/vpnhades.sh
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles
VPN=hades
if [ "$(nmcli connection show --active $VPN)" ]
then
	echo "%{F#dfdfdf}%{o#00ff00}%{o-}%{F-}"
else
	echo "%{F#dfdfdf}%{o#ff0000}%{o-}%{F-}"
fi

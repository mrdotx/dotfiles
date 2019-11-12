#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/vpnhadestoggle.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-12 22:23:57

vpnname=hades

if [ "$(nmcli connection show --active $vpnname)" ]
then
        nmcli con down id $vpnname && notify-send "VPN" "$vpnname disconnected!" && exit 0
else
        nmcli con up id $vpnname passwd-file "$HOME"/coding/hidden/vpn/$vpnname && notify-send "VPN" "$vpnname connected!" && exit 0
fi

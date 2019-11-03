#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/vpnhadestoggle.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-03 17:55:41

VPN=hades

if [ "$(nmcli connection show --active $VPN)" ]
then
        nmcli con down id $VPN && notify-send "VPN" "$VPN disconnected!" && exit 0
else
        nmcli con up id $VPN passwd-file "$HOME"/coding/secrets/vpn/$VPN && notify-send "VPN" "$VPN connected!" && exit 0
fi

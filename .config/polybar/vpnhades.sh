#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/vpnhades.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-20 12:54:03

vpnname=hades

case "$1" in
    --polybar)
        if [ "$(nmcli connection show --active $vpnname)" ]
        then
        	echo "%{F#dfdfdf}%{o#00b200}%{o-}%{F-}"
        else
        	echo "%{F#dfdfdf}%{o#ff5555}%{o-}%{F-}"
        fi
        ;;
    *)
        if [ "$(nmcli connection show --active $vpnname)" ]
        then
                nmcli con down id $vpnname && \
                    notify-send -i "$HOME/.config/polybar/icons/vpn.png" "VPN" "$vpnname disconnected!" && \
                    exit 0
        else
                nmcli con up id $vpnname passwd-file "$HOME"/coding/hidden/vpn/$vpnname && \
                    notify-send -i "$HOME/.config/polybar/icons/vpn.png" "VPN" "$vpnname connected!" && \
                    exit 0
        fi
        ;;
esac

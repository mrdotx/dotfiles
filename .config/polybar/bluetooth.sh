#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/bluetooth.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-20 12:06:23

case "$1" in
    --polybar)
        if [ "$(systemctl is-active bluetooth.service)" = "active" ]
        then
        	echo "%{F#dfdfdf}%{o#00b200}%{o-}%{F-}"
        else
        	echo "%{F#dfdfdf}%{o#ff5555}%{o-}%{F-}"
        fi
        ;;
    *)
        if [ "$(systemctl is-active bluetooth.service)" != "active" ]
        then
                sudo -A systemctl start bluetooth.service && \
                    sudo -A systemctl start bluetooth.target && \
                    sudo -A systemctl start ModemManager.service && \
                    notify-send -i "$HOME/.config/polybar/icons/bluetooth.png" "Service" "Bluetooth and ModemManager started!" && \
                    exit 0
        else
                sudo -A systemctl stop bluetooth.service && \
                    sudo -A systemctl stop bluetooth.target && \
                    sudo -A systemctl stop ModemManager.service && \
                    notify-send -i "$HOME/.config/polybar/icons/bluetooth.png" "Service" "Bluetooth and ModemManager stopped!" && \
                    exit 0
        fi
        ;;
esac

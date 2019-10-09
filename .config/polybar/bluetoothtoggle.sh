#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# Path:     ~/.config/polybar/bluetoothtoggle.sh
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles

if [ "$(systemctl is-active bluetooth.service)" != "active" ]
then
        sudo -A systemctl start bluetooth.service && sudo -A systemctl start bluetooth.target && sudo -A systemctl start ModemManager.service && notify-send "Service" "Bluetooth and ModemManager started!" && exit 0
else
        sudo -A systemctl stop bluetooth.service && sudo -A systemctl stop bluetooth.target && sudo -A systemctl stop ModemManager.service && notify-send "Service" "Bluetooth and ModemManager stopped!" && exit 0
fi

#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# Path:     ~/.config/polybar/firewalltoggle.sh
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles

if [ "$(systemctl is-active ufw.service)" != "active" ]
then
        sudo -A systemctl start ufw.service && notify-send "Service" "Firewall started!" && exit 0
else
        sudo -A systemctl stop ufw.service && notify-send "Service" "Firewall stopped!" && exit 0
fi

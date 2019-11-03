#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/printertoggle.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-03 17:54:45

if [ "$(systemctl is-active org.cups.cupsd.service)" != "active" ]
then
        sudo -A systemctl start org.cups.cupsd.service && sudo -A systemctl start avahi-daemon.service && sudo -A systemctl start avahi-daemon.socket && notify-send "Service" "Printer and Avahi started!" && exit 0
else
        sudo -A systemctl stop org.cups.cupsd.service && sudo -A systemctl stop avahi-daemon.service && sudo -A systemctl stop avahi-daemon.socket && notify-send "Service" "Printer and Avahi stopped!" && exit 0
fi

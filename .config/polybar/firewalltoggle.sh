#!/bin/bash
# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.config/polybar/firewalltoggle.sh
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-17 13:51:09

if [ "$(systemctl is-active ufw.service)" != "active" ]
then
        sudo -A systemctl start ufw.service && notify-send -i "$HOME/.config/polybar/icons/firewall.png" "Service" "Firewall started!" && exit 0
else
        sudo -A systemctl stop ufw.service && notify-send -i "$HOME/.config/polybar/icons/firewall.png" "Service" "Firewall stopped!" && exit 0
fi

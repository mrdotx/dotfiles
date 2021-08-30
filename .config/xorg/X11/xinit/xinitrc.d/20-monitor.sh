#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/xorg/X11/xinit/xinitrc.d/20-monitor.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-08-30T20:36:51+0200

 xrandr | grep "HDMI2 connected" \
    && xrandr \
        --output "HDMI2" \
        --primary \
        --output "eDP1" \
        --right-of "HDMI2"

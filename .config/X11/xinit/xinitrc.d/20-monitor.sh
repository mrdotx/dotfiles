#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/20-monitor.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-11-22T11:10:06+0100

 xrandr | grep "HDMI2 connected" \
    && xrandr \
        --output "HDMI2" \
        --primary \
        --output "eDP1" \
        --right-of "HDMI2"

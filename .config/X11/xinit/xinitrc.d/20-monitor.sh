#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/20-monitor.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2022-02-09T21:25:05+0100

xrandr | grep "DisplayPort-0 disconnected" \
    && xrandr \
        --output "HDMI-A-0" \
        --primary \
        --output "DisplayPort-0" \
        --right-of "HDMI-A-0"

xrandr | grep "HDMI2 connected" \
    && xrandr \
        --output "HDMI2" \
        --primary \
        --output "eDP1" \
        --right-of "HDMI2"

#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/20-monitor.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2024-02-03T18:40:36+0100

xrandr | grep -q "DisplayPort-0 connected" \
    && xrandr \
        --output "DisplayPort-0" --primary \
        --output "HDMI-A-0" --above "DisplayPort-0"

xrandr | grep -q "HDMI2 connected" \
    && xrandr \
        --output "HDMI2" --primary \
        --output "eDP1" --right-of "HDMI2"

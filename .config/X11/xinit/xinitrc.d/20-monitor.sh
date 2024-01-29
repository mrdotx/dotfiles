#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/20-monitor.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2024-01-29T15:40:31+0100

xrandr | grep "DisplayPort-0 connected" \
    && xrandr \
        --output "DisplayPort-0" --primary \
        --mode "1920x1080" \
        --pos "0x1080" \
        --rotate "normal" \
        --output "HDMI-A-0" \
        --mode "1920x1080" \
        --pos "0x0" \

xrandr | grep "HDMI2 connected" \
    && xrandr \
        --output "HDMI2" --primary \
        --mode "1920x1080" \
        --pos "0x0" \
        --rotate "normal" \
        --output "eDP1" \
        --right-of "HDMI2"

#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/20-monitor.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2022-03-06T17:11:34+0100

xrandr | grep "DisplayPort-0 connected" \
    && xrandr \
        --output "DisplayPort-0" --primary \
        --mode "1920x1080" \
        --pos "0x780" \
        --rotate "normal" \
        --output "HDMI-A-0" \
        --mode "1920x1080" \
        --pos "1920x0" \
        --rotate "left"

xrandr | grep "HDMI2 connected" \
    && xrandr \
        --output "HDMI2" --primary \
        --mode "1920x1080" \
        --pos "0x0" \
        --rotate "normal" \
        --output "eDP1" \
        --right-of "HDMI2"

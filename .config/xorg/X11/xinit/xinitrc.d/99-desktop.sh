#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/xorg/X11/xinit/xinitrc.d/99-desktop.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-08-30T18:13:35+0200

 xrandr | grep "HDMI2 connected" \
    && xrandr \
        --output "HDMI2" \
        --primary \
        --output "eDP1" \
        --right-of "HDMI2"

command -v wallpaper.sh > /dev/null 2>&1 \
    && wallpaper.sh &

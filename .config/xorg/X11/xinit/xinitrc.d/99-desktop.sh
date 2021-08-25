#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/xorg/X11/xinit/xinitrc.d/99-desktop.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-08-25T12:18:44+0200

command -v screenlayout.sh > /dev/null 2>&1 \
    && screenlayout.sh &

command -v wallpaper.sh > /dev/null 2>&1 \
    && wallpaper.sh &

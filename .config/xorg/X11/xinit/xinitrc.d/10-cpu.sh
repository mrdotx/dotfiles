#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/xorg/X11/xinit/xinitrc.d/10-cpu.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-08-25T12:11:56+0200

command -v cpu_policy.sh > /dev/null 2>&1 \
    && cpu_policy.sh --performance

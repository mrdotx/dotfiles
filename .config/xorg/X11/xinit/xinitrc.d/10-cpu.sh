#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/xorg/X11/xinit/xinitrc.d/10-cpu.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-08-30T20:04:13+0200

command -v cpufreqctl > /dev/null 2>&1 \
    && $EXEC_AS_USER cpufreqctl --governor --set=performance \
    && $EXEC_AS_USER cpufreqctl --epp --set=performance

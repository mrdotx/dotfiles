#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/10-cpu.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-11-22T11:09:59+0100

command -v cpufreqctl > /dev/null 2>&1 \
    && $EXEC_AS_USER cpufreqctl --governor --set=performance \
    && $EXEC_AS_USER cpufreqctl --epp --set=performance

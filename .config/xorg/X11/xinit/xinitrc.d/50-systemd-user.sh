#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/xorg/X11/xinit/xinitrc.d/50-systemd-user.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-08-25T12:19:56+0200

systemctl --user import-environment DISPLAY XAUTHORITY

command -v dbus-update-activation-environment >/dev/null 2>&1 \
    && dbus-update-activation-environment DISPLAY XAUTHORITY

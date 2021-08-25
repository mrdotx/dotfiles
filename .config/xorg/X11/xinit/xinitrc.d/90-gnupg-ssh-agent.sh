#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/xorg/X11/xinit/xinitrc.d/90-gnupg-ssh-agent.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-08-25T11:12:20+0200

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    export SSH_AUTH_SOCK
fi

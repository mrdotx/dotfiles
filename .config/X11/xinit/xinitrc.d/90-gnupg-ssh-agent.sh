#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/90-gnupg-ssh-agent.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-11-22T11:10:14+0100

unset SSH_AGENT_PID
[ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ] \
    && SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)" \
    && export SSH_AUTH_SOCK

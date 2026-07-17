#!/bin/sh

# path:   /home/klassiker/Projects/repos/dotfiles/.config/X11/xinit/xinitrc.d/90-gnupg-ssh-agent.sh
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/dotfiles
# date:   2026-07-17T02:35:23+0200

unset SSH_AGENT_PID
[ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ] \
    && SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)" \
    && export SSH_AUTH_SOCK

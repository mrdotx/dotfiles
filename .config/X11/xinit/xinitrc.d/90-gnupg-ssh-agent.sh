#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/X11/xinit/xinitrc.d/90-gnupg-ssh-agent.sh
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/dotfiles
# date:   2025-08-05T05:42:15+0200

unset SSH_AGENT_PID
[ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ] \
    && SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)" \
    && export SSH_AUTH_SOCK

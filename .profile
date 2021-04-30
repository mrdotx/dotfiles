# shellcheck shell=bash

# path:   /home/klassiker/.local/share/repos/dotfiles/.profile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-04-30T08:55:31+0200

# history (same functionality as zsh)
export HISTFILE="$HOME/.local/share/cmd_history" \
    HISTSIZE=10000 \
    HISTFILESIZE=5000 \
    HISTCONTROL=ignoreboth

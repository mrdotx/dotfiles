# path:   /home/klassiker/.local/share/repos/dotfiles/.bashrc
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/dotfiles
# date:   2026-02-28T05:25:45+0100

# if shell is not running interactive, break up
tty -s \
    || return

# history (same functionality as zsh)
# show command with history expansion to user before running it
shopt -s histverify
# add commands to HISTFILE when shell exits
shopt -s histappend
# ignore command line that start with a space
# ignore command line if it is identical to the previous one
# older duplicate command lines are removed when saving
export \
    HISTCONTROL=ignorespace:ignoredups:erasedups \
    HISTFILE="$HOME/.local/share/cmd_history" \
    HISTSIZE=2000 \
    HISTFILESIZE=20000

# functions and aliases
[ -f "$HOME/.config/functions" ] \
    && . "$HOME/.config/functions"
[ -f "$HOME/.config/aliases" ] \
    && . "$HOME/.config/aliases"

# prompt
[ "$(id -u)" -eq 0 ] \
    && PS1='\[\e[1;31m\][\[\e[0;97m\]\w\[\e[1;31m\]]\e[0;97m\]\$\[\e[0m\] ' \
    || PS1='\[\e[1;34m\][\[\e[0;97m\]\w\[\e[1;34m\]]\e[0;97m\]\$\[\e[0m\] '

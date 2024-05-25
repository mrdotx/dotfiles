# path:   /home/klassiker/.local/share/repos/dotfiles/.bashrc
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2024-05-24T23:15:58+0200

# if shell is not running interactive, break up
tty -s \
    || return

# SIGWINCH
# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# history (same functionality as zsh)
shopt -s histverify # show command with history expansion to user before running it
shopt -s histappend # add commands to HISTFILE in order of execution
export \
    HISTFILE="$HOME/.local/share/cmd_history" \
    HISTSIZE=10000 \
    HISTFILESIZE=5000 \
    HISTCONTROL=ignoreboth

# functions and aliases
[ -f "$HOME/.config/functions" ] \
    && . "$HOME/.config/functions"

[ -f "$HOME/.config/aliases" ] \
    && . "$HOME/.config/aliases"

# prompt
[ "$(id -u)" -eq 0 ] \
    && PS1='\[\e[1;31m\][\[\e[0;97m\]\w\[\e[1;31m\]]\e[0;97m\]\$\[\e[0m\] ' \
    || PS1='\[\e[1;34m\][\[\e[0;97m\]\w\[\e[1;34m\]]\e[0;97m\]\$\[\e[0m\] '

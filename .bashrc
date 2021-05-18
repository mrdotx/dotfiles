# shellcheck shell=bash

# path:   /home/klassiker/.local/share/repos/dotfiles/.bashrc
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-05-18T09:07:51+0200

# if shell is not running interactive, break up
tty -s \
    || return

# xhost
xhost +local:root > /dev/null 2>&1

# SIGWINCH
# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# history command configuration
shopt -s histverify # show command with history expansion to user before running it
shopt -s histappend # add commands to HISTFILE in order of execution

# aliases
[ -f "$HOME/.config/aliases" ] \
    && . "$HOME/.config/aliases"

# prompt
use_color=true
if $use_color; then
    if [ $EUID -eq 0 ]; then
        PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
    else
        PS1='\[\033[01;34m\][\u@\h\[\033[01;37m\] \W\[\033[01;34m\]]\$\[\033[00m\] '
    fi
else
    if [ $EUID -eq 0 ]; then
        # show root@ if there is no color
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \w \$ '
    fi
fi
unset use_color

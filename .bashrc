# path:       ~/.bashrc
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-01-26T17:48:37+0100

# colors
[[ $- != *i* ]] && return

use_color=false

if ${use_color} ; then

    # command
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias tree='tree -C'

    # prompt
    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
    else
        PS1='\[\033[01;34m\][\u@\h\[\033[01;37m\] \W\[\033[01;34m\]]\$\[\033[00m\] '
    fi

else
    if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \w \$ '
    fi
fi

unset use_color

# xhost
xhost +local:root > /dev/null 2>&1

# SIGWINCH
# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# alias
shopt -s expand_aliases
[ -f "$HOME/.config/aliases" ] && source "$HOME/.config/aliases"

# autostart
if [[ ! "$TERM" =~ ^(linux|st-256color|tmux-256color)$ ]]; then
    tx
fi

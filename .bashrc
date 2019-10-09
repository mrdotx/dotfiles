# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# Path:     ~/.bashrc
# User:     klassiker [mrdotx]
# GitHub:   https://github.com/mrdotx/dotfiles

# colors {{{
[[ $- != *i* ]] && return

use_color=true

if ${use_color} ; then
	# directory
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		fi
	fi

    # command
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias tree='tree -C'

    # man pages
    export LESS_TERMCAP_mb=$'\e[1;32m'
    export LESS_TERMCAP_md=$'\e[1;32m'
    export LESS_TERMCAP_me=$'\e[0m'
    export LESS_TERMCAP_se=$'\e[0m'
    export LESS_TERMCAP_so=$'\e[01;33m'
    export LESS_TERMCAP_ue=$'\e[0m'
    export LESS_TERMCAP_us=$'\e[1;4;31m'

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
# }}}

# xhost {{{
xhost +local:root > /dev/null 2>&1
# }}}

# SIGWINCH {{{
# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
# }}}

# alias {{{
shopt -s expand_aliases
source "$HOME"/.aliases
# }}}

# completion {{{
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
source /usr/share/fzf/completion.bash && source /usr/share/fzf/key-bindings.bash
#complete -cf sudo
# pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# }}}

# autostart {{{
if [[ ! "$TERM" =~ ^(linux|st-256color|tmux-256color)$ ]]; then
    tx
fi
# }}}

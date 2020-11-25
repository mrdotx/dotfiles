# path:       /home/klassiker/.config/zsh/.zshrc
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-11-25T11:02:30+0100

# if shell is not running interactive, break up
tty -s \
    || return

# aliases
[ -f "$HOME/.config/aliases" ] \
    && . "$HOME/.config/aliases"

# prompt
autoload -U colors && colors
ZLE_RPROMPT_INDENT=0

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose name"
# GIT_PS1_STATESEPARATOR="|"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_HIDE_IF_PWD_IGNORED=1

preexec () {
    _ZSH_CMD_EXEC_START=$(date +%s.%N)
}
precmd () {
    local ESTAT="$?"
    local OPAR="%{$fg_bold[blue]%}[%{$reset_color%}"
    local CPAR="%{$fg_bold[blue]%}]%{$reset_color%}"

    __git_ps1 "$OPAR%3~" "$CPAR%B»%b " " %s"

    if [ $ESTAT != 0 ]; then
        local ESTAT="%{$fg[red]%}$ESTAT%{$reset_color%}"
    else
        local ESTAT="%{$fg[green]%}$ESTAT%{$reset_color%}"
    fi

    if [ $_ZSH_CMD_EXEC_START ]; then
        local ETIME=$(printf "%s" "$(date -u -d "0 $(date +%s.%N) sec - $_ZSH_CMD_EXEC_START sec" +"%H:%M:%S.%3N")" \
            | sed 's/^00:00://;s/^00://;s/^0//' \
        )
        RPROMPT="«$OPAR$ESTAT $ETIME$CPAR"
    else
        RPROMPT="«$OPAR$ESTAT$CPAR"
    fi

    function zle-keymap-select
    {
        local OPAR="%{$fg_bold[blue]%}[%{$reset_color%}"
        local CPAR="%{$fg_bold[blue]%}]%{$reset_color%}"
        case $KEYMAP in
            vicmd)
                RPROMPT="«$OPAR-- %{$fg[green]%}NORMAL%{$reset_color%} --$CPAR"
                ;;
            viins | main)
                RPROMPT="«$OPAR-- %{$fg[green]%}INSERT%{$reset_color%} --$CPAR"
                ;;
        esac
        zle reset-prompt
    }
    zle -N zle-keymap-select
}

# vi mode
export KEYTIMEOUT=1

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^V" edit-command-line

# completion
autoload -Uz compinit
zstyle ':completion:*' menu select
# case insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots) # hidden files
# pip zsh completion
function _pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" \
               COMP_CWORD=$(( cword-1 )) \
               PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip

# history command configuration
# ignore duplicated commands history list
setopt hist_ignore_dups
# ignore commands that start with space
setopt hist_ignore_space
# show command with history expansion to user before running it
setopt hist_verify
# add commands to HISTFILE in order of execution
setopt inc_append_history

# fuzzy finder
. /usr/share/fzf/completion.zsh
. /usr/share/fzf/key-bindings.zsh

# git
. /usr/share/git/completion/git-prompt.sh

# zsh-autosuggestion
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#1f5393,bg=black,bold,underline"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# history-substring-search
. /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-syntax-highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

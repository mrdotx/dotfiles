# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zshrc
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-07-04T20:58:12+0200

# if shell is not running interactive, break up
tty -s \
    || return

# history (same functionality as bash)
# ignore duplicated commands history list
setopt hist_ignore_dups
# ignore commands that start with space
setopt hist_ignore_space
# show command with history expansion to user before running it
setopt hist_verify
# add commands to HISTFILE in order of execution
setopt inc_append_history

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

preexec() {
    _ZSH_CMD_EXEC_START=$(date +%s.%N)
}
precmd() {
    case $? in
        0)
            _ZSH_CMD_EXEC_ERR="%{$fg[green]%}$?%{$reset_color%}"
            ;;
        *)
            _ZSH_CMD_EXEC_ERR="%{$fg[red]%}$?%{$reset_color%}"
            ;;
    esac

    set_prompt() {
        local OPAR="%{$fg_bold[blue]%}[%{$reset_color%}"
        local CPAR="%{$fg_bold[blue]%}]%{$reset_color%}"

        __git_ps1 "$OPAR%3~" "$CPAR%B»%b " " %s"
        RPROMPT="%B«%b$OPAR$1$CPAR"
    }

    if [ $_ZSH_CMD_EXEC_START ]; then
        _ZSH_CMD_EXEC_TIME=$(date -u -d "0 $(date +%s.%N) sec - $_ZSH_CMD_EXEC_START sec" +"%H:%M:%S.%3N" \
            | sed 's/^00:00://;s/^00://;s/^0//' \
        )
        set_prompt "$_ZSH_CMD_EXEC_ERR $_ZSH_CMD_EXEC_TIME"
    else
        set_prompt "$_ZSH_CMD_EXEC_ERR"
    fi

    function zle-keymap-select
    {
        case $KEYMAP in
            vicmd)
                set_prompt "-- %{$fg[red]%}NORMAL%{$reset_color%} --"
                ;;
            viins | main)
                if [ $_ZSH_CMD_EXEC_START ]; then
                    set_prompt "$_ZSH_CMD_EXEC_ERR $_ZSH_CMD_EXEC_TIME"
                else
                    set_prompt "$_ZSH_CMD_EXEC_ERR"
                fi
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

# fuzzy finder completion
. /usr/share/fzf/completion.zsh
. /usr/share/fzf/key-bindings.zsh

# git completion
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

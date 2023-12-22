# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zshrc
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2023-12-21T21:56:27+0100

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

# functions and aliases
[ -f "$HOME/.config/functions" ] \
    && . "$HOME/.config/functions"

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
        local bracket_color="$fg_bold[blue]"

        # root indicator
        [ $(id -u) -eq 0 ] \
            && local bracket_color="$fg_bold[red]"

        local bracket_open="%{$bracket_color%}[%{$reset_color%}"
        local bracket_close="%{$bracket_color%}]%{$reset_color%}"

        __git_ps1 "$bracket_open%3~" "$bracket_close%B»%b " " %s"
        RPROMPT="%B«%b$bracket_open$1$bracket_close"
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

# fuzzy finder completion
. /usr/share/fzf/completion.zsh
. /usr/share/fzf/key-bindings.zsh

# git completion
. /usr/share/git/completion/git-prompt.sh

# zsh-autosuggestion
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=blue,bg=black,underline"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# zsh-syntax-highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)

# history-substring-search
. /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bg=blue,bold'
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# autostart
cinfo

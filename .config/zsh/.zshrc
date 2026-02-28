# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zshrc
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/dotfiles
# date:   2026-02-28T05:26:04+0100

# if shell is not running interactive, break up
tty -s \
    || return

# history (same functionality as bash)
# show command with history expansion to user before running it
setopt hist_verify
# add commands to HISTFILE when shell exits
setopt append_history
# ignore command line that start with a space
setopt hist_ignore_space
# ignore command line if it is identical to the previous one
setopt hist_ignore_dups
# older duplicate command lines are removed when saving
setopt hist_save_no_dups
export \
    HISTFILE="$HOME/.local/share/cmd_history" \
    HISTSIZE=2000 \
    SAVEHIST=20000

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
#GIT_PS1_STATESEPARATOR="|"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_HIDE_IF_PWD_IGNORED=1

set_prompt() {
    case "$RANGER_LEVEL" in
        [1-9]) # ranger
            local separator_left="%B%F{yellow}{%f%b$RANGER_LEVEL%B%F{yellow}}%f%b>"
            local separator_right="<"
            local bracket_left="%B%F{yellow}(%f%b"
            local bracket_right="%B%F{yellow})%f%b"
            ;;
        *) # root -> normal
            local separator_left="%(!.#.%B»%b)"
            local separator_right="%(!.#.%B«%b)"
            local bracket_left="%B%(!.%F{red}{.%F{blue}[)%f%b"
            local bracket_right="%B%(!.%F{red}}.%F{blue}])%f%b"
            ;;
    esac

    local exit_status="%(?.%F{green}.%F{red})%?%f"
    local exec_time="${_ZSH_CMD_EXEC_START:+" $_ZSH_CMD_EXEC_TIME"}"

    [ $1 ] \
        && PS1="$bracket_left$1$bracket_right$separator_left " \
        || __git_ps1 "$bracket_left%3~" "$bracket_right$separator_left " " %s"

    RPROMPT="$separator_right$bracket_left$exit_status$exec_time$bracket_right"
}

zle-keymap-select() {
    case $KEYMAP in
        vicmd)
            set_prompt "%K{red} NORMAL %k"
            ;;
        viins | main)
            set_prompt
            ;;
    esac

    zle reset-prompt
}

preexec() {
    _ZSH_CMD_EXEC_START=$(date +%s.%N)
}

precmd() {
    _ZSH_CMD_EXEC_TIME=$(date -u -d "0 $(date +%s.%N) sec \
            - $_ZSH_CMD_EXEC_START sec" +"%H:%M:%S.%3N" \
        | sed 's/^00:00://;s/^00://;s/^0//' \
    )

    set_prompt

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

# git prompt
. /usr/share/git/completion/git-prompt.sh

# zsh-autosuggestion
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# zsh-syntax-highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)
ZSH_HIGHLIGHT_STYLES[path]='fg=14'

# history-substring-search
. /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=12'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=9,bold'
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# autostart
[ -z "$RANGER_LEVEL" ] \
    && [ $(id -u) -eq 1000 ] \
    && cinfo \
    || return 0

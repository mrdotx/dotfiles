# path:       /home/klassiker/.config/zsh/.zshrc
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-06-03T12:43:49+0200

# aliases
[ -f "$HOME/.config/aliases" ] && . "$HOME/.config/aliases"

# if shell is not running interactive, break up
[[ $- != *i* ]] && return

# prompt
autoload -U colors && colors

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose name"
# GIT_PS1_STATESEPARATOR="|"
GIT_PS1_SHOWCOLORHINTS=1

preexec () {
    ZSH_CMD_EXEC_START=$(date +%s.%N)
}
precmd () {
    __git_ps1 "%{$fg_bold[blue]%}[%{$reset_color%}%3~%{$fg_bold[blue]%}]%{$reset_color%}" "%B$%b "

    if [ $ZSH_CMD_EXEC_START ]; then
        ZSH_CMD_EXEC_TIME=$(printf " (%s)\n" "$(date -u -d "0 $(date +%s.%N) sec - $ZSH_CMD_EXEC_START sec" +"%H:%M:%S.%3N")")
        RPROMPT="%F{blue}[%f%?%F{blue}]%f${ZSH_CMD_EXEC_TIME}"
    else
        RPROMPT="%F{blue}[%f%?%F{blue}]%f"
    fi
}

# history command configuration
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution

# completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # case insensitive
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
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

# fuzzy finder
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# git
source /usr/share/git/completion/git-prompt.sh

# zsh-autosuggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#1f5393,bg=black,bold,underline"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# autostart
# if [[ "$TERM" =~ ^(st-256color)$ ]]; then
#     nf
# fi
if [[ "$TERM" =~ ^(rxvt-unicode-256color)$ ]]; then
    tx
fi

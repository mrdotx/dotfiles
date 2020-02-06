# path:       ~/.config/zsh/.zshrc
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-02-06T18:21:12+0100

# aliases
[ -f "$HOME/.config/aliases" ] && source "$HOME/.config/aliases"

# if shell is not running interactive, break up
[[ $- != *i* ]] && return

# prompt
autoload -U colors && colors
#precmd () { __git_ps1 "%{$fg_bold[green]%}[%n@%m%{$reset_color%} %2~%{$fg_bold[green]%}]%{$reset_color%}%{$reset_color%}" "%B$%b " }
precmd () { __git_ps1 "%{$fg_bold[green]%}[%{$reset_color%}%3~%{$fg_bold[green]%}]%{$reset_color%}" "%B$%b " }

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose name"
#GIT_PS1_STATESEPARATOR="|"
GIT_PS1_SHOWCOLORHINTS=1

# history command configuration
#setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# completion
autoload -Uz compinit
zstyle ':completion:*' menu select
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
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#980096,bg=black,bold,underline"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# autostart
if [[ ! "$TERM" =~ ^(st-256color|tmux-256color|linux)$ ]]; then
    tx
fi

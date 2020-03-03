# path:       ~/.profile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-03T03:40:14+0100

# hardware settings
# gpu iHD/i965 intel-media-driver/libva-intel-driver new/old driver
export LIBVA_DRIVER_NAME=i965

# project paths
[ -d "$HOME/repos/cmus" ] && PATH="$HOME/repos/cmus:$PATH"
[ -d "$HOME/repos/conky" ] && PATH="$HOME/repos/conky:$PATH"
[ -d "$HOME/repos/i3" ] && PATH="$HOME/repos/i3:$PATH"
[ -d "$HOME/repos/newsboat" ] && PATH="$HOME/repos/newsboat:$PATH"
[ -d "$HOME/repos/maintenance" ] && PATH="$HOME/repos/maintenance:$PATH"
[ -d "$HOME/repos/polybar" ] && PATH="$HOME/repos/polybar:$PATH"
[ -d "$HOME/repos/python" ] && PATH="$HOME/repos/python:$PATH"
[ -d "$HOME/repos/rclone" ] && PATH="$HOME/repos/rclone:$PATH"
[ -d "$HOME/repos/rofi" ] && PATH="$HOME/repos/rofi:$PATH"
[ -d "$HOME/repos/shell" ] && PATH="$HOME/repos/shell:$PATH"
[ -d "$HOME/repos/st" ] && PATH="$HOME/repos/st:$PATH"
[ -d "$HOME/repos/stopwatch" ] && PATH="$HOME/repos/stopwatch:$PATH"
[ -d "$HOME/repos/surf" ] && PATH="$HOME/repos/surf:$PATH"
[ -d "$HOME/repos/system" ] && PATH="$HOME/repos/system:$PATH"

# xdg paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# xdg config paths
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# standard apps
export TERMINAL="st"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"
export FILE="ranger"
export READER="zathura"
export BROWSER="surf.sh"
export TERMINALBROWSER="links"

# app settings
export RANGER_LOAD_DEFAULT_RC=false
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/site-packages
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export MOZ_USE_XINPUT2=1
export NO_AT_BRIDGE=1
export LESSHISTFILE=-
export WWW_HOME=duckduckgo.com
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# zsh and bash history merge
export HISTFILE="$HOME/.cmd_history"    # for zsh and bash
export HISTSIZE=10000                   # for zsh and bash
export SAVEHIST=5000                    # for zsh
export HISTFILESIZE=$SAVEHIST           # for bash
export HISTCONTROL=ignoreboth           # for bash ignore duplicated commands and commands start with space

# colored man pages
blink_start="$(printf '%b' '[1;31m')"
bold_start="$(printf '%b' '[1;34m')"
turn_off="$(printf '%b' '[0m')"
standout_start="$(printf '%b' '[01;44;37m')"
standout_stop="$(printf '%b' '[0m')"
underline_start="$(printf '%b' '[1;4;36m')"
underline_stop="$(printf '%b' '[0m')"
export LESS_TERMCAP_mb=$blink_start
export LESS_TERMCAP_md=$bold_start
export LESS_TERMCAP_me=$turn_off
export LESS_TERMCAP_so=$standout_start
export LESS_TERMCAP_se=$standout_stop
export LESS_TERMCAP_us=$underline_start
export LESS_TERMCAP_ue=$underline_stop

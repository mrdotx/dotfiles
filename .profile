# path:       ~/.profile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-02-08T20:52:40+0100

# project paths
[ -d "$HOME/projects/cmus" ] && PATH="$HOME/projects/cmus:$PATH"
[ -d "$HOME/projects/conky" ] && PATH="$HOME/projects/conky:$PATH"
[ -d "$HOME/projects/i3" ] && PATH="$HOME/projects/i3:$PATH"
[ -d "$HOME/projects/maintenance" ] && PATH="$HOME/projects/maintenance:$PATH"
[ -d "$HOME/projects/polybar" ] && PATH="$HOME/projects/polybar:$PATH"
[ -d "$HOME/projects/python" ] && PATH="$HOME/projects/python:$PATH"
[ -d "$HOME/projects/rclone" ] && PATH="$HOME/projects/rclone:$PATH"
[ -d "$HOME/projects/rofi" ] && PATH="$HOME/projects/rofi:$PATH"
[ -d "$HOME/projects/shell" ] && PATH="$HOME/projects/shell:$PATH"
[ -d "$HOME/projects/st" ] && PATH="$HOME/projects/st:$PATH"
[ -d "$HOME/projects/stopwatch" ] && PATH="$HOME/projects/stopwatch:$PATH"
[ -d "$HOME/projects/surf" ] && PATH="$HOME/projects/surf:$PATH"
[ -d "$HOME/projects/system" ] && PATH="$HOME/projects/system:$PATH"

# zsh and bash history merge
export HISTFILE="$HOME/.cmd_history"
export HISTSIZE=10000
export HISTFILESIZE=10000
export SAVEHIST=5000

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

# hardware settings
# gpu iHD/i965 intel-media-driver/libva-intel-driver new/old driver
export LIBVA_DRIVER_NAME=i965

# colored man pages
blink_start="$(printf '%b' '[1;31m')"
bold_start="$(printf '%b' '[1;34m')"
turn_off="$(printf '%b' '[0m')"
standout_start="$(printf '%b' '[01;44;37m')"
standout_stop="$(printf '%b' '[0m')"
underline_start="$(printf '%b' '[1;36m')"
underline_stop="$(printf '%b' '[0m')"
export LESS_TERMCAP_mb=$blink_start
export LESS_TERMCAP_md=$bold_start
export LESS_TERMCAP_me=$turn_off
export LESS_TERMCAP_so=$standout_start
export LESS_TERMCAP_se=$standout_stop
export LESS_TERMCAP_us=$underline_start
export LESS_TERMCAP_ue=$underline_stop

# enable gnome keyring for terminal applications
if [ -n "$DESKTOP_SESSION" ];then
    eval "$(gnome-keyring-daemon --start)"
    export SSH_AUTH_SOCK
fi

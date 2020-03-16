# path:       ~/.zshenv
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-16T00:59:02+0100

# project paths
typeset -U PATH path
path=("$HOME/repos/cmus" "$HOME/repos/conky" "$HOME/repos/i3" "$HOME/repos/newsboat" "$HOME/repos/maintenance" "$HOME/repos/polybar" "$HOME/repos/python" "$HOME/repos/rclone" "$HOME/repos/rofi" "$HOME/repos/shell" "$HOME/repos/st" "$HOME/repos/stopwatch" "$HOME/repos/surf" "$HOME/repos/system" "$path[@]")
export PATH

# hardware settings (check vainfo)
# gpu iHD/i965 intel-media-driver/libva-intel-driver new/old driver
export LIBVA_DRIVER_NAME=i965

# xdg paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# config paths
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export XAUTHORITY="$XDG_DATA_HOME/xorg/Xauthority"
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/site-packages
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd"
export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export FONTCONFIG_PATH=/etc/fonts
export FONTCONFIG_FILE=fonts.conf

# app settings
export SSH_AGENT_PID=
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"
export RANGER_LOAD_DEFAULT_RC=false
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export MOZ_USE_XINPUT2=1
export NO_AT_BRIDGE=1
export COLORTERM="truecolor"
export LESSHISTFILE=-
export WWW_HOME=duckduckgo.com

# standard apps
export TERMINAL="st"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"
export FILE="ranger"
export PAGER="less"
export READER="zathura"
export BROWSER="surf.sh"
export TERMINALBROWSER="links"

# history (same functionality as bash)
export HISTFILE="$HOME/.cmd_history"
export HISTSIZE=10000
export SAVEHIST=5000

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

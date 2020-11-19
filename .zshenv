# path:       /home/klassiker/.zshenv
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-11-19T00:51:45+0100

# repository paths
typeset -U PATH path
path=( \
    "$HOME/.local/share/repos/audio" \
    "$HOME/.local/share/repos/backlight" \
    "$HOME/.local/share/repos/compressor" \
    "$HOME/.local/share/repos/conky" \
    "$HOME/.local/share/repos/dmenu/scripts" \
    "$HOME/.local/share/repos/fzf" \
    "$HOME/.local/share/repos/i3" \
    "$HOME/.local/share/repos/link-handler" \
    "$HOME/.local/share/repos/polybar" \
    "$HOME/.local/share/repos/python" \
    "$HOME/.local/share/repos/rclone" \
    "$HOME/.local/share/repos/rofi" \
    "$HOME/.local/share/repos/screenshot" \
    "$HOME/.local/share/repos/shell" \
    "$HOME/.local/share/repos/stopwatch" \
    "$HOME/.local/share/repos/surf" \
    "$HOME/.local/share/repos/terminal-colors" \
    "$HOME/.local/share/repos/terminal-wrapper" \
    "$path[@]" \
)
export PATH

# systemd environment
systemctl --user import-environment PATH

# hardware settings (check vainfo)
# gpu iHD/i965 intel-media-driver/libva-intel-driver new/old driver
export LIBVA_DRIVER_NAME=i965

# firefox vaapi x11 hardware acceleration
# (gfx.webrender.all=true)
# media.ffmpeg.vaapi-drm-display.enabled=true
# media.ffmpeg.vaapi.enabled=true
export MOZ_X11_EGL=1

# xdg paths
export \
    XDG_CONFIG_HOME="$HOME/.config" \
    XDG_CACHE_HOME="$HOME/.cache" \
    XDG_DATA_HOME="$HOME/.local/share" \
    XDG_DATA_DIRS=/usr/local/share:/usr/share \
    XDG_CONFIG_DIRS=/etc/xdg

# config paths
export \
    ZDOTDIR="$XDG_CONFIG_HOME/zsh" \
    XAUTHORITY="$XDG_DATA_HOME/xorg/Xauthority" \
    RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd" \
    PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/site-packages \
    NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc" \
    GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc" \
    FONTCONFIG_PATH=/etc/fonts \
    FONTCONFIG_FILE=fonts.conf \
    PYLINTHOME="$XDG_CACHE_HOME/pylint" \
    WEECHAT_HOME="$XDG_CONFIG_HOME/weechat" \
    KODI_DATA="$XDG_DATA_HOME/kodi" \

# app settings
export \
    GPG_TTY=$(tty) \
    RANGER_LOAD_DEFAULT_RC=false \
    QT_QPA_PLATFORMTHEME="qt5ct" \
    QT_AUTO_SCREEN_SCALE_FACTOR=0 \
    MOZ_USE_XINPUT2=1 \
    NO_AT_BRIDGE=1 \
    LESSHISTFILE=- \
    HIGHLIGHT_OPTIONS="\
        --max-size=2M \
        --replace-tabs=4 \
        --out-format=xterm256 \
        --style=$HOME/.config/highlight/klassiker.theme \
        --force=sh" \
    WWW_HOME="duckduckgo.com"

# standard apps
export \
    TERMINAL="urxvtc.sh" \
    TERMINAL2="st" \
    VISUAL="nvim" \
    EDITOR="nvim" \
    SUDO_EDITOR="nvim" \
    FILE="ranger" \
    PAGER="less" \
    READER="zathura" \
    BROWSER="w3m.sh"

# history (same functionality as bash)
export \
    HISTFILE="$HOME/.local/share/cmd_history" \
    HISTSIZE=10000 \
    SAVEHIST=5000

# colored man pages
export \
    LESS_TERMCAP_mb=$'\e[1;31m' \
    LESS_TERMCAP_md=$'\e[1;34m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;37m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;4;36m' \
    LESS_TERMCAP_ue=$'\e[0m'

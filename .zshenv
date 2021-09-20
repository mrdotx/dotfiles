# path:   /home/klassiker/.local/share/repos/dotfiles/.zshenv
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-09-19T20:54:31+0200

# xdg paths
export \
    XDG_CONFIG_HOME="$HOME/.config" \
    XDG_CACHE_HOME="$HOME/.cache" \
    XDG_DATA_HOME="$HOME/.local/share" \
    XDG_DATA_DIRS=/usr/local/share:/usr/share \
    XDG_CONFIG_DIRS=/etc/xdg

# history (same functionality as bash)
export \
    HISTFILE="$XDG_DATA_HOME/cmd_history" \
    HISTSIZE=10000 \
    SAVEHIST=5000

# repository paths
typeset -U PATH path
path=( \
    "$XDG_DATA_HOME/repos/audio" \
    "$XDG_DATA_HOME/repos/backlight" \
    "$XDG_DATA_HOME/repos/compressor" \
    "$XDG_DATA_HOME/repos/conky" \
    "$XDG_DATA_HOME/repos/dmenu/scripts" \
    "$XDG_DATA_HOME/repos/efistub" \
    "$XDG_DATA_HOME/repos/fzf" \
    "$XDG_DATA_HOME/repos/i3" \
    "$XDG_DATA_HOME/repos/link-handler" \
    "$XDG_DATA_HOME/repos/polybar" \
    "$XDG_DATA_HOME/repos/python" \
    "$XDG_DATA_HOME/repos/rclone" \
    "$XDG_DATA_HOME/repos/rofi" \
    "$XDG_DATA_HOME/repos/screenshot" \
    "$XDG_DATA_HOME/repos/shell" \
    "$XDG_DATA_HOME/repos/stopwatch" \
    "$XDG_DATA_HOME/repos/surf" \
    "$XDG_DATA_HOME/repos/terminal-colors" \
    "$XDG_DATA_HOME/repos/terminal-wrapper" \
    "$XDG_DATA_HOME/repos/wacom" \
    "$XDG_DATA_HOME/repos/zram" \
    "$path[@]" \
)
export PATH

# systemd environment
systemctl --user import-environment PATH

# graphic settings (vainfo)
# iHD    | intel-media-driver        | new driver
# i965   | libva-intel-driver        | old driver
#        | libva-intel-driver-hybrid | for hybrid
# hybrid | intel-hybrid-codec-driver | partial VP8/VP9 encoding/decoding
export \
    LIBVA_DRIVER_NAME=i965

# config paths
export \
    XAUTHORITY="$XDG_DATA_HOME/xorg/Xauthority" \
    ZDOTDIR="$XDG_CONFIG_HOME/zsh" \
    RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd" \
    PASSWORD_STORE_DIR="$XDG_DATA_HOME/repos/password-store" \
    NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc" \
    GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc:$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine" \
    FONTCONFIG_PATH=/etc/fonts \
    FONTCONFIG_FILE=fonts.conf \
    PYLINTHOME="$XDG_CACHE_HOME/pylint" \
    WGETRC="$XDG_CONFIG_HOME/wget/wgetrc" \
    KODI_DATA="$XDG_DATA_HOME/kodi" \

# app settings
export \
    COLORTERM=truecolor \
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
        --style=$XDG_CONFIG_HOME/highlight/klassiker.theme \
        --force=sh" \
    WWW_HOME="searx.tiekoetter.com"

# standard apps
export \
    TERMINAL="urxvtc.sh" \
    TERMINAL_BACKUP="st" \
    VISUAL="nvim" \
    EDITOR="nvim" \
    SUDO_EDITOR="nvim" \
    FILE="ranger" \
    PAGER="less" \
    READER="zathura" \
    BROWSER="w3m.sh" \
    BROWSER_BACKUP="surf.sh" \
    EXEC_AS_USER="doas"

# colored man pages
export \
    LESS_TERMCAP_mb=$'\e[1;31m' \
    LESS_TERMCAP_md=$'\e[1;34m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;37m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[1;4;36m' \
    LESS_TERMCAP_ue=$'\e[0m'

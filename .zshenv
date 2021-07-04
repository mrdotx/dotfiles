# path:   /home/klassiker/.local/share/repos/dotfiles/.zshenv
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-07-04T20:51:29+0200

# history (same functionality as bash)
export \
    HISTFILE="$HOME/.local/share/cmd_history" \
    HISTSIZE=10000 \
    SAVEHIST=5000

# repository paths
typeset -U PATH path
path=( \
    "$HOME/.local/share/repos/audio" \
    "$HOME/.local/share/repos/backlight" \
    "$HOME/.local/share/repos/compressor" \
    "$HOME/.local/share/repos/conky" \
    "$HOME/.local/share/repos/dmenu/scripts" \
    "$HOME/.local/share/repos/efistub" \
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
    "$HOME/.local/share/repos/zram" \
    "$path[@]" \
)
export PATH

# systemd environment
systemctl --user import-environment PATH

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
    RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvtd" \
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
    PASSWORD_STORE_DIR="$XDG_DATA_HOME/repos/password-store" \
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

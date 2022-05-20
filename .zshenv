# path:   /home/klassiker/.local/share/repos/dotfiles/.zshenv
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2022-05-20T06:31:52+0200

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
    "$XDG_DATA_HOME/repos/backlight" \
    "$XDG_DATA_HOME/repos/compressor" \
    "$XDG_DATA_HOME/repos/conky" \
    "$XDG_DATA_HOME/repos/dmenu/scripts" \
    "$XDG_DATA_HOME/repos/efistub" \
    "$XDG_DATA_HOME/repos/fzf" \
    "$XDG_DATA_HOME/repos/i3" \
    "$XDG_DATA_HOME/repos/ironos-flasher" \
    "$XDG_DATA_HOME/repos/link-handler" \
    "$XDG_DATA_HOME/repos/polybar" \
    "$XDG_DATA_HOME/repos/python" \
    "$XDG_DATA_HOME/repos/rclone" \
    "$XDG_DATA_HOME/repos/rofi" \
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

# config paths
export \
    XINITRC="$XDG_CONFIG_HOME/X11/xinit/xinitrc" \
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
    ZSTD_NBTHREADS=0 \
    XZ_DEFAULTS="--threads=0" \
    LESS='-MR --use-color -Dd+b$Dk+b$Du+C$DEWb$DNc$DPWb$DRWb$DSWb$DWWB' \
    LESSHISTFILE=- \
    RANGER_LOAD_DEFAULT_RC=false \
    QT_QPA_PLATFORMTHEME="qt5ct" \
    QT_AUTO_SCREEN_SCALE_FACTOR=0 \
    MOZ_USE_XINPUT2=1 \
    NO_AT_BRIDGE=1 \
    HIGHLIGHT_OPTIONS=" \
        --max-size=16M \
        --replace-tabs=4 \
        --out-format=xterm256 \
        --style=$XDG_CONFIG_HOME/highlight/klassiker.theme \
        --force=sh" \
    CARGO_HOME="$XDG_DATA_HOME/cargo" \
    WWW_HOME="searx.tiekoetter.com"

# standard apps
export \
    TERMINAL="urxvtc.sh" \
    TERMINAL_BACKUP="st" \
    EDITOR="vim" \
    FILE="ranger" \
    PAGER="less" \
    SYSTEMD_LESS="-FSXK $LESS" \
    READER="zathura" \
    BROWSER="w3m.sh" \
    BROWSER_BACKUP="surf.sh" \
    EXEC_AS_USER="doas"

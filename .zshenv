# path:   /home/klassiker/.local/share/repos/dotfiles/.zshenv
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2024-06-20T17:16:34+0200

# xdg paths
export \
    XDG_CONFIG_HOME="$HOME/.config" \
    XDG_CACHE_HOME="$HOME/.cache" \
    XDG_DATA_HOME="$HOME/.local/share" \
    XDG_STATE_HOME="$HOME/.local/state"

export \
    XDG_DATA_DIRS=/usr/local/share:/usr/share \
    XDG_CONFIG_DIRS=/etc/xdg

export \
    XDG_DESKTOP_DIR="$HOME/Desktop" \
    XDG_DOCUMENTS_DIR="$HOME/Documents" \
    XDG_DOWNLOAD_DIR="$HOME/Downloads" \
    XDG_MUSIC_DIR="$HOME/Music" \
    XDG_PICTURES_DIR="$HOME/Pictures" \
    XDG_PUBLICSHARE_DIR="$HOME/Public" \
    XDG_TEMPLATES_DIR="$HOME/Templates" \
    XDG_VIDEOS_DIR="$HOME/Videos"

# history (same functionality as bash)
export \
    HISTFILE="$XDG_DATA_HOME/cmd_history" \
    HISTSIZE=10000 \
    SAVEHIST=5000

# repository paths
typeset -U PATH path
path=( \
    "$XDG_DATA_HOME/repos/dmenu/scripts" \
    "$XDG_DATA_HOME/repos/efistub" \
    "$XDG_DATA_HOME/repos/epg" \
    "$XDG_DATA_HOME/repos/fzf" \
    "$XDG_DATA_HOME/repos/i3" \
    "$XDG_DATA_HOME/repos/ironos-flasher" \
    "$XDG_DATA_HOME/repos/link-handler" \
    "$XDG_DATA_HOME/repos/polybar" \
    "$XDG_DATA_HOME/repos/python" \
    "$XDG_DATA_HOME/repos/rclone" \
    "$XDG_DATA_HOME/repos/shell" \
    "$XDG_DATA_HOME/repos/surf" \
    "$XDG_DATA_HOME/repos/terminal-analysis" \
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
    PYLINTHOME="$XDG_CACHE_HOME/pylint" \
    WGETRC="$XDG_CONFIG_HOME/wget/wgetrc" \
    KODI_DATA="$XDG_DATA_HOME/kodi"

# standard apps
export \
    EXEC_AS_USER="doas" \
    TERMINAL="urxvtc.sh" \
    EDITOR="nvim" \
    PAGER="less" \
    BROWSER="w3m.sh"

# app settings
export \
    RUSTICL_ENABLE=radeonsi \
    COLORTERM=truecolor \
    GPG_TTY=$(tty) \
    ZSTD_NBTHREADS=0 \
    XZ_DEFAULTS="--threads=0" \
    LESS='-MR --use-color -Dd+b$Dk+b$Du+C$DEWb$DNc$DPWb$DRWb$DSWb$DWWB' \
    LESSHISTFILE=- \
    MANROFFOPT="-c" \
    DIFFPROG="nvim -d" \
    HIGHLIGHT_OPTIONS=" \
        --replace-tabs=4 \
        --out-format=xterm256 \
        --style=$XDG_CONFIG_HOME/highlight/klassiker.theme \
        --force=sh" \
    FZF_DEFAULT_OPTS=" \
        --exact \
        --prompt='» ' --pointer='»' --marker='»' \
        --color='fg:7,preview-fg:15,bg:-1,hl:12' \
        --color='fg+:7,bg+:12,gutter:8,hl+:15' \
        --color='info:7,prompt:15,pointer:15' \
        --color='marker:7,spinner:12,header:15' \
        --no-bold" \
    RANGER_LOAD_DEFAULT_RC=false \
    W3M_DIR="$XDG_STATE_HOME/w3m" \
    WWW_HOME="lite.duckduckgo.com" \
    CARGO_HOME="$XDG_DATA_HOME/cargo" \
    GOPATH="$XDG_DATA_HOME/go" \
    GOMODCACHE="$XDG_DATA_HOME/go/mod" \
    QT_QPA_PLATFORMTHEME="qt6ct" \
    QT_AUTO_SCREEN_SCALE_FACTOR=0 \
    MOZ_USE_XINPUT2=1 \
    NO_AT_BRIDGE=1

export \
    SYSTEMD_LESS="-FSXK $LESS"

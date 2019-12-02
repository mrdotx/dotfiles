# path:       ~/.profile
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-12-02 20:02:43

# dev paths
if [ -d "$HOME/coding/python" ] ; then
    PATH="$HOME/coding/python:$PATH"
fi
if [ -d "$HOME/coding/shell" ] ; then
    PATH="$HOME/coding/shell:$PATH"
fi
if [ -d "$HOME/coding/st" ] ; then
    PATH="$HOME/coding/st:$PATH"
fi

# xdg paths
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# xdg config paths
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export WEECHAT_HOME="$XDG_CONFIG_HOME"/weechat

# apps
export TERMINAL="st"
export VISUAL="vim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"
export FILE="ranger"
export READER="zathura"
export BROWSER="qutebrowser"

# app settings
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.7/site-packages
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export MOZ_USE_XINPUT2=1
export NO_AT_BRIDGE=1

# enable gnome keyring for terminal applications
if [ -n "$DESKTOP_SESSION" ];then
    eval "$(gnome-keyring-daemon --start)"
    export SSH_AUTH_SOCK
fi

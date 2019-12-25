# path:       ~/.profile
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-12-25 22:42:11

# dev paths
if [ -d "$HOME/projects/python" ] ; then
    PATH="$HOME/projects/python:$PATH"
fi
if [ -d "$HOME/projects/shell" ] ; then
    PATH="$HOME/projects/shell:$PATH"
fi
if [ -d "$HOME/projects/st" ] ; then
    PATH="$HOME/projects/st:$PATH"
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
export PYLINTHOME="$XDG_DATA_HOME"/pylint.d

# apps
export TERMINAL="st"
export VISUAL="vim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"
export FILE="ranger"
export READER="zathura"
export BROWSER="surf.sh"
export TERMINALBROWSER="w3m"

# app settings
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/site-packages
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export MOZ_USE_XINPUT2=1
export NO_AT_BRIDGE=1
export LESSHISTFILE=-

# enable gnome keyring for terminal applications
if [ -n "$DESKTOP_SESSION" ];then
    eval "$(gnome-keyring-daemon --start)"
    export SSH_AUTH_SOCK
fi

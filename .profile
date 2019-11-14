# vim:fileencoding=utf-8:ft=sh:foldmethod=marker

# path:       ~/.profile
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2019-11-14 11:22:22

# path
if [ -d "$HOME/.conky" ] ; then
    PATH="$HOME/.conky:$PATH"
fi
if [ -d "$HOME/coding/python" ] ; then
    PATH="$HOME/coding/python:$PATH"
fi
if [ -d "$HOME/coding/shell" ] ; then
    PATH="$HOME/coding/shell:$PATH"
fi

# export
export TERMINAL="st"
export VISUAL="vim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"
export FILE="ranger"
export READER="zathura"
export BROWSER="qutebrowser"
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.7/site-packages
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export MOZ_USE_XINPUT2=1
export NO_AT_BRIDGE=1

# enable gnome keyring for terminal applications
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

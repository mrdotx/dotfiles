# path:       ~/.profile
# user:       klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-01-24T22:17:21+0100

# projects paths
PATH="$HOME/projects/cmus:$PATH"
PATH="$HOME/projects/conky:$PATH"
PATH="$HOME/projects/i3:$PATH"
PATH="$HOME/projects/maintenance:$PATH"
PATH="$HOME/projects/polybar:$PATH"
PATH="$HOME/projects/python:$PATH"
PATH="$HOME/projects/rclone:$PATH"
PATH="$HOME/projects/rofi:$PATH"
PATH="$HOME/projects/shell:$PATH"
PATH="$HOME/projects/st:$PATH"
PATH="$HOME/projects/stopwatch:$PATH"
PATH="$HOME/projects/surf:$PATH"
PATH="$HOME/projects/system:$PATH"

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
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

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
export RANGER_LOAD_DEFAULT_RC=false
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

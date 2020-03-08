#!/bin/sh

# path:       ~/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-08T18:44:39+0100

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userxprofile=$HOME/.xprofile
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
sysxprofile=/etc/xprofile

# merge in defaults and keymaps
[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        # shellcheck disable=SC1090
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# enable gnome keyring for terminal applications
eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK

# start programs before window manager
# shellcheck disable=SC1090
[ -f $sysxprofile ] && . $sysxprofile
# shellcheck disable=SC1090
[ -f "$userxprofile" ] && . "$userxprofile"

# default window manager
wm=${1:-i3}

case $wm in
    i3|i3wm) exec i3 ;;
    kodi) exec kodi-standalone ;;
    # if $wm not known, try to run string as command
    *) exec "$1" ;;
esac

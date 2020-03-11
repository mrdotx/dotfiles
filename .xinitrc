#!/bin/sh

# path:       ~/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-11T18:41:35+0100

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

# start applications, before graphical environment is launched
# shellcheck disable=SC1090
[ -f $sysxprofile ] && . $sysxprofile
# shellcheck disable=SC1090
[ -f "$userxprofile" ] && . "$userxprofile"

# start graphical environment
if [ "$TERM" = linux ] ; then
    # default session
    session=${1:-i3}
    case $session in
        i3|i3wm) exec dbus-launch --sh-syntax --exit-with-session i3 ;;
        bspwm) exec dbus-launch --sh-syntax --exit-with-session bspwm ;;
        kodi) exec dbus-launch --sh-syntax --exit-with-session kodi-standalone ;;
        # if $session is not known, try to run string as command
        *) exec dbus-launch --sh-syntax --exit-with-session "$1" ;;
    esac
fi

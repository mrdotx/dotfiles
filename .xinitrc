#!/bin/sh

# path:       ~/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-21T19:26:41+0100

user_resources=$HOME/.Xresources
user_modmap=$HOME/.Xmodmap
sys_resources=/etc/X11/xinit/.Xresources
sys_modmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[ -f $sys_resources ] && xrdb -merge $sys_resources
[ -f $sys_modmap ] && xmodmap $sys_modmap
[ -f "$user_resources" ] && xrdb -merge "$user_resources"
[ -f "$user_modmap" ] && xmodmap "$user_modmap"

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        # shellcheck disable=SC1090
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# autostart applications
xautolock -detectsleep &    # auto lock/suspend device
xbanish &                   # remove mouse cursor on keypress

# start graphical environment
if [ "$TERM" = linux ] ; then
    # default session
    session=${1:-i3}
    case $session in
        i3|i3wm) exec i3 ;;
        kodi) exec kodi-standalone ;;
        # if $session is not known, try to run string as command
        *) exec "$1" ;;
    esac
fi

#!/bin/sh

# path:       /home/klassiker/.xinitrc
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-06-06T11:05:40+0200

user_resources=$HOME/.config/xorg/Xresources
user_modmap=$HOME/.config/xorg/Xmodmap
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

# gnupg ssh agent support
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    export SSH_AUTH_SOCK
fi

# keyboard
setxkbmap -model pc105 -layout us,de -option grp:caps_switch
xset r rate 300 50

# mouse
xinput --set-prop 'Synaptics TM3242-001' 'libinput Tapping Enabled' 0
xinput --set-prop 'Synaptics TM3242-001' 'libinput Natural Scrolling Enabled' 1

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

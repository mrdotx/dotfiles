#!/bin/sh

# path:   /home/klassiker/.xinitrc
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-03-23T12:14:24+0100

# merge in defaults and keymaps
[ -f /etc/X11/xinit/.Xresources ] \
    && xrdb -merge /etc/X11/xinit/.Xresources
[ -f /etc/X11/xinit/.Xmodmap ] \
    && xmodmap /etc/X11/xinit/.Xmodmap
[ -f "$HOME/.config/xorg/Xresources" ] \
    && xrdb -merge "$HOME/.config/xorg/Xresources"
[ -f "$HOME/.config/xorg/Xmodmap" ] \
    && xmodmap "$HOME/.config/xorg/Xmodmap"

# start some programs
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        # shellcheck disable=SC1090
        [ -x "$f" ] \
            && . "$f"
    done
    unset f
fi

# gnupg ssh agent support
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
    export SSH_AUTH_SOCK
fi

# start window manager
session="${1:-i3}"
[ "$TERM" = linux ] \
    && case "$session" in
        i3)
            exec i3
            ;;
        kodi)
            exec kodi-standalone
            ;;
        *)
            exec "$1"
            ;;
    esac

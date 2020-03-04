#!/bin/sh

# path:       ~/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-04T16:24:49+0100

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userxprofile=$HOME/.xprofile
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
sysxprofile=/etc/xprofile

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

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
if [ -f $sysxprofile ]; then
    # shellcheck disable=SC1090
    . $sysxprofile
fi

if [ -f "$userxprofile" ]; then
    # shellcheck disable=SC1090
    . "$userxprofile"
fi

# default window manager
wm=${1:-i3}

case $wm in
    i3|i3wm) exec i3 ;;
    awesome) exec awesome ;;
    bspwm) exec bspwm ;;
    budgie) exec budgie-desktop ;;
    cinnamon) exec cinnamon-session ;;
    deepin) exec startdde ;;
    enlightenment) exec enlightenment_start ;;
    fluxbox) exec startfluxbox ;;
    gnome) exec gnome-session ;;
    gnome-classic) exec gnome-session --session=gnome-classic ;;
    jwm) exec jwm ;;
    kde) exec startplasma-x11 ;;
    kdew) exec startplasma-wayland ;;
    lxde) exec startlxde ;;
    lxqt) exec startlxqt ;;
    mate) exec mate-session ;;
    xfce|xfce4) exec startxfce4 ;;
    openbox) exec openbox-session ;;
    xmonad) exec xmonad ;;
    pekwm) exec pekwm ;;
    catwm) exec catwm ;;
    dwm) exec dwm ;;
    startede) exec startede ;;
    icewm) exec icewm-session ;;
    monsterwm) exec monsterwm ;;
    notion) exec notion ;;
    kodi) exec kodi-standalone ;;
    # no known session, try to run it as command
    *) exec "$1" ;;
esac

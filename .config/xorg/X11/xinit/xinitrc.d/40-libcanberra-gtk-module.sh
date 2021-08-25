#!/bin/sh

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/xorg/X11/xinit/xinitrc.d/40-libcanberra-gtk-module.sh
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-08-25T11:11:58+0200

case "${DESKTOP_SESSION-}" in
  gnome*) # Done by gnome-settings-daemon
  ;;
  *)
    # Extra check in case DESKTOP_SESSION is not set correctly
    if [ -z "${GNOME_DESKTOP_SESSION_ID-}" ]; then
      GTK_MODULES="${GTK_MODULES:+$GTK_MODULES:}canberra-gtk-module"
      export GTK_MODULES
    fi
  ;;
esac

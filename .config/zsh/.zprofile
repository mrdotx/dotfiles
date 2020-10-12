# path:       /home/klassiker/.config/zsh/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-10-12T21:05:34+0200

if systemctl -q is-active multi-user.target && [ ! $DISPLAY ] && [ $XDG_VTNR -eq 1 ] ; then
    exec startx > ~/.local/share/xorg/Xorg.log 2>&1
fi

# path:       ~/.config/zsh/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-11T14:02:24+0100

if systemctl -q is-active graphical.target && [ ! $DISPLAY ] && [ $XDG_VTNR -eq 1 ] ; then
    exec startx $HOME/.xinitrc i3 -- -keeptty -nolisten tcp > "$HOME/.local/share/xorg/Xsession-errors" 2>&1
fi

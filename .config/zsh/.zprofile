# path:       ~/.config/zsh/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-20T10:47:03+0100

if systemctl -q is-active multi-user.target && [ ! $DISPLAY ] && [ $XDG_VTNR -eq 1 ] ; then
    exec startx $HOME/.xinitrc i3 -- -keeptty -nolisten tcp > "$HOME/.local/share/xorg/Xsession-errors" 2>&1
fi

# path:       ~/.config/zsh/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-25T12:43:11+0100

if systemctl -q is-active multi-user.target && [ ! $DISPLAY ] && [ $XDG_VTNR -eq 1 ] ; then
    exec startx $HOME/.config/X11/xinitrc i3 -- -keeptty -nolisten tcp > "$HOME/.local/share/X11/Xsession-errors" 2>&1
fi

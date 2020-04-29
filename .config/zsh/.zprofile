# path:       /home/klassiker/.config/zsh/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-04-29T11:00:02+0200

if systemctl -q is-active multi-user.target && [ ! $DISPLAY ] && [ $XDG_VTNR -eq 1 ] ; then
    exec startx -- -keeptty -nolisten tcp > "$HOME/.local/share/X11/Xsession-errors" 2>&1
fi

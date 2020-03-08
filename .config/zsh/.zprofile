# path:       ~/.config/zsh/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-08T18:26:38+0100

if systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx ~/.xinitrc i3 2> "$HOME/.local/share/xorg/Xsession-errors"
fi

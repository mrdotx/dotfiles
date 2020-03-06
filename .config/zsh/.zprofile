# path:       ~/.config/zsh/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-06T19:36:32+0100

if systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx 2> "$HOME/.local/share/xorg/Xsession-errors"
fi

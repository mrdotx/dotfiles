# path:       ~/.bash_profile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-05T13:47:38+0100

# shellcheck disable=SC1090
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

if systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx 2> "$HOME/.local/share/xorg/Xsession-errors"
fi

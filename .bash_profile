# path:       ~/.bash_profile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-05T08:42:42+0100

# shellcheck disable=SC1090
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

if systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    startx 2> "$HOME/.local/share/xorg/Xsession-errors"
fi

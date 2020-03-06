# path:       ~/.bash_profile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-06T19:25:54+0100

# shellcheck disable=SC1090
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

# shellcheck disable=SC1090
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

if systemctl -q is-active graphical.target && [ ! "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx 2> "$HOME/.local/share/xorg/Xsession-errors"
fi

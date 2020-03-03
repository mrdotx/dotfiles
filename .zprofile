# path:       ~/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-03T09:04:35+0100

# shellcheck disable=SC1090
[ -f "$HOME/.profile" ] && source "$HOME/.profile"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    startx
fi

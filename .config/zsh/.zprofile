# path:   /home/klassiker/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-05-28T10:11:05+0200

if systemctl -q is-active graphical.target \
    && [ ! $DISPLAY ] \
    && [ $XDG_VTNR -eq 1 ]; then
        exec startx > "$HOME/.local/share/xorg/Xorg.log" 2>&1
fi

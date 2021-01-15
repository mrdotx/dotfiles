# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-01-15T13:10:30+0100

if systemctl -q is-active multi-user.target \
    && [ ! $DISPLAY ] \
    && [ $XDG_VTNR -eq 1 ]; then
        exec startx > "$HOME/.local/share/xorg/Xorg.log" 2>&1
fi

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-06-24T11:03:22+0200

systemctl -q is-active graphical.target \
    && [ -z $DISPLAY ] \
    && [ $XDG_VTNR -eq 1 ] \
    && exec startx > "$HOME/.local/share/xorg/Xorg.log" 2>&1

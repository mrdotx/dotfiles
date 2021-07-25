# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-07-25T19:49:24+0200

systemctl -q is-active multi-user.target \
    && [ -z $DISPLAY ] \
    && [ $XDG_VTNR -eq 1 ] \
    && exec startx > "$HOME/.local/share/xorg/Xsession.log" 2>&1

# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-07-24T21:09:22+0200

# exec startx > "$HOME/.local/share/xorg/Xsession.log" 2>&1
# exec sx 2> "$HOME/.local/share/xorg/Xsession.log"

systemctl -q is-active multi-user.target \
    && [ -z $DISPLAY ] \
    && [ $XDG_VTNR -eq 1 ] \
    && exec sx 2> "$HOME/.local/share/xorg/Xsession.log"

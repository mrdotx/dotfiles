# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-07-13T21:28:56+0200

systemctl -q is-active multi-user.target \
    && [ -z $DISPLAY ] \
    && [ $XDG_VTNR -eq 1 ] \
    && exec sx 2> "$HOME/.local/share/xorg/Xsession.log"

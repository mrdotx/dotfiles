# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2022-12-21T12:12:42+0100

systemctl -q is-active multi-user.target \
    && [ -z "$SSH_CONNECTION" ] \
    && [ -z "$DISPLAY" ] \
    && [ "$XDG_VTNR" -eq 1 ] \
    && exec startx "$XINITRC" > "$HOME/.local/share/xorg/Xsession.log" 2>&1

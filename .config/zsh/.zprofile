# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/dotfiles
# date:   2025-08-05T05:44:20+0200

systemctl -q is-active multi-user.target \
    && [ -z "$SSH_CONNECTION" ] \
    && [ -z "$DISPLAY" ] \
    && [ "$XDG_VTNR" -eq 1 ] \
    && exec startx "$XINITRC" > "$HOME/.local/share/xorg/Xsession.log" 2>&1

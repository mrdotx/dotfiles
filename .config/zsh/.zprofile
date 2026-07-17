# path:   /home/klassiker/Projects/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# url:    https://github.com/mrdotx/dotfiles
# date:   2026-07-17T02:37:18+0200

systemctl -q is-active multi-user.target \
    && [ -z "$SSH_CONNECTION" ] \
    && [ -z "$DISPLAY" ] \
    && [ "$XDG_VTNR" -eq 1 ] \
    && exec startx "$XINITRC" > "$HOME/.local/share/xorg/Xsession.log" 2>&1

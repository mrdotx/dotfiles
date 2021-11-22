# path:   /home/klassiker/.local/share/repos/dotfiles/.config/zsh/.zprofile
# author: klassiker [mrdotx]
# github: https://github.com/mrdotx/dotfiles
# date:   2021-11-22T11:03:08+0100

# xserver settings (xset q)
# -ardelay 200 = auto repeat delay [200]
# -arinterval 20 = 1000 / repeat rate [1000 / 50]
xserver="-ardelay 200 -arinterval 20"

systemctl -q is-active multi-user.target \
    && [ -z $DISPLAY ] \
    && [ $XDG_VTNR -eq 1 ] \
    && exec startx "$XINITRC" -- $xserver \
        > "$HOME/.local/share/xorg/Xsession.log" 2>&1

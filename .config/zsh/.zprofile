# path:       ~/.config/zsh/.zprofile
# author:     klassiker [mrdotx]
# github:     https://github.com/mrdotx/dotfiles
# date:       2020-03-11T11:17:03+0100

[ -z $DISPLAY ] && [ $XDG_VTNR -eq 1 ] && exec startx $HOME/.xinitrc i3 -- -keeptty -nolisten tcp > "$HOME/.local/share/xorg/Xsession-errors" 2>&1

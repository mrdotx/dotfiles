" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/reload.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2025-05-11T05:41:25+0200

" if tmux is running reload tmux config whenever tmux config is updated
autocmd BufWritePost *.config/tmux/tmux.conf
    \ !pgrep tmux >/dev/null 2>&1
    \ && tmux source-file ~/.config/tmux/tmux.conf

" merge xrdb whenever xresources are updated
autocmd BufWritePost *.config/X11/Xresources.d/*
                   \,*.config/X11/Xresources
    \ !xrdb -merge ~/.config/X11/Xresources
autocmd BufWritePost *.config/X11/Xresources.d/wallpaper
    \ !systemctl --user restart wallpaper.service

" reload i3 whenever i3 configs are updated
autocmd BufWritePost *.config/i3/*
                   \,*.config/X11/Xresources
    \ !i3-msg -- reload >/dev/null 2>&1

" restart polybar whenever polybar configs are updated
autocmd BufWritePost *.config/polybar/*
                   \,*.config/X11/Xresources
                   \,*.config/X11/Xresources.d/polybar
    \ !systemctl --user restart polybar.service

" restart dunst whenever dunst config is updated
autocmd BufWritePost *.config/dunst/dunstrc
    \ !killall dunst && notify-send 'i3' 'dunst restarted'

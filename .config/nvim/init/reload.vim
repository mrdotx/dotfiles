" path:   /home/klassiker/Projects/repos/dotfiles/.config/nvim/init/reload.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-07-17T02:31:14+0200

" if tmux is running reload tmux config whenever the tmux config is updated
autocmd BufWritePost *.config/tmux/tmux.conf
    \ silent !pgrep tmux >/dev/null 2>&1
    \ && tmux source-file ~/.config/tmux/tmux.conf

" merge xrdb whenever the xresources configs are updated
autocmd BufWritePost *.config/X11/Xresources.d/*
                   \,*.config/X11/Xresources
    \ silent !xrdb -merge ~/.config/X11/Xresources
autocmd BufWritePost *.config/X11/Xresources.d/wallpaper
    \ silent !systemctl --user restart wallpaper.service

" reload i3 whenever the i3 configs are updated
autocmd BufWritePost *.config/i3/*
                   \,*.config/X11/Xresources
    \ silent !i3-msg -- reload >/dev/null 2>&1

" restart polybar whenever the polybar configs are updated
autocmd BufWritePost *.config/polybar/*
                   \,*.config/X11/Xresources
                   \,*.config/X11/Xresources.d/polybar
    \ silent !systemctl --user restart polybar.service

" reload dunst whenever the dunst config is updated
autocmd BufWritePost *.config/dunst/dunstrc
    \ silent !dunstctl reload

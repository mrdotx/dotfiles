" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/filetypes.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2024-06-06T17:46:16+0200

" enable spell check
autocmd FileType tex,latex,markdown,gitcommit
    \ setlocal spell spelllang=en_us,de_de

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

" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/filetypes.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2023-03-26T10:35:27+0200

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

" edit gpg encrypted files
augroup encrypt
    autocmd!
    " disable temporary data
    autocmd BufReadPre,FileReadPre *.asc,*.gpg
        \ set viminfo=
        \ | set noswapfile noundofile nobackup
    " binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre *.asc,*.gpg
        \ set bin
        \ | let ch_save = &ch
        \ | set ch=2
    autocmd BufReadPost,FileReadPost *.asc,*.gpg
        \ '[,']!gpg --quiet --decrypt
    " normal mode for editing
    autocmd BufReadPost,FileReadPost *.asc,*.gpg
        \ set nobin
        \ | let &ch = ch_save
        \ | unlet ch_save
        \ | execute ":doautocmd BufReadPost ".expand("%:r")
    " convert text to encrypted data before writing
    autocmd BufWritePre,FileWritePre *.asc
        \ '[,']!gpg --quiet --encrypt --armor --default-recipient-self
    autocmd BufWritePre,FileWritePre *.gpg
        \ set bin
        \ | '[,']!gpg --quiet --encrypt --default-recipient-self
    autocmd BufWritePost,FileWritePost *.asc,*.gpg u
augroup END

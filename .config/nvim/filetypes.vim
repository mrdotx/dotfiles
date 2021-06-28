" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/filetypes.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-06-28T09:25:53+0200

" enable spell check
autocmd FileType tex,latex,markdown,gitcommit
    \ setlocal spell spelllang=en_us,de_de

" restart i3 and picom whenever i3 config is updated
autocmd BufWritePost *.config/i3/config
    \ !i3-msg -- restart >/dev/null 2>&1
    \ && systemctl --user restart picom.service
" restart polybar whenever polybar configs are updated
autocmd BufWritePost *.config/polybar/*
    \ !systemctl --user restart polybar.service
" run xrdb whenever xresources are updated
autocmd BufWritePost *.config/xorg/*
    \ !xrdb -merge ~/.config/xorg/Xresources
" if tmux is running reload tmux config whenever tmux config is updated
autocmd BufWritePost *.config/tmux/tmux.conf
    \ !pgrep tmux >/dev/null 2>&1
    \ && tmux source-file ~/.config/tmux/tmux.conf

" edit gpg encrypted files
augroup encrypt
    autocmd!
    " disable temporary data
    autocmd BufReadPre,FileReadPre *.asc,*.gpg
        \ set viminfo= |
        \ set noswapfile noundofile nobackup
    " binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre *.asc,*.gpg
        \ set bin |
        \ let ch_save = &ch |
        \ set ch=2
    autocmd BufReadPost,FileReadPost *.asc,*.gpg
        \ '[,']!gpg --quiet --decrypt
    " normal mode for editing
    autocmd BufReadPost,FileReadPost *.asc,*.gpg
        \ set nobin |
        \ let &ch = ch_save |
        \ unlet ch_save |
        \ execute ":doautocmd BufReadPost ".expand("%:r")
    " convert text to encrypted data before writing
    autocmd BufWritePre,FileWritePre *.asc
        \ '[,']!gpg --quiet --encrypt --armor --default-recipient-self
    autocmd BufWritePre,FileWritePre *.gpg
        \ set bin |
        \ '[,']!gpg --quiet --encrypt --default-recipient-self
    autocmd BufWritePost,FileWritePost *.asc,*.gpg u
augroup END

" last modfied | actual path
" if buffer modified, update any 'date: ' \ 'path: ' in the first 10 lines.
" 'date: ' | 'path: ' can have up to 4 characters before (they are retained).
" restores cursor and window position using save_cursor variable.
function! ModDate()
    if &modified
        let save_cursor=getpos(".")
        let n=min([10, line("$")])
        if &ft =~ 'vimwiki\|markdown'
            keepjumps execute '1,'.n.'s#^\(.\{,4}date: \).*#\1'.
                \ strftime('           %FT%T%z').'#e'
        else
            keepjumps execute '1,'.n.'s#^\(.\{,4}date: \).*#\1' .
                \ strftime('  %FT%T%z').'#e'
        endif
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfunction
autocmd BufWritePre * call ModDate()

function! ModPath()
    if &modified
        let save_cursor=getpos(".")
        let n=min([10, line("$")])
        keepjumps execute '1,'.n.'s#^\(.\{,4}path: \).*#\1'.
            \ '  '.expand('%:p').'#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfunction
autocmd BufWritePre * call ModPath()

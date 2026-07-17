" path:   /home/klassiker/Projects/repos/dotfiles/.config/nvim/init/encrypt.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-07-17T02:30:56+0200

" edit gpg encrypted files
augroup encrypt
    autocmd!
    " disable temporary data
    autocmd BufReadPre,FileReadPre *.asc,*.gpg
        \ setlocal viminfo=
        \ | setlocal noswapfile noundofile nobackup
    " binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre *.asc,*.gpg
        \ setlocal binary
    autocmd BufReadPost,FileReadPost *.asc,*.gpg
        \ silent %!gpg --quiet --decrypt
    " normal mode for editing
    autocmd BufReadPost,FileReadPost *.asc,*.gpg
        \ setlocal nobinary
        \ | execute ":doautocmd BufReadPost ".expand("%:r")
    " convert text to encrypted data before writing
    autocmd BufWritePre,FileWritePre *.asc
        \ %!gpg --quiet --encrypt --default-recipient-self --armor
    autocmd BufWritePre,FileWritePre *.gpg
        \ setlocal binary
        \ | %!gpg --quiet --encrypt --default-recipient-self
    autocmd BufWritePost,FileWritePost *.asc,*.gpg
        \ silent undo
augroup END

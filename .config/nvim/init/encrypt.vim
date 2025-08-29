" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/encrypt.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2025-08-29T04:38:07+0200

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
        \ | let ch_save=&ch
        \ | set ch=2
    autocmd BufReadPost,FileReadPost *.asc,*.gpg
        \ '[,']!gpg --quiet --decrypt
    " normal mode for editing
    autocmd BufReadPost,FileReadPost *.asc,*.gpg
        \ set nobin
        \ | let &ch=ch_save
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

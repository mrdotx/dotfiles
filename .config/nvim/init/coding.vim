" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/coding.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-01-25T06:34:13+0100

" general
set autoindent                      " indent when moving to the next line
set foldmethod=indent               " enable folding
set foldlevel=99                    " folds with higher level will be closed

" style guide
set encoding=utf-8                  " file encoding
set tabstop=4                       " number of visual spaces per TAB
set softtabstop=4                   " number of spaces in tab when editing
set shiftwidth=4                    " the size of an indent
set colorcolumn=80,100,120          " show width indicator

" file type specific
filetype on                         " enable file type detection
filetype plugin on                  " load the plugins for specific file types
filetype indent on                  " automatically indent code

autocmd FileType tex,markdown setlocal spell spelllang=en_us,de_de
autocmd FileType gitcommit setlocal spell spelllang=en_us colorcolumn=50,72

" disables automatic commenting on newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" indentation
let g:spaces_enabled=1
function! IndentationToggle()
    if g:spaces_enabled==1
        set expandtab               " tabs are spaces
        inoremap <s-tab> <c-v><tab>
        let g:spaces_enabled=0
    else
        set noexpandtab             " tabs are tabulators
        inoremap <s-tab> <c-v><space><space><space><space>
        let g:spaces_enabled=1
    endif
endfunction
silent! call IndentationToggle()

" mark characters
let g:mark_characters_enabled=0
function! MarkCharactersToggle()
    if g:mark_characters_enabled==1
        call matchdelete(g:match_nonascii)
        call matchdelete(g:match_trailingspace)
        let g:mark_characters_enabled=0
    else
        " non ascii characters
        let g:match_nonascii=matchadd('ErrorMsg', '[^\d0-\d255]')
        " trailing space
        let g:match_trailingspace=matchadd('ExtraWhitespace', '\s\+$')
        let g:mark_characters_enabled=1
    endif
endfunction
silent! call MarkCharactersToggle()

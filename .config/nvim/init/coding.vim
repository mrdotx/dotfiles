" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/coding.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-01-23T06:28:16+0100

" file type specific settings
filetype on                         " enable file type detection
filetype plugin on                  " load the plugins for specific file types
filetype indent on                  " automatically indent code

let python_highlight_all=1          " enable all python syntax highlightings
set foldmethod=indent               " enable folding
set foldlevel=99
set encoding=utf-8                  " file encoding
" disables automatic commenting on newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" mark characters
let g:mark_characters_enabled=0
function! MarkCharactersToggle()
    if g:mark_characters_enabled==1
        call matchdelete(g:match_nonascii)
        call matchdelete(g:match_trailingspace)
        let g:mark_characters_enabled=0
    else
        " match non ascii characters
        let g:match_nonascii=matchadd('ErrorMsg', '[^\d0-\d255]', 42)
        " match trailing space
        let g:match_trailingspace=matchadd('ExtraWhitespace', '\s\+$', 42)
        let g:mark_characters_enabled=1
    endif
endfunction
silent! call MarkCharactersToggle()

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

" style guide
set tabstop=4                       " number of visual spaces per TAB
set softtabstop=4                   " number of spaces in tab when editing
set shiftwidth=4                    " the size of an indent
set autoindent                      " indent when moving to the next line
set colorcolumn=80                  " show width indicator

" enable spell check
autocmd FileType tex,latex,markdown,gitcommit
    \ setlocal spell spelllang=en_us,de_de

" python pep 8 style guide
function! AutoPy()
    set textwidth=79
    set fileformat=unix
endfunction
autocmd BufNewFile,BufRead *.py call AutoPy()

" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/coding.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2025-02-22T05:47:46+0100

let python_highlight_all=1          " enable all python syntax highlightings
set foldmethod=indent               " enable folding
set foldlevel=99
set encoding=utf-8                  " file encoding
" disables automatic commenting on newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" mark characters
let g:mark_characters_enabled = 0
function! MarkCharactersToggle()
    if g:mark_characters_enabled == 1
        call matchdelete(g:match_nonascii)
        call matchdelete(g:match_trailingspace)
        let g:mark_characters_enabled = 0
    else
        " match non ascii characters
        let g:match_nonascii = matchadd('ErrorMsg', '[^\d0-\d255]', 42)
        " match trailing space
        let g:match_trailingspace = matchadd('ExtraWhitespace', '\s\+$', 42)
        let g:mark_characters_enabled = 1
    endif
endfunction
silent! call MarkCharactersToggle()

" style guide
set tabstop=4                       " number of visual spaces per TAB
set softtabstop=4                   " number of spaces in tab when editing
set shiftwidth=4                    " the size of an indent
set expandtab                       " tabs are spaces
set autoindent                      " indent when moving to the next line
set colorcolumn=80                  " show width indicator

" python pep 8 style guide
function! AutoPy()
    set textwidth=79
    set fileformat=unix
endfunction
autocmd BufNewFile,BufRead *.py call AutoPy()

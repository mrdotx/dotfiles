" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/coding.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2023-03-26T10:26:43+0200

let python_highlight_all=1          " enable all python syntax highlightings
set foldmethod=indent               " enable folding
set foldlevel=99
set encoding=utf-8                  " file encoding
" disables automatic commenting on newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" mark extra white space
autocmd BufNewFile,BufRead * match ExtraWhitespace /\s\+$/

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

" get correct comment highlighting for json
autocmd FileType json syntax match Comment +\/\/.\+$+

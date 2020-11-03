" path:       /home/klassiker/.config/nvim/coding.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-11-02T10:15:03+0100

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

" templates
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.md 0r $HOME/.config/nvim/templates/skeleton.md
        autocmd BufNewFile *.sh 0r $HOME/.config/nvim/templates/skeleton.sh
        autocmd BufNewFile *.py 0r $HOME/.config/nvim/templates/skeleton.py
        autocmd BufNewFile *.c 0r $HOME/.config/nvim/templates/skeleton.c
        autocmd BufNewFile *.md,*.sh,*.py,*.c inoremap <space><space> <esc>/<++><enter>"_c4l
        autocmd BufNewFile *.md,*.sh,*.py,*.c startinsert
    augroup END
endif

" last modfied | actual path
" if buffer modified, update any 'date: ' \ 'path: ' in the first 10 lines.
" 'date: ' | 'path: ' can have up to 4 characters before (they are retained).
" restores cursor and window position using save_cursor variable.
function! ModDate()
    if &modified
        let save_cursor=getpos(".")
        let n=min([10, line("$")])
        if &ft =~ 'vimwiki\|markdown'
            keepjumps exe '1,' . n . 's#^\(.\{,4}date: \).*#\1' .
                \ strftime('              %FT%T%z') . '#e'
        else
            keepjumps exe '1,' . n . 's#^\(.\{,4}date: \).*#\1' .
                \ strftime('      %FT%T%z') . '#e'
        endif
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
autocmd BufWritePre * call ModDate()

function! ModPath()
    if &modified
        let save_cursor=getpos(".")
        let n=min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,4}path: \).*#\1' .
            \ '      ' . expand('%:p') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
autocmd BufWritePre * call ModPath()
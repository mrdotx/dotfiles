" path:       ~/.config/nvim/dev.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-02-13T16:37:13+0100

" style guide
" number of visual spaces per TAB
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" the size of an indent
set shiftwidth=4
" tabs are spaces
set expandtab
" indent when moving to the next line while writing code
set autoindent

" python pep 8 style guide
function! AutoPy()
    set textwidth=79
    set fileformat=unix
endfunction
autocmd BufNewFile,BufRead *.py call AutoPy()

" templates
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.md 0r $HOME/.config/nvim/templates/skeleton.md
        autocmd BufNewFile *.md inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        autocmd BufNewFile *.sh 0r $HOME/.config/nvim/templates/skeleton.sh
        autocmd BufNewFile *.sh inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        autocmd BufNewFile *.py 0r $HOME/.config/nvim/templates/skeleton.py
        autocmd BufNewFile *.py inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        autocmd BufNewFile *.c 0r $HOME/.config/nvim/templates/skeleton.c
        autocmd BufNewFile *.c inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
    augroup END
endif

" last modfied
" if buffer modified, update any 'date: ' in the first 10 lines.
" 'date: ' can have up to 4 characters before (they are retained).
" restores cursor and window position using save_cursor variable.
function! ModDate()
    if &modified
        let save_cursor=getpos(".")
        let n=min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,4}date: \).*#\1' .
            \ strftime('      %FT%T%z') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
autocmd BufWritePre * call ModDate()

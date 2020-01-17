" path:       ~/.config/nvim/config/coding.vimrc
" user:       klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-01-17T10:14:03+0100

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

" file explore
com!  -nargs=* -bar -bang -complete=dir  Lexplore  call netrw#Lexplore(<q-args>, <bang>0)

fun! Lexplore(dir, right)
    if exists("t:netrw_lexbufnr")
    " close down netrw explorer window
    let lexwinnr = bufwinnr(t:netrw_lexbufnr)
    if lexwinnr != -1
        let curwin = winnr()
        exe lexwinnr."wincmd w"
        close
        exe curwin."wincmd w"
    endif
    unlet t:netrw_lexbufnr

    else
        " open netrw explorer window in the dir of current file
        " (even on remote files)
        let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
        exe (a:right? "botright" : "topleft")." vertical ".((g:netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
        if a:dir != ""
            exe "Explore ".a:dir
        else
            exe "Explore ".path
        endif
        setlocal winfixwidth
        let t:netrw_lexbufnr = bufnr("%")
    endif
endfun

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=-28
let g:netrw_sort_sequence='[\/]$,*'
let g:netrw_ftp_cmd='ftp -p'

" templates
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.md 0r $HOME/.config/nvim/templates/skeleton.md
        autocmd BufNewFile *.md inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        autocmd BufNewFile *.sh 0r $HOME/.config/nvim/templates/skeleton.sh
        autocmd BufNewFile *.sh inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        autocmd BufNewFile *.py 0r $HOME/.config/nvim/templates/skeleton.py
        autocmd BufNewFile *.py inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
    augroup END
endif

" last modfied
" If buffer modified, update any 'date: ' in the first 10 lines.
" 'date: ' can have up to 4 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! ModifiedDate()
    if &modified
        let save_cursor=getpos(".")
        let n=min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,4}date: \).*#\1' .
            \ strftime('      %FT%T%z') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
autocmd BufWritePre * call ModifiedDate()

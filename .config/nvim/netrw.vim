" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/netrw.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-01-15T12:52:16+0100

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=-28
let g:netrw_sort_sequence='[\/]$,*'
let g:netrw_ftp_cmd='ftp -p'
let g:netrw_dirhistmax=0
let g:netrw_is_open=0

function! NetrwToggle()
    if g:netrw_is_open
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:netrw_is_open=0
    else
        let g:netrw_is_open=1
        silent Lexplore
    endif
endfunction

function! NetrwOpen(cmd)
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright' a:cmd g:path
    :normal <c-l>
    :call NetrwToggle()
endfunction

" close netrw if it's the only buffer open
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

" change directory to the current buffer when opening files.
set autochdir

" autostart netrw
" autocmd VimEnter * :call NetrwToggle()

" keybindings
function! NetrwMappings()
    noremap <buffer> <c-l> <c-w>l
    noremap <silent> <c-f> :call NetrwToggle()<cr>
    noremap <silent> T :call NetrwOpen("tabnew")<cr>
    noremap <buffer> V :call NetrwOpen("vnew")<cr>
    noremap <buffer> H :call NetrwOpen("new")<cr>
endfunction

augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END

nnoremap <silent> <leader><leader> :call NetrwToggle()<cr>

" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/goyo.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2025-08-05T05:30:06+0200

function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    set noshowmode
    set noshowcmd
    autocmd! numbertoggle
    set norelativenumber
    set nonumber
    set scrolloff=999
    set wrap
    set nolist
    hi Normal ctermbg=black
    hi Normal guibg=black
endfunction

function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    set showmode
    set showcmd
    set number relativenumber
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END
    set scrolloff=5
    set nowrap
    set list
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:goyo_before()
    let b:quitting=0
    let b:quitting_bang=0
    autocmd QuitPre <buffer> let b:quitting=1
    cabbrev <buffer> q! let b:quitting_bang=1 <bar> q!
endfunction

function! s:goyo_after()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

let g:goyo_callbacks=[function('s:goyo_before'), function('s:goyo_after')]

" keybindings
nnoremap <silent>   <leader>g   :Goyo<cr>

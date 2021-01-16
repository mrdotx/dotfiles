" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/syntastic.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-01-16T12:50:11+0100

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" location list toggle
command! LToggle call s:LListToggle()

function! s:LListToggle() abort
    let buffer_count_before = s:BufferCount()
    " can't close if there's cursor in it
    silent! lclose
    silent! lclose

    if s:BufferCount() == buffer_count_before
        silent! lopen
    endif
endfunction

function! s:BufferCount() abort
    return len(filter(range(1, bufnr('$')), 'bufwinnr(v:val) != -1'))
endfunction

" keybindings
nnoremap    <silent>    <leader>.       :LToggle<cr>
nnoremap    <silent>    <leader>;       :lprev<cr>
nnoremap    <silent>    <leader>'       :lnext<cr>

nnoremap                <leader>S       :SyntasticToggleMode<cr>

" path:   /home/klassiker/Projects/repos/dotfiles/.config/nvim/init/plugins/lightline.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-07-17T02:29:11+0200

" gitgutter status
function! GitGutterStatus()
    let [l:add,l:change,l:remove]=GitGutterGetHunkSummary()
    if l:add==0 && l:change==0 && l:remove==0 | return '' | endif
    let l:indicators=[]
    if l:add!=0
        call add(l:indicators, '󰐗 '.l:add)
    endif
    if l:change!=0
        call add(l:indicators, '󰆗 '.l:change)
    endif
    if l:remove!=0
        call add(l:indicators, '󰍶 '.l:remove)
    endif
    return join(l:indicators, ' ')
endfunction

" coc status
function! CocDiagnosticStatus() abort
    let l:info=get(b:, 'coc_diagnostic_info', {})
    if empty(l:info) | return '' | endif
    let l:indicators=[]
    if get(l:info, 'error', 0)
        call add(l:indicators, '󰅙 '.l:info['error'])
    endif
    if get(l:info, 'warning', 0)
        call add(l:indicators, '󰀨 '.l:info['warning'])
    endif
    if get(l:info, 'information', 0)
        call add(l:indicators, '󰋼 '.l:info['information'])
    endif
    if get(l:info, 'hint', 0)
        call add(l:indicators, '󰋗 '.l:info['hint'])
    endif
    return join(l:indicators, ' ').get(g:, 'coc_status', '')
endfunction

" filename, modified and readonly combined
function! FilenameModifiedReadonly()
    let l:filename=expand('%:t') !=# '' ? expand('%:t') : '[no name] '
    let l:indicators=[]
    if &readonly!=0 || &modified!=0
        call add(l:indicators, '[')
        if &readonly!=0
            call add(l:indicators, 'r')
        endif
        if &modified!=0
            call add(l:indicators, '+')
        endif
        call add(l:indicators, ']')
    endif
    return l:filename.join(l:indicators, '')
endfunction

" lightline elements
let g:lightline={
    \ 'colorscheme': 'klassiker',
    \ 'subseparator': {
        \ 'left': '│',
        \ 'right': '│'
    \ },
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'gitstatus' ],
        \           [ 'filename_modified_readonly', 'spell' ] ],
        \ 'right': [ [ 'line_info' ],
        \            [ 'cocstatus' ],
        \            [ 'file_type', 'file_encoding' ] ]
    \ },
    \ 'inactive': {
        \ 'left': [ [ 'filename' ],
        \           [ 'gitstatus' ] ],
        \ 'right': [ [ 'line_info' ],
        \            [ 'cocstatus' ] ]
    \ },
    \ 'component': {
        \ 'file_encoding': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
        \ 'file_type': '%{&ft!=#""?&ft:"[no ft]"}',
        \ 'line_info': '%1p%% ↓%1l/%L≡ →%-1v%<'
    \ },
    \ 'component_function': {
        \ 'gitstatus': 'GitGutterStatus',
        \ 'filename_modified_readonly': 'FilenameModifiedReadonly',
        \ 'cocstatus': 'CocDiagnosticStatus'
    \ }
\ }

" use autocmd to force lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

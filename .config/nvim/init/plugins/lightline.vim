" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/lightline.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2022-05-07T08:37:52+0200

" klassiker color scheme
"   color           =  gui          ,term
let s:black1        = ['#333333'    ,8  ]
let s:red0          = ['#df2800'    ,1  ]
let s:green0        = ['#00b200'    ,2  ]
let s:yellow0       = ['#b0b200'    ,3  ]
let s:blue1         = ['#4185d7'    ,12 ]
let s:magenta0      = ['#980096'    ,5  ]
let s:cyan0         = ['#008081'    ,6  ]
let s:white0        = ['#cccccc'    ,7  ]
let s:white1        = ['#ffffff'    ,15 ]

let s:grey0         = ['#121212'    ,233]
let s:grey1         = ['#2b2b2b'    ,234]
let s:grey2         = ['#666666'    ,242]

let s:p = {
    \ 'normal': {
        \ 'left': [ [ s:white1, s:blue1 ],
        \           [ s:white0, s:grey2 ],
        \           [ s:white0, s:grey1 ] ],
        \ 'middle': [ [ s:white0, s:grey1 ] ],
        \ 'right': [ [ s:white1, s:blue1 ],
        \            [ s:white0, s:grey2 ] ],
        \ 'error': [ [ s:red0, s:grey1 ] ],
        \ 'warning': [ [ s:yellow0, s:black1 ] ]
    \ },
    \ 'inactive': {
        \ 'left': [ [ s:white0, s:grey2 ],
        \           [ s:grey2, s:grey1 ] ],
        \ 'middle': [ [ s:white0, s:grey0 ] ],
        \ 'right': [ [ s:white0, s:grey2 ],
        \            [ s:grey2, s:black1 ] ]
    \ },
    \ 'insert': {
        \ 'left': [ [ s:white1, s:green0 ],
        \           [ s:white0, s:grey2 ],
        \           [ s:white0, s:grey1 ] ],
        \ 'right': [ [ s:white1, s:green0 ],
        \            [ s:white0, s:grey2 ] ]
    \ },
    \ 'replace': {
        \ 'left': [ [ s:white1, s:red0 ],
        \           [ s:white0, s:grey2 ],
        \           [ s:white0, s:grey1 ] ],
        \ 'right': [ [ s:white1, s:red0 ],
        \            [ s:white0, s:grey2 ] ]
    \ },
    \ 'visual': {
        \ 'left': [ [ s:white1, s:magenta0 ],
        \           [ s:white0, s:grey2 ],
        \           [ s:white0, s:grey1 ] ],
        \ 'right': [ [ s:white1, s:magenta0 ],
        \            [ s:white0, s:grey2 ] ]
    \ },
    \ 'tabline': {
        \ 'left': [ [ s:white0, s:grey2 ] ],
        \ 'middle': [ [ s:white0, s:grey1 ] ],
        \ 'right': [ [ s:white0, s:grey1 ] ],
        \ 'tabsel': [ [ s:white1, s:blue1 ] ]
    \ }
\ }

let g:lightline#colorscheme#klassiker#palette = lightline#colorscheme#flatten(s:p)

" gitgutter status
function! GitGutterStatus()
    let [l:add,l:change,l:remove] = GitGutterGetHunkSummary()
    if l:add==0 && l:change==0 && l:remove==0 | return '' | endif
    let l:indicators=[]
    if l:add!=0
        call add(l:indicators, ' '.l:add)
    endif
    if l:change!=0
        call add(l:indicators, ' '.l:change)
    endif
    if l:remove!=0
        call add(l:indicators, ' '.l:remove)
    endif
    return join(l:indicators, ' ')
endfunction

" coc status
function! CocDiagnosticStatus() abort
    let l:info = get(b:, 'coc_diagnostic_info', {})
    if empty(l:info) | return '' | endif
    let l:indicators=[]
    if get(l:info, 'error', 0)
        call add(l:indicators, ' '.l:info['error'])
    endif
    if get(l:info, 'warning', 0)
        call add(l:indicators, ' '.l:info['warning'])
    endif
    if get(l:info, 'information', 0)
        call add(l:indicators, ' '.l:info['information'])
    endif
    if get(l:info, 'hint', 0)
        call add(l:indicators, ' '.l:info['hint'])
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
let g:lightline = {
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

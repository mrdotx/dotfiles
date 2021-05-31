" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/lightline.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-31T21:39:42+0200

" klassiker color scheme
let s:black     = [ '#121212', 233 ]
let s:red       = [ '#df2800', 1 ]
let s:green     = [ '#00b200', 2 ]
let s:yellow    = [ '#b0b200', 3 ]
let s:blue      = [ '#4185d7', 12 ]
let s:magenta   = [ '#980096', 5 ]
let s:cyan      = [ '#008081', 6 ]
let s:white     = [ '#ffffff', 15 ]

let s:base0     = [ '#2b2b2b', 234 ]
let s:base1     = [ '#333333', 8 ]
let s:base2     = [ '#666666', 242 ]
let s:base3     = [ '#cccccc', 251 ]

let s:p = {
    \ 'normal': {
        \ 'left': [ [ s:white, s:blue ],
        \           [ s:base3, s:base2 ],
        \           [ s:base3, s:base0 ] ],
        \ 'middle': [ [ s:base3, s:base0 ] ],
        \ 'right': [ [ s:white, s:blue ],
        \            [ s:base3, s:base2 ] ],
        \ 'error': [ [ s:red, s:base0 ] ],
        \ 'warning': [ [ s:yellow, s:base1 ] ]
    \ },
    \ 'inactive': {
        \ 'left': [ [ s:base3, s:base2 ],
        \           [ s:base2, s:base0 ] ],
        \ 'middle': [ [ s:base3, s:black ] ],
        \ 'right': [ [ s:base3, s:base2 ],
        \            [ s:base2, s:base1 ] ]
    \ },
    \ 'insert': {
        \ 'left': [ [ s:white, s:green ],
        \           [ s:base3, s:base2 ],
        \           [ s:base3, s:base0 ] ],
        \ 'right': [ [ s:white, s:green ],
        \            [ s:base3, s:base2 ] ]
    \ },
    \ 'replace': {
        \ 'left': [ [ s:white, s:red ],
        \           [ s:base3, s:base2 ],
        \           [ s:base3, s:base0 ] ],
        \ 'right': [ [ s:white, s:red ],
        \            [ s:base3, s:base2 ] ]
    \ },
    \ 'visual': {
        \ 'left': [ [ s:white, s:magenta ],
        \           [ s:base3, s:base2 ],
        \           [ s:base3, s:base0 ] ],
        \ 'right': [ [ s:white, s:magenta ],
        \            [ s:base3, s:base2 ] ]
    \ },
    \ 'tabline': {
        \ 'left': [ [ s:base3, s:base2 ] ],
        \ 'middle': [ [ s:base3, s:base0 ] ],
        \ 'right': [ [ s:base3, s:base0 ] ],
        \ 'tabsel': [ [ s:white, s:blue ] ]
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

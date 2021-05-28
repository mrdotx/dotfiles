" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/lightline.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-28T17:37:27+0200

" klassiker colorscheme
let s:red       = [ '#df2800', 1 ]
let s:green     = [ '#00b200', 2 ]
let s:yellow    = [ '#b0b200', 3 ]
let s:blue      = [ '#4185d7', 12 ]
let s:magenta   = [ '#980096', 5 ]
let s:cyan      = [ '#008081', 6 ]
let s:white     = [ '#ffffff', 15 ]

let s:base0     = [ '#2b2b2b', 234 ]
let s:base1     = [ '#333333', 237 ]
let s:base2     = [ '#666666', 242 ]
let s:base3     = [ '#cccccc', 251 ]

let s:p = {
    \ 'normal': {},
    \ 'inactive': {},
    \ 'insert': {},
    \ 'replace': {},
    \ 'visual': {},
    \ 'tabline': {}
    \ }

let s:p.normal.left     = [ [ s:white, s:blue ], [ s:base3, s:base0 ] ]
let s:p.normal.middle   = [ [ s:base3, s:base0 ] ]
let s:p.normal.right    = [ [ s:white, s:blue ], [ s:base3, s:base2 ] ]
let s:p.normal.error    = [ [ s:red, s:base0 ] ]
let s:p.normal.warning  = [ [ s:yellow, s:base1 ] ]

let s:p.inactive.right  = [ [ s:white, s:base2 ], [ s:base2, s:base0 ] ]
let s:p.inactive.middle = [ [ s:base3, s:base0 ] ]
let s:p.inactive.left   = [ [ s:white, s:base2 ], [ s:base2, s:base1 ] ]

let s:p.insert.left     = [ [ s:white, s:green ], [ s:base3, s:base2 ] ]
let s:p.replace.left    = [ [ s:white, s:red ], [ s:base3, s:base2 ] ]
let s:p.visual.left     = [ [ s:white, s:magenta ], [ s:base3, s:base2 ] ]

let s:p.tabline.left    = copy(s:p.normal.middle)
let s:p.tabline.tabsel  = [ [ s:white, s:blue ] ]
let s:p.tabline.middle  = copy(s:p.normal.middle)
let s:p.tabline.right   = copy(s:p.tabline.middle)

let g:lightline#colorscheme#klassiker#palette = lightline#colorscheme#flatten(s:p)

" coc status function
function! CocStatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E:' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W:' . info['warning'])
    endif
    if get(info, 'information', 0)
        call add(msgs, 'I:' . info['information'])
    endif
    if get(info, 'hint', 0)
        call add(msgs, 'H:' . info['hint'])
    endif
    return join(msgs, ' | ') . get(g:, 'coc_status', '')
endfunction

" lightline elements
let g:lightline = {
    \ 'colorscheme': 'klassiker',
    \ 'subseparator': {
        \ 'left': '|', 'right': '|' },
    \ 'active': {
		\ 'left': [ [ 'mode', 'paste' ],
		\           [ 'readonly', 'filename', 'modified' ] ],
		\ 'right': [ [ 'percent', 'lineinfo' ],
		\            [ 'cocstatus' ],
		\            [ 'filetype', 'fileencoding', 'fileformat' ] ] },
	\ 'inactive': {
		\ 'left': [ [ 'filename' ] ],
		\ 'right': [ [ 'percent', 'lineinfo' ],
		\            [ 'cocstatus' ] ] },
    \ 'component_function': {
        \ 'cocstatus': 'CocStatusDiagnostic' },
\ }

" use autocmd to force lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

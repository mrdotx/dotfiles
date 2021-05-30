" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/lightline.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-30T16:03:20+0200

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
    \ 'normal': {},
    \ 'inactive': {},
    \ 'insert': {},
    \ 'replace': {},
    \ 'visual': {},
    \ 'tabline': {}
\ }

let s:p.normal.left     = [ [ s:white, s:blue ],
                            \ [ s:base3, s:base2 ],
                            \ [ s:base3, s:base0 ] ]
let s:p.normal.middle   = [ [ s:base3, s:base0 ] ]
let s:p.normal.right    = [ [ s:white, s:blue ],
                            \ [ s:base3, s:base2 ] ]
let s:p.normal.error    = [ [ s:red, s:base0 ] ]
let s:p.normal.warning  = [ [ s:yellow, s:base1 ] ]

let s:p.inactive.left   = [ [ s:base3, s:base2 ],
                            \ [ s:base2, s:base0 ] ]
let s:p.inactive.middle = [ [ s:base3, s:black ] ]
let s:p.inactive.right  = [ [ s:base3, s:base2 ],
                            \ [ s:base2, s:base1 ] ]

let s:p.insert.left     = [ [ s:white, s:green ],
                            \ [ s:base3, s:base2 ],
                            \ [ s:base3, s:base0 ] ]
let s:p.insert.right    = [ [ s:white, s:green ],
                            \ [ s:base3, s:base2 ] ]

let s:p.replace.left    = [ [ s:white, s:red ],
                            \ [ s:base3, s:base2 ],
                            \ [ s:base3, s:base0 ] ]
let s:p.replace.right   = [ [ s:white, s:red ],
                            \ [ s:base3, s:base2 ] ]

let s:p.visual.left     = [ [ s:white, s:magenta ],
                            \ [ s:base3, s:base2 ],
                            \ [ s:base3, s:base0 ] ]
let s:p.visual.right    = [ [ s:white, s:magenta ],
                            \ [ s:base3, s:base2 ] ]

let s:p.tabline.left    = [ [ s:base3, s:base2 ] ]
let s:p.tabline.middle  = copy(s:p.normal.middle)
let s:p.tabline.right   = copy(s:p.tabline.middle)
let s:p.tabline.tabsel  = [ [ s:white, s:blue ] ]

let g:lightline#colorscheme#klassiker#palette = lightline#colorscheme#flatten(s:p)

" gitgutter status
function! GitGutterStatus()
    let [l:a,l:m,l:r] = GitGutterGetHunkSummary()
    if l:a==0 && l:m==0 && l:r==0 | return '' | endif
    let l:msgs = []
    if l:a!=0
        call add(l:msgs, '+'.l:a)
    endif
    if l:m!=0
        call add(l:msgs, '~'.l:m)
    endif
    if l:r!=0
        call add(l:msgs, '-'.l:r)
    endif
    return join(l:msgs, ' ')
endfunction

" coc status
function! CocStatusDiagnostic() abort
    let l:info = get(b:, 'coc_diagnostic_info', {})
    if empty(l:info) | return '' | endif
    let l:msgs = []
    if get(l:info, 'error', 0)
        call add(l:msgs, 'E'.l:info['error'])
    endif
    if get(l:info, 'warning', 0)
        call add(l:msgs, 'W'.l:info['warning'])
    endif
    if get(l:info, 'information', 0)
        call add(l:msgs, 'I'.l:info['information'])
    endif
    if get(l:info, 'hint', 0)
        call add(l:msgs, 'H'.l:info['hint'])
    endif
    return join(msgs, ' ').get(g:, 'coc_status', '')
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
		\           [ 'readonly', 'filename', 'modified' ] ],
		\ 'right': [ [ 'line_info' ],
		\            [ 'cocstatus' ],
		\            [ 'filetype', 'file_encoding' ] ]
    \ },
	\ 'inactive': {
		\ 'left': [ [ 'filename' ],
        \           [ 'gitstatus' ] ],
		\ 'right': [ [ 'line_info' ],
		\            [ 'cocstatus' ] ]
    \ },
    \ 'component': {
		\ 'file_encoding': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
        \ 'line_info': '%1p%% ↓%1l/%L≡ →%-1v'
    \ },
    \ 'component_function': {
        \ 'gitstatus': 'GitGutterStatus',
        \ 'cocstatus': 'CocStatusDiagnostic'
    \ },
\ }

" use autocmd to force lightline update
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

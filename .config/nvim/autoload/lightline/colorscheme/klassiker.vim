" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/autoload/lightline/colorscheme/klassiker.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2025-08-29T04:44:56+0200

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
let s:grey2         = ['#585858'    ,240]

let s:p={
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

let g:lightline#colorscheme#klassiker#palette=lightline#colorscheme#flatten(s:p)

" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/vim-gitgutter.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-01-15T12:51:06+0100

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:gitgutter_preview_win_floating=1

highlight GitGutterAdd guifg=#00ff00 ctermfg=Green
highlight GitGutterChange guifg=#ffff55 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff0000 ctermfg=Red

nmap <leader>]  <Plug>(GitGutterNextHunk)
nmap <leader>[  <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)
nmap <leader>hf :GitGutterFold<cr>

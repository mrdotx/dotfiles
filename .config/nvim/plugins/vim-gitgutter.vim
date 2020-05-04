" path:       /home/klassiker/.config/nvim/plugins/vim-gitgutter.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-04T10:13:39+0200

highlight GitGutterAdd guifg=#00ff00 ctermfg=Green
highlight GitGutterChange guifg=#ffff55 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff0000 ctermfg=Red
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

nmap <leader>] <Plug>(GitGutterNextHunk)
nmap <leader>[ <Plug>(GitGutterPrevHunk)

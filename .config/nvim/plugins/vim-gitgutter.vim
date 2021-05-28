" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/vim-gitgutter.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-28T11:53:32+0200

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:gitgutter_preview_win_floating=1

highlight GitGutterAdd guifg=#00ff00 ctermfg=Green
highlight GitGutterChange guifg=#ffff55 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff0000 ctermfg=Red

" keybindings
nmap                <leader>[   <Plug>(GitGutterPrevHunk)
nmap                <leader>]   <Plug>(GitGutterNextHunk)
nmap                <leader>hp  <Plug>(GitGutterPreviewHunk)
nmap                <leader>hs  <Plug>(GitGutterStageHunk)
nmap                <leader>hu  <Plug>(GitGutterUndoHunk)
nnoremap <silent>   <leader>hf  :GitGutterFold<cr>

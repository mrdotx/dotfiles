" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/vim-gitgutter.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-06-28T11:56:30+0200

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:gitgutter_preview_win_floating=1
let g:gitgutter_grep='grep --color=never'

let g:gitgutter_sign_added=''
let g:gitgutter_sign_modified=''
let g:gitgutter_sign_removed=''
let g:gitgutter_sign_removed_first_line=''
let g:gitgutter_sign_removed_above_and_below=''
let g:gitgutter_sign_modified_removed=''

highlight GitGutterDelete guifg=#df2800 ctermfg=1
highlight GitGutterAdd guifg=#00b200 ctermfg=2
highlight GitGutterChange guifg=#b0b200 ctermfg=3

" keybindings
nmap                <leader>[   <Plug>(GitGutterPrevHunk)
nmap                <leader>]   <Plug>(GitGutterNextHunk)
nmap                <leader>hp  <Plug>(GitGutterPreviewHunk)
nmap                <leader>hs  <Plug>(GitGutterStageHunk)
nmap                <leader>hu  <Plug>(GitGutterUndoHunk)
nnoremap <silent>   <leader>hf  :GitGutterFold<cr>

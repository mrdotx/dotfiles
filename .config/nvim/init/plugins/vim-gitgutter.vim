" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/vim-gitgutter.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2024-05-21T17:37:41+0200

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0
let g:gitgutter_close_preview_on_escape=1
let g:gitgutter_grep='grep --color=never'

let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='┃'
let g:gitgutter_sign_removed_first_line='┏'
let g:gitgutter_sign_removed_above_and_below='┣'
let g:gitgutter_sign_modified_removed='╏'

" keybindings
nmap                <leader>[   <Plug>(GitGutterPrevHunk)
nmap                <leader>]   <Plug>(GitGutterNextHunk)
nmap                <leader>p   <Plug>(GitGutterPreviewHunk)
nmap                <leader>h   <Plug>(GitGutterStageHunk)
nmap                <leader>u   <Plug>(GitGutterUndoHunk)
nnoremap <silent>   <leader>d   :GitGutterDiffOrig<cr><c-w>w
nnoremap <silent>   <leader>f   :GitGutterFold<cr>

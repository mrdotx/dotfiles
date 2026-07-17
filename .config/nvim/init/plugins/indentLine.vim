" path:   /home/klassiker/Projects/repos/dotfiles/.config/nvim/init/plugins/indentLine.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2026-07-17T02:29:08+0200

"let g:indentLine_enabled=0
let g:indentLine_char='┆'
"let g:indentLine_char_list=['|', '¦', '┆', '┊']
let g:indentLine_indentLevel=6

let g:indentLine_fileTypeExclude=['which_key', 'vimwiki', 'coc-explorer', 'help']
let g:indentLine_bufTypeExclude=['help', 'terminal']

" keybindings
nnoremap <silent>   <leader>vi   :IndentLinesToggle<cr>

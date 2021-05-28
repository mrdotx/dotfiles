" path:   /home/klassiker/.config/nvim/plugins/indentLine.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-28T10:03:05+0200

" let g:indentLine_enabled = 0
let g:indentLine_char = '┆'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_indentLevel = 6

let g:indentLine_fileTypeExclude = ['vimwiki', 'coc-explorer', 'help', 'json']
let g:indentLine_bufTypeExclude = ['help', 'terminal']

" keybindings
nnoremap <silent>   <leader>i   :IndentLinesToggle<cr>

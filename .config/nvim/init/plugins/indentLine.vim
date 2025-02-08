" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/indentLine.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2025-02-08T07:26:52+0100

"let g:indentLine_enabled = 0
let g:indentLine_char = '┆'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_indentLevel = 6

let g:indentLine_fileTypeExclude = ['which_key', 'vimwiki', 'coc-explorer', 'help']
let g:indentLine_bufTypeExclude = ['help', 'terminal']

" keybindings
nnoremap <silent>   <leader>vi   :IndentLinesToggle<cr>

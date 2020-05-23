" path:       /home/klassiker/.config/nvim/plugins/syntastic.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-23T12:20:47+0200

autocmd FileType sh let b:coc_diagnostic_disable=1

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

nnoremap <leader>S :SyntasticToggleMode<cr>

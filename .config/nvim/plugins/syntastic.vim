" path:       ~/.config/nvim/plugins/syntastic.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-04-29T07:48:21+0200

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

nnoremap <leader>S :SyntasticToggleMode<CR>

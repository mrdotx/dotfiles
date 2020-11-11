" path:       /home/klassiker/.config/nvim/plugins/vim-airline.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-11-11T14:54:50+0100

let g:airline_powerline_fonts=0
let g:airline_symbols_ascii=0
let g:airline_theme='base16_klassiker'
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#coc#enabled=1
let g:airline#extensions#hunks#non_zero_only=1

" remove ln symbol
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ''

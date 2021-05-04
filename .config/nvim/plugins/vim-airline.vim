" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/vim-airline.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-04T13:17:13+0200

let g:airline_powerline_fonts=0
let g:airline_symbols_ascii=0
let g:airline_theme='base16_klassiker'

" default enabled airline extensions (check with :AirlineExtensions)
" coc, fzf, hunks, keymap, netrw, po, quickfix, syntastic, term, whitespace, wordcount
let g:airline_extensions = ['coc', 'hunks', 'netrw', 'quickfix', 'syntastic', 'term', 'whitespace']
let g:airline#extensions#hunks#non_zero_only=1

" remove airline symbols and add ln/☰/cn symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = 'y'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = 'x'

" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/keybindings.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-23T12:55:16+0200

" switch/exchange windows
nnoremap                <tab>           <c-w>w
nnoremap                <S-tab>         <c-w>x

" buffers
nnoremap <silent>       <leader>b/      :buffers<cr>
nnoremap <silent>       <leader>bd      :bdelete<cr>
nnoremap <silent>       <leader>bf      :bfirst<cr>
nnoremap <silent>       <leader>bk      :bwipeout<cr>
nnoremap <silent>       <leader>bl      :blast<cr>
nnoremap <silent>       <leader>bm      :bmodified<cr>
nnoremap <silent>       <leader>bp      :bprevious<cr>
nnoremap <silent>       <leader>bn      :bnext<cr>

" turn off search highlight
nnoremap <silent>       <leader><space> :nohlsearch<cr>

" goyo straight writing
nnoremap <silent>       <leader>g       :Goyo<cr>

" show hidden characters
nnoremap <silent>       <leader>l       :set list! list?<cr>
nnoremap <silent>       <leader>i       :IndentLinesToggle<cr>

" spell check
nnoremap <silent>       <leader>de      :setlocal spell! spelllang=en_us<cr>
nnoremap <silent>       <leader>dg      :setlocal spell! spelllang=de_de<cr>
nnoremap <silent>       <leader>dx      :setlocal spell! spelllang=en_us,de_de<cr>

" terminal
nnoremap <expr>         <leader>t       ":" . winheight(0)/3 . "split term://"
                                        \ . "%"
nnoremap <silent><expr> <leader>s       ":" . winheight(0)/3 . "split term://"
                                        \ . "shellcheck -x -s sh %<cr>"

" replace
nnoremap                <leader>r       :%s///gc<left><left><left>

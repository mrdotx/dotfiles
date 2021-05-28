" path:   /home/klassiker/.config/nvim/keybindings.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-28T10:02:19+0200

" switch/exchange windows
nnoremap                <tab>       <c-w>w
nnoremap                <S-tab>     <c-w>x

" turn off search highlight
nnoremap <silent>       <leader>/   :nohlsearch<cr>

" buffers
nnoremap <silent>       <leader>b/  :buffers<cr>
nnoremap <silent>       <leader>bd  :bdelete<cr>
nnoremap <silent>       <leader>bf  :bfirst<cr>
nnoremap <silent>       <leader>bk  :bwipeout<cr>
nnoremap <silent>       <leader>bl  :blast<cr>
nnoremap <silent>       <leader>bm  :bmodified<cr>
nnoremap <silent>       <leader>bp  :bprevious<cr>
nnoremap <silent>       <leader>bn  :bnext<cr>

" spell check
nnoremap <silent>       <leader>de  :setlocal spell! spelllang=en_us<cr>
nnoremap <silent>       <leader>dg  :setlocal spell! spelllang=de_de<cr>
nnoremap <silent>       <leader>dx  :setlocal spell! spelllang=en_us,de_de<cr>

" show hidden characters
nnoremap <silent>       <leader>l   :set list! list?<cr>

" replace
nnoremap                <leader>r   :%s///gc<left><left><left>

" terminal
nnoremap <silent><expr> <leader>s   ":".winheight(0)/3
                                    \ ."split term://shellcheck -x -s sh %<cr>"
nnoremap <expr>         <leader>t   ":".winheight(0)/3
                                    \ ."split term://%"

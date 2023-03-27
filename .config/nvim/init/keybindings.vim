" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/keybindings.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2023-03-27T08:15:08+0200

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
nnoremap <silent>       <leader>bn  :bnext<cr>
nnoremap <silent>       <leader>bp  :bprevious<cr>

" spell check
nnoremap <silent>       <leader>se  :setlocal spell! spelllang=en_us<cr>
nnoremap <silent>       <leader>sg  :setlocal spell! spelllang=de_de<cr>
nnoremap <silent>       <leader>sx  :setlocal spell! spelllang=en_us,de_de<cr>

" show hidden characters
nnoremap <silent>       <leader>l   :set list! list?<cr>

" replace
nnoremap                <leader>r   :%s///gc<left><left><left>
nnoremap <silent>       <leader>rs  :%s/\s\+$//e<cr>
nnoremap <silent>       <leader>rt  :%s/	/    /g<cr>

" terminal execution
nnoremap <silent><expr> <leader>c   ":TermExec shellcheck -x "
                                    \ .expand('%:p')."<cr>"
nnoremap <expr>         <leader>t   ":TermExec "
                                    \ .expand('%:p')

" path:       /home/klassiker/.config/nvim/mappings.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-04T10:19:50+0200

" switch cursor window
nnoremap                <tab>               <c-w>w
nnoremap                <S-tab>             <c-w>W

" buffer cycle
nnoremap    <silent>    <leader>b           :bprevious<cr>
nnoremap    <silent>    <leader>B           :bnext<cr>

" turn off search highlight
nnoremap    <silent>    <leader>.           :nohlsearch<cr>

" show hidden characters
nnoremap                <leader>l           :set list! list?<cr>

" spell check
nnoremap                <leader>d           :setlocal spell! spelllang=de_de<cr>
nnoremap                <leader>e           :setlocal spell! spelllang=en_us<cr>

" shellcheck
nnoremap    <silent>    <leader>s           :vs term://shellcheck -s sh %<cr>

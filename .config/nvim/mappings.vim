" path:       /home/klassiker/.config/nvim/mappings.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-02T18:57:51+0200

" switch cursor window
nnoremap                <tab>               <C-w>w
nnoremap                <S-tab>             <C-w>W

" buffer cycle
nnoremap    <silent>    gp                  :bprevious<CR>
nnoremap    <silent>    gn                  :bnext<CR>

" turn off search highlight
nnoremap    <silent>    <leader><space>     :nohlsearch<CR>

" show hidden characters
nnoremap                <leader>l           :set list! list?<CR>

" spell check
nnoremap                <leader>d           :setlocal spell! spelllang=de_de<CR>
nnoremap                <leader>e           :setlocal spell! spelllang=en_us<CR>

" shellcheck
nnoremap    <silent>    <leader>s           :vs term://shellcheck -s sh %<CR>

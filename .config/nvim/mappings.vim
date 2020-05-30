" path:       /home/klassiker/.config/nvim/mappings.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-30T19:50:55+0200

" switch cursor window
nnoremap                <tab>           <c-w>w
nnoremap                <S-tab>         <c-w>W

" buffers
nnoremap    <silent>    <leader>b/      :buffers<cr>
nnoremap    <silent>    <leader>bd      :bdelete<cr>
nnoremap    <silent>    <leader>bf      :bfirst<cr>
nnoremap    <silent>    <leader>bk      :bwipeout<cr>
nnoremap    <silent>    <leader>bl      :blast<cr>
nnoremap    <silent>    <leader>bm      :bmodified<cr>
nnoremap    <silent>    <leader>bp      :bprevious<cr>
nnoremap    <silent>    <leader>bn      :bnext<cr>

" turn off search highlight
nnoremap    <silent>    <leader><space> :nohlsearch<cr>

" goyo straight writing
nnoremap    <silent>    <leader>g       :Goyo<cr>

" show hidden characters
nnoremap                <leader>l       :set list! list?<cr>

" shellcheck
nnoremap    <silent>    <leader>s       :vs term://shellcheck -s sh %<cr>

" spell check
nnoremap    <silent>    <leader>de      :setlocal spell! spelllang=en_us<cr>
nnoremap    <silent>    <leader>dg      :setlocal spell! spelllang=de_de<cr>
nnoremap    <silent>    <leader>dx      :setlocal spell! spelllang=en_us,de_de<cr>

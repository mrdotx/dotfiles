" path:       ~/.config/nvim/config/keys.vimrc
" user:       klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-01-20T17:30:46+0100

" shortcuts
" leader is comma
let mapleader=","
" file explore in split window
map         <leader><leader>    :Lexplore<CR>
" autocomplete goto
map         <leader>g           :YcmCompleter GoToDefinitionElseDeclaration<CR>
" switch cursor window
nnoremap    <tab>               <C-w>w
nnoremap    <S-tab>             <C-w>W
" buffer cycle
nnoremap    <leader>b           :bprevious<CR>
" turn off search highlight
nnoremap    <leader><space>     :nohlsearch<CR>
" show hidden characters
map         <leader>l           :set list! list?<CR>
" spell-check, shellcheck, syntastic
map         <leader>d           :setlocal spell! spelllang=de_de<CR>
map         <leader>e           :setlocal spell! spelllang=en_us<CR>
map         <leader>s           :vs term://shellcheck -s sh %<CR>
map         <leader>S           :SyntasticToggleMode<CR>
" copy vimwiki to webserver
map         <leader>n           :!$HOME/projects/miscellaneous/pandoc/copy.sh<CR>

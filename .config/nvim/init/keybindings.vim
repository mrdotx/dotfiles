" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/keybindings.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2025-07-07T05:11:56+0200

" tabulator
inoremap                <s-tab>     <c-v><tab>

" switch/exchange windows
nnoremap                <tab>       <c-w>w
nnoremap                <s-tab>     <c-w>x

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

" language
nnoremap <silent>       <leader>le  :setlocal spell! spelllang=en_us<cr>
nnoremap <silent>       <leader>lg  :setlocal spell! spelllang=de_de<cr>
nnoremap <silent>       <leader>lx  :setlocal spell! spelllang=en_us,de_de<cr>

" visible characters
nnoremap <silent>       <leader>vc  :set cursorcolumn! cursorcolumn?<cr>
nnoremap <silent>       <leader>vh  :set list! list?<cr>
nnoremap <silent>       <leader>vl  :set cursorline! cursorline?<cr>
nnoremap <silent>       <leader>vw  :set wrap! wrap?<cr>
nnoremap <silent>       <leader>vm  :call MarkCharactersToggle()<cr>

" replace
nnoremap                <leader>r   :%s///gc<left><left><left>
nnoremap <silent>       <leader>s   :%s/\s\+$//e<cr>
nnoremap <silent>       <leader>t   :%s/	/    /g<cr>

" terminal execution
nnoremap                <leader>e   :TermExec %:p
nnoremap <silent>       <leader>n   :TermExec fzf_ssh.sh --exec m625q sync_notes.sh<cr>

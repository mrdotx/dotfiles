" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/keybindings.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-25T10:21:21+0200

" switch/exchange windows
nnoremap            <tab>           <c-w>w
nnoremap            <S-tab>         <c-w>x

" turn off search highlight
nnoremap <silent>   <localleader>/  :nohlsearch<cr>

" replace
nnoremap            <localleader>r  :%s///gc<left><left><left>

" terminal
function! TermSplit(ratio,cmd)
    execute winheight(0)/a:ratio."split term://".a:cmd
endfunction
nnoremap <silent>   <localleader>s  :call TermSplit('3','shellcheck -x -s sh %')<cr>
nnoremap            <localleader>t  :call TermSplit('3','%')<left><left>

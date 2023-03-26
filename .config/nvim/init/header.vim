" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/header.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2023-03-26T10:34:25+0200

" last modfied | actual path
" if buffer modified, update any 'date: ' | 'path: ' in the first 10 lines.
"   'date: ' | 'path: ' can have up to 4 characters before (they are retained).
" restores cursor and window position using save_cursor variable.
function! ModifyHeader()
    if &modified
        let save_cursor=getpos(".")
        let n=min([10, line("$")])
        " 'path: '
        keepjumps execute '1,'.n.'s#^\(.\{,4}path: \).*#\1'.
            \ '  '.expand('%:p').'#e'
        call histdel('search', -1)
        " 'date: '
        if &ft=~'vimwiki\|markdown'
            keepjumps execute '1,'.n.'s#^\(.\{,4}date: \).*#\1'.
                \ strftime('           %FT%T%z').'#e'
        else
            keepjumps execute '1,'.n.'s#^\(.\{,4}date: \).*#\1'.
                \ strftime('  %FT%T%z').'#e'
        endif
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfunction
autocmd BufWritePre * call ModifyHeader()

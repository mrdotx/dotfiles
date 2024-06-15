" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/commands.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2024-06-14T07:29:33+0200

" command to write current buffer as root
command W :execute ':silent w !$EXEC_AS_USER tee % > /dev/null' | :edit!
command Wq :execute ':silent w !$EXEC_AS_USER tee % > /dev/null' | :quit!

" command for terminal execution in split window
command -nargs=1 -complete=file -bar TermExec
    \ :execute winheight(0)/3'split term://<args>'

" command to sort by delimiter and column
function! SortColumn(delimiter, column)
    execute ':%!sort -t"'.a:delimiter.'" -k'.a:column
endfunction
command -nargs=* SortColumn
    \ call SortColumn(<f-args>)

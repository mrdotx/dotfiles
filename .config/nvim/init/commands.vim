" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/commands.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2025-02-19T07:02:15+0100

" write current buffer as root
command W :silent execute 'w !$EXEC_AS_USER tee ' .
    \ shellescape(@%, 1) . ' >/dev/null' | :edit!
command Wq :silent execute 'w !$EXEC_AS_USER tee ' .
    \ shellescape(@%, 1) . ' >/dev/null' | :quit!

" terminal execution in split window
command -nargs=1 -complete=file -bar TermExec
    \ :execute winheight(0)/3'split term://<args>'

" sort by delimiter and column
function! SortColumn(delimiter, column)
    execute ':%!sort -t"'.a:delimiter.'" -k'.a:column
endfunction
command -nargs=* SortColumn
    \ call SortColumn(<f-args>)

" upgrade/-date plug and coc
command Up PlugUpgrade | PlugUpdate | CocUpdate

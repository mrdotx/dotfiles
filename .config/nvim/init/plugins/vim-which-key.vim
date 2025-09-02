" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/vim-which-key.vim
" author: klassiker [mrdotx]
" url:    https://github.com/mrdotx/dotfiles
" date:   2025-09-02T04:48:43+0200

set timeoutlen=500                  " by default timeoutlen is 1000 ms

let g:which_key_sep='»'
let g:which_key_fallback_to_native_key=1
let g:which_key_display_names={ ' ': 'space' }
let g:which_key_disable_default_offset=1
let g:which_key_centered=0

" color mappings
hi default link WhichKey          SpecialChar
hi default link WhichKeySeperator SpecialComment
hi default link WhichKeyGroup     Comment
hi default link WhichKeyDesc      Normal
hi default link WhichKeyFloating  NormalFloat

" define description dictionaries
call which_key#register(',', "g:main_dict")
call which_key#register(' ', "g:coc_dict")
call which_key#register('g', "g:goto_dict")

" main description dictionary
let g:main_dict={
    \ 'name': '+main',
    \ ',': 'netrw file explorer',
    \ '.': {
        \ 'name': '+remote',
        \ 'b': 'macbook',
        \ 'd': 'm75q',
        \ 'm': 'm625q',
        \ 'n': 't14',
        \ 'p': 'prinzipal',
        \ 'r': 'marcus'
    \ },
    \ '/': 'reset search highlighting',
    \ '[': 'goto previous changed git hunk',
    \ ']': 'goto next changed git hunk',
    \ 'b': {
        \ 'name': '+buffer',
        \ '/': 'buffer list',
        \ 'd': 'delete buffer',
        \ 'f': 'first buffer',
        \ 'k': 'kill buffer',
        \ 'l': 'last buffer',
        \ 'm': 'next modified buffer',
        \ 'n': 'next buffer',
        \ 'p': 'previous buffer'
    \ },
    \ 'd': 'diff origin',
    \ 'e': 'execute terminal command',
    \ 'f': 'fold hunk',
    \ 'g': 'goyo',
    \ 'h': 'stage hunk',
    \ 'i': 'indentation toggle',
    \ 'l': {
        \ 'name': '+language',
        \ 'g': 'german toggle',
        \ 'e': 'english toggle',
        \ 'x': 'english and german toggle'
    \ },
    \ 'n': 'sync notes to webserver',
    \ 'p': 'preview hunk',
    \ 'r': {
        \ 'name': '+replace',
        \ '4': '4 spaces with tabs',
        \ 'r': 'remove trailing spaces',
        \ 's': 'searched string',
        \ 't': 'tabs with 4 spaces'
    \ },
    \ 'u': 'undo hunk',
    \ 'v': {
        \ 'name': '+visibility',
        \ 'c': 'screen column highlight toggle',
        \ 'h': 'hidden characters toggle',
        \ 'i': 'indent line toggle',
        \ 'l': 'text line highlight toggle',
        \ 'm': 'mark characters toggle',
        \ 'w': 'wrap line toggle'
    \ },
    \ 'w': {
        \ 'name': '+vimwiki',
        \ ',': {
            \ 'name': '+dairy',
            \ 'i': 'generate links',
            \ 'm': 'make tomorrow note',
            \ 't': 'make note new tab',
            \ 'w': 'make note',
            \ 'y': 'make yesterday note'
        \ },
        \ 'i': 'open diary',
        \ 's': 'select vimwiki',
        \ 't': 'open vimwiki new tab',
        \ 'w': 'open vimwiki'
    \ },
    \ 'x': 'hex edit'
\ }

" coc description dictionary
let g:coc_dict={
    \ 'name': '+coc',
    \ '/': 'show all diagnostics',
    \ 'a': 'action selected code',
    \ 'ac': 'action current line',
    \ 'as': 'action whole buffer',
    \ 'c': 'show all commands',
    \ 'cl': 'code lens action current line',
    \ 'e': 'show all extensions',
    \ 'f': 'formating selected code',
    \ 'h': 'inlay hint toggle',
    \ 'j': 'default action next item',
    \ 'k': 'default action previous item',
    \ 'o': 'find symbol current document',
    \ 'p': 'resume latest list',
    \ 'q': {
        \ 'name': '+quickfix',
        \ 'f': 'quickfix current line'
    \ },
    \ 'r': 'refactor selected',
    \ 're': 'refactor',
    \ 'rn': 'rename symbol',
    \ 's': 'search workspace symbols'
\ }

" goto description dictionary
let g:goto_dict={
    \ 'name': '+goto',
    \ '[': 'previous diagnostics list item',
    \ ']': 'next diasnostics list item',
    \ '%': 'matchit operation backward',
    \ 'c': 'comment out',
    \ 'cc': 'comment out line',
    \ 'cgc': 'uncomment block',
    \ 'd': 'definition',
    \ 'i': 'implementation',
    \ 'r': 'references',
    \ 'x': 'netrw browse x',
    \ 'y': 'type definition'
\ }

" keybindings
nnoremap <silent> <leader>      :<c-u>WhichKey ','<cr>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual ','<cr>
nnoremap <silent> <localleader> :<c-u>WhichKey ' '<cr>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ' '<cr>
nnoremap <silent> g             :<c-u>WhichKey 'g'<cr>
vnoremap <silent> g             :<c-u>WhichKeyVisual 'g'<cr>

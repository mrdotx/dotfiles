" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins/vim-which-key.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2025-01-20T07:17:32+0100

let g:which_key_fallback_to_native_key=1
let g:which_key_sep = '»'

" by default timeoutlen is 1000 ms
set timeoutlen=500

" color mappings
highlight default link WhichKey          SpecialChar
highlight default link WhichKeySeperator SpecialComment
highlight default link WhichKeyGroup     Comment
highlight default link WhichKeyDesc      Normal
highlight default link WhichKeyFloating  NormalFloat

" key mappings
nnoremap <silent> <leader>      :<c-u>WhichKey ','<cr>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual ','<cr>
nnoremap <silent> <localleader> :<c-u>WhichKey ' '<cr>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ' '<cr>
nnoremap <silent> g             :<c-u>WhichKey 'g'<cr>
vnoremap <silent> g             :<c-u>WhichKeyVisual 'g'<cr>

" define description dictionaries
call which_key#register(',', "g:main_dict")
call which_key#register(' ', "g:coc_dict")
call which_key#register('g', "g:goto_dict")

" main description dictionary
let g:main_dict = {
    \ 'name': '+main',
    \ ',': 'netrw file explorer',
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
    \ 'n': 'sync notes to webserver',
    \ 'p': 'preview hunk',
    \ 'r': 'replace',
    \ 's': 'remove trailing spaces',
    \ 't': 'replace tabs with 4 spaces',
    \ 'l': {
        \ 'name': '+language',
        \ 'g': 'german toggle',
        \ 'e': 'english toggle',
        \ 'x': 'english and german toggle'
    \ },
    \ 'u': 'undo hunk',
    \ 'v': {
        \ 'name': '+visible',
        \ 'c': 'screen column highlight toggle',
        \ 'h': 'hidden characters toggle',
        \ 'i': 'indent line toggle',
        \ 'l': 'text line highlight toggle',
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
let g:coc_dict = {
    \ 'name': '+coc',
    \ '/': 'show all diagnostics',
    \ 'a': 'action selected code',
    \ 'ac': 'action current line',
    \ 'as': 'action whole buffer',
    \ 'c': 'show all commands',
    \ 'cl': 'code lens action current line',
    \ 'e': 'show all extensions',
    \ 'f': 'formating selected code',
    \ 'h': 'toggle inlay hint',
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
let g:goto_dict = {
    \ 'name': '+goto',
    \ '[': 'previous diagnostics list item',
    \ ']': 'next diasnostics list item',
    \ '%': 'matchit operation backward',
    \ 'c': 'comment',
    \ 'cc': 'comment line',
    \ 'd': 'definition',
    \ 'i': 'implementation',
    \ 'r': 'references',
    \ 'x': 'netrw browse x',
    \ 'y': 'type definition'
\ }

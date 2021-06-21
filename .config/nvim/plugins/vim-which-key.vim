" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/vim-which-key.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-06-21T10:43:04+0200

let g:which_key_fallback_to_native_key=1

" by default timeoutlen is 1000 ms
set timeoutlen=500

" color mappings
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator SpecialComment
highlight default link WhichKeyGroup     Comment
highlight default link WhichKeyDesc      DiffText
highlight default link WhichKeyFloating  Pmenu

" key mappings
nnoremap <silent> <leader>      :<c-u>WhichKey ','<cr>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual ','<cr>
nnoremap <silent> <localleader> :<c-u>WhichKey '.'<cr>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual '.'<cr>
nnoremap <silent> g             :<c-u>WhichKey 'g'<cr>
vnoremap <silent> g             :<c-u>WhichKeyVisual 'g'<cr>

" define description dictionaries
call which_key#register(',', "g:main_dict")
call which_key#register('.', "g:coc_dict")
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
    \ 'd': {
        \ 'name': '+dictionaries',
        \ 'g': 'german toggle',
        \ 'e': 'english toggle',
        \ 'x': 'english and german toggle'
    \ },
    \ 'g': 'goyo',
    \ 'h': {
        \ 'name': '+hunk',
        \ 'f': 'fold',
        \ 'p': 'preview',
        \ 's': 'stage',
        \ 'u': 'undo'
    \ },
    \ 'i': 'toggle indent characters',
    \ 'l': 'toggle control characters',
    \ 'p': 'generate passwords',
    \ 'r': 'replace',
    \ 's': 'shell check posix',
    \ 't': 'terminal',
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
    \ }
\ }

" coc description dictionary
let g:coc_dict = {
    \ 'name': '+coc',
    \ '.': 'show all diagnostics',
    \ 'a': 'action selected code',
    \ 'ac': 'action current line',
    \ 'c': 'show all commands',
    \ 'e': 'show all extensions',
    \ 'f': 'formating selected code',
    \ 'j': 'default action next item',
    \ 'k': 'default action previous item',
    \ 'o': 'find symbol current document',
    \ 'p': 'resume latest list',
    \ 'q': {
        \ 'name': '+quickfix',
        \ 'f': 'autofix current line'
    \ },
    \ 'r': {
        \ 'name': '+rename',
        \ 'n': 'symbol renaming'
    \ },
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

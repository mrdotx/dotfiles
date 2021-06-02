" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/vim-which-key.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-06-02T19:11:24+0200

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
    \ ',': [':call NetrwToggle()'       ,'netrw file explorer'],
    \ '/': [':echo "press faster ,/"'   ,'reset search highlighting'],
    \ '[': ['<Plug>(GitGutterPrevHunk)' ,'goto previous changed git hunk'],
    \ ']': ['<Plug>(GitGutterNextHunk)' ,'goto next changed git hunk'],
    \ 'b': {
        \ 'name': '+buffer',
        \ '/': [':buffers'      ,'buffer list'],
        \ 'd': [':bdelete'      ,'delete buffer'],
        \ 'f': [':bfirst'       ,'first buffer'],
        \ 'k': [':bwipeout'     ,'kill buffer'],
        \ 'l': [':blast'        ,'last buffer'],
        \ 'h': [':bmodified'    ,'next modified buffer'],
        \ 'n': [':bnext'        ,'next buffer'],
        \ 'p': [':bprevious'    ,'previous buffer']
    \ },
    \ 'd': {
        \ 'name': '+dictionaries',
        \ 'g': [':setlocal spell! spelllang=de_de'          ,'german toggle'],
        \ 'e': [':setlocal spell! spelllang=en_us'          ,'english toggle'],
        \ 'x': [':setlocal spell! spelllang=en_us,de_de'    ,'english and german toggle']
    \ },
    \ 'g': [':Goyo'                     ,'goyo'],
    \ 'h': {
        \ 'name': '+hunk',
        \ 'f': [':GitGutterFold'                ,'fold'],
        \ 'p': ['<Plug>(GitGutterPreviewHunk)'  ,'preview'],
        \ 's': ['<Plug>(GitGutterStageHunk)'    ,'stage'],
        \ 'u': ['<Plug>(GitGutterUndoHunk)'     ,'undo']
    \ },
    \ 'i': [':IndentLinesToggle'        ,'toggle indent characters'],
    \ 'l': [':set list! list?'          ,'toggle control characters'],
    \ 'r': [':echo "press faster ,r"'   ,'replace'],
    \ 's': [':echo "press faster ,s"'   ,'shell check posix'],
    \ 't': [':echo "press faster ,t"'   ,'terminal'],
    \ 'w': {
        \ 'name': '+vimwiki',
        \ ',': {
            \ 'name': '+dairy',
            \ 'i': ['<Plug>VimwikiDiaryGenerateLinks'           ,'generate links'],
            \ 'm': ['<Plug>VimwikiDiaryMakeTomorrowDiaryNote'   ,'make tomorrow note'],
            \ 't': ['<Plug>VimwikiDiaryTabMakeDiaryNote'        ,'make note new tab'],
            \ 'w': ['<Plug>VimwikiDiaryMakeDiaryNote'           ,'make note'],
            \ 'y': ['<Plug>VimwikiDiaryMakeYesterdayDiaryNote'  ,'make yesterday note']
        \ },
        \ 'i': ['<Plug>VimwikiDiaryIndex'   ,'open diary'],
        \ 's': ['<Plug>VimwikiUISelect'     ,'select vimwiki'],
        \ 't': ['<Plug>VimwikiTabIndex'     ,'open vimwiki new tab'],
        \ 'w': ['<Plug>VimwikiIndex'        ,'open vimwiki']
    \ }
\ }

" coc description dictionary
let g:coc_dict = {
    \ 'name': '+coc',
    \ '.': [':CocList diagnostics'              ,'show all diagnostics'],
    \ 'a': ['<Plug>(coc-codeaction-selected)'   ,'action selected code'],
    \ 'ac': ['<Plug>(coc-codeaction)'           ,'action current line'],
    \ 'c': [':CocList commands'                 ,'show all commands'],
    \ 'e': [':CocList extensions'               ,'show all extensions'],
    \ 'f': ['<Plug>(coc-format-selected)'       ,'formating selected code'],
    \ 'j': [':CocNext'                          ,'default action next item'],
    \ 'k': [':CocPrev'                          ,'default action previous item'],
    \ 'o': [':CocList outline'                  ,'find symbol current document'],
    \ 'p': [':CocListResume'                    ,'resume latest list'],
    \ 'q': {
        \ 'name': '+quickfix',
        \ 'f': ['<Plug>(coc-fix-current)'   ,'autofix current line']
    \ },
    \ 'r': {
        \ 'name': '+rename',
        \ 'n': ['<Plug>(coc-rename)'    ,'symbol renaming']
    \ },
    \ 's': [':CocList -I symbols'               ,'search workspace symbols']
\ }

" goto description dictionary
let g:goto_dict = {
    \ 'name': '+goto',
    \ '[': ['<Plug>(coc-diagnostic-prev)'       ,'previous diagnostics list item'],
    \ ']': ['<Plug>(coc-diagnostic-next)'       ,'next diasnostics list item'],
    \ '%': ['<Plug>(MatchitOperationBackward)'  ,'matchit operation backward'],
    \ 'c': ['<Plug>Commentary'                  ,'comment'],
    \ 'cc': ['<Plug>CommentaryLine'             ,'comment line'],
    \ 'd': ['<Plug>(coc-definition)'            ,'definition'],
    \ 'i': ['<Plug>(coc-implementation)'        ,'implementation'],
    \ 'r': ['<Plug>(coc-references)'            ,'references'],
    \ 'x': ['<Plug>NetrwBrowseX'                ,'netrw browse x'],
    \ 'y': ['<Plug>(coc-type-definition)'       ,'type definition']
\ }

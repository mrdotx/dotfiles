" path:       /home/klassiker/.config/nvim/plugins/vim-which-key.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-06-08T12:34:40+0200

" by default timeoutlen is 1000 ms
set timeoutlen=500

" color mappings
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator Identifier
highlight default link WhichKeyGroup     Float
highlight default link WhichKeyDesc      Comment

" key mappings
nnoremap <silent> <leader>  :<c-u>WhichKey ','<cr>
vnoremap <silent> <leader>  :<c-u>WhichKeyVisual ','<cr>
nnoremap <silent> <space>   :<c-u>WhichKey '<space>'<cr>
vnoremap <silent> <space>   :<c-u>WhichKeyVisual '<space>'<cr>

" define description dictionaries
call which_key#register(',', "g:comma_dict")
call which_key#register(' ', "g:space_dict")

" description dictionary mappings
let g:comma_dict = {
    \ 'name': 'main',
    \ ',': [':call ToggleNetrw()'       ,'netrw file explorer'],
    \ 'SPC': [':nohlsearch'             ,'reset search highlighting'],
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
        \ 'p': [':bprevious'    ,'previous buffer'],
        \ },
    \ 'd': {
        \ 'name': '+dictionaries',
        \ 'g': [':setlocal spell! spelllang=de_de'          ,'german toggle'],
        \ 'e': [':setlocal spell! spelllang=en_us'          ,'english toggle'],
        \ 'x': [':setlocal spell! spelllang=en_us,de_de'    ,'english and german toggle'],
        \ },
    \ 'g': [':Goyo'             ,'goyo'],
    \ 'h': {
        \ 'name': '+hunk',
        \ 'f': [':GitGutterFold'                ,'fold'],
        \ 'p': ['<Plug>(GitGutterPreviewHunk)'  ,'preview'],
        \ 's': ['<Plug>(GitGutterStageHunk)'    ,'stage'],
        \ 'u': ['<Plug>(GitGutterUndoHunk)'     ,'undo'],
        \ },
    \ 'l': [':set list! list?'                  ,'show control characters'],
    \ 'r': [':%s///gc<left><left><left>'        ,'replace'],
    \ 'S': [':SyntasticToggleMode'              ,'syntastic'],
    \ 's': [':vs term://shellcheck -s sh %'     ,'shell check posix'],
    \ 'w': {
        \ 'name': '+vimwiki',
        \ ',': {
            \ 'name': '+dairy',
            \ 'i': ['<Plug>VimwikiDiaryGenerateLinks'          ,'generate links'],
            \ 'm': ['<Plug>VimwikiDiaryMakeTomorrowDiaryNote'  ,'make tomorrow note'],
            \ 't': ['<Plug>VimwikiDiaryTabMakeDiaryNote'       ,'make note new tab'],
            \ 'w': ['<Plug>VimwikiDiaryMakeDiaryNote'          ,'make note'],
            \ 'y': ['<Plug>VimwikiDiaryMakeYesterdayDiaryNote' ,'make yesterday note'],
            \ },
        \ 'i': ['<Plug>VimwikiDiaryIndex'  ,'open diary'],
        \ 's': ['<Plug>VimwikiUISelect'    ,'select vimwiki'],
        \ 't': ['<Plug>VimwikiTabIndex'    ,'open vimwiki new tab'],
        \ 'w': ['<Plug>VimwikiIndex'       ,'open vimwiki'],
        \ },
    \ }

let g:space_dict = {
    \ 'name': 'coc - conquer of completion',
    \ 'a': ['<Plug>(coc-codeaction-selected)'   ,'action selected code'],
    \ 'ac': ['<Plug>(coc-codeaction)'           ,'action current line'],
    \ 'c': [':CocList commands'                 ,'show all commands'],
    \ 'd': [':CocList diagnostics'              ,'show all diagnostics'],
    \ 'e': [':CocList extensions'               ,'show all extensions'],
    \ 'f': ['<Plug>(coc-format-selected)'       ,'formating selected code'],
    \ 'j': [':CocNext'                          ,'default action next item'],
    \ 'k': [':CocPrev'                          ,'default action previous item'],
    \ 'o': [':CocList outline'                  ,'find symbol current document'],
    \ 'p': [':CocListResume'                    ,'resume latest list'],
    \ 'q': {
        \ 'name': '+quickfix',
        \ 'f': ['<Plug>(coc-fix-current)'   ,'autofix current line'],
        \ },
    \ 'r': {
        \ 'name': '+rename',
        \ 'n': ['<Plug>(coc-rename)'    ,'symbol renaming'],
        \ },
    \ 's': [':CocList -I symbols'   ,'search workspace symbols'],
    \ }

" path:       /home/klassiker/.config/nvim/plugins/vim-which-key.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-30T00:52:45+0200

" by default timeoutlen is 1000 ms
set timeoutlen=500

" color mappings
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator Identifier
highlight default link WhichKeyGroup     Float
highlight default link WhichKeyDesc      Comment

" keymaps
nnoremap <silent> <leader>  :<c-u>WhichKey ','<cr>
vnoremap <silent> <leader>  :<c-u>WhichKeyVisual ','<cr>
nnoremap <silent> <space>   :<c-u>WhichKey '<space>'<cr>
vnoremap <silent> <space>   :<c-u>WhichKeyVisual '<space>'<cr>

" define description dictonaries
call which_key#register(',', "g:comma_dict")
call which_key#register(' ', "g:space_dict")

" description dictonaries mappings
let g:comma_dict = {
    \ 'name' : 'main',
    \ ',' : [':call ToggleNetrw()'                  , 'toggle file explorer netrw'],
    \ 'SPC' : [':nohlsearch'                        , 'reset search highlighting'],
    \ '[' : ['<Plug>(GitGutterPrevHunk)'            , 'goto previous changed git hunk'],
    \ ']' : ['<Plug>(GitGutterNextHunk)'            , 'goto next changed git hunk'],
    \ 'a' : ['<Plug>(coc-codeaction-selected)'      , 'coc action selected code'],
    \ 'ac' : ['<Plug>(coc-codeaction)'              , 'coc action current line'],
    \ 'd' : [':setlocal spell! spelllang=de_de'     , 'toggle spell check german'],
    \ 'e' : [':setlocal spell! spelllang=en_us'     , 'toggle spell check english'],
    \ 'f' : ['<Plug>(coc-format-selected)'          , 'formating selected code'],
    \ 'g' : [':Goyo'                                , 'toggle goyo'],
    \ 'l' : [':set list! list?'                     , 'show control characters'],
    \ 'b' : {
        \ 'name' : '+buffer',
        \ '/' : [':buffers'     , 'buffer list'],
        \ 'd' : [':bdelete'     , 'delete buffer'],
        \ 'f' : [':bfirst'      , 'first buffer'],
        \ 'k' : [':bwipeout'    , 'kill buffer'],
        \ 'l' : [':blast'       , 'last buffer'],
        \ 'h' : [':bmodified'   , 'next modified buffer'],
        \ 'n' : [':bnext'       , 'next buffer'],
        \ 'p' : [':bprevious'   , 'previous buffer'],
        \ },
    \ 'q' : {
        \ 'name': '+quickfix coc',
        \ 'f' : ['<Plug>(coc-fix-current)', 'coc autofix current line'],
        \ },
    \ 'r' : {
        \ 'name': '+rename coc',
        \ 'n' : ['<Plug>(coc-rename)', 'coc symbol renaming'],
        \ },
    \ 'S' : [':SyntasticToggleMode'             , 'toggle syntastic'],
    \ 's' : [':vs term://shellcheck -s sh %'    , 'posix check shell script'],
    \ 'w' : {
        \ 'name': '+vimwiki',
        \ ',' : {
            \ 'name': '+dairy',
            \ 'i' : ['<Plug>VimwikiDiaryGenerateLinks'              , 'generate links'],
            \ 'm' : ['<Plug>VimwikiDiaryMakeTomorrowDiaryNote'      , 'make tomorrow note'],
            \ 't' : ['<Plug>VimwikiDiaryTabMakeDiaryNote'           , 'make note new tab'],
            \ 'w' : ['<Plug>VimwikiDiaryMakeDiaryNote'              , 'make note'],
            \ 'y' : ['<Plug>VimwikiDiaryMakeYesterdayDiaryNote'     , 'make yesterday note'],
            \ },
        \ 'i' : ['<Plug>VimwikiDiaryIndex'  , 'open diary'],
        \ 's' : ['<Plug>VimwikiUISelect'    , 'select vimwiki'],
        \ 't' : ['<Plug>VimwikiTabIndex'    , 'open vimwiki new tab'],
        \ 'w' : ['<Plug>VimwikiIndex'       , 'open vimwiki'],
        \ },
    \ }

let g:space_dict = {
    \ 'name' : 'coclist',
    \ 'a' : [':CocList diagnostics'     , 'show all diagnostics'],
    \ 'c' : [':CocList commands'        , 'show all commands'],
    \ 'e' : [':CocList extensions'      , 'show all extensions'],
    \ 'j' : [':CocNext'                 , 'default action next item'],
    \ 'k' : [':CocPrev'                 , 'default sction previous item'],
    \ 'o' : [':CocList outline'         , 'find symbol current document'],
    \ 'p' : [':CocListResume'           , 'resume latest coc list'],
    \ 's' : [':CocList -I symbols'      , 'search workspace symbols'],
    \ }

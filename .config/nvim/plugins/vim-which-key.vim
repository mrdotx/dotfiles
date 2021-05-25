" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins/vim-which-key.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-25T13:22:14+0200

" by default timeoutlen is 1000 ms
set timeoutlen=500

" color mappings
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator Identifier
highlight default link WhichKeyGroup     Float
highlight default link WhichKeyDesc      Comment

" key mappings
nnoremap <silent> <leader>      :<c-u>WhichKey ','<cr>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual ','<cr>
nnoremap <silent> <localleader> :<c-u>WhichKey '.'<cr>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual '.'<cr>

" define description dictionaries
call which_key#register(',', "g:main_dict")
call which_key#register('.', "g:coc_dict")

" description dictionary main
let g:main_dict = {
    \ 'name': 'main',
    \ ',': [':call NetrwToggle()'           ,'netrw file explorer'],
    \ '/': [':echo "nosearchhl = [, + /]"'  ,'reset search highlighting'],
    \ '[': ['<Plug>(GitGutterPrevHunk)'     ,'goto previous changed git hunk'],
    \ ']': ['<Plug>(GitGutterNextHunk)'     ,'goto next changed git hunk'],
    \ 'g': [':Goyo'                         ,'goyo'],
    \ 'i': [':IndentLinesToggle'            ,'toggle indent characters'],
    \ 'l': [':set list! list?'              ,'toggle control characters'],
    \ 'r': [':echo "replace = [, + r]"'     ,'replace'],
    \ 's': [':echo "shellcheck = [, + s]"'  ,'shell check posix'],
    \ 't': [':echo "terminal = [, + t]"'    ,'terminal'],
    \ }

" +buffer
let g:main_dict.b = {
    \ 'name': '+buffer',
    \ '/': [':buffers'      ,'buffer list'],
    \ 'd': [':bdelete'      ,'delete buffer'],
    \ 'f': [':bfirst'       ,'first buffer'],
    \ 'k': [':bwipeout'     ,'kill buffer'],
    \ 'l': [':blast'        ,'last buffer'],
    \ 'h': [':bmodified'    ,'next modified buffer'],
    \ 'n': [':bnext'        ,'next buffer'],
    \ 'p': [':bprevious'    ,'previous buffer'],
    \ }

" +dictionaries
let g:main_dict.d = {
    \ 'name': '+dictionaries',
    \ 'g': [':setlocal spell! spelllang=de_de'          ,'german toggle'],
    \ 'e': [':setlocal spell! spelllang=en_us'          ,'english toggle'],
    \ 'x': [':setlocal spell! spelllang=en_us,de_de'    ,'english and german toggle'],
    \ }

" +hunk
let g:main_dict.h = {
    \ 'name': '+hunk',
    \ 'f': [':GitGutterFold'                ,'fold'],
    \ 'p': ['<Plug>(GitGutterPreviewHunk)'  ,'preview'],
    \ 's': ['<Plug>(GitGutterStageHunk)'    ,'stage'],
    \ 'u': ['<Plug>(GitGutterUndoHunk)'     ,'undo'],
    \ }

" +vimwiki
let g:main_dict.w = {
    \ 'name': '+vimwiki',
    \ ',': {
        \ 'name': '+dairy',
        \ 'i': ['<Plug>VimwikiDiaryGenerateLinks'           ,'generate links'],
        \ 'm': ['<Plug>VimwikiDiaryMakeTomorrowDiaryNote'   ,'make tomorrow note'],
        \ 't': ['<Plug>VimwikiDiaryTabMakeDiaryNote'        ,'make note new tab'],
        \ 'w': ['<Plug>VimwikiDiaryMakeDiaryNote'           ,'make note'],
        \ 'y': ['<Plug>VimwikiDiaryMakeYesterdayDiaryNote'  ,'make yesterday note'],
        \ },
    \ 'i': ['<Plug>VimwikiDiaryIndex'                       ,'open diary'],
    \ 's': ['<Plug>VimwikiUISelect'                         ,'select vimwiki'],
    \ 't': ['<Plug>VimwikiTabIndex'                         ,'open vimwiki new tab'],
    \ 'w': ['<Plug>VimwikiIndex'                            ,'open vimwiki'],
    \ }

" description dictionary coc
let g:coc_dict = {
    \ 'name': 'coc - conquer of completion',
    \ '.': [':CocList diagnostics'          ,'show all diagnostics'],
    \ 'c': [':CocList commands'             ,'show all commands'],
    \ 'e': [':CocList extensions'           ,'show all extensions'],
    \ 'f': ['<Plug>(coc-format-selected)'   ,'formating selected code'],
    \ 'j': [':CocNext'                      ,'default action next item'],
    \ 'k': [':CocPrev'                      ,'default action previous item'],
    \ 'o': [':CocList outline'              ,'find symbol current document'],
    \ 'p': [':CocListResume'                ,'resume latest list'],
    \ 's': [':CocList -I symbols'           ,'search workspace symbols'],
    \ }

let g:coc_dict.a = {
    \ 'name': '+action',
    \ 's': ['<Plug>(coc-codeaction-selected)'   ,'action selected code'],
    \ 'c': ['<Plug>(coc-codeaction)'            ,'action current line'],
    \ }

let g:coc_dict.q = {
    \ 'name': '+quickfix',
    \ 'f': ['<Plug>(coc-fix-current)'   ,'autofix current line'],
    \ }

let g:coc_dict.r = {
    \ 'name': '+rename',
    \ 'n': ['<Plug>(coc-rename)'    ,'symbol renaming'],
    \ }

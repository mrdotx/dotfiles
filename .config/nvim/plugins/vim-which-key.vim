" path:       /home/klassiker/.config/nvim/plugins/vim-which-key.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-04T01:30:57+0200

" by default timeoutlen is 1000 ms
set timeoutlen=500

" keymaps
nnoremap <silent> <leader>  :<c-u>WhichKey ','<cr>
nnoremap <silent> <space>   :<c-u>WhichKey '<space>'<cr>
nnoremap <silent> g         :<c-u>WhichKey 'g'<cr>

" register description directories
call which_key#register(',', "g:comma_prefix_dict")
call which_key#register(' ', "g:space_prefix_dict")
call which_key#register('g', "g:g_prefix_dict")

" descriptions
let g:comma_prefix_dict = {
    \ 'name' : 'main',
    \ '<space>' : ['nohlsearch', 'reset search highlighting'],
    \ 'a' : ['<Plug>(coc-codeaction-selected)', 'coc action selected code'],
    \ 'ac' : ['<Plug>(coc-codeaction)', 'coc action current line'],
    \ 'd' : ['setlocal spell! spelllang=de_de', 'toggle spell check german'],
    \ 'e' : ['setlocal spell! spelllang=en_us', 'toggle spell check english'],
    \ 'f' : ['<Plug>(coc-format-selected)', 'formating selected code'],
    \ 'l' : ['set list! list?', 'show control characters'],
    \ 'q' : {
        \ 'name': '+coc autofix',
        \ 'f' : ['<Plug>(coc-fix-current)', 'coc autofix current line'],
        \ },
    \ 'r' : {
        \ 'name': '+coc rename',
        \ 'n' : ['<Plug>(coc-rename)', 'coc symbol renaming'],
        \ },
    \ 'S' : ['SyntasticToggleMode', 'toggle syntastic'],
    \ 's' : ['vs term://shellcheck -s sh %', 'posix check shell script'],
    \ 'w' : {
        \ 'name': '+vimwiki',
        \ ',' : {
            \ 'name': '+dairy',
            \ 'i' : ['<Plug>VimwikiDiaryGenerateLinks', 'generate links'],
            \ 'm' : ['<Plug>VimwikiDiaryMakeTomorrowDiaryNote', 'make tomorrow note'],
            \ 't' : ['<Plug>VimwikiDiaryTabMakeDiaryNote', 'make note new tab'],
            \ 'w' : ['<Plug>VimwikiDiaryMakeDiaryNote', 'make note'],
            \ 'y' : ['<Plug>VimwikiDiaryMakeYesterdayDiaryNote', 'make yesterday note'],
            \ },
        \ 'i' : ['<Plug>VimwikiDiaryIndex', 'open diary'],
        \ 's' : ['<Plug>VimwikiUISelect', 'select vimwiki'],
        \ 't' : ['<Plug>VimwikiTabIndex', 'open vimwiki new tab'],
        \ 'w' : ['<Plug>VimwikiIndex', 'open vimwiki'],
        \ },
    \ }

let g:space_prefix_dict = {
    \ 'name' : 'coclist',
    \ 'a' : ['CocList diagnostics', 'show all diagnostics'],
    \ 'c' : ['CocList commands', 'show all commands'],
    \ 'e' : ['CocList extensions', 'show all extensions'],
    \ 'j' : ['CocNext', 'default action next item'],
    \ 'k' : ['CocPrev', 'default sction previous item'],
    \ 'o' : ['CocList outline', 'find symbol current document'],
    \ 'p' : ['CocListResume' , 'resume latest coc list'],
    \ 's' : ['CocList -I symbols', 'search workspace symbols'],
    \ }

let g:g_prefix_dict = {
    \ 'name' : 'goto and comments',
    \ '%' : ['<Plug>(MatchitOperationBackward)', 'match it operation backward'],
    \ '[' : ['<Plug>(GitGutterPrevHunk)', 'goto previous changed git hunk'],
    \ ']' : ['<Plug>(GitGutterNextHunk)', 'goto next changed git hunk'],
    \ 'c' : ['<Plug>Commentary', 'comment out/in selected region'],
    \ 'cc' : ['<Plug>CommentaryLine', 'comment out/in current line'],
    \ 'd' : ['<Plug>(coc-definition)', 'goto definition'],
    \ 'f' : ['call ToggleNetrw()', 'toggle file explorer netrw'],
    \ 'i' : ['<Plug>(coc-implementation)', 'goto implementation'],
    \ 'n' : ['bnext', 'goto next buffer'],
    \ 'p' : ['bprevious', 'goto previous buffer'],
    \ 'r' : ['<Plug>(coc-references)', 'goto references'],
    \ 'x' : ['<Plug>NetrwBrowseX', 'open selected path or file'],
    \ 'y' : ['<Plug>(coc-type-definition)', 'goto type definition'],
    \ }

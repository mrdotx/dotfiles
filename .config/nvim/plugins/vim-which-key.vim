" path:       /home/klassiker/.config/nvim/plugins/vim-which-key.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-02T18:47:37+0200

" by default timeoutlen is 1000 ms
set timeoutlen=500

" hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" keymaps
nnoremap <silent> <leader>  :<c-u>WhichKey ','<CR>
nnoremap <silent> <Space>   :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> g         :<c-u>WhichKey 'g'<CR>

" register description directories
call which_key#register(',', "g:comma_prefix_dict")
call which_key#register(' ', "g:space_prefix_dict")
call which_key#register('g', "g:g_prefix_dict")

" descriptions
let g:comma_prefix_dict = {
    \ 'name' : 'main',
    \ ',' : ['call ToggleNetrw()', 'toggle netrw file explorer'],
    \ '[' : ['<Plug>(GitGutterPrevHunk)', 'goto to previous changed git hunk'],
    \ ']' : ['<Plug>(GitGutterNextHunk)', 'goto to next changed git hunk'],
    \ 'a' : ['<Plug>(coc-codeaction-selected)', 'applying code action to the selected region'],
    \ 'ac' : ['<Plug>(coc-codeaction)', 'applying code action to the selected line'],
    \ 'b' : ['bprevious', 'goto to previous buffer'],
    \ 'bn' : ['bnext', 'goto to next buffer'],
    \ 'd' : ['setlocal spell! spelllang=de_de', 'toggle spell check german'],
    \ 'e' : ['setlocal spell! spelllang=en_us', 'toggle spell check english'],
    \ 'f' : ['<Plug>(coc-format-selected)', 'formating selected code'],
    \ 'l' : ['set list! list?', 'show control characters'],
    \ 'q' : {
        \ 'name': '+autofix',
        \ 'f' : ['<Plug>(coc-fix-current)', 'apply coc autofix to problem on the current line'],
        \ },
    \ 'r' : {
        \ 'name': '+rename',
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
            \ 't' : ['<Plug>VimwikiDiaryTabMakeDiaryNote', 'make note in new tab'],
            \ 'w' : ['<Plug>VimwikiDiaryMakeDiaryNote', 'make note'],
            \ 'y' : ['<Plug>VimwikiDiaryMakeYesterdayDiaryNote', 'make yesterday note'],
            \ },
        \ 'i' : ['<Plug>VimwikiDiaryIndex', 'open diary'],
        \ 's' : ['<Plug>VimwikiUISelect', 'select vimwiki'],
        \ 't' : ['<Plug>VimwikiTabIndex', 'open vimwiki in new tab'],
        \ 'w' : ['<Plug>VimwikiIndex', 'open vimwiki'],
        \ },
    \ }

let g:space_prefix_dict = {
    \ 'name' : 'coclist',
    \ 'a' : ['CocList diagnostics', 'show all diagnostics'],
    \ 'c' : ['CocList commands', 'show all commands'],
    \ 'e' : ['CocList extensions', 'show all extensions'],
    \ 'j' : ['CocNext', 'do default action for next item'],
    \ 'k' : ['CocPrev', 'do default sction for previous item'],
    \ 'o' : ['CocList outline', 'find symbol of current document'],
    \ 'p' : ['CocListResume' , 'resume latest coc list'],
    \ 's' : ['CocList -I symbols', 'search workspace symbols'],
    \ }

let g:g_prefix_dict = {
    \ 'name' : 'goto and comments',
    \ '%' : ['<Plug>(MatchitOperationBackward)', 'match it operation backward'],
    \ 'c' : ['<Plug>Commentary', 'comment out/in selected region'],
    \ 'cc' : ['<Plug>CommentaryLine', 'comment out/in selected line'],
    \ 'd' : ['<Plug>(coc-definition)', 'goto definition'],
    \ 'i' : ['<Plug>(coc-implementation)', 'goto implementation'],
    \ 'r' : ['<Plug>(coc-references)', 'goto references'],
    \ 'x' : ['<Plug>NetrwBrowseX', 'open selected path in file explorer'],
    \ 'y' : ['<Plug>(coc-type-definition)', 'goto type definition'],
    \ }

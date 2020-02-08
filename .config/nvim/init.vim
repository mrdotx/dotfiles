" path:       ~/.config/nvim/init.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-02-08T20:05:58+0100

" leader is comma
let mapleader=","

" vim-plug autoinstall
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vimwiki/vimwiki'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-syntastic/syntastic'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'
call plug#end()

" airline
let g:airline_powerline_fonts=1
let g:airline_theme = 'base16_klassiker'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" coc
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
"set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" vimwiki
let notes={}
let notes.path='$HOME/Dokumente/Notes'
let notes.path_html='$HOME/Dokumente/Notes/html/'
let notes.syntax='markdown'
let notes.ext='.md'
let notes.auto_export=1
let notes.automatic_nested_syntaxes=1
let notes.template_path='$HOME/projects/vimwiki-pandoc/template/'
let notes.template_default='github'
let notes.template_ext='.html5'
let notes.custom_wiki2html='$HOME/projects/vimwiki-pandoc/wiki2html.sh'
let g:vimwiki_list=[notes]
let g:vimwiki_global_ext=0
let g:vimwiki_use_mouse=1

" mouse
if has('mouse')
    set mouse=a
endif

" colors
" true color
set termguicolors
" color theme
colorscheme klassiker
" enable syntax processing
syntax on
" enable all Python syntax highlighting features
let python_highlight_all=1
hi Normal ctermbg=NONE
" transparent background
hi Normal guibg=NONE
hi Folded guibg=NONE
hi FoldedColumn guibg=NONE
" color codes
lua require'colorizer'.setup()

" ui config
" clipboard
set clipboard+=unnamedplus
" show hybrid line numbers and numbertoggle
set number relativenumber
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END
" show command in bottom bar
set showcmd
" highlight current line
"set cursorline
" highlight extra white space
:highlight ExtraWhitespace ctermbg=red guibg=red
" to ward off unexpected things
set nocompatible
" visual autocomplete for command menu
set wildmenu
set wildmode=longest,list,full
" redraw only when we need to
set lazyredraw
" highlight matching [{()}]
set showmatch
" symbols for control character
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
" splits open at the bottom and right
set splitbelow splitright
" enable folding
set foldmethod=indent
set foldlevel=99
" file encoding
set encoding=utf-8
" disables automatic commenting on newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" run xrdb whenever Xresources are updated.
autocmd BufWritePost *Xresources !xrdb -merge %
" mark extra white space as bad and color it red
autocmd BufRead,BufNewFile *.sh,*.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/

" searching
" search as characters are entered
set incsearch
" highlight matches
set hlsearch
" do case insensitive search
set ignorecase
" ...unless capital letters are used
set smartcase

" file type specific settings
" enable file type detection
filetype on
" load the plugins for specific file types
filetype plugin on
" automatically indent code
filetype indent on

" style guide
" number of visual spaces per TAB
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" the size of an indent
set shiftwidth=4
" tabs are spaces
set expandtab
" indent when moving to the next line while writing code
set autoindent

" python pep 8 style guide
function! AutoPy()
    set textwidth=79
    set fileformat=unix
endfunction
autocmd BufNewFile,BufRead *.py call AutoPy()

" file explore
com!  -nargs=* -bar -bang -complete=dir  Lexplore  call netrw#Lexplore(<q-args>, <bang>0)

fun! Lexplore(dir, right)
    if exists("t:netrw_lexbufnr")
    " close down netrw explorer window
    let lexwinnr = bufwinnr(t:netrw_lexbufnr)
    if lexwinnr != -1
        let curwin = winnr()
        exe lexwinnr."wincmd w"
        close
        exe curwin."wincmd w"
    endif
    unlet t:netrw_lexbufnr

    else
        " open netrw explorer window in the dir of current file
        " (even on remote files)
        let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
        exe (a:right? "botright" : "topleft")." vertical ".((g:netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
        if a:dir != ""
            exe "Explore ".a:dir
        else
            exe "Explore ".path
        endif
        setlocal winfixwidth
        let t:netrw_lexbufnr = bufnr("%")
    endif
endfun

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=-28
let g:netrw_sort_sequence='[\/]$,*'
let g:netrw_ftp_cmd='ftp -p'

" templates
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.md 0r $HOME/.config/nvim/templates/skeleton.md
        autocmd BufNewFile *.md inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        autocmd BufNewFile *.sh 0r $HOME/.config/nvim/templates/skeleton.sh
        autocmd BufNewFile *.sh inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        autocmd BufNewFile *.py 0r $HOME/.config/nvim/templates/skeleton.py
        autocmd BufNewFile *.py inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        autocmd BufNewFile *.c 0r $HOME/.config/nvim/templates/skeleton.c
        autocmd BufNewFile *.c inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
    augroup END
endif

" last modfied
" If buffer modified, update any 'date: ' in the first 10 lines.
" 'date: ' can have up to 4 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! ModifiedDate()
    if &modified
        let save_cursor=getpos(".")
        let n=min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,4}date: \).*#\1' .
            \ strftime('      %FT%T%z') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun
autocmd BufWritePre * call ModifiedDate()

" shortcuts
" file explore in split window
map         <leader><leader>    :Lexplore<CR>
" autocomplete goto
map         <leader>g           :YcmCompleter GoToDefinitionElseDeclaration<CR>
" switch cursor window
nnoremap    <tab>               <C-w>w
nnoremap    <S-tab>             <C-w>W
" buffer cycle
nnoremap    <leader>b           :bprevious<CR>
" turn off search highlight
nnoremap    <leader><space>     :nohlsearch<CR>
" show hidden characters
map         <leader>l           :set list! list?<CR>
" spell-check, shellcheck, syntastic
map         <leader>d           :setlocal spell! spelllang=de_de<CR>
map         <leader>e           :setlocal spell! spelllang=en_us<CR>
map         <leader>s           :vs term://shellcheck -s sh %<CR>
map         <leader>S           :SyntasticToggleMode<CR>
" copy vimwiki to webserver
map         <leader>n           :!$HOME/projects/vimwiki-pandoc/copy.sh<CR>

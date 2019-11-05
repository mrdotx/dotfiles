" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" path:       ~/.config/nvim/init.vim
" user:       klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2019-11-05 23:44:49

" vim-plug autoinstall {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vimwiki/vimwiki'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'z0mbix/vim-shfmt'
    Plug 'edkolev/tmuxline.vim'
    Plug 'flazz/vim-colorschemes'
call plug#end()

    let g:airline_powerline_fonts=1
    "let g:airline_theme = 'molokai'
    
    let g:shfmt_extra_args='-i 4'
    
    let notes={}
    let notes.path='$HOME/coding/hidden/notes'
    let notes.path_html='$HOME/coding/hidden/notes/html/'
    let notes.syntax='markdown'
    let notes.ext='.md'
    let notes.auto_export=1
    let notes.automatic_nested_syntaxes=1
    let notes.template_path='$HOME/coding/hidden/notes/sh/template/'
    let notes.template_default='github'
    let notes.template_ext='.html5'
    let notes.custom_wiki2html='$HOME/coding/hidden/notes/sh/wiki2html.sh'
    let g:vimwiki_list=[notes]
    let g:vimwiki_global_ext=0
    let g:vimwiki_use_mouse=1
" }}}

" colors {{{
" color theme
    "colorscheme darkblue
    colorscheme monokai-phoenix
" enable syntax processing
    syntax on
" enable all Python syntax highlighting features
    let python_highlight_all=1
    hi Normal ctermbg=NONE
" }}}

" mouse {{{
    if has('mouse')
        set mouse=a
    endif
" }}}

" spaces & tabs {{{
" number of visual spaces per TAB
    set tabstop=4
" number of spaces in tab when editing
    set softtabstop=4
" tabs are spaces
    set expandtab
" the size of an indent
    set shiftwidth=4
" }}}

" ui config {{{
" clipboard
    set clipboard=unnamedplus
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
" to ward off unexpected things
    set nocompatible
" visual autocomplete for command menu
    set wildmenu
    set wildmode=longest,list,full
" indent when moving to the next line while writing code
    set autoindent
" redraw only when we need to
    set lazyredraw
" highlight matching [{()}]
    set showmatch
" symbols for control character
    set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
" splits open at the bottom and right
    set splitbelow splitright
" disables automatic commenting on newline
    autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
" run xrdb whenever Xresources are updated.
    autocmd BufWritePost *Xresources !xrdb -merge % 
" }}}

" file explore {{{
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

    let g:netrw_banner = 0
    let g:netrw_liststyle = 0
    let g:netrw_browse_split = 4
    let g:netrw_altv = 1
    let g:netrw_winsize = -28
    let g:netrw_sort_sequence = '[\/]$,*'
    let g:netrw_ftp_cmd = 'ftp -p'
" }}}

" searching {{{
" search as characters are entered
    set incsearch
" highlight matches
    set hlsearch
" do case insensitive search
    set ignorecase
" ...unless capital letters are used
    set smartcase
" }}}

" file type specific settings {{{
" enable file type detection
    filetype on
" load the plugins for specific file types
    filetype plugin on
" automatically indent code
    filetype indent on
" }}}

" templates {{{
    if has("autocmd")
        augroup templates
            autocmd BufNewFile *.md 0r $HOME/.config/nvim/templates/skeleton.md
            autocmd BufNewFile *.md inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
            autocmd BufNewFile *.sh 0r $HOME/.config/nvim/templates/skeleton.sh
            autocmd BufNewFile *.sh inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
            autocmd BufNewFile *.py 0r $HOME/.config/nvim/templates/skeleton.py
            autocmd BufNewFile *.py inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
        augroup END
    endif
" }}}

" last modfied {{{
" If buffer modified, update any 'date: ' in the first 10 lines.
" 'date: ' can have up to 4 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor=getpos(".")
    let n=min([10, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,4}date: \).*#\1' .
          \ strftime('      %F %T') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()
" }}}

" shortcuts {{{
" leader is comma
    let mapleader=","
" file explore in split window
    map         <leader><leader>    :Lexplore<CR>
" switch cursor window
    nnoremap    <tab>               <C-w>w
    nnoremap    <S-tab>             <C-w>W
" turn off search highlight
    nnoremap    <leader><space>     :nohlsearch<CR>
" show hidden characters
    map         <leader>l           :set list! list?<CR>
" spell-check and shellcheck
    map         <leader>d           :setlocal spell! spelllang=de_de<CR>
    map         <leader>e           :setlocal spell! spelllang=en_us<CR>
    map         <leader>s           :!shellcheck %<CR>
" format shellscript
    map         <leader>f           :Shfmt<CR>
" copy vimwiki to webserver
    map         <leader>n           :!$HOME/coding/hidden/notes/sh/copy.sh<CR>
" markdown preview
    map         <leader>m           :w!<CR>:w!/tmp/vim-markdown.md<CR>:!pandoc -s -f markdown -t html -o /tmp/vim-markdown.html /tmp/vim-markdown.md<CR>:!qutebrowser /tmp/vim-markdown.html > /dev/null 2> /dev/null&<CR><CR>
" }}}

" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" Path:     ~/.config/nvim/init.vim
" User:     klassiker [mrdotx]
" GitHub:   https://github.com/mrdotx/dotfiles

" vim-plug autoinstall {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'z0mbix/vim-shfmt'
    Plug 'edkolev/tmuxline.vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'vimwiki/vimwiki'
call plug#end()

let g:airline_powerline_fonts = 1
"let g:airline_theme = 'molokai'

let g:shfmt_extra_args = '-i 4'

let notes = {}
let notes.path = '$HOME/coding/secrets/notes'
let notes.path_html = '$HOME/coding/secrets/notes/html/'
let notes.syntax = 'markdown'
let notes.ext = '.md'
let notes.auto_export = 1
let notes.automatic_nested_syntaxes = 1
let notes.template_path = '$HOME/coding/secrets/notes/template/'
let notes.template_default = 'github'
let notes.template_ext = '.html5'
let notes.custom_wiki2html = '$HOME/coding/secrets/notes/wiki2html.sh'
let g:vimwiki_list = [notes]
let g:vimwiki_global_ext = 0
" }}}

" colors {{{
" color theme
    "colorscheme darkblue
    colorscheme monokai-phoenix
" enable syntax processing
    syntax on
" enable all Python syntax highlighting features
    let python_highlight_all = 1
    hi Normal ctermbg=NONE
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
            autocmd BufNewFile *.sh 0r $HOME/.config/nvim/templates/skeleton.sh
            autocmd BufNewFile *.md 0r $HOME/.config/nvim/templates/skeleton.md
        augroup END
    endif
" }}}

" shortcuts {{{
" leader is comma
    let mapleader=","
" turn off search highlight
    nnoremap    <leader><space> :nohlsearch<CR>
" show hidden characters
    map         <leader>l       :set list! list?<CR>
" spell-check and shellcheck
    map         <leader>g       :setlocal spell! spelllang=de_de<CR>
    map         <leader>e       :setlocal spell! spelllang=en_us<CR>
    map         <leader>s       :!shellcheck %<CR>
" format shellscript
    map         <leader>f       :Shfmt<CR>
" copy vimwiki to webserver
    map         <leader>n       :!$HOME/coding/secrets/notes/copy.sh<CR>
" markdown preview
    map         <leader>m       :w!<CR>:w!/tmp/vim-markdown.md<CR>:!pandoc -s -f markdown -t html -o /tmp/vim-markdown.html /tmp/vim-markdown.md<CR>:!qutebrowser /tmp/vim-markdown.html > /dev/null 2> /dev/null&<CR><CR>
" }}}

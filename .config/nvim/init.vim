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
call plug#end()

let g:airline_powerline_fonts = 1
"let g:airline_theme = 'molokai'
let g:shfmt_extra_args = '-i 4'
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
    map         <leader>s       :!clear && shellcheck %<CR>
    "map         <leader>s       :set makeprg=shellcheck\ -f\ gcc\ %<CR>
    "map         <leader>m       :make<CR>
    "map         <leader>n       :cnext<CR>
" format shellscript
    map         <leader>f       :Shfmt<CR>
" }}}

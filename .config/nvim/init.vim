" path:       /home/klassiker/.config/nvim/init.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-05-22T02:01:04+0200

let mapleader=","                   " leader key for global plugins
let maplocalleader="\<space>"       " leader key for filetype plugins

" mouse
if has('mouse')
    set mouse=a
endif

" colors
set termguicolors                   " true color
colorscheme klassiker               " color theme
syntax on                           " enable syntax processing
" transparent background
hi Normal ctermbg=NONE
hi Normal guibg=NONE
hi Folded guibg=NONE
hi FoldedColumn guibg=NONE

" ui config
set clipboard+=unnamedplus          " clipboard
set number relativenumber           " show hybrid line numbers and numbertoggle
    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END
set showcmd                         " show command in bottom bar
"set cursorline                     " highlight current line
"set cursorcolumn                   " highlight current column
set nocompatible                    " to ward off unexpected things
set wildmenu                        " visual autocomplete for command menu
set wildmode=longest,list,full
set lazyredraw                      " redraw only when we need to
set showmatch                       " highlight matching [{()}]
" symbols for control character
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set splitbelow splitright           " splits open at the bottom and right

" searching
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches
set ignorecase                      " do case insensitive search
set smartcase                       " ...unless capital letters are used

" file type specific settings
filetype on                         " enable file type detection
filetype plugin on                  " load the plugins for specific file types
filetype indent on                  " automatically indent code

" automatic actions
" enable spell check
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us,de_de
" run xrdb whenever Xresources are updated.
autocmd BufWritePost *.config/xorg/* !xrdb -merge ~/.config/xorg/Xresources

" plugins
source ~/.config/nvim/plugins/vim-plug.vim
" netrw
source ~/.config/nvim/netrw.vim
" dev
source ~/.config/nvim/dev.vim
" mappings
source ~/.config/nvim/mappings.vim

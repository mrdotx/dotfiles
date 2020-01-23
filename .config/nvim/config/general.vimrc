" path:       ~/.config/nvim/config/general.vimrc
" user:       klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-01-23T22:45:29+0100

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

" path:       ~/.config/nvim/init.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-04-23T00:44:47+0200

" leader is comma
let mapleader=","

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
" transparent background
hi Normal ctermbg=NONE
hi Normal guibg=NONE
hi Folded guibg=NONE
hi FoldedColumn guibg=NONE

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
" highlight current column
"set cursorcolumn
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

" plugins
source ~/.config/nvim/plugins.vim

" netrw
source ~/.config/nvim/netrw.vim

" dev
source ~/.config/nvim/dev.vim

" automatic actions
" enable spell check
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us,de_de
" run xrdb whenever Xresources are updated.
autocmd BufWritePost *Xresources !xrdb -merge %

" shortcuts
" file explore in split window
nnoremap    <silent>    <leader><leader>    :call ToggleNetrw()<CR>
" switch cursor window
nnoremap                <tab>               <C-w>w
nnoremap                <S-tab>             <C-w>W
" buffer cycle
nnoremap    <silent>    <leader>b           :bprevious<CR>
" turn off search highlight
nnoremap    <silent>    <leader><space>     :nohlsearch<CR>
" show hidden characters
nnoremap                <leader>l           :set list! list?<CR>
" spell check
nnoremap                <leader>d           :setlocal spell! spelllang=de_de<CR>
nnoremap                <leader>e           :setlocal spell! spelllang=en_us<CR>

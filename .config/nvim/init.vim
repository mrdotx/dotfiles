" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2024-08-13T14:04:23+0200

let g:init_config_folder='~/.config/nvim/init/'

" provider
let g:loaded_node_provider=0
let g:loaded_perl_provider=0
let g:loaded_python3_provider=0
let g:loaded_ruby_provider=0

" leader keys
let mapleader=','                   " for global plugins
let maplocalleader=' '              " for filetype plugins

" mouse
set mouse=a

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
set noswapfile                      " swapfile
set number relativenumber           " show hybrid line numbers and numbertoggle
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set noshowmode                      " don't show normal, insert replace etc.
set showcmd                         " show command in bottom bar
set showmatch                       " highlight matching [{()}]
set nowrap                          " no visible line wrap
set scrolloff=5                     " number of lines to retain on top/bottom
set nocompatible                    " to ward off unexpected things
set wildmenu                        " visual autocomplete for command menu
set wildmode=longest,list,full
set lazyredraw                      " redraw only when we need to
" symbols for control character
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set list                            " show control characters
set splitbelow splitright           " splits open at the bottom and right

" searching
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches
set ignorecase                      " do case insensitive search
set smartcase                       " ...unless capital letters are used

" if config exists source file
function! SourceConfig(file)
    let l:config=g:init_config_folder.a:file
    if !empty(glob(l:config))
        execute 'source' l:config
    else
        echo l:config." not found\n"
    endif
endfunction

call SourceConfig('filetypes.vim')
call SourceConfig('commands.vim')
call SourceConfig('reload.vim')
call SourceConfig('pass.vim')
call SourceConfig('header.vim')
call SourceConfig('plugins.vim')
call SourceConfig('netrw.vim')
call SourceConfig('coding.vim')
call SourceConfig('templates.vim')
call SourceConfig('keybindings.vim')

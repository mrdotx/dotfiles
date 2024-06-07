" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2024-06-06T17:46:36+0200

let g:inits_config_folder='~/.config/nvim/init/'

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

" file type specific settings
filetype on                         " enable file type detection
filetype plugin on                  " load the plugins for specific file types
filetype indent on                  " automatically indent code

" command to write current buffer as root
command W :execute ':silent w !$EXEC_AS_USER tee % > /dev/null' | :edit!
command Wq :execute ':silent w !$EXEC_AS_USER tee % > /dev/null' | :quit!

" command for terminal execution in split window
command -nargs=1 -complete=file -bar TermExec
    \ :execute winheight(0)/3'split term://<args>'

" command to sort by delimiter and column
function! SortColumn(delimiter, column)
    execute ':%!sort -t"'.a:delimiter.'" -k'.a:column
endfunction
command -nargs=* SortColumn
    \ call SortColumn(<f-args>)

" if config exists source file
function! IfConfigExists(action, file)
    let l:config=g:inits_config_folder.a:file
    if !empty(glob(l:config))
        execute a:action l:config
    else
        echo l:config." not found\n"
    endif
endfunction

call IfConfigExists('source', 'filetypes.vim')
call IfConfigExists('source', 'pass.vim')
call IfConfigExists('source', 'header.vim')
call IfConfigExists('source', 'plugins.vim')
call IfConfigExists('source', 'netrw.vim')
call IfConfigExists('source', 'coding.vim')
call IfConfigExists('source', 'templates.vim')
call IfConfigExists('source', 'keybindings.vim')

" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-06-07T08:11:09+0200

let g:inits_config_folder='~/.config/nvim/'

" leader keys
let mapleader=','                   " for global plugins
let maplocalleader='.'              " for filetype plugins

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
"set cursorline                     " highlight current line
"set cursorcolumn                   " highlight current column
set scrolloff=5                     " number of lines to retain on top/bottom
set nocompatible                    " to ward off unexpected things
set wildmenu                        " visual autocomplete for command menu
set wildmode=longest,list,full
set lazyredraw                      " redraw only when we need to
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
autocmd FileType tex,latex,markdown,gitcommit setlocal spell spelllang=en_us,de_de
" run xrdb whenever xresources are updated
autocmd BufWritePost *.config/xorg/* !xrdb -merge ~/.config/xorg/Xresources
" edit amored gpg encrypted files
augroup encrypt
    au!
    " disable temporary data
    autocmd BufReadPre,FileReadPre *.asc set viminfo=
    autocmd BufReadPre,FileReadPre *.asc set noswapfile noundofile nobackup
    " binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre *.asc set bin
    autocmd BufReadPre,FileReadPre *.asc let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost *.asc '[,']!gpg -d 2>/dev/null
    " normal mode for editing
    autocmd BufReadPost,FileReadPost *.asc set nobin
    autocmd BufReadPost,FileReadPost *.asc let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost *.asc execute ":doautocmd BufReadPost ".expand("%:r")
    " convert text to encrypted data before writing
    autocmd BufWritePre,FileWritePre *.asc '[,']!gpg --default-recipient-self -ae 2>/dev/null
    autocmd BufWritePost,FileWritePost *.asc u
augroup END

" if config exists source file
function! IfConfigExists(action, file)
    let l:config=g:inits_config_folder.a:file
    if !empty(glob(l:config))
        execute a:action l:config
    else
        echo l:config." not found\n"
    endif
endfunction

call IfConfigExists('source', 'plugins.vim')
call IfConfigExists('source', 'netrw.vim')
call IfConfigExists('source', 'coding.vim')
call IfConfigExists('source', 'keybindings.vim')

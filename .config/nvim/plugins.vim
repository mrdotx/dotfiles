" path:       /home/klassiker/.config/nvim/plugins.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-11-02T10:11:39+0100

" vim-plug autoinstall
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/goyo.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'liuchengxu/vim-which-key'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-syntastic/syntastic'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vimwiki/vimwiki'
call plug#end()

" plugin configs
source ~/.config/nvim/plugins/vim-airline.vim
source ~/.config/nvim/plugins/goyo.vim
luafile ~/.config/nvim/plugins/nvim-colorizer.lua
source ~/.config/nvim/plugins/vim-which-key.vim
source ~/.config/nvim/plugins/indentLine.vim
source ~/.config/nvim/plugins/vim-commentary.vim
source ~/.config/nvim/plugins/vim-gitgutter.vim
source ~/.config/nvim/plugins/syntastic.vim
source ~/.config/nvim/plugins/coc.nvim.vim
source ~/.config/nvim/plugins/vimwiki.vim
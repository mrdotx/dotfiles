" path:       ~/.config/nvim/plugins/plug.vim
" author:     klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-04-27T19:19:27+0200

" vim-plug autoinstall
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.local/share/nvim/plugged')
    Plug 'vimwiki/vimwiki'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-syntastic/syntastic'
    Plug 'airblade/vim-gitgutter'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'vim-airline/vim-airline'
    Plug 'edkolev/tmuxline.vim'
call plug#end()

" plugin configs
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/colorizer.vim
source ~/.config/nvim/plugins/gitgutter.vim
source ~/.config/nvim/plugins/syntastic.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/vimwiki.vim

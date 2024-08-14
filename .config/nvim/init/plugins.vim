" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2024-08-13T14:10:47+0200

let g:plugged_folder='~/.local/share/nvim/plugged/'
let g:plugged_config_folder='~/.config/nvim/init/plugins/'

" vim-plug autoinstall
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin(g:plugged_folder)
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'brenoprata10/nvim-highlight-colors'
    Plug 'liuchengxu/vim-which-key'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fidian/hexmode'
    Plug 'vimwiki/vimwiki'
call plug#end()

" if plugin folder exists source config file
function! SourcePlugin(action, plugin_name)
    let l:plugin=g:plugged_folder.a:plugin_name
    let l:config_name=split(a:plugin_name, '\.')
    let l:config=g:plugged_config_folder.l:config_name[0]
    if a:action=='lua'
        let l:config=l:config.'.lua'
    else
        let l:config=l:config.'.vim'
    endif
    if !empty(glob(l:plugin))
        if !empty(glob(l:config))
            execute 'source' l:config
        else
            echo l:config." not found\n"
        endif
    else
        echo l:plugin." not found\n"
    endif
endfunction

call SourcePlugin('vim', 'lightline.vim')
call SourcePlugin('vim', 'goyo.vim')
call SourcePlugin('lua', 'nvim-highlight-colors')
call SourcePlugin('vim', 'vim-which-key')
call SourcePlugin('vim', 'indentLine')
call SourcePlugin('vim', 'vim-commentary')
call SourcePlugin('vim', 'vim-gitgutter')
call SourcePlugin('vim', 'coc.nvim')
call SourcePlugin('vim', 'hexmode')
call SourcePlugin('vim', 'vimwiki')

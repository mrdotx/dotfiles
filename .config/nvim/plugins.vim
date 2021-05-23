" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-23T19:12:10+0200

let g:plugged_folder='~/.local/share/nvim/plugged/'
let g:plugged_config_folder='~/.config/nvim/plugins/'

" vim-plug autoinstall
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin(g:plugged_folder)
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/goyo.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'liuchengxu/vim-which-key'
    Plug 'alvan/vim-closetag'
    Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-syntastic/syntastic'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vimwiki/vimwiki'
call plug#end()

" if plugin folder exists source config file
function! IfPluginExists(action, plugin_names)
    for plugin_name in a:plugin_names
        let l:plugin=g:plugged_folder.plugin_name
        let l:config_name=split(plugin_name, '\.')
        let l:config=g:plugged_config_folder.l:config_name[0]
        if a:action=='luafile'
            let l:config=l:config.'.lua'
        else
            let l:config=l:config.'.vim'
        endif
        if !empty(glob(l:plugin))
            if !empty(glob(l:config))
                execute a:action l:config
            else
                echo l:config." not found\n"
            endif
        else
            echo l:plugin." not found\n"
        endif
    endfor
endfunction

let lua_plugin_names=[
    \ 'nvim-colorizer.lua'
    \ ]
let vim_plugin_names=[
    \ 'vim-airline',
    \ 'goyo.vim',
    \ 'vim-which-key',
    \ 'vim-closetag',
    \ 'auto-pairs',
    \ 'indentLine',
    \ 'vim-commentary',
    \ 'vim-gitgutter',
    \ 'syntastic',
    \ 'coc.nvim',
    \ 'vimwiki'
    \ ]
call IfPluginExists('luafile', lua_plugin_names)
call IfPluginExists('source', vim_plugin_names)

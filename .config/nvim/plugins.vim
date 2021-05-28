" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/plugins.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2021-05-28T11:52:49+0200

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
    Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vimwiki/vimwiki'
call plug#end()

" if plugin folder exists source config file
function! IfPluginExists(action, plugin_name)
    let l:plugin=g:plugged_folder.a:plugin_name
    let l:config_name=split(a:plugin_name, '\.')
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
endfunction

call IfPluginExists('source', 'vim-airline')
call IfPluginExists('source', 'goyo.vim')
call IfPluginExists('luafile', 'nvim-colorizer.lua')
call IfPluginExists('source', 'vim-which-key')
call IfPluginExists('source', 'auto-pairs')
call IfPluginExists('source', 'indentLine')
call IfPluginExists('source', 'vim-commentary')
call IfPluginExists('source', 'vim-gitgutter')
call IfPluginExists('source', 'coc.nvim')
call IfPluginExists('source', 'vimwiki')

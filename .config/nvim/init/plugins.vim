" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/init/plugins.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2023-04-01T18:38:00+0200

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
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'liuchengxu/vim-which-key'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'fidian/hexmode'
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

call IfPluginExists('source', 'lightline.vim')
call IfPluginExists('source', 'goyo.vim')
call IfPluginExists('luafile', 'nvim-colorizer.lua')
call IfPluginExists('source', 'vim-which-key')
call IfPluginExists('source', 'indentLine')
call IfPluginExists('source', 'vim-commentary')
call IfPluginExists('source', 'vim-gitgutter')
call IfPluginExists('source', 'coc.nvim')
call IfPluginExists('source', 'hexmode')
call IfPluginExists('source', 'vimwiki')

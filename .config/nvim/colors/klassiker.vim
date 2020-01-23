" path:       ~/.config/nvim/colors/klassiker.vim
" user:       klassiker [mrdotx]
" github:     https://github.com/mrdotx/dotfiles
" date:       2020-01-23T23:26:32+0100

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name="klassiker"

" colors used in this scheme
" GUI: #3476A4, Term:  67
" GUI: #009698, Term:  81
" GUI: #334455, Term:  59
" GUI: #111111, Term: 233
" GUI: #000000, Term:  00
" GUI: #211F1C, Term:  00
" GUI: #960020, Term:  88
" GUI: #420E09, Term:  52
" GUI: #FD971F, Term: 208
" GUI: #F92782, Term: 197
" GUI: #75715E, Term:  95
" GUI: #49483E, Term:  59
" GUI: #8F908A, Term: 102
" GUI: #00B200, Term: 112
" GUI: #AE81FF, Term: 141
" GUI: #778899, Term: 103
" GUI: #223344, Term:  23
" GUI: #253B22, Term:  22
" GUI: #383A3E, Term: 236
" GUI: #F8F8F8, Term:  15
" GUI: #B0B200, Term: 185

" popup Menu
hi Pmenu guifg=#F8F8F8 guibg=#223344 gui=NONE ctermfg=15 ctermbg=23 cterm=NONE
hi PmenuSet guifg=#009698 guibg=#111111 gui=NONE ctermfg=81 ctermbg=233 cterm=NONE
hi PmenuSBar guifg=#009698 guibg=#334455 gui=NONE ctermfg=81 ctermbg=59 cterm=NONE
hi PmenuSel guifg=#009698 guibg=#334455 gui=NONE ctermfg=81 ctermbg=59 cterm=NONE
hi PmenuThumb guifg=#778899 guibg=#778899 gui=NONE ctermfg=103 ctermbg=103 cterm=NONE

" editor
hi Normal guifg=#F8F8F8 guibg=#111111 gui=NONE ctermfg=15 ctermbg=233 cterm=NONE
hi Conceal guifg=#009698 guibg=#111111 gui=NONE ctermfg=81 ctermbg=233 cterm=NONE
hi NonText guifg=#49483E guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#009698 guibg=#111111 gui=NONE ctermfg=81 ctermbg=233 cterm=NONE
hi StatusLineNC guifg=#778899 guibg=#111111 gui=NONE ctermfg=103 ctermbg=233 cterm=NONE
hi Search guifg=#000000 guibg=#B0B200 gui=NONE ctermfg=00 ctermbg=221 cterm=NONE
hi VertSplit guifg=#75715E guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
hi LineNr guifg=#8F908A guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
hi SignColumn guifg=NONE guibg=#211F1C gui=NONE ctermfg=NONE ctermbg=00 cterm=NONE

" messages
hi Question guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi ModeMsg guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi MoreMsg guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi ErrorMsg guifg=#111111 guibg=#F92782 gui=NONE ctermfg=233 ctermbg=197 cterm=NONE
hi WarningMsg guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE

" spelling
hi SpellBad guifg=#F8F8F8 guibg=NONE gui=undercurl ctermfg=15 ctermbg=NONE cterm=undercurl guisp=#F92782
hi SpellLocal guifg=#009698 guibg=NONE gui=undercurl ctermfg=81 ctermbg=NONE cterm=undercurl guisp=#009698

" tabline
hi TabLine guifg=#8F908A guibg=#111111 gui=NONE ctermfg=102 ctermbg=233 cterm=NONE
hi TabLineSel guifg=#F8F8F8 guibg=#334455 gui=NONE ctermfg=15 ctermbg=59 cterm=NONE
hi TabLineFill guifg=#111111 guibg=#111111 gui=NONE ctermfg=233 ctermbg=233 cterm=NONE

" misc
hi SpecialKey guifg=#49483E guibg=NONE gui=NONE ctermfg=59 ctermbg=NONE cterm=NONE
hi Title guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi Directory guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE

" diff
hi DiffAdd guifg=#F8F8F8 guibg=#253B22 gui=NONE ctermfg=15 ctermbg=22 cterm=NONE
hi DiffDelete guifg=#F92782 guibg=#420E09 gui=NONE ctermfg=197 ctermbg=52 cterm=NONE
hi DiffChange guifg=#B0B200 guibg=#420E09 gui=NONE ctermfg=185 ctermbg=52 cterm=NONE
hi DiffText guifg=#75715E guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE

" folding
hi Folded guifg=#778899 guibg=#211F1C gui=NONE ctermfg=103 ctermbg=00 cterm=NONE
hi FoldColumn guifg=NONE guibg=#211F1C gui=NONE ctermfg=NONE ctermbg=00 cterm=NONE

" cursor colors
hi ColorColumn guifg=NONE guibg=#383A3E gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi CursorColumn guifg=NONE guibg=#383A3E gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi CursorLine guifg=NONE guibg=#383A3E gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Cursor guifg=#111111 guibg=#F8F8F8 gui=NONE ctermfg=233 ctermbg=15 cterm=NONE
hi Visual guifg=NONE guibg=#49483E gui=NONE ctermfg=NONE ctermbg=59 cterm=NONE
hi MatchParen guifg=#111111 guibg=#B0B200 gui=NONE ctermfg=233 ctermbg=185 cterm=NONE

if has("nvim")
  " neovim terminal
  hi TermCursor guifg=#111111 guibg=#F8F8F8 gui=NONE ctermfg=233 ctermbg=15 cterm=NONE
  hi TermCursorNC guifg=#111111 guibg=#778899 gui=NONE ctermfg=233 ctermbg=103 cterm=NONE
endif

" general highlighting
hi Constant guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Number guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Float guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Boolean guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
hi Character guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi String guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
hi Type guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Structure guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi TypeDef guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Identifier guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Function guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Statement guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Operator guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Label guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Keyword guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Preproc guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Include guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Define guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Macro guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi PreCondit guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Special guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Delimiter guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Comment guifg=#3476A4 guibg=NONE gui=italic ctermfg=67 ctermbg=NONE cterm=italic
hi SpecialComment guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
hi Tag guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
hi Underlined guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Todo guifg=#F8F8F8 guibg=#111111 gui=bold ctermfg=15 ctermbg=233 cterm=bold
hi Error guifg=#F8F8F8 guibg=#960020 gui=NONE ctermfg=15 ctermbg=88 cterm=NONE

function! s:cppFiletype()
  " vim-cpp-enhanced-highlight syntax
  hi cppSTLnamespace guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi cppSTLtype guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi cppModifier guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
endfunction

function! s:jsFiletype()
  " vim-javascript syntax
  hi jsStorageClass guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsOperator guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsBooleanTrue guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
  hi jsBooleanFalse guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
  hi jsModules guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsModuleWords guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsOf guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsArgsObj guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsImportContainer guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsExportContainer guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsCommentTodo guifg=#778899 guibg=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
  hi jsLineComment guifg=#3476A4 guibg=NONE gui=italic ctermfg=67 ctermbg=NONE cterm=italic
  hi jsEnvComment guifg=#3476A4 guibg=NONE gui=italic ctermfg=67 ctermbg=NONE cterm=italic
  hi jsCvsTag guifg=#3476A4 guibg=NONE gui=italic ctermfg=67 ctermbg=NONE cterm=italic
  hi jsComment guifg=#3476A4 guibg=NONE gui=italic ctermfg=67 ctermbg=NONE cterm=italic
  hi jsBlockComment guifg=#3476A4 guibg=NONE gui=italic ctermfg=67 ctermbg=NONE cterm=italic
  hi jsDocTags guifg=#778899 guibg=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
  hi jsDocType guifg=#778899 guibg=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
  hi jsDocTypeNoParam guifg=#778899 guibg=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
  hi jsDocParam guifg=#778899 guibg=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
  hi jsDocSeeTag guifg=#778899 guibg=NONE gui=NONE ctermfg=103 ctermbg=NONE cterm=NONE
  hi jsTemplateVar guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsStringD guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsStringS guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsTemplateString guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsTemplateBraces guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi jsTaggedTemplate guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpCharClass guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpBoundary guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpBackRef guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpQuantifier guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpOr guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpMod guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpSpecial guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpGroup guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsRegexpString guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsNumber guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
  hi jsFloat guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
  hi jsObjectKey guifg=#B0B200 guibg=NONE gui=NONE ctermfg=185 ctermbg=NONE cterm=NONE
  hi jsFunctionKey guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi jsDecorator guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi jsDecoratorFunction guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi jsStatement guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsConditional guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsRepeat guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsLabel guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsKeyword guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsClass guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsAsyncKeyword guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsGlobalObjects guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsGlobalNodeObjects guifg=#009698 guibg=NONE gui=italic ctermfg=81 ctermbg=NONE cterm=italic
  hi jsThis guifg=#009698 guibg=NONE gui=italic ctermfg=81 ctermbg=NONE cterm=italic
  hi jsExceptions guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsBuiltins guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsFutureKeys guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsHtmlEvents guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsTernaryIfOperator guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsGenerator guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsFuncName guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi jsFuncArgs guifg=#FD971F guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
  hi jsFuncArgRest guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi jsArrowFunction guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
  hi jsFuncCall guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE

  " custom syntax
  hi javaScriptMethodCallWithoutArgs guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi javaScriptMethodCallWithArgs guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi javaScriptStaticFunctionWithArgs guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi javaScriptStaticFunctionWithoutArgs guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi javaScriptFunctionCallWithArgs guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi javaScriptFunctionCallWithoutArgs guifg=#00B200 guibg=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
  hi javaScriptArrowFunction guifg=#009698 guibg=NONE gui=NONE ctermfg=81 ctermbg=NONE cterm=NONE
endfunction

function! s:jsonFiletype()
  " json syntax
  hi jsonNull guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
  hi jsonKeyword guifg=#F8F8F8 guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
  hi jsonPadding guifg=#F8F8F8 guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
  hi jsonBraces guifg=#F8F8F8 guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
endfunction

function! s:pursFiletype()
  " purescript syntax
  hi purescriptImportKeyword guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi purescriptConstructor guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
  hi purescriptConstructorDecl guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
  hi purescriptTypeAlias guifg=#AE81FF guibg=NONE gui=NONE ctermfg=141 ctermbg=NONE cterm=NONE
  hi purescriptModuleKeyword guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi purescriptWhere guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi purescriptData guifg=#F92782 guibg=NONE gui=NONE ctermfg=197 ctermbg=NONE cterm=NONE
  hi purescriptTypeVar guifg=#F8F8F8 guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
  hi purescriptDelimiter guifg=#F8F8F8 guibg=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
endfunction

augroup FILETYPE_LOADER
  au!
  au Filetype purs call <SID>pursFiletype()
  au Filetype cpp call <SID>cppFiletype()
  au Filetype json call <SID>jsonFiletype()
  au Filetype javascript call <SID>jsFiletype()
augroup END

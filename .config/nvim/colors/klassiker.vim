" path:   /home/klassiker/.local/share/repos/dotfiles/.config/nvim/colors/klassiker.vim
" author: klassiker [mrdotx]
" github: https://github.com/mrdotx/dotfiles
" date:   2022-05-06T18:17:43+0200

hi clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
let g:colors_name   = "klassiker"

"   color       = gui       ,term
let s:black0    = ["#000000","0"]
let s:black1    = ["#333333","8"]
let s:red0      = ["#df2800","1"]
let s:red1      = ["#ff5555","9"]
let s:green0    = ["#00b200","2"]
let s:green1    = ["#39ff14","10"]
let s:yellow0   = ["#b0b200","3"]
let s:yellow1   = ["#effd5f","11"]
let s:blue0     = ["#1f5393","4"]
let s:blue1     = ["#4185d7","12"]
let s:magenta0  = ["#980096","5"]
let s:magenta1  = ["#ff6fff","13"]
let s:cyan0     = ["#008081","6"]
let s:cyan1     = ["#7ef9ff","14"]
let s:white0    = ["#cccccc","7"]
let s:white1    = ["#ffffff","15"]

let s:grey0     = ["#2b2b2b","234"]
let s:grey1     = ["#666666","242"]
let s:grey2     = ["#778899","103"]
let s:grey3     = ["#334455","59"]
let s:grey4     = ["#223344","23"]
let s:pink      = ["#f92782","197"]

function! s:hi(group, fg, bg, attr, guisp)
    let cmd = ""
    if a:fg[0] == "NONE"
          let cmd = cmd . " guifg=" . a:fg[0] . " ctermfg=" . a:fg[0]
    elseif a:fg[0] != "" && a:fg[1] != ""
          let cmd = cmd . " guifg=" . a:fg[0] . " ctermfg=" . a:fg[1]
    endif
    if a:bg[0] == "NONE"
          let cmd = cmd . " guibg=" . a:bg[0] . " ctermbg=" . a:bg[0]
    elseif a:bg[0] != "" && a:bg[1] != ""
          let cmd = cmd . " guibg=" . a:bg[0] . " ctermbg=" . a:bg[1]
    endif
    if a:attr != ""
          let cmd = cmd . " gui=" . a:attr . " cterm=" . a:attr
    endif
    if a:guisp[0] != ""
          let cmd = cmd . " guisp=" . a:guisp[0]
    endif
    if cmd != ""
          exec "hi " . a:group . cmd
    endif
endfunction

"          group            ,fg         ,bg         ,attr           ,guisp
" popup Menu
call s:hi("Pmenu"           ,s:white1   ,s:grey4    ,"NONE"         ,"")
call s:hi("PmenuSet"        ,s:cyan0    ,s:black0   ,"NONE"         ,"")
call s:hi("PmenuSBar"       ,s:cyan0    ,s:grey3    ,"NONE"         ,"")
call s:hi("PmenuSel"        ,s:cyan0    ,s:grey3    ,"NONE"         ,"")
call s:hi("PmenuThumb"      ,s:grey2    ,s:grey2    ,"NONE"         ,"")

" " editor
call s:hi("Normal"          ,s:white1   ,s:black0   ,"NONE"         ,"")
call s:hi("Conceal"         ,s:cyan0    ,s:black0   ,"NONE"         ,"")
call s:hi("NonText"         ,s:grey3    ,["NONE"]   ,"NONE"         ,"")
call s:hi("StatusLine"      ,s:cyan0    ,s:black0   ,"NONE"         ,"")
call s:hi("StatusLineNC"    ,s:grey2    ,s:black0   ,"NONE"         ,"")
call s:hi("WildMenu"        ,s:black0   ,s:yellow0  ,"NONE"         ,"")
call s:hi("Search"          ,s:white1   ,s:blue0    ,"NONE"         ,"")
call s:hi("VertSplit"       ,s:blue1    ,["NONE"]   ,"NONE"         ,"")
call s:hi("LineNr"          ,s:grey2    ,["NONE"]   ,"NONE"         ,"")
call s:hi("SignColumn"      ,["NONE"]   ,["NONE"]   ,"NONE"         ,"")

" " messages
call s:hi("Question"        ,s:yellow0  ,["NONE"]   ,"NONE"         ,"")
call s:hi("ModeMsg"         ,s:yellow0  ,["NONE"]   ,"NONE"         ,"")
call s:hi("MoreMsg"         ,s:yellow0  ,["NONE"]   ,"NONE"         ,"")
call s:hi("ErrorMsg"        ,s:black0   ,s:red0     ,"NONE"         ,"")
call s:hi("WarningMsg"      ,s:red0     ,["NONE"]   ,"NONE"         ,"")

" " spelling
call s:hi("SpellBad"        ,s:white1   ,["NONE"]   ,"undercurl"    ,s:white1)
call s:hi("SpellCap"        ,s:grey1    ,["NONE"]   ,"undercurl"    ,s:grey1)
call s:hi("SpellLocal"      ,s:cyan0    ,["NONE"]   ,"undercurl"    ,s:cyan0)
call s:hi("SpellRare"       ,s:red1     ,["NONE"]   ,"undercurl"    ,s:red1)

" " tabline
call s:hi("TabLine"         ,s:grey1    ,s:black0   ,"NONE"         ,"")
call s:hi("TabLineSel"      ,s:white1   ,s:grey3    ,"NONE"         ,"")
call s:hi("TabLineFill"     ,s:black0   ,s:black0   ,"NONE"         ,"")

" " misc
call s:hi("SpecialKey"      ,s:grey3    ,["NONE"]   ,"NONE"         ,"")
call s:hi("Title"           ,s:yellow0  ,["NONE"]   ,"NONE"         ,"")
call s:hi("Directory"       ,s:cyan0    ,["NONE"]   ,"NONE"         ,"")

" " diff
call s:hi("DiffAdd"         ,s:grey0    ,s:green1   ,"NONE"         ,"")
call s:hi("DiffDelete"      ,s:grey0    ,s:red1     ,"NONE"         ,"")
call s:hi("DiffChange"      ,s:grey0    ,s:red1     ,"NONE"         ,"")
call s:hi("DiffText"        ,s:white1   ,["NONE"]   ,"NONE"         ,"")

" " folding
call s:hi("Folded"          ,s:grey2    ,s:grey0    ,"NONE"         ,"")
call s:hi("FoldColumn"      ,["NONE"]   ,s:grey0    ,"NONE"         ,"")

" " cursor colors
call s:hi("ColorColumn"     ,["NONE"]   ,s:grey4    ,"NONE"         ,"")
call s:hi("CursorColumn"    ,["NONE"]   ,s:grey4    ,"NONE"         ,"")
call s:hi("CursorLine"      ,["NONE"]   ,s:grey4    ,"NONE"         ,"")
call s:hi("Cursor"          ,s:black0   ,s:white1   ,"NONE"         ,"")
call s:hi("Visual"          ,["NONE"]   ,s:black1   ,"NONE"         ,"")
call s:hi("MatchParen"      ,s:black0   ,s:yellow0  ,"NONE"         ,"")
call s:hi("TermCursor"      ,s:black0   ,s:blue1    ,"NONE"         ,"")
call s:hi("TermCursorNC"    ,s:black0   ,s:grey2    ,"NONE"         ,"")

" " general highlighting
call s:hi("Constant"        ,s:magenta0 ,["NONE"]   ,"NONE"         ,"")
call s:hi("Number"          ,s:magenta0 ,["NONE"]   ,"NONE"         ,"")
call s:hi("Float"           ,s:magenta0 ,["NONE"]   ,"NONE"         ,"")
call s:hi("Boolean"         ,s:magenta0 ,["NONE"]   ,"NONE"         ,"")
call s:hi("Character"       ,s:yellow0  ,["NONE"]   ,"NONE"         ,"")
call s:hi("String"          ,s:yellow0  ,["NONE"]   ,"NONE"         ,"")
call s:hi("Type"            ,s:cyan0    ,["NONE"]   ,"NONE"         ,"")
call s:hi("Structure"       ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("StorageClass"    ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("TypeDef"         ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("Identifier"      ,s:green0   ,["NONE"]   ,"NONE"         ,"")
call s:hi("Function"        ,s:green0   ,["NONE"]   ,"NONE"         ,"")
call s:hi("Statement"       ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("Operator"        ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("Label"           ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("Keyword"         ,s:cyan0    ,["NONE"]   ,"NONE"         ,"")
call s:hi("Preproc"         ,s:green0   ,["NONE"]   ,"NONE"         ,"")
call s:hi("Include"         ,s:cyan0    ,["NONE"]   ,"NONE"         ,"")
call s:hi("Define"          ,s:cyan0    ,["NONE"]   ,"NONE"         ,"")
call s:hi("Macro"           ,s:green0   ,["NONE"]   ,"NONE"         ,"")
call s:hi("PreCondit"       ,s:green0   ,["NONE"]   ,"NONE"         ,"")
call s:hi("Special"         ,s:cyan0    ,["NONE"]   ,"NONE"         ,"")
call s:hi("SpecialChar"     ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("Delimiter"       ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("Comment"         ,s:blue1    ,["NONE"]   ,"italic"       ,"")
call s:hi("SpecialComment"  ,s:cyan0    ,["NONE"]   ,"NONE"         ,"")
call s:hi("Tag"             ,s:pink     ,["NONE"]   ,"NONE"         ,"")
call s:hi("Underlined"      ,s:green0   ,["NONE"]   ,"NONE"         ,"")
call s:hi("Ignore"          ,["NONE"]   ,["NONE"]   ,"NONE"         ,"")
call s:hi("Todo"            ,s:white1   ,["NONE"]   ,"bold"         ,"")
call s:hi("Error"           ,s:red0     ,["NONE"]   ,"NONE"         ,"")
call s:hi("ExtraWhitespace" ,s:grey0    ,s:red0     ,"NONE"         ,"")

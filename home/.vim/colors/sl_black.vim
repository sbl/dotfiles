" sl_black color scheme
"
" derived from ir_black / not so dark anymore / sbl 2013
"
" More at: http://blog.infinitered.com/entries/show/8


set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sl_black"

" aka darkgreen:    #4e9a06
" aka green:        #8ae219
" aka darkyellow:   #c4a000
" aka yellow:       #fce94f
" aka darkblue:     #3465a4
" aka blue:         #729fcf
" aka darkmagenta:  #75507b
" aka magenta:      #ad7fa8
" aka cyan:         #34e2e2
" aka red:          #ef2929
" aka brown:        #c4a000
"
" ember color:      #f16f58


"hi Example         guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

" General colors
hi Normal           guifg=#bebebe     guibg=#242c30       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi NonText          guifg=#242c30     guibg=NONE       gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE

hi Cursor           guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=reverse
hi LineNr           guifg=darkgray     guibg=NONE       gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi VertSplit        guifg=darkgray     guibg=NONE     gui=NONE      ctermfg=darkgray        ctermbg=NONE    cterm=NONE
hi StatusLine       guifg=white       guibg=#4e9a06     gui=NONE    ctermfg=white       ctermbg=darkgreen       cterm=NONE
hi StatusLineNC     guifg=#242c30       guibg=darkgray     gui=NONE      ctermfg=white        ctermbg=darkgray    cterm=NONE

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title            guifg=#f6f3e8     guibg=NONE        gui=bold      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual           guifg=NONE        guibg=darkgray     gui=NONE      ctermfg=NONE        ctermbg=darkgray    cterm=NONE

hi SpecialKey       guifg=#808080     guibg=#343434     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi WildMenu         guifg=black       guibg=#fce94f      gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar        guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=NONE
"hi Ignore           guifg=gray        guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Error            guifg=NONE        guibg=#ef2929    gui=undercurl ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=NONE       guibg=#ef2929     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=NONE       guibg=#ef2929     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=black       guibg=#34e2e2     gui=BOLD      ctermfg=black       ctermbg=cyan        cterm=BOLD

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#212121     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi CursorColumn   guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi MatchParen     guifg=#34e2e2     guibg=NONE        gui=BOLD      ctermfg=white       ctermbg=darkgray    cterm=NONE
  hi Pmenu          guifg=#bebebe     guibg=#354147     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi PmenuSel       guifg=#354147     guibg=#8ae219     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi Search         guifg=NONE        guibg=NONE        gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
endif

" Syntax highlighting
hi Comment          guifg=#7C7C7C     guibg=NONE        gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi String           guifg=#729fcf     guibg=NONE        gui=NONE      ctermfg=darkblue       ctermbg=NONE        cterm=NONE
hi Number           guifg=#ad7fa8     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi Keyword          guifg=#729fcf     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi PreProc          guifg=#729fcf     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Conditional      guifg=#729fcf     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE  " if else end

hi Todo             guifg=#ef2929     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
hi Constant         guifg=#34e2e2     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Identifier       guifg=#34e2e2     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Function         guifg=#8ae219     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE
hi Type             guifg=#fce94f     guibg=NONE        gui=NONE      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Statement        guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=lightblue   ctermbg=NONE        cterm=NONE

hi Special          guifg=#bebebe     guibg=NONE        gui=bold      ctermfg=white       ctermbg=NONE        cterm=NONE
hi Delimiter        guifg=#34e2e2     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Operator         guifg=white       guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special


" Special for Ruby
hi rubyRegexp                  guifg=#c4a000      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyRegexpDelimiter         guifg=#c4a000      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyEscape                  guifg=#34e2e2        guibg=NONE      gui=NONE      ctermfg=cyan           ctermbg=NONE      cterm=NONE
hi rubyInterpolationDelimiter  guifg=#c4a000      guibg=NONE      gui=NONE      ctermfg=brown           ctermbg=NONE      cterm=NONE
hi rubyControl                 guifg=#729fcf      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE  "and break, etc
"hi rubyGlobalVariable          guifg=#FFCCFF      guibg=NONE      gui=NONE      ctermfg=lightblue      ctermbg=NONE      cterm=NONE  "yield
hi rubyStringDelimiter         guifg=#8ae219      guibg=NONE      gui=NONE      ctermfg=lightgreen     ctermbg=NONE      cterm=NONE
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"hi link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

hi link rubyClass             Keyword
hi link rubyModule            Keyword
hi link rubyKeyword           Keyword
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type


" Special for HTML
hi link htmlTagName Function

" Special for Javascript

hi link jsNumber      Number
"hi link jsFunction Function
hi link jsThis Identifier
hi link jsPrototype Identifier
hi link jsObjectKey Function
hi link jsFunctionKey Function

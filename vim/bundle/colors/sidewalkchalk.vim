" Vim color file
" Converted from Textmate theme Sidewalk Chalk using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Sidewalk Chalk"

hi Cursor  guifg=NONE guibg=#7f7f7f gui=NONE
hi Visual  guifg=NONE guibg=#828383 gui=NONE
hi CursorLine  guifg=NONE guibg=#282a2b gui=NONE
hi CursorColumn  guifg=NONE guibg=#282a2b gui=NONE
hi LineNr  guifg=#939394 guibg=#2b2d2e gui=NONE
hi VertSplit  guifg=#525455 guibg=#525455 gui=NONE
hi MatchParen  guifg=#62ba4d guibg=NONE gui=NONE
hi StatusLine  guifg=#fafafa guibg=#525455 gui=bold
hi StatusLineNC  guifg=#fafafa guibg=#525455 gui=NONE
hi Pmenu  guifg=#5f88b8 guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#828383 gui=NONE
hi IncSearch  guifg=NONE guibg=#3d5c38 gui=NONE
hi Search  guifg=NONE guibg=#3d5c38 gui=NONE
hi Directory  guifg=#e5da39 guibg=NONE gui=NONE
hi Folded  guifg=#535353 guibg=#2b2d2e gui=NONE

hi Normal  guifg=#fafafa guibg=#2b2d2e gui=NONE
hi Boolean  guifg=#d56e26 guibg=NONE gui=NONE
hi Character  guifg=#e5da39 guibg=NONE gui=NONE
hi Comment  guifg=#535353 guibg=#212223 gui=NONE
hi Conditional  guifg=#62ba4d guibg=NONE gui=NONE
hi Constant  guifg=NONE guibg=NONE gui=NONE
hi Define  guifg=#62ba4d guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#e5da39 guibg=NONE gui=NONE
hi Function  guifg=#a3a3a3 guibg=NONE gui=NONE
hi Identifier  guifg=NONE guibg=NONE gui=NONE
hi Keyword  guifg=#62ba4d guibg=NONE gui=NONE
hi Label  guifg=#5f88b8 guibg=#21242e gui=NONE
hi NonText  guifg=#525252 guibg=#282a2b gui=NONE
hi Number  guifg=#e5da39 guibg=NONE gui=NONE
hi Operator  guifg=#a3a3a3 guibg=NONE gui=NONE
hi PreProc  guifg=#62ba4d guibg=NONE gui=NONE
hi Special  guifg=#fafafa guibg=NONE gui=NONE
hi SpecialKey  guifg=#525252 guibg=#282a2b gui=NONE
hi Statement  guifg=#62ba4d guibg=NONE gui=NONE
hi StorageClass  guifg=NONE guibg=NONE gui=NONE
hi String  guifg=#5f88b8 guibg=#21242e gui=NONE
hi Tag  guifg=#5f88b8 guibg=NONE gui=NONE
hi Title  guifg=#fafafa guibg=NONE gui=bold
hi Todo  guifg=#535353 guibg=#212223 gui=inverse,bold
hi Type  guifg=#5f88b8 guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#62ba4d guibg=NONE gui=NONE
hi rubyFunction  guifg=#a3a3a3 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#e5da39 guibg=NONE gui=NONE
hi rubyConstant  guifg=#5f88b8 guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#5f88b8 guibg=#21242e gui=NONE
hi rubyBlockParameter  guifg=NONE guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#55a9db guibg=NONE gui=NONE
hi rubyInclude  guifg=#62ba4d guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#55a9db guibg=NONE gui=NONE
hi rubyRegexp  guifg=#5f88b8 guibg=#21242e gui=NONE
hi rubyRegexpDelimiter  guifg=#5f88b8 guibg=#21242e gui=NONE
hi rubyEscape  guifg=#e5da39 guibg=NONE gui=NONE
hi rubyControl  guifg=#62ba4d guibg=NONE gui=NONE
hi rubyClassVariable  guifg=NONE guibg=NONE gui=NONE
hi rubyOperator  guifg=#a3a3a3 guibg=NONE gui=NONE
hi rubyException  guifg=#62ba4d guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#55a9db guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=#5f88b8 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARMethod  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsRenderMethod  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsMethod  guifg=NONE guibg=NONE gui=NONE
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#535353 guibg=#212223 gui=NONE
hi erubyRailsMethod  guifg=NONE guibg=NONE gui=NONE
hi htmlTag  guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag  guifg=NONE guibg=NONE gui=NONE
hi htmlTagName  guifg=NONE guibg=NONE gui=NONE
hi htmlArg  guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#e5da39 guibg=NONE gui=NONE
hi javaScriptFunction  guifg=NONE guibg=NONE gui=NONE
hi javaScriptRailsFunction  guifg=NONE guibg=NONE gui=NONE
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#5f88b8 guibg=NONE gui=NONE
hi yamlAnchor  guifg=#55a9db guibg=NONE gui=NONE
hi yamlAlias  guifg=#55a9db guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=NONE guibg=#20272d gui=NONE
hi cssURL  guifg=NONE guibg=NONE gui=NONE
hi cssFunctionName  guifg=NONE guibg=NONE gui=NONE
hi cssColor  guifg=#e5da39 guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=NONE guibg=NONE gui=NONE
hi cssClassName  guifg=NONE guibg=NONE gui=NONE
hi cssValueLength  guifg=#e5da39 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=NONE guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE

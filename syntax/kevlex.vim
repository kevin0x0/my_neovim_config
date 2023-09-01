if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax keyword  kevlexKeyword     def import
syntax match    kevlexIdentifier  "[A-Za-z_\-][A-Za-z0-9_\-]*\|\'\([^'\\]\|\.\)\+'"
syntax match    kevlexRegex       "$ *[^\n]*"
syntax region   kevlexComment     start="#" end="\n"
syntax match    kevlexEnvVar      "% *\([A-Za-z_\-][A-Za-z0-9_\-]*\|\'\([^\'\\]\|\.\)\+\'\)"
syntax region   kevlexString      start="!" end="\n\n"
syntax region   kevlexString     start="\"" end="\n"
syntax match    kevlexNumber      "[0-9]+"
syntax keyword  kevlexOperator    = : ( ) 

hi link kevlexEnvVar      Purple
hi link kevlexRegex       Macro
hi link kevlexKeyword     Keyword
hi link kevlexIdentifier  Identifier
hi link kevlexComment     Comment 
hi link kevlexString      String
hi link kevlexNumber      Number    
hi link kevlexOperator    Operator 

let b:current_syntax = "kevlex"

let &cpo = s:cpo_save
unlet s:cpo_save

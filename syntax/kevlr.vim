if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax keyword  kevlrKeyword      set decl
syntax match    kevlrIdentifier   "[A-Za-z\u0100-\uFFFF_\-][A-Za-z0-9\u0100-\uFFFF_\-]*\|'\([^'\\]\|[\u0100-\uFFFF]\|\\.\)*'"
syntax region   kevlrComment      start="#" end="\n"
syntax region   kevlrString       start="`" end="`"
syntax match    kevlrString       "\"\([^"\\]\|[\u0100-\uFFFF]\|\\.\)*\""
syntax match    kevlrNumber       "[0-9]\+"
syntax match    kevlrOperator     "[=:()\[\],;|<%]\|\.\."

hi link kevlrKeyword       Keyword
hi link kevlrIdentifier    Identifier
hi link kevlrComment       Comment 
hi link kevlrString        String
hi link kevlrNumber        Number    
hi link kevlrOperator      Operator 

let b:current_syntax = "kevlr"

let &cpo = s:cpo_save
unlet s:cpo_save

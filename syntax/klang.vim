if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax keyword  klangKeyword      let while where match case of repeat until if else for in return break continue local shared new and or not async yield
syntax keyword  klangConstant     true false nil
syntax match    klangIdentifier   "[A-Za-z\u0100-\uFFFF_][A-Za-z0-9\u0100-\uFFFF]*\|'\([^'\\]\|[\u0100-\uFFFF]\|\\.\)*'"
syntax region   klangString       start="`" end="`"
syntax region   klangString       start=+"+ end=+"+ skip=+\\"+
syntax match    klangNumber       "[0-9]\+\|0[xX][0-9A-Fa-f]\+"
syntax match    klangOperator     "[+\-*/%<>.?]\|\.\.\|<-\|==\|<=\|>=\|->\|&&\|||\|!"
syntax match    klangDelimiter    "[{}():;,|]"
syntax match    klangSpecial      "this\|\.\.\."
syntax region   klangComment      start="--" end="\n"

hi link klangKeyword       Keyword
hi link klangConstant      Constant
hi link klangIdentifier    Identifier
hi link klangString        String
hi link klangNumber        Number    
hi link klangOperator      Operator 
hi link klangDelimiter     Delimiter
hi link klangSpecial       Special
hi link klangComment       Comment 


let b:current_syntax = "klang"

let &cpo = s:cpo_save
unlet s:cpo_save

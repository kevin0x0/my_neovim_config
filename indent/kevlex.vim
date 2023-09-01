if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

if exists("*KevLexIndent")
  finish
endif

setlocal indentexpr=KevLexIndent()
setlocal indentkeys=0$,0(,o,O

function KevLexIndent()
  echo "Indent called"
  let offset = shiftwidth()
  let ind = 0
  let lnum = line('.') - 1
  " no indent in first line
  if lnum == 0
    return 0
  endif
  let prevline = getline(lnum)
  if prevline[0:2] == "def" && prevline[-1:-1] == ":"
    let ind = offset
  else
    let matchpos = match(prevline, "[^ ]")
    let headchar = prevline[matchpos]
    if headchar == "$" || headchar == "("
      let ind = matchpos
    endif
  endif
  echo prevline
  return ind
endfunction

let b:undo_indent="setl indentkeys< | setl indentexpr<"

(identifier) @variable

((identifier) @variable.builtin
  (#eq? @variable.builtin "self"))

((identifier) @constant
 (#match? @constant "^[A-Z][A-Z\\d_]*$"))

[
  "break" 
  "continue" 
  "return" 
  "local" 
  "method" 
  "shared" 
  "where" 
  "inherit" 
  "new" 
  "in"
  "let"
] @keyword

"async" @keyword.coroutine

[
  "if"
  "else"
  "match" 
  "case" 
  "of" 
] @keyword.conditional

[
  "for"
  "while"
  "repeat"
  "until"
] @keyword.repeat

[
  "return"
  "yield"
] @keyword.return

[
  "is"
  "isnot"
  "and"
  "or"
  "not"
] @keyword.operator



[
  "."
  ";"
  ","
  ":"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  "<-" 
  "+" 
  "-" 
  "*" 
  "/" 
  "%" 
  "//" 
  ":=" 
  "<<" 
  "->" 
  "=>" 
  "=" 
  ">" 
  ">=" 
  "<" 
  "<=" 
  "==" 
  "!=" 
  "===" 
  "!==" 
  "&&" 
  "||" 
  "!" 
  "$"
] @operator

[
  (true)
  (false)
] @boolean

(break_statement
  label: (identifier) @label)

(continue_statement
  label: (identifier) @label)

(string) @string

(nil) @constant.builtin

[
  (float)
  (integer)
] @number

(wildcard) @character.special
(vararg) @string.special

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (dot_expression
              field: (identifier) @function.method.call))

(local_statement
  name: (identifier) @function
  [
    (closure)
    (closure_body)
  ])

(let_statement
  pattern: (dot_expression
    field: (identifier) @function.method)
  value: [
    (closure)
    (closure_body)
  ])

(let_statement
  pattern: (identifier) @function
  value: [
    (closure)
    (closure_body)
  ])

(assign_statement
  pattern: (dot_expression
    field: (identifier) @function.method)
  value: [
    (closure)
    (closure_body)
  ])

(assign_statement
  pattern: (identifier) @function
  value: [
    (closure)
    (closure_body)
  ])

(method_statement
  name: (dot_expression
          field: (identifier) @function.method))

(dot_expression
  field: (identifier) @member)

(class_method
  (class_pair
    field: (identifier) @function.method))
    
(class_shared_list
  (class_pair
    field: (identifier) @function
    value:
      [
        (closure)
        (closure_body)
      ]))

(tuple
  "(" @punctuation.special
  ")" @punctuation.special)

(comment) @comment

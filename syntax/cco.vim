syn match   Constant   /\<[0-9]\+\(.[0-9]\+\)\?\>/
syn match   String     /"\([^\\"]\?\(\\[\\"tn]\)\?\)*"/           contains=Escape
syn match   String     /'.'/                                      contains=Escape
syn match   Constant   /\(\\n\)|\(\\r\)|\(\\t\)|\(\\0\)/          contained
" hi def link Escape     Constant

syn match   FuncSig    /\func\s\+\w+([^)]*)\s*\(->\s*\w+\)\?\s*/
syn match   FuncParams /(\(&\?mut\s+\)\?[_A-Za-z]\w*\(,\s*\)\?)/  contains=Type,Param
syn match   Type       /\<[A-Z]\w*/
syn keyword Type       i8 i16 i32 i64 u8 u16 u32 u64 isize usize f32 f64 bool char str __cvoid any
syn match   FuncName   /[_A-Za-z]\w*(/                            contains=Function
syn match   Function   /[_A-Za-z]\w*/                             contained

syn keyword Constant   true false null default
syn match   Constant   /\<[A-Z0-9_]\+\>/

syn keyword Conditional if else ask or
syn keyword Macro       import extern nomangle pub func struct mut yield return delete for while in break as type
syn keyword Error       this
" hi def link Param       Error

syn region  Block      start="{" end="}" fold transparent
syn region  Comment    start="\/\*" end="\*\/"
syn match   Comment    /\/\/.*\n/


syn match   Begin      /\w\+\(([^)]\+)\)\?\s*=\w+:/  contains=Parens,Equal
syn region  Outcome    start="{" end="}" fold transparent

syn match   Equal      /\w\+\(([^)]\+)\)\?\s*=/      contains=Name
syn match   Arrow      /=>\s*\w\+/  contains=Name
syn match   Name       /\w\+/       contains=SpecialV contained

syn match   Parens     /([^)]\+)/   contains=Condition
syn match   Condition  /\w\+/       contains=Number contained
syn match   Number     /[0-9]\+/    contained
syn match   String     /"\([^\\"]\?\(\\[\\"tn]\)\?\)*"/

syn keyword Modifier   Add Sub Set
syn keyword SpecialV   entry exit

hi def link Condition  Macro
hi def link Number     Constant
hi def link Name       Type
hi def link Modifier   Function
hi def link SpecialV   Error

syn match   Comment    /#.*\n/
syn match   Macro      /#!.*\n/


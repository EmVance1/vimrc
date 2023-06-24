syntax keyword	Todo		TODO
syntax keyword 	Name 		NAME contained

syntax match	Macro		"\$[a-zA-Z_]\+"
syntax match	Comment		"\* .*" contains=Todo, Name
syntax region 	Comment 	start="\*\*\*" end="\%$" contains=Todo, Name

syntax match	Error 		"\v(scene)\s+.*"
syntax match	Underlined	"\v(scene\s+)?(INT\.|EXT\.) [^a-z]+ - [^a-z]+"
syntax match	Error 		"\v(subhead)\s+.*"
syntax match	Underlined	"\v(subhead)\s+[^a-z]+" contains=Todo
syntax match	Error 		"\v(trans)\s+.*"
syntax match 	Function 	"\v(trans)\s+[^a-z]+"
syntax match 	Function  	"\v(direct)\s+"
syntax match	Error 		"\v(direct)\s*\n"
syntax match 	Function  	"\v(chyron)"
syntax match	Error 		"\v(chyron)\s*\n"

syntax keyword	Statement	parens speech
syntax keyword	Special 	montage
syntax match	Special 	"mon-end"

syntax match	Statement	"\v\w+( \((O\.S\.|V\.O\.)\))?:\s+" contains=Define
syntax match	Define		"\v\([A-Z].*\)"


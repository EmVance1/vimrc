syntax match 	Comment 		"\v//.*"
syntax region 	Comment 		start="\v/\*" end="\v\*/"

syntax match 	Function 		"\v(func)\s+[a-zA-Z_][a-zA-Z0-9_]*\s*(\.\s*(#?[A-Z_][a-zA-Z0-9_]*\s*))?" contains=Type, Structure, Constant
syntax keyword  Keyword 	 	func struct
syntax match 	Constant 		"\v(#(new|iter|next|hash|index))"

syntax match 	Identifier 		"\v[a-zA-Z_][a-zA-Z0-9_]*"

syntax match 	Float 	 		"\v[0-9]+\.[0-9]+"
syntax match 	Number 	 		"\v(0(x|o|b))?[0-9]+"
syntax match 	Character 		"\v'\\?.'"
syntax match 	String 			"\v\"[^\"]*\""
syntax keyword 	Boolean 		true false null

syntax keyword 	Conditional 	if else
syntax keyword 	Repeat 		 	for while
syntax keyword  Keyword 		yield return
syntax keyword 	Keyword 	 	this import

syntax match 	Type 			"\v(import)\s*[a-zA-Z_][a-zA-Z0-9_]*" contains=Keyword
syntax keyword  Type 			u8 u16 u32 u64 i8 i16 i32 i64 f32 f64 bool char str
syntax match 	Structure 		"\v[A-Z_][a-zA-Z0-9_]*"


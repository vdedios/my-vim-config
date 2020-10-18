" Highlight Class and Function names
syn match    cCustomParen    "(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match    cCustomFuncCab  "\w*\((.*).*\n{\)\@=" contains=cCustomParen
syn match    cCustomFuncCabx  "\w*\((\w* .*).*;\)\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  	Number
hi def link cCustomClass 	Number
hi def link cCustomFuncCab  Macro
hi def link cCustomFuncCabx  Macro

" Vim syntax file
" Language:    Flex Logic	
" Maintainer: hendi.maulana@redknee.com
" Last Change:

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Flex Logic is case insensitive
"syn case ignore

syn keyword flexConditional IF THEN ELIF ELSE CASE SWITCH EQUALS
syn keyword flexRepeat DO FOR LOOP NEXT TO UNTIL END WHILE
"Statement
syn keyword flexStatement PARAMETERS RESULTS DEFAULT RETURN INTERFACE
syn keyword flexStatement EXISTS CALL ADMIN_INSTANCE INSTANCE SPECIAL CASES
syn keyword flexStatement ON OR TO XOR AND NOT
syn keyword flexStatement CALL_IF_EXISTS IF_NOT_EXISTS IF_EXISTS

syn keyword flexBoolean  TRUE FALSE
syn keyword flexConst NULL
"Datatypes
syn keyword flexTypes BOOLEAN BYTE 
syn keyword flexTypes INTEGER LONG STRING CONST ENUM
syn keyword flexTypes DATE TIME DATE_AND_TIME

syn match flexOperator "[()+.,\-/*=&]"
syn match flexOperator "[<>]=\="
syn match flexOperator "<>"
syn match flexOperator "\s\+_$"
syn match flexOperator "[#:]"
" Methods
syn keyword flexMethods Add Notify NotifyImmediately ReadCibMsg TypeCast 
syn keyword flexMethods ReadBalance Recharge SetBalance Reserve
syn keyword flexMethods GetSubscriptions
syn keyword flexMethods SubString StringTokenizer StringWith
syn keyword flexMethods GetCurrentTime ModifyDate SetExpirationDate
syn keyword flexMethods InstanceIDMapper

"syn keyword flexEvents Activate ActiveRowChanged

"syn keyword flexFunction Abs Array Asc AscB AscW Atn Avg BOF CBool CByte
"syn keyword flexFunction 

"syn keyword flexKeyword Public PublicNotCreateable OnNewProcessSingleUse

syn keyword flexTodo contained	TODO

"syn keyword flexDefine flex3DDKShadow flex3DFace flex3DHighlight flex3DLight


"Numbers
"integer number, or floating point number without a dot.
syn match flexNumber "\<\d\+\>"
"floating point number, with dot
syn match flexNumber "\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match flexNumber "\.\d\+\>"
"syn match  flexNumber		"{[[:xdigit:]-]\+}\|&[hH][[:xdigit:]]\+&"
"syn match  flexNumber		":[[:xdigit:]]\+"
"syn match  flexNumber		"[-+]\=\<\d\+\>"
syn match  flexFloat		"[-+]\=\<\d\+[eE][\-+]\=\d\+"
syn match  flexFloat		"[-+]\=\<\d\+\.\d*\([eE][\-+]\=\d\+\)\="
syn match  flexFloat		"[-+]\=\<\.\d\+\([eE][\-+]\=\d\+\)\="

" String and Character contstants
syn region  flexString		start=+"+  end=+"\|$+
syn region  flexComment		start="/\*"  end="\*/" contains=flexTodo
syn match   flexComment		"//.*$" contains=flexTodo
syn match   flexLineNumber	"^\d\+\(\s\|$\)"
syn match   flexTypeSpecifier  "[a-zA-Z0-9][\$%&!#]"ms=s+1
syn match   flexTypeSpecifier  "#[a-zA-Z0-9]"me=e-1

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_flex_syntax_inits")
	if version < 508
		let did_flex_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink flexBoolean		Identifier
	HiLink flexLineNumber		Comment
	HiLink flexComment		Comment
	HiLink flexConditional    Identifier	
	HiLink flexConst			Constant
	HiLink flexDefine			Constant
	HiLink flexError			Error
	HiLink flexFunction		Identifier
	HiLink flexIdentifier		Identifier
	HiLink flexNumber			Number
	HiLink flexFloat			Float
	HiLink flexMethods		PreProc
	HiLink flexOperator		Operator
"	HiLink flexRepeat			Repeat
        HiLink flexRepeat			Identifier
	HiLink flexString			String
	HiLink flexStatement		Identifier
	HiLink flexKeyword		Statement
	HiLink flexEvents			Special
	HiLink flexTodo			Todo
	HiLink flexTypes			Type
	HiLink flexTypeSpecifier	Type

	delcommand HiLink
endif

let b:current_syntax = "flex"

" vim: ts=8

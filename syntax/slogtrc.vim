" Vim syntax file
" Language:	SLEE log file
" Maintainer:	rakhmat.nugroho@nsn.com 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
syntax clear

syn match slogtrcError "^ERROR\S*:" 
syn match slogNumber "\d" 
syn match slogtrcPair "[a-zA-Z0-9]\+=[a-zA-Z0-9_]\+" contains=slogtrcName
syn match slogtrcName "[a-zA-Z0-9]\+=" contained
syn match slogtrcQuotedValue "\"\S*\"" 
syn match slogtrcQuotedValue "'CONTAINS .\+'" 
syn match slogtrcNotMatching "not matching"


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
highlight link slogtrcError ErrorMsg
highlight link slogtrcNotMatching Error
highlight link slogNumber Number
highlight link slogtrcPair Number
highlight link slogtrcName Special
highlight link slogtrcQuotedValue Identifier

let b:current_syntax = "slogtrc"

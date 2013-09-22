" Vim syntax file
" Language:	SLEE log file
" Maintainer:	rakhmat.nugroho@nsn.com 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
syntax clear

syn region slogError start="^ERROR" end="$" 
syn region slogForStep start="Flex>.*for step" end="Flex> Exits.*$" contains=slogAction,slogForStepParam,slogStepValue,slogForStepNo
syn match slogForStepNo "for step \d\+:" contained 
syn match slogInSub "Flex>.*in sub.*$"
syn region slogSignal start="[a-zA-Z]*-SIGNAL-START" end="SIGNAL-END" contains=slogSignalValue
syn match slogLogicStart "Flex>.*is about to run.*$"
syn match slogLogicEnd "Flex>.*finished.*$"
syn region slogRatingResponse start="Frt> The following data is returned in IRatingResponse" end="END IRatingResponse" contains=slogNumber
syn match slogCharging "<use-case\/>.*$" contains=slogQuotedValue
syn match slogChargingStep "<Step number.*$" contains=slogAction,slogQuotedValue
syn region slogChargingGeneralState start="BEGIN: ChargeGeneralState" end="END: ChargeGeneralState" contains=slogNumber

syn match slogStoreValue "Flex> .*store value on index.*$" contains=slogNumber
syn match slogForStepParam "Flex> Par.*" contained contains=slogStepValue
syn match slogAction "\.[a-zA-Z0-9]*Action" contained

syn match slogStepValue display contained "'.*'"
syn match slogNumber "\d" display contained
syn match slogSignalValue "[a-zA-Z0-9]\+=[a-zA-Z0-9_]\+" contained contains=slogSignalName
syn match slogSignalName "[a-zA-Z0-9]\+=" contained
syn match slogQuotedValue "\"\S*\"" contained

syn region slogTicketProfile start="<ConfirmationTicketV21" end="\/ConfirmationTicketV21>" contains=slogQuotedValue
syn region slogTicketProfile start="<CallTicketV22" end="\/CallTicketV22>" contains=slogQuotedValue

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
highlight link sLogError ErrorMsg
highlight link slogForStep Question
highlight link slogForStepNo Statement
highlight link slogStoreValue Special
highlight link slogInSub Folded
highlight link slogSignal Identifier
highlight link slogLogicStart TabLineSel
highlight link slogLogicEnd TabLineSel
highlight link slogAction Special
highlight link slogRatingResponse Identifier
highlight link slogCharging Special
highlight link slogChargingStep Special
highlight link slogChargingGeneralState Identifier
highlight link slogStepValue Number
highlight link slogNumber Number
highlight link slogSignalValue Number
highlight link slogSignalName Special
highlight link slogForStepParam Identifier
highlight link slogQuotedValue Identifier
highlight link slogTicketProfile Special

let b:current_syntax = "slog"

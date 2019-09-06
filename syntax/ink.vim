if exists("b:current_syntax")
  finish
endif

"syntax keyword inkOperator and not or && ||
"syntax keyword inkCast INT FLOOR FLOAT
"
syntax keyword inkPreProc INCLUDE EXTERNAL
syntax keyword inkDoneEnd contained DONE END

syntax match inkNumbers "\v(\d|\.)+" contained containedin=inkBracketExpr

syntax match inkKnotName  "\v\s*\k+" contained nextgroup=inkStitchSuffix
syntax match inkStitchSuffix "\v\.\k+" contained

syntax match inkGlue "<>"
syntax match inkDivert "->" nextgroup=inkKnotName

syntax region inkComment start="//" end="$"
syntax region inkComment start="/\*" end="\*/" extend
syntax region inkTodo start="TODO\s\?:"hs=s end="$" contains=inkComment keepend
syntax region inkTag start="# " end="$" contains=inkComment

syntax region inkKnot start="^\s*=\{2,}\s" end="$" contains=inkComment,inkTag,inkKnotName
syntax region inkStitch start="^\s*=\s" end="$" contains=inkComment,inkTag,inkKnotName

syntax match inkChoice "\v^\s*((\*\s)+|(\+\s)+|(-\s)+)" contains=inkLabel nextgroup=inkLabel
syntax match inkLabel "\v\(.{-}\)" contained contains=inkKnotName

syntax match inkChoiceText "\v(\[|\])"

syntax region inkBracketExpr start="\v\{" end="\v\}" transparent nextgroup=inkPrefixBracketContainer contains=inkPrefixBracketContainer,inkBracket keepend
syntax match inkPrefixBracketContainer "\v\{[!&~]" contained transparent nextgroup=inkBracket contains=inkBracket,inkTextChoice
syntax match inkBracket "\v\{" contained contains=inkTextChoice nextgroup=inkTextChoice
syntax match inkTextChoice "\v\{\!"hs=s+1 contained nextgroup=inkBracket
syntax match inkTextChoice "\v\{\&"hs=s+1 contained nextgroup=inkBracket
syntax match inkTextChoice "\v\{\~"hs=s+1 contained nextgroup=inkBracket
syntax match inkBracket "\}" contained


syntax region inkFunc start="\v[A-Z_]+\(" end="\v\)" transparent contained containedin=inkBracketExpr contains=inkParens,inkFuncName,inkFuncArgs keepend nextgroup=inkFuncName
syntax match inkFuncName "\v[A-Z_]+" contained contains=inkFuncArgs,inkParens nextgroup=inkParens
syntax match inkParens "\v(\(|\))" contained contains=inkFuncArgs nextgroup=inkFuncArgs
syntax match inkFuncArgs "\v\s*(->)?\s*\w*\s*" contained


" syntax match inkBuiltin "\vCHOICE_COUNT\(\)" contained containedin=inkBracketExpr
" syntax match inkBuiltin "\vTURNS\(\)" contained containedin=inkBracketExpr
" syntax match inkBuiltin "\vTURNS_SINCE" contained containedin=inkBracketExpr contains=inkDivertArgs nextgroup=inkDivertArgs
" syntax match inkDivertArgs "\v\(\s*->\s*\w+\s*\)" contained transparent contains=inkDivert,inkKnotName,inkParens nextgroup=inkParens
" syntax match inkParens "\v(\(|\))" contained
" syntax match inkBuiltin "\vSEED_RANDOM\(\d+\)" contained containedin=inkBracketExpr contains=inkNumbers

syntax match inkEndBracket "\v\}$"

syntax match inkBool "true" contained containedin=inkBracketExpr
syntax match inkBool "false" contained containedin=inkBracketExpr

highlight default link inkPreProc PreProc
highlight default link inkComment Comment
highlight default link inkTodo Todo
highlight default link inkTag Special

highlight default link inkDivert Special
highlight default link inkDoneEnd Statement
highlight default link inkGlue Special

highlight default link inkKnot Identifier
highlight default link inkStitch Identifier

highlight default link inkKnotName Structure
highlight default link inkStitchSuffix Structure

highlight default link inkChoice Statement
highlight default link inkLabel Structure

highlight default link inkChoiceText Structure

highlight default link inkNumbers Number
highlight default link inkBool Boolean

highlight default link inkBracket Structure
highlight default link inkTextChoice Statement
highlight default link inkPrefixBracketContainer Statement
highlight default link inkEndBracket Structure

highlight default link inkFunc Function
highlight default link inkFuncName Function
highlight default link inkParens Function

let b:current_syntax = "ink"

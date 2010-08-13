if exists("b:current_syntax")
    finish
endif

syn match cfgHeader     /^\[.*\]/
syn match cfgComment    /^[\t ]*#.*$/

syn match cfgOperator    /=/
syn match cfgMembers    /^members/
syn match cfgReadonly    /^readonly/
syn match cfgWritable    /^writable/
" syn match cfgMember    /^members *= *\@<=\w\+/
syn match cfgMember    /\(^members * = *\)\@<=.\+/ contains=cfgGroupInclude
syn match cfgGroupInclude    /\w\@<!@[a-z0-9_-]\+/ contained

hi link cfgHeader 	Title
hi link cfgComment 	Comment
hi link cfgOperator Operator
hi link cfgMembers  Statement
hi link cfgReadonly Question
hi link cfgWritable Operator
hi link cfgGroupInclude String
hi link cfgMember Special

" vim: set ai et sw=4 :

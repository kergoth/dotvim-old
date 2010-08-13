" Match a line containing just '--' as an error, as beginning a signature
" with the dashes, but without the trailing space, is a common mistake.
syn match mailInvalidSignature contains=@mailLinks,@mailQuoteExps "^--$"
hi def link mailInvalidSignature Error

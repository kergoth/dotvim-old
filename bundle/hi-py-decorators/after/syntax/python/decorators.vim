syn match   pythonDecorator	"@" display contains=pythonDecoratorFunction nextgroup=pythonDecoratorFunction skipwhite
syn match   pythonDecoratorFunction	"[a-zA-Z_][a-zA-Z0-9_.]*" display contained nextgroup=pythonFunc skipwhite
hi link pythonDecoratorFunction pythonDecorator

setlocal keywordprg=pydoc
setlocal commentstring=#\ %s
setlocal sw=4 ts=4 sts=4 et
if exists('+omnifunc')
  set ofu=pythoncomplete#Complete
endif
set isk+=.
setlocal fdm=syntax
setlocal fdl=1

setlocal keywordprg=pydoc
setlocal commentstring=#\ %s
setlocal sw=4 ts=4 sts=0 noet
if exists('+omnifunc')
  set ofu=pythoncomplete#Complete
endif

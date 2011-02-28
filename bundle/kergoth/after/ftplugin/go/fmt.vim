if !executable("gofmt")
  finish
endif

let bindirs = split(globpath(&runtimepath, 'bin'), '\n')
let $PATH = $PATH . ':' . join(bindirs, ':')
if !executable("mygofmt")
  finish
endif

function! Goformat()
  let regel=line(".")
  silent %!mygofmt
  call cursor(regel, 1)
endfunction

command! Gofmt call Goformat()

au BufWrite *.go :Gofmt
set equalprg=mygofmt

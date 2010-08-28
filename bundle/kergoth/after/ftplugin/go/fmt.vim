let $PATH = $MYVIMRUNTIME . "/bin:" . $PATH

function! Goformat()
  if executable("mygofmt")
    let regel=line(".")
    silent %!mygofmt
    call cursor(regel, 1)
  endif
endfunction

command! Fmt call Goformat()

set equalprg=mygofmt
au BufWrite *.go :Fmt

function! Goformat()
    let regel=line(".")
    silent %!~/bin/gofmt
    call cursor(regel, 1)
endfunction

command! Fmt call Goformat()

au BufWrite *.go :Fmt

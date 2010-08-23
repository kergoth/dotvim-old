function! Goformat()
    let regel=line(".")
    silent %!gofmt
    call cursor(regel, 1)
endfunction

command! Fmt call Goformat()

au BufWrite *.go :Fmt

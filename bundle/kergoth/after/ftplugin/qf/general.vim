set foldmethod=marker
set foldmarker=Entering\ directory,Leaving\ directory

setlocal statusline=%2*%-3.3n%0* |
setlocal statusline+=\ \[Compiler\ Messages\] |
setlocal statusline+=%=%2*\ %<%P |

let w:numberoverride = 1
set nonumber

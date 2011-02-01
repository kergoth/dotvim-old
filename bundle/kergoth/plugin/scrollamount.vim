" Title:        ScrollAmount
" Description:  Adjust mouse wheel scroll amount based on window height.
" Maintainer:   Chris Larson <clarson@kergoth.com>
" Version:      2

if exists("g:loaded_scrollamount") || &cp || !has('autocmd')
  finish
endif
let g:loaded_scrollamount = 1

function! <SID>Max(a, b)
  if a:a >= a:b
    return a:a
  else
    return a:b
  endif
endfunction

function! <SID>MapMouseScroll()
    let mousejump = <SID>Max(winheight(0)/8, 1)
    exe 'map <MouseDown> ' . mousejump . ''
    exe 'map <MouseUp> ' . mousejump . ''
endfunction

if &ttymouse != '' ||
      \ (has('gui_running') && has('unix'))
  " scrollwheel = intelligent # of lines to scroll based on window height
  augroup KergothScrollWheel
    au!
    au WinEnter,VimEnter * call <SID>MapMouseScroll()

    try
      au VimResized * call <SID>MapMouseScroll()
    catch
    endtry
  augroup END
endif

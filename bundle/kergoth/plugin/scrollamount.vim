" Title:        ScrollAmount
" Description:  Adjust mouse wheel scroll amount based on window height.
" Maintainer:   Chris Larson <clarson@kergoth.com>
" Version:      3

if exists("g:loaded_scrollamount") || &cp || !has('autocmd')
  finish
endif
let g:loaded_scrollamount = 1

if !exists("g:scrollamount_factor")
  " The number of lines for the mouse wheel jump is the window height divided
  " by this factor.
  let g:scrollamount_factor = 8
endif

function! <SID>MapMouseScroll()
    let mousejump = max([winheight(0) / g:scrollamount_factor, 1])
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

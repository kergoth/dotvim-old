" We need 'matchadd'
if exists('g:loaded_tip810') || (v:version == 701 && ! exists('*matchadd'))
      \ || (v:version < 702)
	finish
endif
let g:loaded_tip810 = 1

" highlight text that exceeds the textwidth limit
" http://vim.wikia.com/wiki/Highlight_long_lines
autocmd BufWinEnter * :call ApplyTextwidthOverflowHighlighting()
function! ApplyTextwidthOverflowHighlighting()
" remove the previous application in this window
  if exists('w:textwidth_overflow_highlighting_match') &&
        \ exists('w:textwidth_overflow_highlighting_width') &&
        \ (
        \ exists('b:textwidth_overflow_highlighting_disabled') ||
        \ w:textwidth_overflow_highlighting_width != &textwidth
        \ )

    call matchdelete(w:textwidth_overflow_highlighting_match)
    unlet w:textwidth_overflow_highlighting_match
    unlet w:textwidth_overflow_highlighting_width
  endif

" perform new application in this window
  if exists('b:textwidth_overflow_highlighting_disabled') ||
        \ (
        \ exists('w:textwidth_overflow_highlighting_width') &&
        \ w:textwidth_overflow_highlighting_width == &textwidth
        \ )

" nothing to do
    return

  elseif &textwidth > 0
    let w:textwidth_overflow_highlighting_match =
          \ matchadd('WarningMsg', '\%>'. &textwidth .'v.\+', -1)
    let w:textwidth_overflow_highlighting_width = &textwidth
  endif
endfunction

nnoremap <Leader>tw :call ToggleTextwidthOverflowHighlighting()<Enter>
function! ToggleTextwidthOverflowHighlighting()
  if exists('b:textwidth_overflow_highlighting_disabled')
    unlet b:textwidth_overflow_highlighting_disabled
  else
    let b:textwidth_overflow_highlighting_disabled = 1
  endif
  call ApplyTextwidthOverflowHighlighting()
endfunction

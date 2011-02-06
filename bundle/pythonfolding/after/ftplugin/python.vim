" Python folding
" Autour: Maxim Kim <habamax@gmail.com>
" Website: http://habamax.ru/blog/2009/05/python-folding-in-vim/
" Last Change: 2009-12-08 16:31

setlocal smarttab
setlocal expandtab

" GLOBAL options {{{

if !exists("g:python_fold_block")
  let g:python_fold_block = "def"
  " let g:python_fold_block
  "   = "all" -- fold all python code blocks.
  "   = "def" -- fold only classes and defs
endif

if !exists("g:python_fold_keep_empty_lines")
  let g:python_fold_keep_empty_lines = "all"
  " let g:python_fold_keep_empty_lines
  "   = "all" -- keep empty lines between code blocks.
  "   = "top" -- keep empty lines between top level code blocks.
  "   = "top-one" -- keep one empty line between top level code blocks.
  "   = "one" -- keep one empty line between code blocks.
endif

if !exists("g:python_fold_comments")
  let g:python_fold_comments = 1
  " let g:python_fold_comments
  "   = 1 -- fold comments
  "   = 0 -- do not fold comments
endif

if !exists("g:python_fold_docstrings")
  let g:python_fold_docstrings = 1
  " let g:python_fold_docstrings
  "   = 1 -- fold docstrings
  "   = 0 -- do not fold docstrings
endif

if !exists("g:python_fold_imports")
  let g:python_fold_imports = 1
  " let g:python_fold_imports
  "   = 1 -- fold imports
  "   = 0 -- do not fold imports
endif

"}}}

" FOLDING {{{
setlocal fdm=expr
setlocal foldexpr=PythonFoldLevel(v:lnum)

function! PythonFoldLevel(lnum) "{{{
  let line = getline(a:lnum)
  let plnum = prevnonblank(a:lnum - 1)
  let pline = getline(plnum)
  let nlnum = nextnonblank(a:lnum + 1)
  let nline = getline(nlnum)

  let lfoldlevel = indent(a:lnum) / &sw + 1
  let rx_empty = '^\s*$'

  " Fold top level imports. {{{
  if g:python_fold_imports == 1
    let rx_import = '^\%(import\|from\)\s.*$'
    if line =~ rx_import
      if pline =~ rx_import
        return '1'
      else
        return '>1'
      endif
    endif
  endif
  "}}}

  " All blocks(including if, for, etc) are folded or classes and defs. {{{
  if g:python_fold_block == "all"
    let rx_block = '^.\+:\s*\%(#.*\)\?$'
    if g:python_fold_keep_empty_lines =~ "top"
      let rx_block_ws = '^\S.\+:\s*\%(#.*\)\?$'
    else
      let rx_block_ws = rx_block
    endif
  else
    let rx_block = '^\s*\%(def\|class\)\s.\+:\s*\%(#.*\)\?$'
    if g:python_fold_keep_empty_lines =~ "top"
      let rx_block_ws = '^\%(def\|class\)\s.\+:\s*\%(#.*\)\?$'
    else
      let rx_block_ws = rx_block
    endif
  endif

  " Python code block folded with its indent level.
  if line =~ rx_block &&
        \ !s:is_comment_or_string(a:lnum, stridx(line, ':') + 1)
    return '>'.lfoldlevel
  endif
  "}}}

  " Fold comments. {{{
  if g:python_fold_comments == 1
    let rx_comment = '^\s*#.*$'
    if g:python_fold_block == "all"
      if line =~ rx_comment
        if pline =~ rx_comment
          return lfoldlevel
        elseif nline =~ rx_comment
          return '>'.lfoldlevel
        endif
      endif
    else
      if line =~ rx_comment
        if pline =~ rx_comment && nline !~ rx_comment
          return 's1'
        elseif pline =~ rx_comment
          return '='
        elseif nline =~ rx_comment
          return 'a1'
        endif
      endif
    endif

    " We do not want to fold noncomments to a previous comment fold.
    if g:python_fold_block == "all" && line !~ rx_empty && line !~ rx_comment
          \ && pline =~ rx_comment && s:getpline(plnum - 1) =~ rx_comment
      return (lfoldlevel - 1)
    endif
  endif
  " }}}

  " Fold docstrings. {{{
  if g:python_fold_docstrings == 1

    let rx_docstr = '"""\|'."'''"
    if line =~ rx_empty
      if pline =~ rx_docstr ||
            \(s:is_string(plnum, len(pline)) && s:is_string(plnum, 1))
        return "="
      endif
    endif

    if line =~ rx_docstr &&
          \ line !~ '^\s*""".*"""\s*$' && line !~ "^\s*'''.*'''\s*$"
      if s:is_string(plnum, len(pline))
        return 's1'
      else
        return 'a1'
      endif
    endif

  endif
  "}}}

  " Process empty lines between code blocks. {{{
  let foldlevel = -1
  if g:python_fold_keep_empty_lines == "all"
    let foldlevel = s:keep_lines(line, nextnonblank(a:lnum + 1),
          \ '\%(^\s*@.*$\)'.
          \ '\|\%('.rx_block_ws.'\)'.
          \ '\|\%(^\%(import\|from\|\s\)\@!.\+$\)')
  elseif g:python_fold_keep_empty_lines == "top"
    let foldlevel = s:keep_lines(line, nextnonblank(a:lnum + 1),
          \ '\%(^@.\+$\)'.
          \ '\|\%('.rx_block_ws.'\)'.
          \ '\|\%(^\%(import\|from\|\s\)\@!.\+$\)')
  elseif g:python_fold_keep_empty_lines == "top-one"
    let foldlevel = s:keep_lines(line, a:lnum + 1,
          \ '\%(^@.\+$\)'.
          \ '\|\%('.rx_block_ws.'\)'.
          \ '\|\%(^\%(import\|from\|\s\)\@!.\+$\)')
  elseif g:python_fold_keep_empty_lines == "one"
    let foldlevel = s:keep_lines(line, a:lnum + 1,
          \ '\%(^\s*@.*$\)'.
          \ '\|\%('.rx_block_ws.'\)'.
          \ '\|\%(^\%(import\|from\|\s\)\@!.\+$\)')
  endif
  if foldlevel != -1
    return foldlevel
  endif
  "}}}

  " We don't want top level statements to be folded in into top level
  " fors and ifs.
  if line !~ rx_empty && indent(a:lnum) == 0
        \ && !is_string(a:lnum, 1)
    return 0
  end

  " Avoid folding of the rest of the outer block into previous inner block.
  if g:python_fold_block == "all" &&
        \ line !~ rx_empty && indent(a:lnum) < indent(prevnonblank(a:lnum - 1))
        \ && !is_string(a:lnum, 1)
    return (lfoldlevel - 1)
  endif

  return '='
endfunction "}}}

function! s:keep_lines(line, nextlnum, regexp) "{{{
  let nextline = getline(a:nextlnum)
  if a:line =~ '^\s*$' && nextline =~ a:regexp &&
        \ (!s:is_comment_or_string(a:nextlnum, stridx(nextline, ':') + 1) ||
        \  !s:is_comment_or_string(a:nextlnum, stridx(nextline, '@') + 1))
    return (indent(a:nextlnum) / &sw)
  endif
  return -1
endfunction "}}}

function! s:is_comment_or_string(lnum, cnum) "{{{
  return synIDattr(synID(a:lnum, a:cnum, 1), 'name') =~ '\(Comment\|String\)$'
endfunction "}}}

function! s:is_string(lnum, cnum) "{{{
  return synIDattr(synID(a:lnum, a:cnum, 1), 'name') =~ 'String$'
endfunction "}}}

function! s:getpline(lnum) "{{{
  return getline(prevnonblank(a:lnum))
endfunction "}}}

setlocal foldtext=PythonFoldText()
function! PythonFoldText() "{{{
  let line = getline(v:foldstart)
  return line.' ['.(v:foldend - v:foldstart).'] '
endfunction "}}}

" FOLDING }}}

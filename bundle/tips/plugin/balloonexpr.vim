if exists('g:loaded_balloonexpr') || &cp
  finish
endif
let g:loaded_balloonexpr = 1

if (v:version >= 700) && has('balloon_eval')
  fun! BalloonExpr()
    let foldStart = foldclosed(v:beval_lnum )
    let foldEnd   = foldclosedend(v:beval_lnum)

    let lines = []

    " If we're not in a fold...
    if foldStart < 0
      " If 'spell' is on and the word pointed to is incorrectly spelled,
      " the tool tip will contain a few suggestions.
      let lines = spellsuggest(spellbadword(v:beval_text)[0], 5, 0)
    else
      let numLines = foldEnd - foldStart + 1

      " Up to 31 lines get shown okay; beyond that, only 30 lines are shown
      " with ellipsis in between to indicate too much.
      " The reason why 31 get shown okay is that 30 lines plus one of ellipsis
      " is 31 anyway...
      if numLines > 31
        let lines = getline(foldStart, foldStart + 14)
        let lines += ['-- Snipped ' . (numLines - 30) . ' lines --']
        let lines += getline(foldEnd - 14, foldEnd)
      else
        let lines = getline(foldStart, foldEnd)
      endif
    endif

    return join(lines, has('balloon_multiline') ? '\n' : ' ')
  endfun

  set ballooneval
  set balloonexpr=BalloonExpr()
endif

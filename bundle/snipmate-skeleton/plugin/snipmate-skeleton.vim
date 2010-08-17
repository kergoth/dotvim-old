fun! <SID>ReadSnipMateSkeleton()
  let path = globpath(&rtp, "skeletons/skel." . &ft)
  if filereadable(path)
    star
    call snipMate#expandSnip(join(readfile(path), "\n"), 1)
  endif
endfun

au BufNewFile * call <SID>ReadSnipMateSkeleton()

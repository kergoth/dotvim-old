fun! <SID>ReadSnipMateSkeleton()
  let skelname = expand("%:e")
  if empty(skelname)
    let skelname = &ft
  endif

  if !empty(skelname)
    let path = globpath(&rtp, "skeletons/skel." . skelname)
    if filereadable(path)
      star
      call snipMate#expandSnip(join(readfile(path), "\n"), 1)
    endif
  endif
endfun

au BufNewFile * call <SID>ReadSnipMateSkeleton()

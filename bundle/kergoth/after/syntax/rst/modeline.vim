execute 'syn region rstComment contained' .
      \ ' start=/.*/'
      \ ' end=/^\s\@!/ contains=rstTodo,vimModeline'

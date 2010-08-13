TODO
----

- Find a good vim script / configuration for:

  - "Project" handling

    - http://www.vim.org/scripts/script.php?script_id=2801

  - Session management

    - http://peterodding.com/code/vim/session/

  - Completion - either good use of included functionality, or enhanced to
    show function prototypes, etc

    - http://github.com/ervandew/supertab

- Find a nice light background color scheme

  - http://www.vim.org/scripts/script.php?script_id=2855

- Fix 'K' behavior in python scripts, it should be calling pydoc -- either via
  configuring manpageview to run it, or via pydoc.vim

  - let g:manpageview_pgm_py = "pydoc" should work, in theory, but does not
    appear to in reality at the moment

- Integrate MacVim's 'fullscreen' and 'fuoptions' into shell.vim
  (http://peterodding.com/code/vim/shell/)
- Determine if quiltdiff/svndiff/gitdiff/etc are worthwhile

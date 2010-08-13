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

      - This seems rather buggy to me, at least the completion out of the box in
        a python script with omnifunc set doesn't appear to use the omni
        completion, it's falling back to <c-p>, which is pretty useless

- Find a nice light background color scheme

  - http://www.vim.org/scripts/script.php?script_id=2855

- Test these out

  - svndiff, gitdiff, etc
  - quiltdiff: http://www.vim.org/scripts/script.php?script_id=2148
  - http://www.vim.org/scripts/script.php?script_id=2302
  - http://github.com/taq/vim-git-branch-info
  - http://www.vim.org/scripts/script.php?script_id=2255
  - unimpaired.vim: http://www.vim.org/scripts/script.php?script_id=1590
  - python_match.vim: http://www.vim.org/scripts/script.php?script_id=386
  - abolish.vim: http://www.vim.org/scripts/script.php?script_id=1545
  - lua-inspect: http://peterodding.com/code/vim/lua-inspect/

- Fix 'K' behavior in python scripts, it should be calling pydoc -- either via
  configuring manpageview to run it, or via pydoc.vim

  - let g:manpageview_pgm_py = "pydoc" should work, in theory, but does not
    appear to in reality at the moment

- Integrate MacVim's 'fullscreen' and 'fuoptions' into shell.vim
  (http://peterodding.com/code/vim/shell/)

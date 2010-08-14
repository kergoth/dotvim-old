TODO
----

- Find a good vim script / configuration for:

  - "Project" handling

    - nerdtree_project: http://www.vim.org/scripts/script.php?script_id=2801
    - workspace: http://www.vim.org/scripts/script.php?script_id=1410
    - winmanager: http://www.vim.org/scripts/script.php?script_id=95
    - project: http://www.vim.org/scripts/script.php?script_id=69

  - Session management

    - http://peterodding.com/code/vim/session/
    - sessions.vim: http://www.vim.org/scripts/script.php?script_id=2151
    - sessionman.vim: http://www.vim.org/scripts/script.php?script_id=2010

  - Completion - either good use of included functionality, or enhanced to
    show function prototypes, etc

    - http://github.com/ervandew/supertab

      - The 'context' handling for the completion seems a bit wonky with
        python -- try modifying it to trigger omni when seeing a '.' in
        python, not just c.

  - Smart Tabs (always use spaces for alignment, even if using tabs for
    indentation)

    - My altered c.vim: tabspace.vim
    - Smart Tabs: http://www.vim.org/scripts/script.php?script_id=231
    - Clever Tabs: http://www.vim.org/scripts/script.php?script_id=2308

- Find a nice light background color scheme

  - http://www.vim.org/scripts/script.php?script_id=2855

- Test these out

  - svndiff, gitdiff, etc
  - quiltdiff: http://www.vim.org/scripts/script.php?script_id=2148
  - foldsearch: http://www.vim.org/scripts/script.php?script_id=2302
  - vim-git-branch-info: http://github.com/taq/vim-git-branch-info
  - buffergrep: http://www.vim.org/scripts/script.php?script_id=2255
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
- Show the pyflakes error message in the cursor bubble
- Fix gitcommit, it no longer shows the diff of the commit

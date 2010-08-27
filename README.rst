Included Bundles
----------------

- align: Help folks to align text, eqns, declarations, tables, etc
- bitbake: Syntax highlighting, indentation settings, new file skeleton for
  BitBake recipes and configuration files
- bufexplorer: Buffer Explorer / Browser
- changesplugin: indicate changes of a buffer
- conque: Conque is a Vim plugin allowing users to execute and interact with
  programs, typically a shell such as bash, inside a buffer window
- countjump: Create custom motions and text objects via repeated jumps.

  - Used by diff_movement, help_movement

- csapprox: Make gvim-only colorschemes work transparently in terminal vim
- c-syntax: C Syntax Extensions
- detectindent: Automatically detect indent (expandtab, shiftwidth, tabstop)
  settings
- diff_movement: Movement over diff hunks with ]] etc.
- endwise: Wisely add "end" in ruby, endfunction/endif/more in vim script, etc
- fugitive: A Git wrapper so awesome, it should be illegal
- getscript: Keep your plugins up-to-date! (semi-automatic retrieval)

  - Only used for the bundles which aren't handled with braid

- gist: vimscript for gist.github.com
- git: Vim Git runtime files
- github-colors: A gvim colorscheme based on github's syntax highlighting
- gitolite: Syntax highlight for gitolite configuration
- gitosis: gitosis-admin.conf syntax highlighting for vim
- go: Vim syntax highlighting for Go (http://golang.org)
- help_movement: Movement over Vim help sections with ]] etc.
- hilinks: A plugin which traces the highlighting linkages; ie. just what
  highlighting groups associated with the word under the cursor?
- histwin: A Vim Plugin for browsing the undo tree
- indentconsistencycop:  Is the buffer's indentation consistent and does it
  conform to tab settings?
- kergoth
- largefile: Edit large files quickly
- manpageview: Viewer for manpages, gnu info,  perldoc, and php
  (unix/linux/cygwin)
- markdown: Vim Markdown runtime files that WON'T leave you sterile
- matchit: extended % matching for HTML, LaTeX, and many other languages
- modeliner: Generates modeline according to the current settings.
- nerdcommenter: Vim plugin for intensely orgasmic commenting
- nerdtree: hax0r vim script to give you a tree explorer
- pathogen: manage your runtimepath
- pyflakes: on the fly Python checking in Vim with PyFlakes
- pylint: use pylint as the 'compiler' for python files
- pythoncomplete: Python Omni Completion

  - Latest version of the omnicompletion plugin included with Vim 7

- reload: The reload.vim plug-in automatically reloads various types of Vim
  scripts as they’re being edited in Vim to give you instant feedback on the
  changes you make
- repeat: enable repeating supported plugin maps with "."
- securemodelines: Secure, user-configurable modeline support
- snipmate: TextMate-style snippets for Vim
- smarttabs: Use tabs for indent, spaces for alignment
- speeddating: use CTRL-A/CTRL-X to increment dates, times, and more
- sudo: allows one to edit a file with prevledges from an unprivledged
  session.
- supertab: aims to provide tab completion to satisfy all your insert
  completion needs
- surround: quoting/parenthesizing made simple
- syntastic: Automatic syntax checking
- taglist: Source code browser (supports C/C++, java, perl, python, tcl, sql,
  php, etc)
- tips: Various snippets of vimscript pulled from the Vim tips site(s)
- vimorg-runtime: Updated files from the latest upstream vim runtime files
- vis: Extended Visual Mode Commands, Substitutes, and Searches
- yankring: Maintains a history of previous yanks, changes and deletes

TODO
----

- Figure out how to deal with pylint/pyflakes interactions.  The pyflakes
  plugin sets quickfix items, and it regenerates it automatically on certain
  events, which means it blows away the pylint messages from :make.  Perhaps
  we just need a way to disable/re-enable the pyflakes autocmds.
- Disable trailing whitespace and beyond textwidth highlighting for
  conque_term buffers
- Make detectindent obey 'comments' for non-C files.
- Integrate MacVim's 'fullscreen' and 'fuoptions' into shell.vim
  (http://peterodding.com/code/vim/shell/)
- Show the pyflakes error message in the cursor bubble

  - Note: the pyflakes error message uses the quickfix stuff.  There's a vim
    signs in the signs column, and to show the message in the cursor balloon
    when mousing over the sign.  Unfortunately, there are two issues:

    - balloon does not show up when mousing over the sign
    - have to manually run QuickfixsignsSet rather than it doing so
      automatically

- Figure out why let g:manpageview_pgm_py = "pydoc" doesn't work

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
  - Super Parentheses: http://www.vim.org/scripts/script.php?script_id=3210

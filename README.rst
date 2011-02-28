Included Bundles
----------------

  Notes:

  - pythoncomplete is available in git as a mirror at
    git://github.com/vim-scripts/pythoncomplete, but the version there places
    the pythoncomplete.vim file in the wrong location, so currently the
    pythoncomplete bundle is not being managed with braid, and will be updated
    manually.
  - All of the plugins I use from Peter Odding(xolox) are handled using the
    vim-scripts mirror git repositories, even though there are proper upstream
    repositories (github.com/xolox/), because the upstream repositories aren't
    laid out in a traditional vim bundle mannger.

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

- snipmate-skeleton: rather than only going by extension, try to open a
  template for the extension, and fall back to filetype.
- Determine how to make the spell checking a bit smarter.  Specifically, I'd
  like to disable all checking in regular python strings, but have checking in
  *docstrings* and in comments.  Alternatively, don't consider "%s" a spelling
  error.
- Figure out how to deal with pylint/pyflakes interactions.  The pyflakes
  plugin sets quickfix items, and it regenerates it automatically on certain
  events, which means it blows away the pylint messages from :make.  Perhaps
  we just need a way to disable/re-enable the pyflakes autocmds.

  - Additional note: :Glog conflicts with pyflakes in quickfix usage as well.

- Disable trailing whitespace and beyond textwidth highlighting for
  conque_term buffers
- Make detectindent obey 'comments' for non-C files.
- May want to try to implement the green/red bar for unit testing that exists
  in the vimrc at http://bitbucket.org/garybernhardt/dotfiles.
- Figure out why let g:manpageview_pgm_py = "pydoc" doesn't work
- Show the pyflakes error message in the cursor bubble

  - Note: the pyflakes error message uses the quickfix stuff.  There's a vim
    signs in the signs column, and to show the message in the cursor balloon
    when mousing over the sign.  Unfortunately, there are two issues:

    - balloon does not show up when mousing over the sign
    - have to manually run QuickfixsignsSet rather than it doing so
      automatically

- Fix bugs in the current python folding plugin

  - Fails with multi-line function definitions
  - Fails with nested function definitions

- To Test

  - https://github.com/mbadran/headlights

    - I tried this, but got an error (list index out of range).  Need to test
      this under gtk+ to see if it's a MacVim specific problem.

  - https://github.com/vim-scripts/AutoFold.vim
  - https://github.com/vim-scripts/easytags.vim
  - https://github.com/nathanaelkane/vim-indent-guides
  - http://majutsushi.github.com/tagbar/ (alternative to taglist)
  - https://github.com/vim-scripts/indentpython.vim--nianyang
  - https://github.com/alfredodeza/pytest.vim
  - https://github.com/vim-scripts/VimPdb
  - https://github.com/vim-scripts/NERD_Tree-and-ack
  - https://github.com/vim-scripts/toner.vim

  - svndiff, gitdiff, etc
  - quiltdiff: http://www.vim.org/scripts/script.php?script_id=2148
  - foldsearch: http://www.vim.org/scripts/script.php?script_id=2302
  - vim-git-branch-info: http://github.com/taq/vim-git-branch-info
  - buffergrep: http://www.vim.org/scripts/script.php?script_id=2255
  - unimpaired.vim: http://www.vim.org/scripts/script.php?script_id=1590
  - python_match.vim: http://www.vim.org/scripts/script.php?script_id=386
  - abolish.vim: http://www.vim.org/scripts/script.php?script_id=1545

Personal Notes / Reference:
---------------------------

- Keymap / Commands:

  - Vim core:

    - :only - close all windows but the current one

    - ctrl-^: switches between active and alternate buffer in the current window
    - ctrl-w s: split
    - gt, gT: next, previous tab
    - g;, g, (normal mode): previous, next in the changelist
    - ctrl-o, ctrl-i: previous, next in the jumplist
    - f{char}, F{char} (normal mode): occurance of {char} to the left, right
    - A == $a
    - C == d$a
    - I == ctrl-i: insert text before the first non-blank in the line
    - S == ctrl-c == cc: delete line(s) and start insert

  - Vimrc:

    - <leader>ew: edit a file in the same directory as the current file
    - <leader>es: same as above, in a split
    - <leader>ev: same as above, in a vertical split
    - <leader>et: same as above, in a new tab

  - Plugins:

    - surround

      - ds (normal mode): delete surrounding characters
      - cs (normal mode), s (visual mode), ctrl-g s (insert mode):
        change/insert surrounding characters
      - S (visual mode): change/insert surrounding characters, separate lines

    - align

      - <leader>adec: align C declarations
      - <leader>acom: align comments
      - <leader>afnc: align ansi-style C function input arguments
      - <leader>Htd: align html tables

    - nerdcommenter

      - <leader>cs: apply 'sexy' comment to line(s)
      - <leader>c<space>: toggle commenting on line(s)
      - <leader>cc: comment block as a whole (doesnt obey space_delim)
      - <leader>ci: comment individually
      - <leader>cu: uncomment individually

    - [modelines] <leader>im: insert modeline
    - [hilinks] <leader>hlt: show highlighting groups of mouseover

- Common indentation setups:

  - No hard tabs, 2 space indent: set sw=2 sts=2 et
  - No hard tabs, 4 space indent: set sw=4 sts=4 et
  - All hard tabs, 8 space tabstops: set ts=8 sw=8 sts=0 noet
  - Hard tabs for indentation, 4 space tabstops: set ts=4 sw=4 sts=0 noet
  - Horrendous, 4 space indent, 8 space tabstops, hard tabs:
    set ts=8 sw=4 sts=4 noet

- A 'hidden' buffer is one which has been modified, and is not loaded in a
  window.

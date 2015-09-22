# .emacs.d
Personal Emacs configuration used primarily for working with Perl and Haskell projects. Dependencies are pulled in as submodules.

## git hooks
Is is adviced to put following into the git `post-merge` hook

    #!/bin/sh
    emacs -batch -l recompile.el -kill
    echo "Done."

Or you might just `C-u 0 M-x byte-recompile-directory` `~/.emacs.d/packages` in Emacs.

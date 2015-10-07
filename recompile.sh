#!/bin/sh
find . -name '*.elc' -exec rm {} \;
emacs -batch -l recompile.el -kill

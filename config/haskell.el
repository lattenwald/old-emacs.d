(require 'haskell)
(require 'haskell-mode)
(require 'haskell-simple-indent)
(require 'haskell-font-lock)
(require 'stack-mode)

(custom-set-variables
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-args-cabal-repl
   '("--ghc-option=-ferror-spans"))
 '(haskell-notify-p t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-use-presentation-mode t)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-interactive-mode-eval-pretty nil)
 '(shm-use-presentation-mode t)
 '(shm-auto-insert-skeletons t)
 '(shm-auto-insert-bangs t)
 '(haskell-process-suggest-haskell-docs-imports t)
 '(hindent-style "chris-done")
 '(haskell-interactive-mode-eval-mode 'haskell-mode)
 '(haskell-process-args-ghci '("-ferror-spans"))
 '(haskell-process-args-cabal-repl
   '("--ghc-option=-ferror-spans"))
 '(haskell-complete-module-preferred
   '("Data.ByteString"
     "Data.ByteString.Lazy"
     "Data.Conduit"
     "Data.Function"
     "Data.List"
     "Data.Map"
     "Data.Maybe"
     "Data.Monoid"
     "Data.Ord")))

(require 'haskell)
(require 'haskell-mode)
(require 'haskell-indentation)
(require 'haskell-font-lock)
(require 'shm)
(require 'stack-mode)

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'haskell-mode-hook 'stack-mode)

(eval-after-load "structured-haskell-mode"
  '(progn
     (define-key shm-map (kbd "RET") 'shm/newline-indent)))

(eval-after-load "stack-mode"
  '(progn
     (define-key stack-mode-map (kbd "C-c C-l") nil)
     (define-key stack-mode-map (kbd "C-c C-r") 'stack-mode-load)))

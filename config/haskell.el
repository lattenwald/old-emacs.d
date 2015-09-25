(require 'haskell)
(require 'haskell-mode)
(require 'haskell-indentation)
;; (require 'haskell-simple-indent)
(require 'hindent)
(require 'haskell-font-lock)
(require 'haskell-decl-scan)
(require 'shm)
(require 'stack-mode)

(add-hook 'haskell-mode-hook
          (lambda nil
            (turn-on-haskell-indentation)
            ;; (turn-on-haskell-simple-indent)
            (hindent-mode)
            (haskell-decl-scan-mode)
            (stack-mode)
            (interactive-haskell-mode)
            (structured-haskell-mode)))

(add-hook 'structured-haskell-mode-hook
          (lambda nil
            (define-key shm-map (kbd "RET") 'shm/newline-indent-proxy)
            (define-key shm-map (kbd "C-j") 'shm/newline-indent)
            (define-key shm-map (kbd "DEL") nil)
            (define-key shm-map (kbd "<deletechar>") nil)))

(eval-after-load "stack-mode"
  '(progn
     (define-key stack-mode-map (kbd "C-c C-t") nil)
     (define-key stack-mode-map (kbd "C-f") 'stack-mode-type)))

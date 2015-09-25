(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(cperl-auto-newline-after-colon t)
 '(cperl-close-paren-offset 0)
 '(cperl-continued-statement-offset 4)
 '(cperl-electric-keywords t)
 '(cperl-electric-parens-mark nil)
 '(cperl-electric-parens-string "\"\"")
 '(cperl-hairy t)
 '(cperl-highlight-variables-indiscriminately t)
 '(cperl-indent-parens-as-block t)
 '(cua-keep-region-after-copy nil)
 '(cua-mode t nil (cua-base))
 '(cua-remap-control-v t)
 '(cua-remap-control-z t)
 '(custom-safe-themes
   (quote
    ("73abbe794b6467bbf6a9f04867da0befa604a072b38012039e8c1ba730e5f7a5" "8eaa3bce3c618cd81a318fcf2d28c1cd21278531f028feb53186f6387547dfb4" "a4f8d45297894ffdd98738551505a336a7b3096605b467da83fae00f53b13f01" "af9761c65a81bd14ee3f32bc2ffc966000f57e0c9d31e392bc011504674c07d6" default)))
 '(electric-pair-mode t)
 '(flx-ido-mode t)
 '(flycheck-completion-system (quote ido))
 '(flycheck-ghc-args (quote ("-fno-warn-unused-do-bind")))
 '(gc-cons-threshold 20000000)
 '(global-company-mode t)
 '(global-fixmee-mode t)
 '(global-undo-tree-mode t)
 '(global-whitespace-mode t)
 '(haskell-complete-module-preferred
   (quote
    ("Data.ByteString" "Data.ByteString.Lazy" "Data.Conduit" "Data.Function" "Data.List" "Data.Map" "Data.Maybe" "Data.Monoid" "Data.Ord")))
 '(haskell-interactive-mode-eval-mode (quote haskell-mode))
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-interactive-popup-errors nil)
 '(haskell-notify-p t)
 '(haskell-process-args-cabal-repl (quote ("--ghc-option=-ferror-spans")))
 '(haskell-process-args-ghci (quote ("-ferror-spans")))
 '(haskell-process-args-stack-ghci
   (quote
    ("--ghc-options=-ferror-spans --ghc-options=-fno-warn-unused-do-bind")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-suggest-haskell-docs-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-process-use-presentation-mode t)
 '(haskell-tags-on-save t)
 '(hindent-style "chris-done")
 '(ido-buffer-disable-smart-matches nil)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces nil)
 '(make-backup-files nil)
 '(max-lisp-eval-depth 3000)
 '(max-specpdl-size 6000)
 '(projectile-global-mode t)
 '(projectile-mode-line (quote (:eval (format " P[%s]" (projectile-project-name)))))
 '(shm-auto-insert-bangs t)
 '(shm-auto-insert-skeletons t)
 '(shm-lambda-indent-style (quote leftmost-parent))
 '(shm-pragmas
   (quote
    ("LANGUAGE" "OPTIONS_GHC" "INCLUDE" "DEPRECATED" "WARNING" "INLINE" "NOINLINE" "INLINABLE" "CONLIKE" "LINE" "RULES" "SPECIALIZE" "UNPACK" "SOURCE" "SCC" "MINIMAL" "OVERLAPPING" "OVERLAPPABLE")))
 '(shm-prevent-parent-deletion nil)
 '(shm-use-hdevtools t)
 '(shm-use-presentation-mode t)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(speedbar-default-position (quote left))
 '(sr-speedbar-default-width 20)
 '(sr-speedbar-right-side nil)
 '(tab-width 4)
 '(term-default-bg-color "black")
 '(term-default-fg-color "yellow")
 '(term-unbind-key-list (quote ("C-z" "C-x" "C-c" "C-h" "C-y" "<ESC>" "<tab>")))
 '(undo-tree-enable-undo-in-region nil)
 '(weechat-host-default "lattenwald.org")
 '(whitespace-style (quote (face trailing space-before-tab empty)))
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo"))))
 '(cperl-array-face ((t (:inherit font-lock-variable-name-face))))
 '(cperl-hash-face ((t (:inherit font-lock-variable-name-face))))
 '(fixmee-notice-face ((t (:foreground "yellow" :weight bold))))
 '(ido-first-match ((t (:underline nil :weight bold))))
 '(show-paren-match ((t (:background "black"))))
 '(term ((t (:inherit default :background "black")))))

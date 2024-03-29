;; Standard libraries needed
(require 'cl-lib)

;; custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

(defvar packages
  '( ;;libraries
     dash s seq f button-lock let-alist powerline

     ;; packages
     ag company company-ghc cperl-mode elm-mode exec-path-from-shell
     diminish dockerfile-mode docker fixmee flx-ido flycheck go-mode
     haskell-mode helm helm-ag idomenu lua-mode multi-term projectile
     purescript-mode smart-tabs-mode smex spaceline sunrise-commander
     sr-speedbar undo-tree vimish-fold web-mode weechat yaml-mode
     )
  "Packages whose location follows the
  packages/package-name/package-name.el format.")

(defvar custom-load-paths
  '("stack-ide/stack-mode"
    "magit/lisp"
    "ghc-mod/elisp"
    "structured-haskell-mode/elisp"
    "hindent/elisp"
    "ledger/lisp"
    "ESS"
    "ESS/lisp"
    "misc")
  "Custom load paths that don't follow the normal
  package-name/module-name.el format.")

(defvar configs
  '("global"
    "haskell"
    "perl"
    "react")
  "Configuration files that follow the config/foo.el file path
  format.")

;;; Load packages
(cl-loop for location in custom-load-paths
         do (add-to-list 'load-path
                         (concat (file-name-directory (or load-file-name
                                                          (buffer-file-name)))
                                 "packages/"
                                 location)))
(cl-loop for name in packages
         do (progn (unless (fboundp name)
                     (add-to-list 'load-path
                                  (concat (file-name-directory (or load-file-name
                                                                   (buffer-file-name)))
                                          "packages/"
                                          (symbol-name name)))
                     (require name))))

;;; Emacs configurations
(cl-loop for name in configs
         do (load (concat (file-name-directory load-file-name)
                          "config/"
                          name ".el")))
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

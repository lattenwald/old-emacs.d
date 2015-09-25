;; Standard libraries needed
(require 'cl-lib)

;; custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

(defvar packages
  '( ;;libraries
     dash s let-alist button-lock

     ;; packages
     ag company company-ghc cperl-mode exec-path-from-shell
     fixmee flx-ido flycheck haskell-mode helm helm-ag idomenu
     multi-term projectile smart-tabs-mode smex sunrise-commander
     sr-speedbar undo-tree weechat yaml-mode
     )
  "Packages whose location follows the
  packages/package-name/package-name.el format.")

(defvar custom-load-paths
  '("stack-ide/stack-mode"
    "magit/lisp"
    "ghc-mod/elisp"
    "structured-haskell-mode/elisp"
    "hindent/elisp")
  "Custom load paths that don't follow the normal
  package-name/module-name.el format.")

(defvar configs
  '("global"
    "haskell"
    "perl")
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

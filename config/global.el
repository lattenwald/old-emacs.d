;;; Fundamental functions
(defun set-auto-saves ()
  "Put autosave files (ie #foo#) in one place, *not*
 scattered all over the file system!"
  (defvar autosave-dir
    (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

  (make-directory autosave-dir t)

  (defun auto-save-file-name-p (filename)
    (string-match "^#.*#$" (file-name-nondirectory filename)))

  (defun make-auto-save-file-name ()
    (concat autosave-dir
            (if buffer-file-name
                (concat "#" (file-name-nondirectory buffer-file-name) "#")
              (expand-file-name
               (concat "#%" (buffer-name) "#"))))))

;;; incremeting numbers
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(global-set-key (kbd "C-c +") 'increment-number-at-point)

;;; Look and feel
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'wombat)
(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode t)

;;; smart tabs/spaces indentation
(setq-default indent-tabs-mode nil)
(autoload 'smart-tabs-mode "smart-tabs-mode")
(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
(autoload 'smart-tabs-advice "smart-tabs-mode")
(autoload 'smart-tabs-insinuate "smart-tabs-mode")
(add-hook 'smart-tabs-mode (lambda nil
                             (smart-tabs-insinuate
                              'c 'javascript 'cperl 'python 'ruby)))

;;; magit
(require 'magit)
;;; XXX autoloads?

;;; undo tree
(require 'undo-tree)
(global-set-key (kbd "C-r") 'undo-tree-redo)

;;; multi-term terminal
(require 'multi-term)
(setq multi-term-program "zsh")

;;; ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;;; Misc customizations
(setq-default cua-mode t)
(setq-default inhibit-startup-screen t)
(setq-default require-final-newline t)
(setq-default ns-command-modifier 'meta)
(setq-default cua-enable-cua-keys t)
(setq-default delete-selection-mode t)
(setq-default electric-pair-mode t)
(setq-default projectile-global-mode t)
(defvaralias 'c-basic-offset 'tab-width)

;;; Moving in buffer
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

;;; Other keys
(global-set-key (kbd "C-c i") 'idomenu)
(global-set-key (kbd "C-'") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-[") 'align)
(global-set-key (kbd "C-c =") 'magit-status)

;;; Moving between windows
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

;;; fixmee-mode
(setq-default fixmee--listview-local-only t)


;;; sr-speedbar
(require 'sr-speedbar)
(global-set-key (kbd "<f11>") 'sr-speedbar-toggle)

;;; align
(require 'align)
(add-to-list 'align-rules-list
             '(haskell-types
               (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
               (modes quote (haskell-mode literate-haskell-mode))))
(add-to-list 'align-rules-list
             '(haskell-assignment
               (regexp . "\\(\\s-+\\)=\\s-+")
               (modes quote (haskell-mode literate-haskell-mode))))
(add-to-list 'align-rules-list
             '(haskell-arrows
               (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
               (modes quote (haskell-mode literate-haskell-mode))))
(add-to-list 'align-rules-list
             '(haskell-left-arrows
               (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
               (modes quote (haskell-mode literate-haskell-mode))))

(add-hook 'before-save-hook 'whitespace-cleanup)

(server-start)
(exec-path-from-shell-initialize)

(provide 'global)

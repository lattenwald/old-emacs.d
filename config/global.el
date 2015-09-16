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

;;; tabs
(setq-default indent-tabs-mode nil)
(autoload 'smart-tabs-mode "smart-tabs-mode")

;;; Misc customizations
(setq-default cua-mode t)
(setq-default ido-everywhere t)
(setq-default inhibit-startup-screen t)
(setq-default require-final-newline t)
(setq-default ns-command-modifier 'meta)
(setq-default cua-enable-cua-keys t)
(setq-default delete-selection-mode t)
(setq-default electric-pair-mode t)
(setq-default projectile-global-mode t)

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

;;; Moving between windows
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

(add-hook 'before-save-hook 'whitespace-cleanup)

(server-start)
(exec-path-from-shell-initialize)

(provide 'global)

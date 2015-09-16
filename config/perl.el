(defalias 'perl-mode 'cperl-mode)

(add-hook 'cperl-mode-hook (lambda nil
                             (define-key cperl-mode-map (kbd "C-h f") 'cperl-perldoc)))
(add-hook 'cperl-mode-hook (lambda nil
                             (smart-tabs-mode-enable)
                             (smart-tabs-advice cperl-indent-line cperl-indent-level)))
(add-hook 'cperl-mode-hook 'projectile-mode)


(setq-default cperl-auto-newline-after-colon t)
(setq-default cperl-close-paren-offset 0)
(setq-default cperl-continued-statement-offset 4)
(setq-default cperl-electric-keywords t)
(setq-default cperl-electric-parens-mark nil)
(setq-default cperl-electric-parens-string "")
(setq-default cperl-hairy t)
(setq-default cperl-highlight-variables-indiscriminately t)
(setq-default cperl-indent-level 4)
(setq-default cperl-indent-parens-as-block t)

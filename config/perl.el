(defalias 'perl-mode 'cperl-mode)

(add-hook 'cperl-mode-hook (lambda nil
                             (define-key cperl-mode-map (kbd "C-h f") 'cperl-perldoc)))
(add-hook 'cperl-mode-hook (lambda nil
                             (smart-tabs-mode-enable)
                             (smart-tabs-advice cperl-indent-line cperl-indent-level)))
(add-hook 'cperl-mode-hook 'projectile-mode)

(defvaralias 'cperl-indent-level 'tab-width)

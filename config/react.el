;; see https://gist.github.com/sabof/4941970
(defun react-imenu-create-index ()
  "Return an imenu index for the current buffer"
  (save-excursion
    (save-restriction
      (let
          (unique-names result name pos)
        (widen)
        (goto-char (point-min))
        (while (re-search-forward
                "\\(\\_<[^\s-]+?\\_>\\)\s-*=\s-*React\\.createClass"
                nil t)
          (setq name (match-string-no-properties 1)
                pos (match-beginning 1))
          (when (member name unique-names)
            (let ((counter 2)
                  new-name)
              (while (progn (setq new-name (concat name
                                                   "["
                                                   (int-to-string counter)
                                                   "]"))
                            (member new-name unique-names))
                (incf counter))
              (setq name new-name)))
          (push name unique-names)
          (push (cons name pos) result))
        (nreverse result)))))

(defun my-react-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.jsx\\'" buffer-file-name))
    (setq imenu-create-index-function 'react-imenu-create-index)))

(add-hook 'find-file-hook 'my-react-mode)

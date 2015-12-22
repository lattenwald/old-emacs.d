(defvar react--beginning-of-class-re
  "\\(\\_<[^\s-]+?\\_>\\)\s-*=\s-*React\\.createClass")

(defun react-imenu-create-index ()
  "Return an imenu index for the current buffer

Stolen from https://gist.github.com/sabof/4941970"
  (save-excursion
    (save-restriction
      (let
          (unique-names result name pos)
        (widen)
        (goto-char (point-min))
        (while (re-search-forward react--beginning-of-class-re nil t)
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

(defun react-beginning-of-class (&optional arg)
  "Move backward to the beginning of a react class

With argument, do it that many times.  Negative arg -N
means move forward to Nth following beginning of proc.

Returns t unless search stops due to beginning or end of buffer.

Stolen from lua-mode"
  (interactive "P")
  (or arg (setq arg 1))

  (while (and (> arg 0)
              (re-search-backward react--beginning-of-class-re nil t))
    (setq arg (1- arg)))

  (while (and (< arg 0)
              (re-search-forward react--beginning-of-class-re nil t))
    (beginning-of-line)
    (setq arg (1+ arg)))

  (zerop arg))

(defun react-end-of-class (&optional arg)
  "Move forward to next end of react class.
With argument, do it that many times.  Negative argument -N means move
back to Nth preceding end of proc.

This function just searches for a `});' at the beginning of a line.

Stolen from lua-mode"
  (interactive "P")
  (or arg (setq arg 1))
  (let ((found nil)
        (ret t))
    (if (and (< arg 0)
             (not (bolp))
             (save-excursion
               (beginning-of-line)
               (eq (following-char) ?})))
        (forward-char -1))
    (while (> arg 0)
      (if (re-search-forward "^});" nil t)
          (setq arg (1- arg)
                found t)
        (setq ret nil
              arg 0)))
    (while (< arg 0)
      (if (re-search-backward "^});" nil t)
          (setq arg (1+ arg)
                found t)
        (setq ret nil
              arg 0)))
    (if found
        (progn
          (beginning-of-line)
          (forward-line)))
    ret))


(defun my-react-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.jsx\\'" buffer-file-name))
    (setq imenu-create-index-function 'react-imenu-create-index)
    (setq beginning-of-defun-function 'react-beginning-of-class)
    (setq end-of-defun-function 'react-end-of-class)))

(add-hook 'find-file-hook 'my-react-mode)

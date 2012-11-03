(provide "comment-out-select-oneline")
(in-package "user")

(defun comment-out-selection-or-one-line (&optional count)
  (interactive "p")
  (if (pre-selection-p)
      (progn
        (require "comment")
        (let ((fn (cond ((eq *prefix-args* 'universal-argument)
                         (setq count (list count))
                         'comment-do-uncomment)
                        ((and (numberp count)
                              (> 0 count))
                         'comment-do-uncomment)
                        (t
                         'comment-do-comment)))
              beg end)
          (setq beg (selection-point) end (selection-mark))
          (funcall fn beg end count)))
    (toggle-one-line-comment)))
(global-set-key #\C-\; 'comment-out-selection-or-one-line)

(defvar *one-line-comment-alist*
  '(
    (awk-mode   . ("#"))
    (css-mode   . ("/* " " */"))
    (html+-mode . ("<!-- " " -->"))
    (lisp-mode  . (";"))
    (lisp-interaction-mode . (";"))
    (perl-mode  . ("#"))
    (php-mode   . ("//"))
    (sql-mode   . ("--"))
    ))

(defun toggle-one-line-comment ()
  (interactive)
  (let ((li (cdr (assoc buffer-mode *one-line-comment-alist*)))
        bol eol str keyreg)
    (when li
      (save-excursion
        (goto-eol)
        (setq eol (point))
        (back-to-indentation)
        (setq bol (point))
        (setq str (buffer-substring bol eol))
        (if (= (length li) 1)
            (let ((key (car li)))
              (setq keyreg (format nil "^~A+[ \t]*" (regexp-quote key)))
              (if (string-match keyreg str)
                  (delete-region (+ bol (match-beginning 0))
                                 (+ bol (match-end 0)))
                (progn
                  (back-to-indentation) (insert key))))
          (let ((key1 (car li))
                (key2 (cadr li)))
            (setq keyreg (format nil
                                 "^\\(~A\\)+[ \t]*\\(.*\\)[ \t]*\\(~A\\)+$"
                                 (regexp-quote key1)
                                 (regexp-quote key2)))
            (if (string-match keyreg str)
                (progn
                  (setq str (string-replace-match str "\\2"))
                  (delete-region (+ bol (match-beginning 0))
                                 (+ bol (match-end 0)))
                  (insert str))
              (progn
                (back-to-indentation) (insert key1)
                (goto-eol) (insert key2)))))))))

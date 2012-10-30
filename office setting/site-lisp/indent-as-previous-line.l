(defun indent-as-previous-line ()
  "前の行と同じだけインデント"
  (interactive)
  (let (col)
    (save-excursion
      (and
       (previous-line) (goto-bol)
       (looking-at "^[ \t]+")
       (goto-char (match-end 0))
       (setq col (current-column))))
    (if col
        (progn
          (goto-bol)
          (indent-to col)))))
(set-extended-key-translate-table exkey-S-tab #\S-C-F23)
(global-set-key #\S-C-F23 'indent-as-previous-line)

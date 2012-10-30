(in-package "elisp-lib")

(provide "howm-migemo")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "migemo"))

(defun howm-list-migemo2 (&optional completion-p)
  (interactive "P")
  (if completion-p
      (howm-grep t)
    (lisp::let* ((roma (read-from-minibuffer "Search all (migemo): "))
		 (e-reg (get-migemo-regexp roma))
		 (hilit `((,e-reg . 'howm-view-hilit-face)))
		 (howm-view-use-grep nil))
      (declare (special howm-view-use-grep))
      (if e-reg
	  (progn
	    (howm-view-search e-reg howm-directory nil nil nil hilit)
	    (howm-list-normalize e-reg))
	(message "No response from migemo-client."))))) 

(defun get-migemo-regexp (roma &optional (type :emacs))
  (unless ed::*migemo-dict-file*
    (ed::migemo-error "辞書ファイルが設定されていません。"))
  (unless (file-exist-p ed::*migemo-dict-file*)
    (ed::migemo-error (lisp::format nil "辞書ファイルがありません: ~S"
				    ed::*migemo-dict-file*)))
  (lisp::let ((session (ed::migemo-open-func
			(si:make-string-chunk
			 (map-slash-to-backslash ed::*migemo-dict-file*))))
	      (plist (lisp::if (eq :egrep type)
			 '(("|" . 0) ("(" . 1) (")" . 2) ("[ \t]*" . 5))
		       '(("\\|" . 0) ("\\(" . 1) ("\\)" . 2)
			 ("[ \t\n]*" . 5))))
	      result regexp)
    (unwind-protect
	(progn
	  (unless (ed::migemo-is-enable-p session)
	    (ed::migemo-error "辞書が読み込めません"))
	  (dolist (pair plist)
	    (lisp::let* ((index (cdr pair))
			 (regex (si:make-string-chunk (car pair)))
			 (result
			  (ed::migemo-set-operator-func session
							index
							regex)))
	      (when (eq ed::*migemo-set-operator-failed* result)
		(msgbox "~S" (car pair))
		(ed::migemo-error
		 (lisp::format nil "メタ文字指定エラー: ~S:~S"
			       index (car pair))))))
	  (setq result (ed::migemo-query-func session
					      (si:make-string-chunk roma)))
	  (si:unpack-string
	   (si:make-chunk nil ed::*migemo-query-buf* nil result)
	   0))
      (progn
	(when result
	  (ed::migemo-release-func session result))
	(ed::migemo-close-func session)))))

(eval-when (:load-toplevel :execute)
  (global-set-key '(#\C-c #\, #\m) 'howm-list-migemo2)
  (when (lisp::assoc "[roma]" howm-menu-command-table-ja :test #'equal)
    (setf (cdr (lisp::assoc "[roma]" howm-menu-command-table-ja :test #'equal))
	  '(howm-list-migemo2)))
  (when (lisp::assoc "[roma]" howm-menu-command-table-en :test #'equal)
    (setf (cdr (lisp::assoc "[roma]" howm-menu-command-table-en :test #'equal))
	  '(howm-list-migemo2)))
  (let ((m (member 'howm-list-migemo howm-default-key-table
		   :key #'cadr)))
    (when m
      (setf (cadr (car m)) 'howm-list-migemo2))))


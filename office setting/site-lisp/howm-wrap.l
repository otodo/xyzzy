(eval-when (:compile-toplevel :load-toplevel :execute)
  #|(pushnew (merge-pathnames "site-lisp/howm" (si:system-root))
	   *load-path* :test #'string-equal)|#
  (lisp::require "elisp-lib")
  #|(let ((elisp-lib (merge-pathnames "site-lisp/howm/elisp-lib.l"
				    (si:system-root))))
    (if (file-newer-than-file-p elisp-lib (concat elisp-lib "c"))
	(progn
	  (byte-compile-file elisp-lib)
	  (lisp::load (concat elisp-lib "c"))
	  (setq renew-elib t))
      (lisp::require "elisp-lib")))|#)

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; canna ？
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
(defpackage "canna"
  )
(in-package "canna")
(export '(*fence-mode* *select-mode*))
(defvar *fence-mode* nil)
(defvar *select-mode* nil)

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; egg ？
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
(defpackage "egg"
  )
(in-package "egg")
(export '(*in-fence-mode* henkan-mode-in-use))
(defvar *in-fence-mode* nil)
(defvar henkan-mode-in-use nil)

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; howm
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(in-package "elib")

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; font-lock
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(defvar font-lock-defaults nil)
(defvar font-lock-mode-on-hook nil)
(defvar font-lock-mode-off-hook nil)

(defvar-local font-lock-keywords nil)
(defvar-local font-lock-keywords-case-fold-search nil)
(defvar-local font-lock-keywords-only nil)

(defvar *font-lock-idle-second* 5)
(defvar-local font-lock-last-merge-time nil)

(ed::defvar-local *font-lock-minor-mode* nil)
(pushnew '(*font-lock-minor-mode* . "FL") *minor-mode-alist* :key #'car)

(defun font-lock-set-defaults ()
  )

;; regexp-keyword-list
(defun font-lock-fontify-buffer ()
  (font-lock-merge-regexp-keyword-list)
  )
(defun font-lock-fontify-block (&optional arg)
  (font-lock-merge-regexp-keyword-list)
  )

(defun font-lock-keywords-to-regexp-list (keywords)
  (lisp::let ((result))
    (save-match-data
     (labels ((scar (x) (if (consp x) (car x)))
	      (search-tree-item (item tree &key (test #'eql) (key #'identity))
		(cond
		 ((null tree) nil)
		 ((funcall test item (funcall key tree)) tree)
		 ((consp tree)
		  (dolist (node tree)
		    (let ((r (search-tree-item item node :test test :key key)))
		      (when r (return r))))))))
       (dolist (k (delete-duplicates keywords :key #'car :test #'equal))
	 (lisp::let* ((regexp (car k))
		      (opt (cdr k)))
	   (when (and (consp regexp) (eq 'lambda (car regexp)))
	     (lisp::let ((f (search-tree-item 're-search-forward
					      regexp :test #'eq :key #'scar)))
	       (setq regexp (cadr f))))
	   (when (and (consp opt) (consp (car opt)))
	     (setq opt (car opt)))
	   (when (stringp regexp)
	     (lisp::let* ((pos (if (consp opt) (car opt) 0))
			  (face (if (symbolp pos)
				    pos
				  (if (consp opt)
				      (cadr opt)
				    opt))))
	       (when (symbolp face)
		 (lisp::let* ((s (concat "*" (symbol-name face) "*"))
			      (attr (symbol-value (find-symbol s "elisp-lib"))))
		   (unless (numberp pos) (setq pos 0))
		   (push (list regexp
			       (if (boundp 'font-lock-keywords-case-fold-search)
				   font-lock-keywords-case-fold-search)
			       (append (list :color) attr)
			       #|(append (list :color
					     (or (car col) 0)
					     (or (cadr col) 0)))|#
			       t pos pos) result)))))))))
    result))

(defun font-lock-merge-regexp-keyword-list ()
  (ed::make-local-variable 'regexp-keyword-list)
  (when (boundp '*original-regexp-keyword-list*)
    (setq regexp-keyword-list
	  (append (compile-regexp-keyword-list
		   (font-lock-keywords-to-regexp-list font-lock-keywords))
		  *original-regexp-keyword-list*))))

(defun font-lock-mode (&optional (arg nil sv))
  (interactive "p")
  (ed::toggle-mode '*font-lock-minor-mode* arg sv)
  (update-mode-line t)
  (cond
   (*font-lock-minor-mode*
    (ed::make-local-variable '*post-command-hook*)
    (ed::make-local-variable 'regexp-keyword-list)
    (ed::make-local-variable '*original-regexp-keyword-list*)
    (when (null *original-regexp-keyword-list*)
      (setq *original-regexp-keyword-list* regexp-keyword-list))
    (font-lock-merge-regexp-keyword-list)
    (run-hooks 'font-lock-mode-on-hook))
   (t
    (when (boundp '*original-regexp-keyword-list*)
      (setq regexp-keyword-list *original-regexp-keyword-list*))
    (kill-local-variable '*original-regexp-keyword-list*)
    (run-hooks 'font-lock-mode-off-hook))))

(defun font-lock-fontify-hook ()
  (lisp::let ((time (get-universal-time)))
    (when (or (null font-lock-last-merge-time)
	      (<= (+ font-lock-last-merge-time *font-lock-idle-second*) time))
      (font-lock-fontify-block 1)
      (setq font-lock-last-merge-time time)
      ;(lisp::message "run Fontify hook.")
      )))

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; howm をロード。
;; 必要ならコンパイルしてロードする。
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#


(setq howm-keyword/ref-regexp-format "\\(%s\\)[ \t\r\n]*\\([^ \t\r\n].*\\)$")
#|
(setq howm-menu-key-regexp
      "\\(\\([^\n\r\f]\\)[^\n\r\f]*\\)\\(>\\)?\\[")
(setq howm-menu-key-regexp-word-pos 1)
(setq howm-menu-key-regexp-key-pos 2)
(setq howm-menu-key-regexp-moveonly-pos 3)
|#

(dolist (m '("cl" "easy-mmode" "font-lock"))
  (pushnew m *modules* :test #'string-equal))

(when (file-exist-p "~/howm-pre-init.l")
  (lisp::load "~/howm-pre-init.l"))

(let ((path (let ((file (locate-library "howm-wrap.lc")))
	      (when file
		(directory-namestring file))))
      migemo-l)
  (when path
    (dolist (file (append
		   (delete-if
		    #'(lambda (x)
			(let ((name (pathname-name x)))
			  ;; コンパイル、ロードされてまずいものを除く。
			  (or (string-matchp "howm-wrap" name)
			      (string-matchp "howm-install" name)
			      (string-matchp "howm-uninstall" name)
			      (and (string-matchp "howm-migemo" name)
				   (setq migemo-l (list x))))))
		    (sort (or
			   (directory path :file-only t :absolute t :wild "*.l")
			   (directory path :file-only t :absolute t :wild "*.lc"))
			  #'string-lessp))
		   ;; migemo.l は最後にコンパイル、ロードされるようにする。
		   migemo-l))
      (if (string-equal (pathname-type file) "l")
	  (lisp::let ((file-c (concat file "c")))
	    (if (or (and (boundp 'renew-elib)
			 renew-elib)
		    (not (file-exist-p file-c))
		    (file-newer-than-file-p file file-c))
		(progn
		  (elisp-compile file (if (string-matchp "howm-migemo" file)
					  *encoding-sjis*))
		  (lisp::load file-c))
	      (lisp::require (pathname-name file))))
	(lisp::require (pathname-name file))))))
(when (boundp 'renew-elib)
  (makunbound 'renew-elib))

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; howm が動くようにいろいろと設定。
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(defun howm-view-string<= (a b)
  (string-lessp b a))

(defun howm-menu-action (function-table arg)
  (let* ((func (car function-table))
         (onbuf (second function-table))
         (switch-p (eq onbuf 'previous)))
    (let* ((s-buf (if (eq onbuf 'current) 'cur 'prev))
           (s-switch `(switch-to-buffer ,s-buf))
           (s-apply `(apply #',func ,(if arg '(list a) nil))))
      (let* ((s-body (if switch-p
                         `(progn ,s-switch ,s-apply)
                       `(with-current-buffer ,s-buf
			  (prog1
			      ,s-apply
			    (setq buf (current-buffer)))))))
        `(lambda ()
           (let ((a ,arg)
                 (cur (current-buffer))
                 (prev (if (howm-buffer-alive-p howm-menu-previous-buffer)
                           howm-menu-previous-buffer
                         (current-buffer)))
		 (buf))
	     ,s-body
	     (when buf (set-buffer buf))))))))

(defun howm-menu-make-invisible ()
  (save-excursion
    (goto-char (point-min))
    (let (visible-p
          invisible-beg
	  (r buffer-read-only))
      (toggle-read-only nil)
      (unwind-protect
	  (while (not (= (point) (point-max)))
	    (setq visible-p t)
	    (while (re-search-forward howm-menu-toggle-invisible
				      (line-end-position) t)
	      (if visible-p
		  (setq invisible-beg (match-beginning 0))
		(delete-region invisible-beg (match-end 0)))
	      (setq visible-p (not visible-p)))
	    (when (not visible-p)
	      (delete-region invisible-beg
			     (save-excursion (forward-line) (point))
			     ))
	    (forward-line))
	(toggle-read-only r)))))

(defun howm-menu-shortcut ()
  (let* ((beg (match-beginning 0))
         (end (match-end 0))
         (wbeg (match-beginning howm-menu-key-regexp-word-pos))
         (wend (match-end  howm-menu-key-regexp-word-pos))
         (word (match-string-no-properties howm-menu-key-regexp-word-pos))
         (key (match-string-no-properties howm-menu-key-regexp-key-pos))
;;         (key (substring word 0 1)) ;; first letter
         (move-only (match-beginning howm-menu-key-regexp-moveonly-pos))
	 (r buffer-read-only))
    (toggle-read-only nil)
    (unwind-protect
	(progn
	  (set-text-attribute
	   (match-beginning howm-menu-key-regexp-key-pos)
	   (match-end howm-menu-key-regexp-key-pos)
	   nil
	   :foreground (car *howm-menu-key-face*)
	   :background (cadr *howm-menu-key-face*)
	   :bold (member :bold *howm-menu-key-face*)
	   :underline (member :underline *howm-menu-key-face*)
	   :strike-out (member :strike-out *howm-menu-key-face*))
	  (delete-region wend end)
	  (delete-region beg wbeg))
      (toggle-read-only r))
;;     (delete-region beg end)
;;     (insert label)
    (let ((p (point)))
      (define-key howm-menu-mode-map key
        `(lambda ()
           (interactive)
           (let ((pos ,p)
		 (buf))
             (if ,move-only
                 (goto-char pos)
	       (progn
		 (save-excursion
		   (goto-char pos)
		   (let ((case-fold-search nil)) ;; temporaly
		     (when (null (action-lock-get-action))
		       (action-lock-goto-next-link)))
		   (action-lock-invoke)
		   (setq buf (current-buffer)))
		 (when buf (set-buffer buf))))))))
    (when (member key *howm-menu-shortcut-keys*)
      (setq *howm-menu-shortcut-multidef-keys*
            (cons key *howm-menu-shortcut-multidef-keys*)))
    (setq *howm-menu-shortcut-keys*
          (cons key *howm-menu-shortcut-keys*))))

(defvar-local action-lock-original-font-lock-keywords nil)
(defvar-local action-lock-original-return nil)
(defvar-local action-lock-rules nil)

(defun *howm-init-summary-and-contents ()
  (when (boundp 'major-mode)
    (ed::make-local-variable 'buffer-mode)
    (setq buffer-mode major-mode))
  (set-buffer-fold-width nil (selected-buffer))
  (ed::make-local-variable 'font-lock-keywords)
  (ed::make-local-variable '*post-command-hook*)
  (cond
   ((eq buffer-mode 'howm-view-summary-mode)
    (make-local-variable 'howm-view-item-list)
    (unless howm-view-item-list
      (setq howm-view-item-list nil))
    (ed::add-hook '*post-command-hook* 'howm-view-summary-check))
   ((eq buffer-mode 'howm-view-contents-mode)
    (ed::add-hook '*post-command-hook* 'font-lock-fontify-hook))))
(ed::add-hook 'howm-view-summary-mode-hook '*howm-init-summary-and-contents)
(ed::add-hook 'howm-view-contents-mode-hook '*howm-init-summary-and-contents)

(defun *action-lock-mode-init ()
  (make-local-variable 'action-lock-original-return)
  (unless action-lock-original-return
    (setq action-lock-original-return nil))
  (make-local-variable 'action-lock-rules)
  (unless action-lock-rules
    (setq action-lock-rules nil)))
(ed::add-hook 'action-lock-mode-on-hook '*action-lock-mode-init)

(defun *howm-mode-init-vars ()
  (make-local-variable 'font-lock-keywords)
  (unless font-lock-keywords
    (setq font-lock-keywords nil))
  (ed::make-local-variable '*post-command-hook*)
  (ed::add-hook '*post-command-hook* 'font-lock-fontify-hook)
  (when (boundp 'after-save-hook)
    (ed::make-local-variable '*after-save-buffer-hook*)
    (setq *after-save-buffer-hook*
	  (append after-save-hook
		  *after-save-buffer-hook*))))
(ed::add-hook 'howm-mode-on-hook '*howm-mode-init-vars)

(defun howm-menu-mode-init ()
  (howm-view-save-window-configuration))
(ed::add-hook 'howm-menu-hook 'howm-menu-mode-init)

;; action-lock-open に不正な正規表現があるので修正。
(setq action-lock-default-rules
  (list (action-lock-switch '("{ }" "{*}" "{-}"))
	(action-lock-date "{_}" "[%Y-%m-%d %H:%M]")
	(action-lock-open "URL:\\(file://\\)?\\(localhost\\)?\\([^ \t\r\n]-*\\)>))"
			  3) ;; ((<URL:...>))
	(action-lock-open "file://\\(localhost\\)?\\([^> \r\n]*\\)"
			  2) ;; file://...
	(action-lock-browse "\\(http://\\([^> \r\n]*\\)\\)"
			    1) ;; http://...
	))

;; 色の設定。
;; ツール>共通設定>表示色             '(文字色 背景色 装飾（複数指定可）)
;;                                                    :underline
;;                                                    :strike-out
;;                                                    :bold
(defvar *howm-mode-title-face*        '( 4   ))
(defvar *howm-mode-ref-face*          '( 6   ))
(defvar *howm-mode-keyword-face*      '( 7  4))
(defvar *howm-mode-wiki-face*         '(14 nil :underline))
(defvar *howm-reminder-normal-face*   '( 4   ))
(defvar *howm-reminder-todo-face*     '( 3   ))
(defvar *howm-reminder-deadline-face* '( 1   ))
(defvar *howm-reminder-schedule-face* '(14   ))
(defvar *howm-reminder-done-face*     '(15   ))
(defvar *howm-reminder-today-face*    '( 8  3))
(defvar *howm-reminder-tomorrow-face* '( 8  9))
(defvar *howm-view-hilit-face*        '( 1   ))
(defvar *action-lock-face*            '( 8 nil :underline))
(defvar *howm-menu-key-face*          '( 3   ))

;; インタラクティブ関数を user パッケージにインポートする。
(with-package-iterator (howm-find-symbols (list (find-package "elisp-lib"))
					  :internal :external)
  (loop
    (multiple-value-bind (found sym type)
	(howm-find-symbols)
      (unless found (return))
      (when (and (fboundp sym)
		 (commandp (symbol-function sym)))
	(let ((name (symbol-name sym)))
	  (when (and (string-match "^howm-" name)
		     (not (find-symbol name "user")))
	    (import (list sym) "user")))))))

;; 初期化ファイルをロード。
(when (file-exist-p "~/howm-init.l")
  (lisp::load "~/howm-init.l"))

(provide "howm/howm-wrap")
(provide "howm-wrap")

;(setq howm-menu-todo-num 10)
;(setq howm-menu-schedule-days 22)
;; -*- Mode : lisp -*-

;; abbrev complition
;;
;; TKI
;; http://www.Afis.To/~start/
;; ---------- [ Settings ] ----------
#|
refer lisp/abbrev.l


abbrev �ÓI��^��W�J �ɂ�������o�^����� �v���o���̂���ς�
�ׂ����X�y���~�X�ł��A�ł��܂���B

�Ȃ̂ł���� ���� abbrev table �� �ǂ�ŕ⊮���邽�߂̂��̂ł��B

���ꂪ���s�����瓮�I�⊮����@�\���܂����B

|#

;; ---------- [ Settings ] ----------
(unless (fboundp 'expand-abbrev)
  (load-library "abbrev")
  )

(provide "abbrev")
(in-package "editor")

(export '(*do-expand-after-complition* *do-expand-all-in-abbrev-complition*
		  *do-dabbrev-expand-after-complition* completion-abbreve-table ))

;after complition,  do expand?
;�⊮�̌� �W�J���邩�H
(defvar *do-expand-after-complition* t)
;�ÓI�⊮�̎��s�� ���I�W�J���邩�H
(defvar *do-dabbrev-expand-after-complition* t)

;search abbrev table type
;abbrev �⊮��table �̎��
(defvar *do-expand-all-in-abbrev-complition*
  (if *only-global-abbrevs* :global :local))

;example...
; :all  :local :global-only :local-only
;(setq *do-expand-all-in-abbrev-complition* :all)
;(setq *do-expand-all-in-abbrev-complition* :local) ;local & global
;(setq *do-expand-all-in-abbrev-complition* :local-only) ;local only
;(setq *do-expand-all-in-abbrev-complition* :global) ; global only
;(setq *do-expand-all-in-abbrev-complition* ed::*java-mode-abbrev-table*);java only


;KEY
;(global-set-key '(#\C-x #\") 'completion-abbreve-table)
(global-set-key '(#\C-x #\') 'completion-abbreve-table)

;; ---------- [ Settings ] ----------

(defun completion-abbreve-table ()
  (interactive)
  (let ((i 0) key val nc fp kl tables)

	;init
	;;  (setq tl nil)
	(setq kl nil)
	(setq nc (point))
	(backward-char)
	(skip-syntax-spec-backward "w_")
	;;(scan-buffer "[ \t�@\n]" :reverse t :regexp t)
	(setq fp (1+ (point)))

	;check & set table
	(setq tables
		  (cond ((equal :all *do-expand-all-in-abbrev-complition*) ed::*abbrev-table-name-list*)
				((equal :local-only *do-expand-all-in-abbrev-complition*) *local-abbrev-table*)
				((equal :global  *do-expand-all-in-abbrev-complition*) *global-abbrev-table*)
				((equal :local  *do-expand-all-in-abbrev-complition*) (list *global-abbrev-table* *local-abbrev-table*))
				(t *do-expand-all-in-abbrev-complition*)
				))

	;gather word (thought-less-ly)
	(unless (listp tables) (setq tables (list tables)))
	(dolist (abbrev-table tables)
	  ;	  (msgbox "~A ~A" abbrev-table (hash-table-p abbrev-table))
	  (if (symbolp abbrev-table) (setq abbrev-table (symbol-value abbrev-table)))
	  (setq i 0)
	  (when (hash-table-p abbrev-table)
		(handler-case
			(loop
			  (multiple-value-setq (i key val) (si:*enum-hash-table abbrev-table i))
			  (unless i (return))
			  (push (format nil "~A" key) kl)
			  ;   (setq tl (append tl (list (list (list key) val))))
			  )
		  (type-error (c) (progn(message "error ~A" abbrev-table) (sit-for .3)))
		  )))
	; (msgbox " [key:~A] [val:~A] [~A]" kl tl (buffer-substring fp nc))
	(goto-char nc)
	(if (and (do-completion fp nc :list kl)
			 *do-expand-after-complition*)

		; furthermore expand abbrev word by 'expand-abbrev?
	  (let ((bt)(flg))
		(setq flg 0)
		;for popup complition modal.
		(while (and (equal (point) fp) (< flg (/ 20 .7)))
		  (sit-for .7)
		  (incf flg)
		  )
		;(ding)
		(setq bt *local-abbrev-table*)
		(dolist (abbrev-table tables)
		  (if (symbolp abbrev-table) (setq abbrev-table (symbol-value abbrev-table)))
		  (when (hash-table-p abbrev-table)
			(setq *local-abbrev-table* abbrev-table)
			(if (equal t (expand-abbrev))
			 (progn
			   (setq *local-abbrev-table* bt)
			   (return))
			 )
			))
		(setq *local-abbrev-table* bt)
	   (do-dabbreving)
		)
	  ;no hit or not expand
	  ;(message " [key:~A] [~A]" kl (buffer-substring fp nc))
	  (do-dabbreving)
	  )
	)
  )

(defun do-dabbreving ()
	 (when *do-dabbrev-expand-after-complition*
	  (handler-case
	  (dabbrev-expand)
	   (error (c)
		(load-library "dabbrev"))
		(dabbrev-expand)
	   )
	   )
  )

#|

<!-- garbage -->

<!-- test for debug -->

*global-abbrev-table*
#<hashtable 55448492>
(hash-table-count *global-abbrev-table*)
(hash-table-count *local-abbrev-table*)

(setq *local-abbrev-table*  ed::*lisp-mode-abbrev-table*)

(find-symbol (concat "editor::" (symbol-name)))
(symbol-plist (nth 3  ed::*abbrev-table-name-list*))
(symbol-value (symbol-value (nth 3  ed::*abbrev-table-name-list*)))
(type-of (nth 2  ed::*abbrev-table-name-list*))
(setq bt *local-abbrev-table*)
#<hashtable 55448444>
(setq *local-abbrev-table* ed::*java-mode-abbrev-table*)
#<hashtable 55448252>
(setq *local-abbrev-table* bt)
#<hashtable 55448444>

|#

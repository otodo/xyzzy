;;; -*- Mode: Lisp; Package: ChangeLogMemo -*-
;;;
;;; changelogmemo/complete.l
;;;
;;; Last updated: "2006-02-11"
;;;

(provide "changelogmemo/complete")

(in-package "changelogmemo")

;;; ���t�̃��X�g
(defun get-match-list (regexp buffer)
  (let (list)
    (save-window-excursion
      ;save �������̂����⊮���邽�߈ȉ��̂悤�ɂ�����
      (unless buffer
	(if (and *memo-show-p* (find-buffer *buffer-save*))
	    (progn
	      (set-buffer *buffer-save*)
	      (erase-buffer (selected-buffer))
	      (insert-file-contents *cl-file*))
	  (get-buffer-create-save)));��
      (save-excursion
	(goto-char (point-min))
	(let ((hash (make-hash-table :test #'equal))
	      (no-dup nil))
	  (while (scan-buffer regexp :no-dup no-dup)
	    (let ((str (match-string 1)))
	      (unless (gethash str hash)
		(push str list)
		(setf (gethash str hash) hash))
	      (setq no-dup t))))
	(setq list (sort list #'string>=))))
    list))

(defun get-date-list (&optional buffer)
  (get-match-list *date-regexp* buffer))

(defun get-year-list (&optional buffer)
  (get-match-list *year-regexp* buffer))

(defun get-month-list (&optional buffer)
  (get-match-list *month-regexp* buffer))

;;; �J�e�S���̃��X�g(�����łȂ�)
(defun get-category-list (&optional unclassified)
  (let ((name *unclassified-category-name*) list)
    (save-window-excursion
      ;save �������̂����⊮���邽�߈ȉ��̂悤�ɂ�����
      (if (and *memo-show-p* (find-buffer *buffer-save*))
	  (progn
	    (set-buffer *buffer-save*)
	    (erase-buffer (selected-buffer))
	    (insert-file-contents *cl-file*))
	(get-buffer-create-save));��
      (save-excursion
	(goto-char (point-min))
	(let ((hash (make-hash-table :test #'equal)))
	  (while (scan-buffer *category-regexp* :no-dup t)
	    (let ((str (match-string 1)))
	      (unless (gethash str hash)
		(push str list)
		(setf (gethash str hash) hash)))))
	(setq list (sort list #'string<=))
	(and unclassified
	     (goto-char (point-min))
	     (scan-buffer (compile-regexp "^\t?\\* [^][\n]*:"))
	     (setq list (nconc list (list name))))))
    list))

;;; �d��������������������̃��X�g���擾
(defun get-substring-list (list beg end)
  (let ((hash (make-hash-table :test #'equal)) matches)
    (dolist (str list (nreverse matches))
      (setq str (substring str beg end))
      (unless (gethash str hash)
	(push str matches)
	(setf (gethash str hash) str)))))
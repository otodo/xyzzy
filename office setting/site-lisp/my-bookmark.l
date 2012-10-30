;;; -*- Mode: Lisp; Package: EDITOR -*-
;;;
;;; Last updated: <2004/12/21 22:05:47 +0900>
;;;
;;; my-bookmark.l
#|
��about
�{�c����� bookmark.l ���Q�l�ɂ����Ē����āA�e�L�X�g�ɂ�������͂����
�D���Ȏ��ɂ��̈ʒu�ɃW�����v�ł���悤�ɂ��邽�߂ɍ��܂����B
�O���[�o���}�[�N�Ǝ����悤�Ȃ��̂ł����A�e�L�X�g������������
�����肪�N���A����Ȃ��悤�ɂȂ��Ă��܂��B

2004-12-19 (��) 10:52:26
�{�c����Ɍf�ڂ̋��𒸂��܂����B���߂Đ{�c����Ɋ��ӂł��Bm(__)m

���C���X�g�[�����@
1.my-bookmark.l���R�s�[���� ~/site-lisp�� my-bookmark.l �Ƃ������O�ŕۑ�����B
2.�K�v�ɉ����ăo�C�g�R���p�C������B
3..xyzzy �܂��� siteinit.l �Ɉȉ��̋L�q��ǉ�����B
(require "my-bookmark")
4.siteinit.l �ɋL�q�����ꍇ�� xyzzy ���ă_���v����B
5.�ȑO�̂��̂��g�p���Ă����ꍇ�ɂ́AC-c b c �ňȑO�̃��X�g���폜���ĉ�����
�i��2004-10-02 (�y) 12:08:02 �ȍ~�A������̃��X�g�̌`���͕ύX���Ă��Ȃ��̂�
����ȍ~�̂��̂��g�p����Ă���ꍇ�� 5.�̎菇�͕s�v�ł��j�B

���A���C���X�g�[�����@
1.M-x my-bookmark-uninstall ����B
2.~/site-lisp�ɂ��� my-bookmark.l�i�o�C�g�R���p�C�������ꍇ�� my-bookmark.lc ���j���폜����B
3.~/bookmarklist �Ȃǂ̂������ۑ����邽�߂̃t�@�C�����폜����B
4.siteinit.l �� .xyzzy ����my-bookmark.l �Ɋւ���L�q���폜����B
5.siteinit.l �ɋL�q���Ă����ꍇ�� xyzzy ���ă_���v����B

���g����
�EC-c b m�i�܂���S-F2�j�ŃW�����v���[�h�AC-c b d �ō폜���[�h�Ń��j���[��\������B
�E���j���[�̈�ԉ��́u�폜���[�h�ɂ���(&D)�v���u�W�����v���[�h�ɂ���(&J)�v��I�������
���ꂼ��̃��[�h�ɐ؂�ւ��i���̃��[�h�̓X�e�[�^�X�o�[�ɕ\������܂��j�B
�EC-c b a �܂��̓��j���[�i�W�����v���[�h�j�́u��������͂���(A)�v��I������ƁA���݂̃o�b�t�@��
�t�@�C�����E�s�ԍ��i�_���s�j�E�s������s���܂ł̕�������擾���ă��j���[�ɒǉ�����i�Z���N�V����
������ꍇ�̓Z���N�V�����̕���������j���[�ɒǉ�����B��������ꍇ�ɂ͍�������w�肵���o�C�g��
�i*bookmark-filename-length*�A*bookmark-string-length* �Ŏw��j�܂ŕ\������j�B
�E�W�����v���[�h�̎��A���j���[���炵�����I������ƊY���t�@�C���̊Y���|�C���g�ɃW�����v����B
�E�폜���[�h�̎��A���j���[���炵�����I������ƊY�����邵������폜����B
�EC-c b e �܂��̓��j���[�́u�ҏW����(E)�v����ҏW��ʂ��J���ĕs�v�ȍs���폜������AC-g �ŁA�ҏW�I���B
�EC-c b p �ōX�V�������ɑO�ɂ���������񂾈ʒu�iC-c b n �Ō�ɋ��񂾈ʒu�j�ɃW�����v����B
�EC-c b s �ł������ۑ�����t�@�C���̈ꗗ��\�����āA�����؂�ւ��邱�Ƃ��o���܂��i~/.xyzzy �Ȃǂ�
�Ⴆ�Έȉ��̂悤�Ȑݒ肪�K�v�B���̐ݒ�����Ĉꗗ����t�@�C����I������ΊY���t�@�C���͎�����������܂��B
�܂��A���̐ݒ�����Ȃ��Ă��f�t�H���g��~/bookmarklist�Ƃ����t�@�C���ɂ����肪�ۑ�����܂��j�B

;; �������ۑ�����t�@�C���̃��X�g
(setq *bookmark-list-file-list*
      '(("bookmarklist(&b)" . "~/bookmarklist")
	("foo(&f)". "~/foo")
	("bar(&b)" . "~/bar")
	("lisp(&l)" . "~/lispbm")
	))
|#

(provide "my-bookmark")

(in-package "editor")

(export '(bookmark-add-new-bookmark
	  bookmark-clear-all
	  my-bookmark-menu
	  bookmark-edit-bookmark-list
	  bookmark-jump-to-previous-bookmark
	  bookmark-jump-to-next-bookmark
	  bookmark-select-list-file
	  my-bookmark-uninstall
	  *bookmark-menu-item-length*
	  *bookmark-max*
	  *bookmark-filename-length*
	  *bookmark-string-length*
	  *bookmark-list-file*
	  *bookmark-list-file-list*))

;;; �J�X�^�}�C�Y�ł���ϐ�
(defvar *bookmark-menu-item-length* 16)	 	 ;; �����o���ɓ�����
(defvar *bookmark-max* 400)	 	 	 ;; bookmark �������܂ŔF�߂邩
(defvar *bookmark-filename-length* 24)	  	 ;; ���j���[�ɕ\������t�@�C�����̒����i�o�C�g���j
(defvar *bookmark-string-length* 36)	 	 ;; ���j���[�ɕ\�����镶����̒����i�o�C�g���j

(defvar *bookmark-list* nil)
(define-history-variable *bookmark-list-file* "~/bookmarklist")	 ;; �������ۑ�����t�@�C��
(defvar *bookmark-list-file-list* nil)

;;; �W�����v
(defun bookmark-jump-to-bookmark (key &optional n)
  (setq *bookmark-list* (nsubst nil t *bookmark-list*))
  (let ((fn-or-bn (car key))
	(pt (cdr key)) predt tmplist pos key1)
    (cond ((find-buffer fn-or-bn)
	   (switch-to-buffer fn-or-bn))
	  ((and (string-match "[:/]" fn-or-bn)
		(file-exist-p fn-or-bn))
	   (find-file fn-or-bn))
	  (t
	   (setq predt (if n
			   #'string<
			 #'string>))
	   (setq tmplist (copy-alist *bookmark-list*))
	   (setq tmplist (sort tmplist predt :key #'cadar))
	   (setq pos (position
		      (rassoc key tmplist :test #'equal) tmplist))
	   (or
	    (setq key1 (cdr (nth (1+ pos) tmplist)))
	    (< (1- pos) 0)
	    (setq key1 (cdr (nth (1- pos) tmplist))))
	   (when key1
	     (setf (cddar (rassoc key1 *bookmark-list* :test #'equal)) t))
	   (bookmark-clear-this-bookmark key "jp")
	   (plain-error "��������폜���܂���")
	   (return-from bookmark-jump-to-bookmark)))
    (when (pre-selection-p) (stop-selection))
    (goto-char pt)
    (mapc #'(lambda (l) (when (equal key (cdr l))
			  (setf (caaar l) (current-line-number))
			  (setf (cddar l) t))) *bookmark-list*)
    (bookmark-data-write-to-file *bookmark-list*)))

;;; ���X�g�̑���

;; utility

(defun bookmark-data-read-from-file ()  ;NetInstaller ���Q�l�ɂ��܂���
  (with-open-file (s
		   *bookmark-list-file*
		   :direction :input
		   :if-does-not-exist :create)
    (setq *bookmark-list* (read s nil))
    ))

(defun bookmark-data-write-to-file (data)
  (with-open-file (s
		   *bookmark-list-file*
		   :direction :output
		   :if-exists :overwrite
		   :if-does-not-exist :create)
    (format s "~S" data))
  t)

(defun bookmark-get-string-from-line ()
  (let ((str (string-trim '(#\SPC #\TAB #\�@)
			  (if (pre-selection-p)
			      (buffer-substring (selection-point) (selection-mark))
			    (buffer-substring
			     (save-excursion (goto-bol) (point))
			     (save-excursion (goto-eol) (point)))))))
    (setq str (substitute-string str "[ \t�@\n]+" " "))
    (setq str (bookmark-shorten-str str *bookmark-string-length*))
    str))

(defun bookmark-shorten-str (str lgt)
  (let ((convstr (convert-encoding-to-internal
		  *encoding-binary* str)))
    (unless (<= (length convstr) lgt)
      (setq str (convert-encoding-to-internal
		 *encoding-sjis*
		 (subseq convstr 0 (1+ lgt))))
      (setq str (subseq str 0 (1- (length str)))))
    str))

;; �ǉ�
(defun bookmark-add-new-bookmark (mn)
  (interactive)
  (unless mn (bookmark-data-read-from-file))
  (let* ((fn (get-buffer-file-name))
	 (fn-or-bn (if fn fn (buffer-name (selected-buffer))))
	 (bookmark (acons
		    (cons (current-line-number) (bookmark-get-string-from-line))
		    (cons (format-date-string "%y/%m/%d %H:%M:%S") t)
		    (cons fn-or-bn (point)))))
    (bookmark-clear-this-bookmark (cdr bookmark) "ad")
    (setq *bookmark-list* (nsubst nil t *bookmark-list*))
    (push bookmark *bookmark-list*)
    (let ((exceed (- (length *bookmark-list*) *bookmark-max*)))
      (when (> exceed 0)
	(setq *bookmark-list* (nbutlast *bookmark-list* exceed))))
    (bookmark-data-write-to-file *bookmark-list*)
    (message "����������݂܂���")))

;; �폜
(defun bookmark-clear-this-bookmark (key cs)
  (let ((dl (rassoc key *bookmark-list* :test #'equal)))
    (setq *bookmark-list* (delete dl *bookmark-list* :test #'equal)))
  (cond ((string= cs "mn")
	 (bookmark-data-write-to-file *bookmark-list*)
	 (my-bookmark-menu t nil))
	((string= cs "jp")
	 (bookmark-data-write-to-file *bookmark-list*)))
  t)

(defun bookmark-clear-all ()
  (interactive)
  (setq *bookmark-list* nil)
  (bookmark-data-write-to-file *bookmark-list*)
  (message "���ׂč폜���܂���")
  t)

;; �\�[�g
(defun bookmark-sort-bookmark-list-by-filename (predp predf dmode)
  (setq *bookmark-list* (sort *bookmark-list* predp :key #'cddr))
  (setq *bookmark-list* (sort *bookmark-list* predf :key #'cadr))
  (bookmark-data-write-to-file *bookmark-list*)
  (my-bookmark-menu dmode nil))

(defun bookmark-sort-bookmark-list-by-time (predt dmode)
  (setq *bookmark-list* (sort *bookmark-list* predt :key #'cadar))
  (bookmark-data-write-to-file *bookmark-list*)
  (my-bookmark-menu dmode nil))

;;; �ҏW
(defvar *bookmark-edit-mode-keymap* nil)
(unless *bookmark-edit-mode-keymap*
  (setq *bookmark-edit-mode-keymap* (copy-keymap *lisp-mode-map*))
  (define-key *bookmark-edit-mode-keymap* #\C-g 'bookmark-save-bmlist))

(defun bookmark-edit-bookmark-list ()
  (interactive)
  (bookmark-data-read-from-file)
  (message "#\C-g �ŕۑ��I��")
  (let ((buffer (get-buffer-create "*bookmark-edit*")))
    (set-buffer buffer)
    (erase-buffer buffer)
    (set-buffer-fold-width nil)
    (setq buffer-read-only nil)
    (setq need-not-save t)
    (setq kept-undo-information nil)
    (setq auto-save nil)
    (use-keymap *bookmark-edit-mode-keymap*)
    (insert "(\n")
    (with-output-to-buffer (buffer (point-max))
      (mapcar #'(lambda (x)
		  (format t "~S~%" x)) (reverse *bookmark-list*)))
    (goto-char (point-max))
    (insert ")")
    (set-buffer-modified-p nil)
    (setq kept-undo-information 1000)))

(defun bookmark-save-bmlist ()
  (interactive)
  (message "�ύX��ۑ����܂���")
  (set-buffer (find-buffer "*bookmark-edit*"))
  (goto-char (point-min))
  (replace-buffer "$" "" :regexp t)
  (goto-char (point-min))
  (setq *bookmark-list*
	(with-input-from-selected-buffer (read)))
  (bookmark-data-write-to-file (reverse *bookmark-list*))
  (delete-buffer (selected-buffer)))

;;; ���j��
(defun my-bookmark-menu (dmode btn)
  (interactive)
  (continue-pre-selection)
  (let ((exis (bookmark-data-read-from-file))
	(menu (create-popup-menu))
	(l (reverse *bookmark-list*)) minit sinit)
    (if exis
	(unless (< 1 (length *bookmark-list*)) (setq sinit :disable))
      (progn (setq minit :disable)
	(setq sinit :disable)
	(setq dmode nil)))
    (dotimes (i (floor (length l) *bookmark-menu-item-length*))
      (let ((popup (create-popup-menu)))
	(add-popup-menu menu popup (format nil " Bookmark-~d" i))
	(dotimes (i *bookmark-menu-item-length*)
	  (let* ((key (cdar l))
		 (fn-or-bn (cadar l))
		 (lnum (caaaar l))
		 (str (cdaaar l))
		 (jflg (cddaar l))
		 (fbn (file-namestring fn-or-bn)) menu-item)
	    (setq fbn (bookmark-shorten-str fbn *bookmark-filename-length*))
	    (setq menu-item (concat fbn " \t�b" (format nil "~A" lnum) "�b" str))
	    (add-menu-item popup nil (format nil "~A&~D: ~a"
					     (if (>= i 10)
						 (truncate i 10)
					       " ")
					     (rem i 10)
					     menu-item)
			   #'(lambda ()
			       (interactive)
			       (if dmode
				   (bookmark-clear-this-bookmark key "mn")
				 (bookmark-jump-to-bookmark key)))
			   #'(lambda ()
			       (when jflg :check)))
	    (pop l)))))
    (let ((c 0))
      (dolist (b l)
	(let* ((key (cdr b))
	       (fn-or-bn (cadr b))
	       (lnum (caaar b))
	       (str (cdaar b))
	       (jflg (cddar b))
	       (fbn (file-namestring fn-or-bn)) menu-item)
	  (setq fbn (bookmark-shorten-str fbn *bookmark-filename-length*))
	  (setq menu-item (concat fbn " \t�b" (format nil "~A" lnum) "�b" str))
	  (add-menu-item menu nil (format nil "~A&~D: ~a"
					  (if (>= c 10)
					      (truncate c 10)
					    " ")
					  (rem c 10)
					  menu-item)
			 #'(lambda ()
			     (interactive)
			     (if dmode
				 (bookmark-clear-this-bookmark key "mn")
			       (bookmark-jump-to-bookmark key)))
			 #'(lambda ()
			     (when jflg :check))))
	(setq c (1+ c))))
    (add-menu-separator menu)
    (if dmode
	(add-menu-item menu nil "�폜���[�h�ł�")
      (add-menu-item menu nil "��������͂���(&A)"
		     #'(lambda () (interactive) (bookmark-add-new-bookmark t))))
    (let ((smenu (create-popup-menu))
	  (tmenu (create-popup-menu))
	  (orderu  "����(&U)")
	  (orderd  "�~��(&D)"))
      (add-popup-menu menu smenu (format nil "�t���p�X���Ń\�[�g(&F)"))
      (add-menu-item smenu nil orderu
		     #'(lambda () (interactive)
			 (bookmark-sort-bookmark-list-by-filename #'> #'string-greaterp dmode))
		     #'(lambda () sinit))
      (add-menu-item smenu nil orderd
		     #'(lambda () (interactive)
			 (bookmark-sort-bookmark-list-by-filename #'< #'string-lessp dmode))
		     #'(lambda () sinit))
      (add-popup-menu menu tmenu (format nil "�X�V�����Ń\�[�g(&T)"))
      (add-menu-item tmenu nil orderu
		     #'(lambda () (interactive)
			 (bookmark-sort-bookmark-list-by-time #'string> dmode))
		     #'(lambda () sinit))
      (add-menu-item tmenu nil orderd
		     #'(lambda () (interactive)
			 (bookmark-sort-bookmark-list-by-time #'string< dmode))
		     #'(lambda () sinit)))
    (add-menu-item menu nil "�ҏW����(&E)" 'bookmark-edit-bookmark-list)
    (add-menu-item menu nil "���ׂč폜(&C)" 'bookmark-clear-all
		   #'(lambda () minit))
    (if dmode
	(progn (message "�폜���[�h")
	  (add-menu-item menu nil "�W�����v���[�h�ɂ���(&J)"
			 #'(lambda () (interactive) (my-bookmark-menu nil nil))))
      (progn (message "�W�����v���[�h")
	(add-menu-item menu nil "�폜���[�h�ɂ���(&D)"
		       #'(lambda () (interactive) (my-bookmark-menu t nil))
		       #'(lambda () minit))))
    (track-popup-menu menu btn)))

;;; ����������񂾈ʒu�ɖ߂�
(defun bookmark-jump-to-previous-bookmark (&optional n)
  (interactive)
  (let ((exis (bookmark-data-read-from-file))
	predt tmplist key fn-or-bn pt pos)
    (unless exis
      (plain-error "�����肪����܂���B")
      (return-from bookmark-jump-to-previous-bookmark))
    (setq predt (if n
		    #'string<
		  #'string>))
    (setq tmplist (copy-alist *bookmark-list*))
    (setq tmplist (sort tmplist predt :key #'cadar))
    (mapc #'(lambda (l)
	      (when (cddar l)
		(setq key (cdr l))
		(setq fn-or-bn (cadr l))
		(setq pt (cddr l))
		(when (or (and (equal fn-or-bn (get-buffer-file-name))
			       (= pt (point)))
			  (and (equal fn-or-bn (get-buffer-file-name))
			       (eobp)
			       (> pt (point)))
			  (and (equal fn-or-bn (buffer-name (selected-buffer)))
			       (= pt (point)))
			  (and (equal fn-or-bn (buffer-name (selected-buffer)))
			       (eobp)
			       (> pt (point)))
			  (progn
			    (bookmark-jump-to-bookmark key n)
			    nil))
		  (unless
		      (and
		       (setq pos (position l tmplist))
		       (setq key (cdr (nth (1+ pos) tmplist)))
		       (bookmark-jump-to-bookmark key n))
		    (plain-error "�Ȃ����B")))
		(return-from bookmark-jump-to-previous-bookmark))) tmplist)
    (setq key (cdar (if n (reverse tmplist) tmplist)))
    (bookmark-jump-to-bookmark key n)))

(defun bookmark-jump-to-next-bookmark ()
  (interactive)
  (bookmark-jump-to-previous-bookmark t))

;;; �������ۑ�����t�@�C���̐؂�ւ�
(defun bookmark-menu-selected-file (file)
  (setq *bookmark-list-file* file)
  (my-bookmark-menu nil :button2))

(defun bookmark-select-list-file ()
  (interactive)
  (if *bookmark-list-file-list*
      (let ((menu (create-popup-menu)))
	(mapcar #'(lambda (l)
		    (let ((menu-item (car l))
			  (file (cdr l)))
		      (add-menu-item menu nil menu-item
				     #'(lambda ()
					 (interactive)
					 (bookmark-menu-selected-file file))
				     #'(lambda ()
					 (when (equal file *bookmark-list-file*)
					   :check))))) *bookmark-list-file-list*)
	(track-popup-menu menu :button2))
    (plain-error "�������ۑ�����t�@�C���̃��X�g���ݒ肳��Ă��܂���B")))

;;; �c�[���o�[
(defun my-bookmark-tool-bar ()
  (create-tool-bar 'my-bookmark-tool-bar
		   (merge-pathnames "toolbar.bmp" (etc-path))
		   '(("������"	11 (lambda () (interactive)
				     (my-bookmark-menu nil :button2))))))

(define-command-bar 'my-bookmark-tool-bar "������(&S)")

;;; �A���C���X�g�[��
(defun my-bookmark-uninstall ()
  (interactive)
  (unregister-history-variable '*bookmark-list-file*)
  (delete-command-bar 'my-bookmark-tool-bar))

;;; �L�[�o�C���f�B���O
(global-set-key '(#\C-c #\b #\a) #'(lambda () (interactive) (bookmark-add-new-bookmark nil)))
(global-set-key '(#\C-c #\b #\c) 'bookmark-clear-all)
(global-set-key '(#\C-c #\b #\m) #'(lambda () (interactive) (my-bookmark-menu nil :button2)))
(global-set-key '(#\C-c #\b #\d) #'(lambda () (interactive) (my-bookmark-menu t :button2)))
(global-set-key '(#\C-c #\b #\e) 'bookmark-edit-bookmark-list)
(global-set-key '(#\C-c #\b #\p) 'bookmark-jump-to-previous-bookmark)
(global-set-key '(#\C-c #\b #\n) 'bookmark-jump-to-next-bookmark)
(global-set-key '(#\C-c #\b #\s) 'bookmark-select-list-file)
(global-set-key '(#\S-F2) #'(lambda () (interactive) (my-bookmark-menu nil :button2)))

;;;
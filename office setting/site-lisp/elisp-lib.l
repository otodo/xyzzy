(provide "elisp-lib")

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; winapi
;; file-attributes でファイルの最終アクセス、更新日を得るために必要な物。
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "foreign")
  (require "wip/winapi"))

(in-package "winapi")

(c:*define-c-struct FILETIME
  (DWORD dwLowDateTime)
  (DWORD dwHighDateTime))

(c:*define-c-type (FILETIME *) LPFILETIME)

(unless (fboundp 'GetFileTime)
  (c:*define-dll-entry BOOL GetFileTime
    (HANDLE LPFILETIME LPFILETIME LPFILETIME)
    "kernel32"))

(c:*define-c-struct SYSTEMTIME
  (WORD wYear)
  (WORD wMonth)
  (WORD wDayOfWeek)
  (WORD wDay)
  (WORD wHour)
  (WORD wMinute)
  (WORD wSecond)
  (WORD wMilliseconds))

(c:*define-c-type (SYSTEMTIME *) LPSYSTEMTIME)

(unless (fboundp 'FileTimeToSystemTime)
  (c:*define-dll-entry BOOL FileTimeToSystemTime
    (LPFILETIME LPSYSTEMTIME)
    "kernel32"))

(unless (fboundp 'CreateFile)
  (c:*define-dll-entry HANDLE CreateFile
    (LPCSTR DWORD DWORD (c:void *) DWORD DWORD HANDLE)
    "kernel32" "CreateFileA"))

(unless (fboundp 'CloseHandle)
  (c:*define-dll-entry BOOL CloseHandle
    (HANDLE)
    "kernel32"))

(defpackage "elisp-lib"
  (:nicknames "elib")
  (:use "editor" "lisp"))

(in-package "elib")

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; 正規表現のマッチ情報を保持し、body 実行後復元する。
  (defmacro save-match-data (&body body)
    (lisp::let ((md (gensym)))
      `(lisp::let ((,md (match-data)))
	 (unwind-protect
	     (progn
	       ,@body)
	   (store-match-data ,md)))))
  (setf (get 'user::save-match-data 'ed::lisp-indent-hook) 'defun)
  (setf (get 'elib::save-match-data 'ed::lisp-indent-hook) 'defun))

#|(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "elib"))|#

;;;; 基本

;; val（または more の最後）が省略できる。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(setq)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro setq (sym &optional val &rest more)
    (if (oddp (length more))
	(lisp::setq more (append more '(nil))))
    `(lisp::setq ,sym ,val ,@more)))

;; else 節を暗黙の progn で囲む。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(if)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro if (test then &rest else)
    `(lisp::if ,test
	 ,then
       (progn
	 ,@else))))

;; let の変数をスペシャル変数に。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(let)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro let (vars &body body)
    (lisp::let (dec)
      (dolist (v vars)
	(cond
	 ((consp v)
	  (push (list 'special (car v)) dec))
	 (t
	  (push (list 'special v) dec))))
      (when dec
	(lisp::setq dec (append '(declare) (reverse dec))))
      `(lisp::let ,vars
	 ,dec
	 ,@body))))

;; let* の変数をスペシャル変数に。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(let*)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro let* (vars &body body)
    (lisp::let (dec)
      (dolist (v vars)
	(cond
	 ((consp v)
	  (push (list 'special (car v)) dec))
	 (t
	  (push (list 'special v) dec))))
      (when dec
	(lisp::setq dec (append '(declare) (reverse dec))))
      `(lisp::let* ,vars
	 ,dec
	 ,@body))))

;; (interactive "p") の時、引数はオプショナル扱いになる？
;; "p" -> (&optional (var 1) ...)
;; "P" -> (&optional var ...)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(defun)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro defun (name (&rest var) &body form)
    (lisp::let ((form2 form))
      (when (stringp (car form2)) (pop form2))
      (when (and var
		 (consp (car form2))
		 (eq 'interactive (car (car form2)))
		 (stringp (cadr (car form2))))
	(lisp::let ((iarg (schar (cadr (car form2)) 0)))
	  (when (or (char= #\p iarg)
		    (char= #\P iarg))
	    (lisp::setq var (remove-if #'(lambda (x) (eq '&optional x)) var))
	    (when (and (char= #\p iarg)
		       (or (not (consp (car var)))
			   (null (cdar var))))
	      (setf (car var)
		    (list (if (consp (car var)) (caar var) (car var)) 1)))
	    (lisp::setq var (append (list '&optional) var)))))
      `(lisp::defun ,name (,@var)
	 ,@form))))

;; elisp のキー表現を xyzzy のキー表現に。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(define-key)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro define-key (map key func)
    (when (eq map 'global-map)
      (lisp::setq map '*global-keymap*))
    `(ed::define-key ,map (elib::elisp-key-to-xyzzy-key-list ,key) ,func)))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro easy-mmode-define-minor-mode (mode doc
					       &optional init-value
					       lighter keymap)
    (lisp::let* ((name (symbol-name mode))
		 (on (intern (concat name "-on-hook")))
		 (off (intern (concat name "-off-hook")))
		 (map (intern (concat name "-map")))
		 (key-list (gensym)))
      `(progn
	 (defvar-local ,mode nil)
	 (pushnew ',`(,mode . ,lighter) *minor-mode-alist* :key #'car)
	 (defvar ,on nil)
	 (defvar ,off nil)
	 (defvar ,map (make-keymap))
	 (defun ,mode (&optional (arg nil sv))
	   ,doc
	   (interactive)
	   (unless ,map
	     (lisp::setq ,map (make-sparse-keymap)))
	   (dolist (k ,keymap)
	     (elib::define-key ,map (car k) (cdr k)))
	   (ed::toggle-mode ',mode arg sv)
	   (update-mode-line t)
	   (cond
	    (,mode
	     (run-hooks ',on)
	     (set-minor-mode-map ,map))
	    (t
	     (unset-minor-mode-map ,map)
	     (run-hooks ',off)))))))
  )

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro defadvice (func args &rest body)
    `()))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro defface (face spec doc &rest args)
    `(defvar ,face ,spec ,doc)))

;;;; 変数

;; defvar-local とかした後、同名シンボルで defvar とかすると、
;; バッファローカルな変数が隠されてるような感じがするのを、
;; 防いでみるつもり。
(lisp::defvar *localize-symbols* nil)

;; *localize-symbols* 参照。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(defvar)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro defvar (sym val &optional doc)
    `(unless (lisp::member ',sym *localize-symbols* :test #'eq)
       (lisp::defvar ,sym ,val ,doc))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(defvar-local)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro defvar-local (sym val &optional doc)
    `(unless (lisp::member ',sym *localize-symbols* :test #'eq)
       (push ',sym *localize-symbols*)
       (ed::defvar-local ,sym ,val ,doc))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(make-variable-buffer-local)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro make-variable-buffer-local (sym)
    `(defvar-local ,(cadr sym) nil)))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(make-local-variable)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro make-local-variable (sym)
    `(unless (lisp::member ,sym *localize-symbols* :test #'eq)
       (push ,sym *localize-symbols*)
       (ed::make-local-variable ,sym))))

;; n がマイナスなら 0 番目を。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(nth)))
(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro nth (n seq)
    (lisp::let ((n2 (gensym)))
      `(lisp::nth (lisp::let ((,n2 ,n)) (lisp::if (minusp ,n2) 0 ,n2)) ,seq))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro car-safe (object)
    `(ignore-errors (car ,object))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro do-multi-list ((var list-of-list &optional result-form) &body body)
    (lisp::let ((copied-list (gensym))
		(min-length (gensym))
		(counter (gensym)))
      `(lisp::let* ((,copied-list ,list-of-list)
		    (,min-length (apply #'min (mapcar #'length ,copied-list)))
		    (,counter 0)
		    ,var)
	 (while (< ,counter ,min-length)
	   (lisp::setq ,var (mapcar #'(lambda (x) (nth ,counter x)) ,copied-list))
	   ,@body
	   (incf ,counter))
	 ,result-form)))
  (setf (get 'user::do-multi-list 'ed::lisp-indent-hook) 1)
  (setf (get 'elisp-lib::do-multi-list 'ed::lisp-indent-hook) 1))

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  variable
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(ed::defvar-local major-mode nil)
(lisp::defvar auto-mode-alist nil)
(lisp::defvar pop-up-windows t)
(lisp::defvar transient-mark-mode nil)

;(lisp::defvar default-case-fold-search ed::*case-fold-search*)
;(defvar-local case-fold-search default-case-fold-search)

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  inner utility
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  emacs like function and macro
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

;;;; 評価

(defun locate-library (library &optional nosuffix path interactive-call)
  (lisp::let (result
	      (library2 library))
    (unless nosuffix
      (lisp::setq library (concat (if (string-match "^\\(.*?\\)\\(\\.[^.]*\\)$"
					      library)
				(match-string 1)
			      library)
			    ".l")))
    (dolist (path (if (consp path) path *load-path*))
      (lisp::let* ((file1 (merge-pathnames library path))
		   (file2 (concat file1 "c")))
	(cond
	 ((file-exist-p file2) (return (lisp::setq result file2)))
	 ((file-exist-p file1) (return (lisp::setq result file1))))))
    (if interactive-call
	(if result
	    (ed::message "Library is file ~A" result)
	  (ed::message "No library ~A in search path" library2)))
    result))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(require)))
(defun require (feature &optional file-name noerror)
  (when (symbolp feature)
    (lisp::setq feature (pathname-name (symbol-name feature))))
  (unless (member feature *modules* :test #'string-equal)
    (save-match-data
      (if (and (null (elisp-require feature))
	       (not noerror))
	  (lisp::error "ファイルが見つかりません: ~S" feature)))))

;;;; file がロードされたときに form を実行する。ロード済みなら即実行。
(defun eval-after-load (file form)
  )

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(read)))
(defun read (&optional stream)
  (cond
   ((null stream) (lisp::read t nil))
   ((stringp stream) (lisp::read-from-string stream))
   ((streamp stream) (lisp::read stream))
   ((or (bufferp stream)
	(markerp stream))
    (let* ((buf (if (bufferp stream)
		    stream
		  (marker-buffer)))
	   (pos (if (or (bufferp stream)
			(null (marker-point stream)))
		    (progn (set-buffer buf) (point))
		  (marker-point stream))))
      (with-input-from-buffer (buf pos)
	(lisp::read t nil))))
   (t (ed::read-sexp "Lisp expression: "))))

;;;; 入出力

;; 出力先が指定できない。
;; 制御文字をなるべく書き換えてみる。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(format)))
(defun format (fmt &rest args)
  (lisp::apply 'lisp::format
	       (save-match-data
		 (elisp-format-args-to-xyzzy-args
		  (substitute-string fmt "~" "~~")
		  args))))

(defun elisp-make-pading (str column zero left)
  (if (null column)
      str
    (lisp::let* ((len (- column (length str)))
		 (pad (if (< len 1)
			  ""
			(make-sequence 'string len :initial-element zero)))
		 ;(pad (lisp::format nil "~V@{~A~:*~}" len zero))
		 )
      (if left
	  (concat pad str)
	(concat str pad)))))

(defun elisp-format-args-to-xyzzy-args (fmt &optional args)
  (lisp::let* ((fv (coerce fmt 'vector))
	       (i 0) (ai 0)
	       (ra (copy-tree args))
	       (rf ""))
    (handler-case
	(while (< i (length fv))
	  (cond
	   ((char= #\% (aref fv i))
	    (cond
	     ((char= #\% (aref fv (incf i)))
	      (lisp::setq rf (concat rf "%"))
	      (incf i))
	     (t
	      (lisp::let ((right (char= #\- (aref fv i)))
			  option zero c)
		(when right
		  (incf i))
		(while (digit-char-p (aref fv i))
		  (push (aref fv i) option)
		  (incf i))
		(lisp::setq c (aref fv i))
		(incf i)
		(when option
		  (lisp::setq option (coerce (nreverse option) 'string))
		  (lisp::setq zero (char= #\0 (aref option 0)))
		  (lisp::setq option (parse-integer option)))
		(cond
		 ((or (char= c #\s)
		      (char= c #\S))
		  (setf (lisp::nth ai ra)
			(elisp-make-pading
			 (lisp::format nil (if (char= c #\s) "~A" "~S")
				       (lisp::nth ai ra))
			 option #\SPC (not right)))
		  (lisp::setq rf (concat rf "~A")))
		 ((member c '(#\d #\o #\x #\e #\f #\g))
		  (lisp::let ((s (cdr (assoc c '((#\d . "D") (#\o . "O")
						 (#\x . "X") (#\e . "0E")
						 (#\f . "F") (#\g . "E"))))))
		    (setf (lisp::nth ai ra)
			  (elisp-make-pading
			   (lisp::format nil (concat "~" s) (lisp::nth ai ra))
			   option (if (and zero (not right)) #\0 #\SPC)
			   (not right)))
		    (lisp::setq rf (concat rf "~A"))))
		 ((char= c #\c)
		  (lisp::let* ((code (lisp::nth ai ra))
			       (mb (< 255 code))
			       (char (code-char code)))
		    (setf (lisp::nth ai ra)
			  (elisp-make-pading (lisp::format nil "~C" char)
					     (if option
						 (if mb (1- option) option))
					     (if (and zero (not right))
						 #\0
					       #\SPC)
					     (not right)))
		    (lisp::setq rf (concat rf "~A"))))
		 (t (lisp::error "不正なformat指示子です: ~A" c)))
		(incf ai)))))
	   (t
	    (lisp::setq rf (concatenate 'string rf (list (aref fv i))))
	    (incf i))))
      (range-error (c) (lisp::error "書式文字列が途中で終わっています: ~A" fmt))
      (error (c) (lisp::error (si:*condition-string c))))
    (append (list nil rf) ra)))

;; 書式文字列を使うのでこっちも書き換え。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(message)))
(defun message (fmt &rest args)
  (if (and fmt (null args))
      (lisp::setq args (list fmt)
	    fmt "%s"))
  (ed::message "~A" (apply #'elib::format (append (list fmt) args))))

;; こっちも。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(error)))
(defun error (&rest args)
  (if (stringp (car args))
      (lisp::error (apply #'elib::format `(,@args)))
    (apply #'lisp::error `(,@args))))

(defun read-from-minibuffer (prompt &optional initial-contents keymap
				    read hist default-value inherit-input-method)
  (read-string prompt :default default-value))

;; ステータスバーに表示されているメッセージの読み込み
#|
(defvar *status-output-channel* (make-string-output-stream))
(defvar *original-status-window* nil)
(unless *original-status-window*
  (let* ((s (make-broadcast-stream *status-window* *status-output-channel*)))
    (lisp::setq *original-status-window* *status-window*)
    (lisp::setq *status-window* s)))
|#
(defun current-message ()
  #|(get-output-stream-string *status-output-channel*)|#
  "")

;;;; list

;; test のデフォルトが equal。xyzzy では eq。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(member)))
(defun member (item list &key test test-not key)
  (lisp::member item list :test (or test #'equal) :test-not test-not :key key))

;; test のデフォルトが equal。xyzzy では eq。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(assoc)))
(defun assoc (item a-list &key test test-not key)
  (lisp::assoc item a-list :test (or test #'equal) :test-not test-not :key key))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(rassoc)))
(defun rassoc (key a-list)
  (lisp::rassoc key a-list :test #'equal))

;; end が範囲外でもエラーにならない。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(subseq)))
(defun subseq (sequence begin &optional end)
  (lisp::subseq sequence begin (lisp::if end
				   (if (< (length sequence) end)
				       (length sequence)
				     end))))

(defun mapconcat (function sequence separator)
  (lisp::let ((result ""))
    (dolist (item sequence)
      (lisp::setq result (concat result separator (funcall function item))))
    (lisp::if (string= "" result)
	""
      (substring result (length separator)))))

(defun mapcar* (fn list &rest more)
  (lisp::let ((list-list (append (list list) more))
	      result)
    (do-multi-list (list list-list)
      (push (apply fn list) result))
    (nreverse result)))

;;;; hook

;; 引数の数に違いが。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(add-hook)))
(defun add-hook (hook func &optional append local)
  (ed::add-hook hook func append))

(defun make-local-hook (sym)
  (make-local-variable sym))

;;;; 時刻

(defun current-time ()
  (append (multiple-value-list (floor (get-universal-time) 65536)) '(0)))

(defun encode-time (second minute hour date month year &optional dow dst zone)
  (append (multiple-value-list
	   (floor (encode-universal-time second minute hour date month year)
		  65536))
	  '(0)))

(defun decode-time (&optional (time (current-time)))
  (lisp::let* ((result (multiple-value-list
			(decode-universal-time (+ (* (car time) 65536)
						  (cadr time)))))
	       (day-of-week (nth 6 result)))
    (lisp::setq day-of-week (1+ day-of-week))
    (if (<= 7 day-of-week)
	(lisp::setq day-of-week 0))
    (setf (nth 6 result) day-of-week)
    result))

(defun format-time-string (fmt &optional time universal)
  (unless time
    (lisp::setq time (current-time)))
  (format-date-string fmt (+ (* (car time) 65536)
			     (cadr time))))

;;;; buffer

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; buffer をアクティブにする。
  ;; body 実行後元のバッファをアクティブにする。
  (defmacro with-current-buffer (buffer &body body)
    (lisp::let ((buf1 (gensym))
		(buf2 (gensym)))
      `(lisp::let ((,buf1 (selected-buffer))
		   (,buf2 ,buffer))
	 (unwind-protect
	     (progn
	       (set-buffer ,buf2)
	       ,@body)
	   (progn
	     (if (buffer-name ,buf1)
		 (set-buffer ,buf1)))))))
  (setf (get 'user::with-current-buffer 'ed::lisp-indent-hook) 1)
  (setf (get 'elib::with-current-buffer 'ed::lisp-indent-hook) 1)
  )

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; 一時バッファを作成し、アクティブにする。
  ;; body 実行後一時バッファを削除し、元のバッファをアクティブにする。
  (defmacro with-temp-buffer (&rest body)
    (lisp::let ((old-buffer (gensym))
		(tmp-buffer (gensym)))
      `(lisp::let ((,old-buffer (selected-buffer))
		   (,tmp-buffer (create-new-buffer " *temp*")))
	 (unwind-protect
	     (progn
	       (set-buffer ,tmp-buffer)
	       ,@body)
	   (progn
	     (if (buffer-name ,tmp-buffer)
		 (delete-buffer ,tmp-buffer))
	     (if (buffer-name ,old-buffer)
		 (set-buffer ,old-buffer)))))))
  (setf (get 'user::with-temp-buffer 'ed::lisp-indent-hook) 'defun)
  (setf (get 'elib::with-temp-buffer 'ed::lisp-indent-hook) 'defun)
  )

;; 引数が省略できる。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(buffer-name)))
(defun buffer-name (&optional buffer)
  (lisp::setq buffer (or buffer (selected-buffer)))
  (if (deleted-buffer-p buffer)
      nil
    (ed::buffer-name buffer)))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf (symbol-function 'buffer-file-name) #'get-buffer-file-name)
  (setf (symbol-function 'current-buffer) #'selected-buffer)
  (setf (symbol-function 'get-buffer) #'find-buffer))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(kill-buffer)))
(defun kill-buffer (buffer)
  (delete-buffer buffer))

;; インタラクティブに。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(bury-buffer)))
(defun bury-buffer (&optional buffer)
  (interactive)
  (ed::bury-buffer buffer))

;; いろいろと変更。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(pop-to-buffer)))
(defun pop-to-buffer (buffer &optional other-window norecord)
  (lisp::let ((buf (if (stringp buffer)
		       (or (find-buffer buffer)
			   (get-buffer-create buffer))
		     buffer))
	      (pop-up (if (boundp 'pop-up-windows)
			  pop-up-windows
			t)))
    (cond
     ((and (not other-window)
	   (eq buf (window-buffer (selected-window))))
      t)
     (t
      ;(sit-for 3)
      ;(ed::pop-to-buffer buf (or other-window
      ; pop-up))
      ;(refresh-screen t)
      (ed::pop-to-buffer buf (if (or other-window
				     pop-up)
				 (if (numberp pop-up)
				     pop-up
				   (if (= 1 (count-windows))
				       (- (truncate (/
						     (- (screen-height) 2)
						     ;(1- (window-lines))
						     2)))
				     pop-up))))
      ;(refresh-screen)
      ))))

(defun basic-save-buffer ()
  (interactive)
  (when (buffer-modified-p (selected-buffer))
    (save-buffer)))

;;; カーソル

;; バッファの終端で呼ぶとエラーになる。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(forward-char)))
(defun forward-char (&optional arg)
  (interactive)
  (lisp::let ((ret (ed::forward-char arg)))
    (or ret
	(lisp::error "~A of buffer" (lisp::if (or (null arg)
						  (not (minusp arg)))
					"End"
				      "Beginning")))))

;; バッファの先頭で呼ぶとエラーになる。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(backward-char)))
(defun backward-char (&optional arg)
  (interactive)
  (elib::forward-char (if (numberp arg)
			       (- arg)
			     -1)))

(defun line-beginning-position (&optional n)
  (save-excursion
    (when (numberp n)
      (forward-line (1- n)))
    (goto-bol)
    (point)))

(defun line-end-position (&optional n)
  (save-excursion
    (when (numberp n)
      (forward-line (1- n)))
    (goto-eol)
    (point)))

(defun move-to-column (column &optional force)
  (lisp::let ((c (goto-column column)))
    (when (and force
	       (< c column))
      (indent-to column))))

(defun count-lines (start end)
  (lisp::let (startl endl)
    (save-excursion
      (goto-char start)
      (lisp::setq startl (current-line-number))
      (goto-char end)
      (lisp::setq endl (current-line-number))
      (+ (- endl startl) (lisp::if (bolp) 0 1)))))

;;; 編集

;; 引数が省略できる。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(erase-buffer)))
(defun erase-buffer (&optional buffer)
  (ed::erase-buffer (or buffer (selected-buffer))))

;; 引数あり。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(set-mark-command)))
(defun set-mark-command (arg)
  (ed::set-mark-command))

(defun deactivate-mark ()
  )

;; エクスポートされてない。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(kill-new)))
(defun kill-new (x)
  (ed::kill-new x))

(defun find-file-noselect (filename &optional nowarn rawfile wildcards)
  (save-window-excursion
    (lisp::setq filename (expand-file-name filename))
    (lisp::let (result
		(wild (if wildcards (file-namestring filename))))
      (dolist (file (directory (directory-namestring filename)
			       :absolute t :wild wild :file-only t))
	(if (or wildcards
		(string-equal file filename))
	    (push (ed::find-file-internal file) result)))
      (if (= (length result) 1)
	  (car result)
	result))))

;;; 検索

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(match-string)))
(defun match-string (num &optional string)
  (ed::match-string num))

(defun match-string-no-properties (num &optional string)
  (ed::match-string num))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf (symbol-function 'buffer-substring-no-properties) #'buffer-substring))

;; いろいろと動作に違いが……
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(re-search-forward)))
(defun re-search-forward
		 (regexp &optional limit noerror count reversep
			 (regexpp t))
  (when (null count)
    (lisp::setq count 1))
  (lisp::let ((md (match-data))
	      (case-fold (cond
			  ((boundp 'case-fold-search) case-fold-search)
			  ((boundp 'default-case-fold-search)
			   default-case-fold-search)
			  (t *case-fold-search*)))
	      (found))
    (dotimes (i count)
      (lisp::setq found (scan-buffer regexp :regexp regexpp
			       :case-fold case-fold
			       :no-dup reversep :tail (not reversep)
			       :limit limit :reverse reversep)))
    (unless found (store-match-data md))
    (cond
     ((and (not found)
	   (not noerror))
      (error "no match"))
     ((and (not found)
	   (not (eq t noerror)))
      (lisp::if reversep
	  (goto-char (or limit (point-min)))
	(goto-char (or limit (point-max))))
      nil)
     (t found))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(re-search-backward)))
(defun re-search-backward (regexp &optional limit noerror count)
  (elib::re-search-forward regexp limit noerror count t))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(search-forward)))
(defun search-forward (string &optional limit noerror count)
  (elib::re-search-forward string limit noerror count nil nil))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(search-backward)))
(defun search-backward (string &optional limit noerror count)
  (elib::re-search-forward string limit noerror count t nil))

;;;; window

;;; 分割

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(split-window)))
(defun split-window (&optional window size horflag)
  (let ((start (selected-window)))
    (when (and window (windowp window))
      (let (w)
	(loop
	  (other-window)
	  (setq w (selected-window))
	  (when (equal w start)
	    (error "not window lived ~S" window))
	  (when (equal window w)
	    (return)))))
    (setq window (or window start))
    (refresh-screen)
    (when (and (null size)
	       (= 1 (count-windows)))
      (setq size (truncate (/ (- (if horflag
				     (window-width)
				   (window-lines)) 2) 2))))
    (ed::split-window size horflag)
    (when (not (equal start window))
      (let (w)
	(loop
	  (other-window)
	  (setq w (selected-window))
	  (when (equal w start)
	    (return)))))
    t))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf (symbol-function 'split-window-horizontally)
	#'ed::split-window-vertically))

#|
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(split-window-vertically)))
(defun split-window-vertically (&optional arg vertical)
  (interactive)
  (ed::split-window arg vertical))
|#

;;; 状態

(defun select-window (win)
  (set-window win))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(current-window-configuration)))
(defun current-window-configuration ()
  (refresh-screen)
  (ed::current-window-configuration))

#|(shadowing-defun set-window (window)
  (ignore-errors (ed::set-window window)))|#

#|(shadowing-defun set-window-configuration (conf)
  (let ((conf2 (current-window-configuration)))
    (unless (ignore-errors (ed::set-window-configuration conf))
      (ed::set-window-configuration conf2))))|#

;;; スクロール

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf (symbol-function 'scroll-up) #'next-page)
  (setf (symbol-function 'scroll-down) #'previous-page))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(scroll-other-window)))
(defun scroll-other-window (&optional arg)
  (interactive "P")
  (other-window 1)
  (if arg
      (forward-line arg)
    (next-page))
  (other-window -1))

(defun scroll-other-window-down (&optional arg)
  (interactive "P")
  (other-window 1)
  (if arg
      (previous-line arg)
    (previous-page))
  (other-window -1))

;;;; key

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf (symbol-function 'use-local-map) #'use-keymap))

(defun key-binding (key &optional accept-defaults)
  (lisp::let ((k (elisp-key-to-xyzzy-key-list key)))
    (or (lookup-keymap (local-keymap) k)
	(lookup-keymap *global-keymap* k))))

;;;; file

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf (symbol-function 'file-regular-p) #'check-valid-pathname)
  (setf (symbol-function 'file-name-directory) #'directory-namestring)
  (setf (symbol-function 'file-name-nondirectory) #'file-namestring)
  (setf (symbol-function 'file-exists-p) #'file-exist-p)
  (setf (symbol-function 'expand-file-name) #'merge-pathnames))

(defun abbreviate-file-name (filename)
  (save-match-data
   (lisp::let ((home (concat "^"
			     (regexp-quote (remove-trail-slash
					    (merge-pathnames "~/")))
			     "\\(.*\\)$")))
     (if (string-matchp home filename)
	 (concat "~" (substring filename (match-beginning 1)))
       filename))))

(defun file-relative-name (file &optional base)
  (lisp::let ((f (merge-pathnames file))
	      (b (merge-pathnames (or base (default-directory)))))
    (cond
     ((not (string-equal (pathname-device b)
			 (pathname-device f)))
      file)
     (t
      (lisp::let* ((dev-len (length ".:/"))
		   (name (file-namestring f))
		   (base-dirs (coerce
			       (split-string (substring b dev-len) #\/) 'vector))
		   (file-dirs (coerce
			       (split-string (substring (directory-namestring f)
							dev-len) #\/) 'vector))
		   (i 0) (result ""))
	(while (and (< i (length base-dirs))
		    (< i (length file-dirs)))
	  (if (string-equal (aref base-dirs i)
			    (aref file-dirs i))
	      (incf i)
	    (return)))
	(dotimes (x (- (length base-dirs) i))
	  (lisp::setq result (concat result "../")))
	(dotimes (x (- (length file-dirs) i))
	  (lisp::setq result (concat result (aref file-dirs (+ x i)) "/")))
	(concat result name))))))

(defun make-directory (dir &optional parent)
  (create-directory dir :if-exists :skip))

(defun directory-files (dir &optional full match nosort)
  (lisp::let ((files (directory dir :absolute full)))
    (save-match-data
     (lisp::setq files (mapcar
		  #'(lambda (x)
		      (when (string-match "/$" x)
			(lisp::setq x (substring x 0 -1)))
		      (cond
		       ((null match) x)
		       (t
			(when (string-match match x)
			  x))))
		  files)))
    (lisp::setq files (delete nil files))
    (if nosort
	files
      (sort files #'string-lessp))))

(defun file-attributes (file)
  (lisp::let* ((s (si:make-string-chunk (expand-file-name file)))
	       (h (winapi::CreateFile s #x80000000 0 0 3 0 0)))
    (when (/= 0 h)
      (unwind-protect
	  (lisp::let* ((c (winapi::make-FILETIME))
		       (a (winapi::make-FILETIME))
		       (w (winapi::make-FILETIME))
		       (lst (list a w w)))
	    (when (= 1 (winapi::GetFileTime h c a w))
	      (setq lst (mapcar
			 #'(lambda (time)
			     (let ((s (winapi::make-SYSTEMTIME)))
			       (when (= 1 (winapi::FileTimeToSystemTime
					   time s))
				 (let ((ti (encode-universal-time
					    (winapi::SYSTEMTIME-wSecond s)
					    (winapi::SYSTEMTIME-wMinute s)
					    (winapi::SYSTEMTIME-wHour s)
					    (winapi::SYSTEMTIME-wDay s)
					    (winapi::SYSTEMTIME-wMonth s)
					    (winapi::SYSTEMTIME-wYear s)
					    0)))
				   (append (multiple-value-list
					    (floor ti 65536))
					   '(0))))))
			 lst))
	      `(nil ;t for directory, string (name linked to) for symbolic link, or nil.
		nil ;Number of links to file.
		nil ;File uid.
		nil ;File gid.
		,@lst)))
	(winapi::CloseHandle h)))))

;;;; 他

;; いろいろと……
(eval-when (:compile-toplevel :load-toplevel :execute)
  (shadow '(call-process)))
(defun call-process (program &optional infile destination display &rest args)
  (lisp::let* ((delete-buffer nil)
	       (dest (if (consp destination)
			 (car destination)
		       destination))
	       (wait (not (and (numberp dest) (= 0 dest))))
	       (output-buffer (cond
			       ((bufferp dest) dest)
			       ((stringp dest) (get-buffer-create dest))
			       ((eq t dest) (selected-buffer))
			       ((or (null dest)
				    (and (numberp dest)
					 (= 0 dest)))
				(setq delete-buffer t)
				nil)
			       (t
				(lisp::error "no support argment type: ~A"
					     (type-of destination)))))
	       (tmp-file (make-temp-file-name "elisp"))
	       (arg `(,(concat program " "
			       (or (mapconcat #'(lambda (x)
						  (if (find #\SPC x)
						      (concat "'" x "'")
						    x))
					      args " ")
				   ""))
		      #|:environ nil :no-std-handles nil|#
		      :input ,(if (stringp infile)
				  (map-slash-to-backslash infile)
				infile)
		      :output ,tmp-file
		      ,@(if (and (consp destination)
				 (stringp (second destination)))
			    (list :error (map-slash-to-backslash
					  (second destination)))
			  (if (and (consp destination)
				   (null (second destination)))
			      (list :error nil)))
		      :show :minimize
		      :wait ,wait)))
    (unwind-protect
	(prog1
	    (apply 'ed::call-process arg)
	  (when wait
	    (set-buffer output-buffer)
	    (insert-file-contents tmp-file)))
      (progn
	(when delete-buffer (delete-buffer output-buffer))
	(delete-file tmp-file)))))

;; 変換

(defun string-to-number (str)
  (let* ((a (coerce str 'vector))
	 (l (length a))
	 (i 0))
    (when (= l 0) (return-from string-to-number 0))
    (when (or (char= (aref a 0) #\-)
	      (char= (aref a 0) #\+))
      (incf i))
    (while (< i l)
      (case (aref a i)
	((#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9)
	 (incf i))
	(t (return-from string-to-number 0))))
    (parse-integer str)))

;; ファイル

(defvar browse-url-browser-function
  #'(lambda (url &rest args)
      (shell-execute url t)))

(defun browse-url (url &rest args)
  (apply browse-url-browser-function (append (list url) args)))

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; elisp 読み込み用マクロ文字の関数。
;; 文字		?X		> 文字コードにする。
;; 文字列			> エスケープ文字の解釈をする。
;; ベクタ	[0 1 (2 3) x]	> #(0 1 (2 3) x)
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(defconstant *elisp-reader-]* '#:])
(defconstant *elisp-reader-\"* '#:\")

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; error
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(defun elisp-reader-error (obj &optional expectation)
  (lisp::error (if expectation
		   (lisp::format nil
				 "~A が来るべき所に ~~A がありました。"
				 expectation)
		 "読み込みエラー: ~A")
	       obj))

(defun elisp-read-from-string (str)
  (lisp::let ((*readtable* *original-readtable*))
    (lisp::read-from-string str)))

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; character
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(lisp::defvar *elisp-reader-escaped-character*
  '((#\a . "C-g") ;C-g
    (#\b . "C-h") ;C-h(Backspace)
    (#\t . "TAB") ;TAB
    (#\n . "LFD") ;C-j(LFD)
    (#\v . "C-k") ;C-k(垂直タブ)
    (#\f . "C-l") ;C-l(ページ送り)
    (#\r . "RET") ;C-m(RET)
    (#\e . "ESC") ;C-[(ESC)
    (#\\ . "\\") ;\
    (#\C . t)
    (#\M . t)
    (#\S . t)))

(defun elisp-reader-escaped-character (stream)
  (lisp::let ((s (elisp-reader-escaped-character2 stream)))
    (char-code (elisp-read-from-string (concat "#\\" s)))))

(defun elisp-reader-escaped-character2 (stream)
  (lisp::let ((c (lisp::read-char stream t nil t)))
    (cond
     ((char/= c #\\) (coerce (list c) 'string))
     (t
      (elisp-reader-escaped-character3 stream)))))

(defun elisp-reader-escaped-character3 (stream)
  (lisp::let* ((c2 (lisp::read-char stream t nil t))
	 (v (cdr (assoc c2 *elisp-reader-escaped-character* :test #'char=))))
    (cond
     ((stringp v) v)
     ((null v) (coerce (list c2) 'string))
     (t
      (lisp::let ((c3 (lisp::read-char stream t nil t)))
	(when (char/= c3 #\-)
	  (elisp-reader-error c3 #\-))
	(concat (coerce (list c2 #\-) 'string)
		(elisp-reader-escaped-character2 stream)))))))

(defun elisp-reader-character (stream c)
  (lisp::let ((c1 (lisp::read-char stream t nil t)))
    (cond
     ((char/= c1 #\\) (char-code c1))
     (t
      (unread-char #\\ stream)
      (elisp-reader-escaped-character stream)))))

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; string
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(defun elisp-reader-string-parse-character (stream)
  (lisp::let ((s (elisp-reader-escaped-character3 stream)))
    (char-code (elisp-read-from-string (concat "#\\" s)))))

(defvar *elisp-reader-encoding-euc* nil)

(defun elisp-reader-string (stream c)
  (lisp::let ((result)
	      (ctrl '(#\a #\b #\t #\n #\v #\f #\r #\e #\x))
	      escape c2 c3)
    (while (or (char/= #\" (lisp::setq c2 (lisp::read-char stream t nil t)))
	       escape)
      (cond
       ((and (null escape)
	     (char= c2 #\\)
	     (lisp::setq c3 (peek-char nil stream nil nil t))
	     (or (char= c3 #\C)
		 (char= c3 #\M)
		 (char= c3 #\S)
		 ;(char= c3 #\x)
		 (lisp::member c3 '(#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7))
		 (lisp::member c3 ctrl)))
	(lisp::setq escape nil)
	(cond
	 ;; 16
	 ((char= c3 #\x)
	  (lisp::read-char stream t nil t)
	  (lisp::let (hex c4)
	    (while (or (digit-char-p (lisp::setq c4 (lisp::read-char stream t nil t)))
		       (lisp::member c4 '(#\a #\b #\c #\d #\e #\f
					  #\A #\B #\C #\D #\E #\F)))
	      (push c4 hex))
	    (unread-char c4 stream)
	    (lisp::let ((*readtable* *original-readtable*))
	      (lisp::setq hex (parse-integer (coerce (nreverse hex) 'string)
				       :radix 16)))
	    (push (code-char hex) result)))
	 ;; 8
	 ((digit-char-p c3)
	  (lisp::let (oct c4)
	    (while (digit-char-p (lisp::setq c4 (lisp::read-char stream t nil t)))
	      (when (= 3 (length oct))
		(return))
	      (when (or oct
			(char/= c4 #\0))
		(push c4 oct)))
	    (unread-char c4 stream)
	    (lisp::let ((*readtable* *original-readtable*))
	      (lisp::setq oct (parse-integer (coerce (nreverse oct) 'string)
				       :radix 8)))
	    (push (code-char oct) result)))
	 ((lisp::member c3 '(#\C #\M #\S))
	  (lisp::let ((code (elisp-reader-string-parse-character stream)))
	    (push (code-char code) result)))
	 ((lisp::member c3 ctrl)
	  (lisp::let ((a '((#\a . #\C-g) (#\b . #\C-h) (#\t . #\TAB)
			   (#\n . #\LFD) (#\v . #\C-k) (#\f . #\C-l)
			   (#\r . #\RET) (#\e . #\ESC))))
	    (push (cdr (assoc (lisp::read-char stream t nil t)
			      a :test #'char=)) result)))
	 (t
	  (push (lisp::read-char stream t nil t) result))))
       (t
	(if (char= #\\ c2)
	    (lisp::setq escape (not escape))
	  (lisp::setq escape nil))
	(when (null escape)
	  (push c2 result))))
      (lisp::setq c3 nil))
    (if *elisp-reader-encoding-euc*
	(convert-encoding-to-internal *encoding-euc-jp*
				      (coerce (nreverse result) 'string))
      (coerce (nreverse result) 'string))
    ))

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; vector
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(defun elisp-reader-vector (stream c)
  (lisp::let (sexp result)
    (while (and (lisp::setq sexp (lisp::read stream t nil t))
		(not (eq sexp *elisp-reader-]*)))
      (push sexp result))
    (if (not (eq sexp *elisp-reader-]*))
	(elisp-reader-error *elisp-reader-]* sexp))
    `(coerce (quote ,(nreverse result)) 'vector)))

#|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;; elisp のキー表現を xyzzy のキー表現のリストに変換。
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(define-condition elisp-key-error (reader-error)
  (key)
  (:report (lisp::lambda (c s)
	     (lisp::format s "未知のキー（またはイベント）: ~S"
			   (elisp-key-error-key c)))))

(defun elisp-key-to-xyzzy-key-list (key)
  (cond
   ;((consp key) (elisp-cons-to-key key))
   ;((symbolp key) (elisp-symbol-to-key key))
   ;((keymapp key) )
   ((characterp key) (list key))
   ((and (consp key)
	 (not (find-if-not #'characterp key)))
    key)
   ((stringp key) (elisp-string-to-key key))
   ((vectorp key) (elisp-vector-to-key key))
   (t (lisp::error 'elisp-key-error :key key))))

(defun elisp-string-to-key (string)
  (coerce string 'list))

(lisp::defvar *elisp-event-alist*
  `(("delete" . "Delete")
    ("backspace" . "C-h")
    ("insert" . "Insert")
    ("control" . "C-")
    ("shift" . "S-")
    ("meta" . "M-")
    ("tab" . "TAB")
    ("home" . "Home")
    ("end" . "End")
    ("left" . "Left")
    ("right" . "Right")
    ("up" . "Up")
    ("down" . "Down")
    ("next" . "PageDown")
    ("prior" . "PageUp")
    ("escape" . "ESC")
    ("linefeed" . "LFD")
    ("mouse-1" . "LBtnUp")
    ("mouse-2" . "RBtnUp")
    ("mouse-3" . "MBtnUp")
    ;("mouse-wheel" . "MBtnMove");?
    ("down-mouse-1" . "LBtnDown")
    ("down-mouse-2" . "RBtnDown")
    ("down-mouse-3" . "MBtnDown")
    ("mouse-movement" . "MouseMove")
    ("pageup" . "PageUp")
    ("quit" . "C-g")
    ("return" . "RET")
    ,@(lisp::let (lst)
	(dotimes (i 24)
	  (push (cons (lisp::format nil "f~D" (1+ i))
		      (lisp::format nil "F~D" (1+ i)))
		lst))
	(reverse lst))
    ,@(lisp::let (lst)
	(dotimes (i 10)
	  (push (cons (lisp::format nil "kp-~D" i)
		      (lisp::format nil "~D" i))
		lst))
	(reverse lst))
    ,@(lisp::let (lst)
	(dotimes (i 4)
	  (push (cons (lisp::format nil "kp-f~D" (1+ i))
		      (lisp::format nil "F~D" (1+ i)))
		lst))
	(reverse lst))
    ("kp-add" . "+")
    ("kp-decimal" . ".")
    ("kp-divide" . "/")
    ("kp-enter" . "RET")
    ("kp-equal" . "=")
    ("kp-multiply" . "*")
    ;("kp-separator" . "")
    ("kp-subtract" . "-")
    ("kp-tab" . "TAB")
    ("kp-space" . "SPC")
    ("kp-home" . "HOME")
    ("kp-left" . "Left")
    ("kp-up" . "Up")
    ("kp-right" . "Right")
    ("kp-down" . "Down")
    ("kp-prior" . "PageUp")
    ("kp-next" . "PageDown")
    ("kp-end" . "End")
    ("kp-begin" . "Home")
    ("kp-insert" . "Insert")
    ("kp-delete" . "Delete")
    ))

(defun elisp-vector-to-key (vector)
  (lisp::let (result)
    (dotimes (i (length vector))
      (push (elisp-event-to-key (aref vector i)) result))
    (nreverse result)))

(defun elisp-event-to-key (event)
  (save-match-data
   (lisp::let ((result ""))
     (lisp::setq event (if (consp event) event (list event)))
     (dolist (e event)
       (cond
	((symbolp e)
	 (lisp::let (mod ev)
	   (lisp::setq e (symbol-name e))
	   (string-match "^\\([CMS]-\\)*\\(.+\\)" e)
	   (lisp::setq mod (match-string 1))
	   (lisp::setq ev (match-string 2))
	   (lisp::let ((k (cdr (assoc ev *elisp-event-alist*
				      :test #'string-equal))))
	     (lisp::setq result
		   (concat result (if k
				      k
				    (if (= 1 (length e))
					e
				      (lisp::error 'elisp-key-error :key e))))))))
	((numberp e)
	 (lisp::let ((k (substring
			 (lisp::format nil "~S" (code-char e))
			 (length "#\\"))))
	   (lisp::setq result (concat result k))))
	(t (lisp::error 'elisp-key-error :key e))))
     (elisp-read-from-string (concat "#\\" result)))))

(defun elisp-module-exist-p (module)
  (lisp::setq module (if (symbolp module) (symbol-name module) module))
  (save-match-data
   (when (string-matchp "\\(.*\\)\\.lc?$" module)
     (lisp::setq module (match-string 1)))
   (lisp::let ((m-l (concat module ".l"))
	       (m-lc (concat module ".lc")))
     (dolist (path *load-path*)
       (lisp::let ((l (merge-pathnames m-l path))
		   (lc (merge-pathnames m-lc path)))
	 (cond
	  ((file-exist-p lc) (return lc))
	  ((file-exist-p l) (return l))))))))

(defun elisp-lambda-set-macro ()
  (defmacro lambda ((&rest args) &body body)
    `#'(lisp::lambda (,@args)
	 ,@body)))

(defun elisp-lambda-unset-macro ()
  (setf (symbol-function 'lambda) nil))

(defun elisp-require (module &optional pathname)
  (lisp::let ((file (elisp-module-exist-p module)))
    (when file
      (save-match-data
       (cond
	((string-matchp "\\.lc$" file) (lisp::require module))
	(t
	 (lisp::let ((*package* (find-package "elisp-lib"))
		     (*readtable* *elisp-readtable*))
	   (elisp-lambda-set-macro)
	   (unwind-protect
	       (lisp::require module)
	     (elisp-lambda-unset-macro))))))
      t)))

(defun elisp-load (&optional file (encoding *encoding-euc-jp*)
			     &key verbose print if-does-not-exist)
  (interactive "fEmacs Lisp Load: ")
  (save-match-data
   (cond
    ((string-matchp "\\.lc$" file)
     (lisp::load file :verbose verbose :print print
		 :if-does-not-exist if-does-not-exist))
    (t
     (lisp::let ((*readtable* *elisp-readtable*)
		 (*package* (find-package "elisp-lib")))
       (elisp-lambda-set-macro)
       (unwind-protect
	   (if (or (file-exist-p file)
		   (null if-does-not-exist))
	       (mc-load-file file encoding))
	 (elisp-lambda-unset-macro)))))))

(defun elisp-compile (&optional file (encoding *encoding-euc-jp*))
  (interactive "fEmacs Lisp Compile: ")
  (lisp::let ((*readtable* *original-readtable*))  ; 念のため
    (lisp::require "compile"))
  (lisp::let ((*readtable* *elisp-readtable*))
    (elisp-lambda-set-macro)
    (unwind-protect
	(mc-compile-file file encoding)
      (elisp-lambda-unset-macro))))

(defvar *elisp-readtable*
  (lisp::let ((readtable (copy-readtable)))
    (set-macro-character #\? #'elisp-reader-character nil readtable)
    (set-macro-character #\[ #'elisp-reader-vector nil readtable)
    (set-macro-character #\] #'(lisp::lambda (stream c) *elisp-reader-]*) nil
			 readtable)
    (set-macro-character #\" #'elisp-reader-string nil readtable)
    readtable))

(lisp::defvar *original-readtable* (copy-readtable *readtable*))

;(export '(elisp-load elisp-compile))
;(import '(elisp-load elisp-compile) "user")

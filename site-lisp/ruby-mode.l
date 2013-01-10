;;; -*- Mode: Lisp; Package: EDITOR -*-
;;;
;;; This file is not part of xyzzy.
;;;
; $Id: ruby-mode.l,v 100630 2010/06/30 00:00:00 Yukimi_Sake $
;
; ruby-mode for xyzzy
;
; original by HATTORI Masashi San
; modified by Yukio Sakaue <yukimi_sake@mbi.nifty.com>

(provide "ruby-mode")

(in-package "editor")

(require "ruby-hilite")

(export '(ruby-mode
		  ruby-interaction-mode
		  ruby-refresh
		  altanete-ruby-program-path
		  perform-replace
		  *ruby-prog*
		  *ruby-keyword-file*
		  *ruby-mode-hook*
		  *ruby-mode-syntax-table*
		  *ruby-mode-map*
		  *ruby-mode-abbrev-table*
		  *ruby-indent-with-spaces*
		  *ruby-reference-html-help-file*
		  *ruby-save-bufer-before-run*
		  *ruby-execution-path-alist*
		  replace-string
		  query-replace
		  replace-regexp
		  query-replace-regexp
		  ))

(defvar *ruby-prog* "ruby")
(defvar *ruby-mode-hook* nil)
(defvar *ruby-keyword-hash-table* nil)
(defvar *ruby-keyword-file* "Ruby")
(defvar *ruby-completion-list* nil)
(defvar  *ruby-indent-with-spaces* t)
(defvar *ruby-reference-html-help-file* "rubymanjp.chm")
(defvar *ruby-save-bufer-before-run* t)
(defvar *ruby-execution-path-alist* nil)
(defvar *ruby-prev-deleted-string* nil)

(defvar *ruby-mode-syntax-table* nil)
(unless *ruby-mode-syntax-table*
  (setq *ruby-mode-syntax-table* (make-syntax-table))
  (set-syntax-escape *ruby-mode-syntax-table* #\\)
  (set-syntax-symbol *ruby-mode-syntax-table* #\_)
  (set-syntax-symbol *ruby-mode-syntax-table* #\?)
  (set-syntax-symbol-prefix *ruby-mode-syntax-table* #\$)
  (set-syntax-symbol-prefix *ruby-mode-syntax-table* #\@)
  (set-syntax-match *ruby-mode-syntax-table* #\( #\))
  (set-syntax-match *ruby-mode-syntax-table* #\{ #\})
  (set-syntax-match *ruby-mode-syntax-table* #\[ #\])
)

(defvar *ruby-mode-map* nil)
(unless *ruby-mode-map*
	(setq *ruby-mode-map* (make-sparse-keymap))
	(define-key *ruby-mode-map* #\{ 'ruby-electric-insert)
	(define-key *ruby-mode-map* #\F1 'ruby-reference-show-html-help)
	(define-key *ruby-mode-map* #\} 'ruby-electric-close)
	(define-key *ruby-mode-map* #\C-h 'ruby-backward-delete-char)
	(define-key *ruby-mode-map* #\Delete 'ruby-delete-char)
	(define-key *ruby-mode-map* #\TAB 'ruby-tab-and-indent)
	(define-key *ruby-mode-map* '(#\ESC #\]) 'ruby-electric-goto-parenthesis)
	(define-key *ruby-mode-map* #\F20 'ruby-completion)
	(define-key *ruby-mode-map* #\RET 'ruby-newline-and-indent)
	(cond
	 ((find "Gates" *modules* :test #'string=)
		(define-key *ruby-mode-map* '(#\C-F5) 'ruby-interaction-mode)
		(define-key *ruby-mode-map* '(#\F12) 'list-function)
		(define-key *ruby-mode-map* '(#\F5) 'ruby-run-script-immediate)
		(define-key *ruby-mode-map* '(#\S-F5) 'ruby-run-script-with-args)
		(define-key *ruby-mode-map* '(#\S-F12) 'ruby-refresh))
	 
	 (t
		(define-key *ruby-mode-map* '(#\C-c #\i) 'ruby-interaction-mode)
		(define-key *ruby-mode-map* '(#\C-c #\l) 'list-function)
		(define-key *ruby-mode-map* '(#\C-c #\C-x) 'ruby-run-script-immediate)
		(define-key *ruby-mode-map* '(#\C-c #\x) 'ruby-run-script-with-args)
		(define-key *ruby-mode-map* '(#\C-c #\r) 'ruby-refresh)
		)))

(set-extended-key-translate-table exkey-S-space #\F20)
(defvar *ruby-mode-abbrev-table* nil)
(unless *ruby-mode-abbrev-table*
  (define-abbrev-table '*ruby-mode-abbrev-table*))

(setf
 rb-literal-color-list
 '(("\'" . (literal-rb-single ruby-str-fore-color ruby-str-back-color))
	 ("\"" . (literal-rb-double ruby-str-fore-color ruby-str-back-color))
	 ("\/" . (literal-rb-rgxp ruby-rgx-fore-color ruby-rgx-back-color))
	 ("\%" . (literal-rb-percent ruby-percent-fore-color ruby-percent-back-color))
	 ("\<" . (literal-rb-here ruby-here-fore-color ruby-here-back-color)))
 )

(setf
 rb-special-regexp (compile-regexp "[\"\'\`\/\#\}\=]")
 
 rb-begin-block-keywords
 "\\_<\\(?:module\\|class\\|def\\|if\\|unless\\|case\\|for\\|while\\|until\\|begin\\|do\\)\\_>"
 
 rb-mid-block-keywords
 "\\_<\\(?:then\\|else\\|elsif\\|when\\|rescue\\|ensure\\)\\_>"
 
 rb-end-block-keywords
 "\\_<end\\_>"
 
 rb-reserved-keywords
 "\\_<\\(:?alias\\|break\\|in\\|next\\|redo\\|return\\|retry\\|self\\|super\\|yield\\)\\_>"

 rb-parenthesis-keywords
 "[\{\}]"

 rb-begin-block-regexp
 (compile-regexp rb-begin-block-keywords)

 rb-mid-block-regexp
 (compile-regexp rb-mid-block-keywords)

 rb-indentation-regexp
 (compile-regexp
	(concat  rb-parenthesis-keywords "\\|" rb-begin-block-keywords "\\|" rb-end-block-keywords))

  rb-literal-keywords
 "\%\\([qrswxQW]?\\)\\([^a-zA-Z0-9_]\\|\^\\)\\|\<\<\-?\\([\"\'\`]?\\)\\([a-zA-Z0-9_]+\\)\\3\\|[\"\'\`\/\#\{\}]\\|^=begin"
 
 ruby-bold-keywords
 (mapcar #'symbol-name
'( alias begin break case class def do else elsif end ensure for if in module next raise redo
	rescue retry return self super then undef unless until when while yield extend include require
	 ))

 rb-token-regexp
 (compile-regexp "\%\\([qrswxQW]?\\)\\([^a-zA-Z0-9_]\\|\^\\)\\|\<\<\-?\\([\"\'\`]?\\)\\([a-zA-Z0-9_]+\\)\\3\\|[\"\'\`\#\}\/]\\|^=begin\\|\\_<[a-zA-Z0-9]+\\_>")

 
 rb-token-regexp2
 (compile-regexp
	(concat rb-literal-keywords "\\|" rb-begin-block-keywords "\\|" rb-mid-block-keywords "\\|" rb-end-block-keywords "\\|" rb-reserved-keywords))
 
  rb-token-regexp3
 (compile-regexp
	(concat rb-begin-block-keywords "\\|" rb-mid-block-keywords "\\|" rb-end-block-keywords "\\|" rb-reserved-keywords))

rb-literal-begin-regexp
 (compile-regexp
	"\%\\([qrswxQW]?\\)\\([^a-zA-Z0-9_]\\|\^\\)\\|\<\<\-?\\([\"\'\`]?\\)\\([a-zA-Z0-9_]+\\)\\3\\|[\"\'\`\/]\\|^=begin" )
 
rb-mid-end-regexp
 (compile-regexp
	(concat rb-mid-block-keywords  "\\|" rb-end-block-keywords "\\|\}"  ))
 
 rb-then-regexp
 (compile-regexp "\\<then\\(?:$\\|[^a-zA-Z0-9_].*[\;\#]?\\)")
 
 rb-while-until-for-regexp
 (compile-regexp "\\(?:^\\|;\\)[ \t]*\\(?:while\\|until\\|for\\)\\(?:$\\|[^a-zA-Z0-9_]\\)")
 
 rb-bold-keywords
 (append ruby-bold-keywords '("{" "}" "\"" "\'" "\`" "\#" "#{" "\/"))
  
 rd-end-regexp (compile-regexp "^=end")
 rd-keyword-regexp
 (compile-regexp
	(format nil "\\<~A\\>~{\\|\\<~A\\>~}" (car ruby-bold-keywords)
					(cdr ruby-bold-keywords)))
 
 rb-parenthesis-alist
 '(("\(" . "\)") ("\[" . "\]") ("\{" ."\}") ("\<" . "\>"))
 )


;;; Ruby Interaction Mode ;;;

(defvar-local *ruby-interaction-mode* nil)
;(defvar-local irb-process nil)
(defvar *ruby-interaction-mode-map* nil)
(unless *ruby-interaction-mode-map*
	(setq *ruby-interaction-mode-map* (make-sparse-keymap))
	(define-key *ruby-interaction-mode-map* #\C-j 'irb-eval-paragraph)
	)

(defun ruby-interaction-mode (&optional (arg nil sv))
  (interactive "p")
  (toggle-mode '*ruby-interaction-mode* arg sv)
  (if *ruby-interaction-mode*(setq mode-name "Ruby-Interaction")
		(setq mode-name "Ruby"))
  (update-mode-line t)
  (if *ruby-interaction-mode*
      (progn
				(set-minor-mode-map *ruby-interaction-mode-map*)
				(irb-start)
				)
    (progn
			(unset-minor-mode-map *ruby-interaction-mode-map*)
			(irb-quit)
			(sit-for 0.1)
			(delete-other-windows)
			))
	t)

(setq irb-start-script "\"
module IRB
  def IRB.setup(ap_path)
    IRB.init_config(ap_path)
    IRB.init_error
    IRB.conf[:PROMPT][:XYZZY_PROMPT] = {
      :PROMPT_I => nil,
      :PROMPT_S => nil,
      :PROMPT_C => nil,
      :RETURN => '==>%s\n'
    }
    IRB.conf[:PROMPT_MODE] = :XYZZY_PROMPT
    IRB.run_config
  end
end
IRB.start
\"")

;;; Ruby mode ;;;

(defun ruby-mode ()
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "Ruby")
  (setq buffer-mode 'ruby-mode)
  (use-syntax-table *ruby-mode-syntax-table*)
  (use-keymap *ruby-mode-map*)
  (make-local-variable 'mode-specific-indent-command)
  (setq mode-specific-indent-command #'ruby-indent-line2)
  (make-local-variable 'build-summary-function)
  (setq build-summary-function 'ruby-build-summary-of-functions)
  (make-local-variable 'paragraph-start)
  (setq paragraph-start "^$\\|\f")
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)
  (make-local-variable 'indent-tabs-mode)
  (setq indent-tabs-mode nil)
  (make-local-variable 'tags-find-target)
  (setq tags-find-target #'tags-find-target-simple)
  (make-local-variable 'tags-find-point)
  (setq tags-find-point #'tags-find-ruby-point)
  (and *ruby-keyword-file*
			 (null *ruby-keyword-hash-table*)
			 (setq *ruby-keyword-hash-table*
						 (load-keyword-file *ruby-keyword-file*)))
  (when *ruby-keyword-hash-table*
    (make-local-variable 'keyword-hash-table)
    (setq keyword-hash-table *ruby-keyword-hash-table*))
  (make-local-variable 'regexp-keyword-list)
	(make-local-variable 'rb-delete-buffer)
  (setq regexp-keyword-list *ruby-variables-regexp*)
  (setq *local-abbrev-table* *ruby-mode-abbrev-table*)
  (run-hooks '*ruby-mode-hook*)
	(enable-post-buffer-modified-hook t)
	(add-hook 'post-buffer-modified-hook 'ruby-buffer-modified-hook)
	(save-excursion
		(goto-char 0)
		(clear-all-text-attributes)
		(rb-parse-and-set-attr (point-max) nil t )
		))

(defun ruby-delete-char()
	(interactive)
	(unless
			(selection-start-end (start end)
				(setq rb-delete-buffer (buffer-substring start end))
				(delete-char (- end start)))
		(setq rb-delete-buffer (buffer-substring (point)(+ 1 (point))))
		(delete-char)))


(defun ruby-backward-delete-char()
	(interactive)
	(unless
			(selection-start-end (start end)
				(setq rb-delete-buffer (buffer-substring start end))
				(delete-char (- end start)))
		(setq rb-delete-buffer (buffer-substring (- (point) 1)(point)))
		(delete-backward-char)))


(defun ruby-tab-and-indent ()
	(interactive)
	(enable-post-buffer-modified-hook nil)
	(ruby-indent-line2)
	(enable-post-buffer-modified-hook t)
	)

(defun ruby-newline-and-indent ()
  (interactive)
	(enable-post-buffer-modified-hook nil)
	(let ((p1)(p2)(l1)(l2)(rb-str)(rd-lin)(rb-exp)(str)(start)(end)(tag)(mstr)(in-literal)(kwd))
		(save-excursion (goto-bol) (setq p1 (point))
			(skip-chars-forward " \t")
			(setq indentstr (buffer-substring p1 (point)))
			)
		(insert #\LFD)
		(setq p2 (point))
		(goto-char 0)
		(multiple-value-setq (l1 rb-str rd-lin rb-exp)(rb-count-indent2 nil nil nil p1 0))
		(if (or rb-str rd-lin (not (endp rb-exp))); リテラル or RD中 or 式展開中
				(progn
					(cond
					 (rd-lin ;rd なら次の行頭までに "^=end"があるか？
						(scan-buffer  "^=end" :limit p2  :regexp t :tail t))
					 (rb-str ;リテラル
						(while
								(and
								 (scan-buffer (concat (car rb-str)(cadr rb-str)) :regexp t :tail t :limit p2)
								 (not(check-escape))
								 (setq mstr (match-string 0))))));cond
					(if (and
							 mstr
							 (when (string= (match-string 0) "#{")
								(push (list (car rb-str)(third rb-str)) rb-exp) ; 式展開はリテラル中
								 nil))
							nil
						(setq in-literal t)))) ;マッチしなければ次の行頭もリテラル
		(if in-literal
				(progn ;リテラル中ならシンプルインデント
					(goto-char p2)
					(insert indentstr)
					(skip-chars-forward " \t")
					(setq p2 (point)))
			(progn ;リテラル外なら再パース
				(multiple-value-setq (l2 rb-str rd-lin rb-exp)(rb-count-indent2  nil nil rb-exp p2 l1))
				(when (or rb-str rd-lin rb-exp) (setq l2 nil))
				(save-excursion
					(goto-char p1)
					(rb-indent-line l1)
					(next-line)
					(rb-indent-line l2)
					(when (and (bolp) l2) (skip-chars-forward " \t"))
					(setq p2 (point)))))
		
		(save-excursion
			;(set-text-attribute (point) (point-max) nil)
			(clear-all-text-attributes)
			(goto-char 0)
			(rb-parse-and-set-attr (point-max) nil t ))
		(goto-char p2));let
	(enable-post-buffer-modified-hook t))


(defun rb-indent-line (level)
	(when (and level (>= level 0))
		(save-excursion
			(goto-bol)
			(when (looking-at rb-literal-begin-regexp )
				(return-from rb-indent-line))
			(skip-chars-forward " \t")
			(delete-trailing-spaces)
			(when (and (> level 0) (looking-at rb-mid-end-regexp))
				(decf level))
			(if *ruby-indent-with-spaces*
					; (insert " " (* level (tab-columns)))
					 (insert " " (* level (tab-columns (selected-buffer))))
				(insert "\t" level)))))


(defun ruby-indent-line2 ()
	(let ((p) (level 0))
		(save-excursion (goto-bol)(setq p (point)))
		(save-excursion
			(goto-char 0)
			(multiple-value-setq (level rb-str rd-lin rb-exp)(rb-count-indent2 nil nil nil p level)))
		(unless (or rb-str rd-lin rb-exp)
			(rb-indent-line level)
			(when (bolp) (skip-chars-forward " \t")))))


(defun rb-count-indent2 (rb-str rd-lin rb-exp limit level)
	(let ((n 0)(mstr)(rb-str)(rd-lin)(rb-exp)(me))
		(unless level (setq level 0))
		(while (multiple-value-setq
							 (mstr rb-str rd-lin rb-exp n me)
						 (rb-parse-and-set-attr limit rb-exp nil))
			(setq level (+ n level)))
		(values level rb-str rd-lin rb-exp)))


(defun ruby-electric-goto-parenthesis()
	(interactive)
	(let ((opoint (point))(bol 0)(mstr))
		(save-excursion (goto-bol) (setq bol (point)))
		(save-excursion
			(unless (and
							 (looking-at rb-indentation-regexp)
							 (setq mstr (match-string 0))
							 (if (find mstr '("module" "class" "def" "if" "unless" "while" "until" "begin" "do")
									 :test #'string=)
									 (progn (skip-chars-backward " \t")
										 (or (bolp) (string= "\;" (buffer-substring (1- (point)) (point)))))
								 t))))
		(unless mstr
			(and (goto-matched-parenthesis)
					 (show-matched-parenthesis))
			(return-from ruby-electric-goto-parenthesis))
		(if (find mstr '("end" "}") :test #'string=)
				(rb-goto-match-begin opoint)
			(rb-goto-match-end opoint))))

(defun rb-goto-match-begin(opoint)
	(let ((limit (point))(rb-exp (list))(mstr)(n 0)(alist (cons 0 0)))
		(goto-char 0)
		(while
				(prog1 (multiple-value-setq (mstr rb-str rd-lin rb-exp)
								 (rb-parse-and-set-attr limit rb-exp nil)))
					(if (find  mstr '("end" "\}") :test #'string=)
							(decf n)
						(progn
							(incf n)
							(push (cons n (- (point) (length mstr))) alist))));while
		(if (assoc n alist)
				(goto-char (cdr (assoc n alist)))
			(progn
				(goto-char opoint)
				(message "no match begin ~A" mstr)))))

(defun rb-goto-match-end(opoint)
	(let ((rb-exp(list))(mstr)(n 0)(n0 0)(pt -1))
		(goto-char 0)
		(while
				(prog1 (multiple-value-setq (mstr rb-str rd-lin rb-exp)
								 (rb-parse-and-set-attr (point-max) rb-exp nil)))
			(if (find  mstr '("end" "\}") :test #'string=)(decf n)(incf n))
			(when (and (> n0 0) (> n0 n))
				(goto-char (- (point) (length mstr)))
				(return-from rb-goto-match-end))
			(when (and (> 0 pt) (>= (point) opoint))
				(setq pt (point))
				(setq n0 n)));while
		(message "no match end ~A" mstr)
		(goto-char opoint)))

(defun ruby-electric-insert (&optional (arg 1))
	(interactive "*p")
	(self-insert-command arg)
	(ruby-indent-line2))

(defun ruby-electric-close (&optional (arg 1))
	(interactive "*p")
	(self-insert-command arg)
	(ruby-indent-line2)
	(save-excursion
		(forward-char -1)
		(and (goto-matched-parenthesis)
				 (show-matched-parenthesis)))
	t)

(defun ruby-completion () ;from ruby.l by HATTORI San
  (interactive)
  (or *ruby-completion-list*
      (setq *ruby-completion-list*
						(make-list-from-keyword-table *ruby-keyword-hash-table*))
      (return-from ruby-completion nil))
  (let ((opoint (point)))
    (when (skip-syntax-spec-backward "w_")
      (let ((from (point)))
	(goto-char opoint)
	(do-completion from opoint :list *ruby-completion-list*)))))

(defun tags-find-ruby-point (class name functionp point)
	;from ruby.l by HATTORI San
  (goto-char (- point *jump-tag-limit*))
  (and (scan-buffer (concat "^[ \t]*\\(?:def\\|class\\|module\\|attr\\)[ \t]+"
			    (regexp-quote name)
			    "\\(?:$\\|[ \t\r\n\f#]\\)")
		    :regexp t :limit (+ point *jump-tag-limit*))
       (point)))

(pushnew '(ruby-maketags "*.rb") *maketags-list* :key #'car)

(defun ruby-maketags (file count) ;from ruby.l by HATTORI San
  (goto-char (point-min))
  (while (scan-buffer "^[ \t]*\\(?:def\\|class\\|module\\|attr\\)[ \t]+" :regexp t :tail t)
    (do-events)
    (let ((type (match-string 1))
	  (opoint (point)))
      (when (and (string= type "attr")
		 (looking-at "[ \t]+:"))
	(goto-char (match-end 0))
      )
      (skip-chars-forward "A-Za-z0-9_")
      (unless (= opoint (point))
	(format t "~A~A~D" (buffer-substring opoint (point)) file opoint)
	(setq count (1+ count)))))
  count)

#| ; for debugging
(defun ruby-buffer-modified-hook (buffer operation from to undo-p)
	(when (eq buffer-mode 'ruby-mode)
		(save-excursion
			(let ((d (match-data)))
				(goto-char 0)
				(clear-all-text-attributes)
				(rb-parse-and-set-attr (point-max) nil t)
				(store-match-data d)))))
|#

;#|
(defun ruby-buffer-modified-hook (buffer operation from to undo-p)
	(when (eq buffer-mode 'ruby-mode)
		(save-excursion
			(let ((d (match-data))(s)(s1)(tag)(tag2)(start)(end)(fg)(bg)(bld)(rb-exp))
				(if (eql operation :delete)
						(setq s rb-delete-buffer)
					(setq s (buffer-substring from to)))
				(unless s (setq s ""))
				(setq s1 (buffer-substring  (- from 1) from))
				(multiple-value-setq
						(start end tag2)
					(find-text-attribute-point (+ to 1)))
				(multiple-value-setq
						(start end tag fg bg bld)
					(find-text-attribute-point (- from 1)))
				(when (eobp) ; [EOF]直前では前の属性をコピーしておく
					(set-text-attribute from to tag :foreground fg :background bg))
				;パースする条件
				(cond
				 ((and ;属性あり
					 tag
					 (save-excursion
						 (backward-char)
						 (not (and (bolp)
											 (or (equal tag 'literal-rb-comment)
													 (equal tag 'literal-rd-document))))))
					(when
							(or
							 undo-p
							 (string= s "\n")
							 (> (length s) 1) ; ２文字以上(paste)
							 (and (eql operation :delete) (bolp)) ;行頭で削除
							 ;リテラル内はそれを壊す文字列ならパース
							 (and (equal tag 'literal-rb-single)
										(find s '("\\"  "\'") :test #'string=))
							 (and (equal tag 'literal-rb-double)
										(or (string= s1 "{")
												(find s '("\\"  "\"" "\#" "\{" "\}") :test #'string=)))
							 (and (equal tag 'literal-rb-rgxp)
										(or (string= s1 "{")
												(find s '("\\"  "\/" "\#" "\{" "\}") :test #'string=)))
							 (and (equal tag 'literal-rd-document)
										(progn (goto-bol)
											(looking-for "\=")))
							 (and (equal tag 'literal-rb-percent)
										(or (string-looking-at "[^a-zA-Z0-9_]" s) ; %は記号ならパース
												(string= s1 "{")
												(progn (backward-char) (looking-back "%"))))
							 (and (equal tag 'literal-rb-here)
										(or (find s '("\\"  "\"" "\#" "\{" "\}") :test #'string=)
												(string= s1 "{")
												(progn (goto-bol)
													(or (save-excursion (looking-at "^[ \t]*\\([a-zA-Z0-9_]\\).*"))
															(looking-at ".*\<\<\\([a-zA-Z0-9_]\\)*.*$")))))
							 (and bld
										(progn
											(skip-syntax-spec-backward "w_")
											(if (looking-at rb-token-regexp3)
													(set-text-attribute (match-beginning 0) (match-end 0) 'rb-bold' :bold t)
												(let ((pt (point)))
													(skip-syntax-spec-forward "w_")(set-text-attribute pt (point) nil)))
											nil))
							 (if (equal tag 'literal-rb-comment) nil));or
						(message "tag ~A ~A" tag (point))
						(goto-char 0)
						(clear-all-text-attributes)
						(rb-parse-and-set-attr (point-max) rb-exp t)))
				 (t ;属性なし
					(when
							(or
							 undo-p
							 (and (eql operation :delete) (bolp)) ;行頭で削除
							 (string= s "\n")
							 (> (length s) 1) ; ２文字以上(paste)
							 (progn
								 (backward-char)
								 (unless (string-looking-at "[a-zA-Z0-9_]" s)
									 (looking-back "\%")))
							 (progn ; リテラルを作るか変更するキーワードならパース
								 (skip-syntax-spec-backward "w_")
								 (skip-chars-backward "=%<")
								 (looking-at (concat rb-literal-keywords "\\|^\=")))
							 (progn
								 (skip-chars-forward " \t")
								 (if (looking-at rb-token-regexp3)
										 (set-text-attribute (match-beginning 0) (match-end 0) 'rb-bold :bold t)
									 (let ((pt (point)))
										 (skip-syntax-spec-forward "w_")(set-text-attribute pt (point) nil)))
								 nil)
							 (if s (find s '("\"" "\'" "\`" "\{" "\}" "\#") :test #'string=))
							 tag2 ; 次の文字がタグ付き
							 );or これ以外はパースしない
						(goto-char 0)
						(clear-all-text-attributes)
						(rb-parse-and-set-attr (point-max) rb-exp t));when
						)) ;cond
				 (store-match-data d)))))
;|#
	
(defun ruby-reference-show-html-help ()
  (interactive)
  (html-help (merge-pathnames *ruby-reference-html-help-file* (etc-path))
		 (get-winhelp-topic)))

(defun altanete-ruby-program-path (&optional arg)
	(interactive "sRuby-Version:")
	(setq alt-path (cdr (assoc arg *ruby-execution-path-alist* :test #'string=)))
	(if alt-path (setq *ruby-prog* alt-path) (setq *ruby-prog* "ruby"))
	(message-box (concat "Ruby-Version is " arg "\nProgram path is " *ruby-prog*)))

(defun ruby-run-script-immediate ()
	(interactive)
	(rb-run ""))

(defun ruby-run-script-with-args (&optional args)
	(interactive "sARGS: ")
	(unless (interactive-p)
		(setq args (read-string "ARGS: "))
		)
	(rb-run args))

(defun rb-run (args)
	(if *ruby-save-bufer-before-run*
			(progn
				(save-buffer)
				(command-execution (concat *ruby-prog* " \""
																	(get-buffer-file-name) "\" " args)))
		(let
				((tempfile (make-temp-file-name
										"__temp_" "rb" (default-directory))))
			(with-open-file(rb-stream tempfile :direction :output)
				(princ (buffer-substring (point-min)(point-max)) rb-stream )
				)
			(command-execution (concat *ruby-prog* " \"" tempfile "\" " args))
			(delete-file tempfile :if-does-not-exist :skip))))

(defun command-execution (command)
	(interactive "sCmmand:")
	(let ((proc nil)(buffer (selected-buffer)))
		(with-output-to-temp-buffer ("*cmd*" 5)
			(unwind-protect
					(setq proc (make-process
											command
											:output (selected-buffer)
											:exec-directory (default-directory buffer)))
				))
		(while (eq :run (process-status proc))
			(sit-for 0.05)(do-events))
		(if (= 0 (point-max))
				(let ((buff (selected-buffer)))
					(other-window)
					(delete-buffer buff)
					(delete-other-windows))
			(other-window))
		(message (concat " '" command "' ended."))))

(defun irb-start ()
	(interactive)
		(with-output-to-temp-buffer("*Result*" 8)
			(setf irb-result-buffer (selected-buffer)
						irb-count-send 0)
			(set-process-filter
			 (setq irb-process
						 (make-process (concat "ruby -r irb -e " irb-start-script )
													 :output irb-result-buffer)) 'irb-filter-func)
			(other-window)))

(defun irb-filter-func (process str)
	(save-window-excursion
		(set-buffer irb-result-buffer)
		(goto-char (point-max))
		(insert (substring str irb-count-send (length str)))
		)
	(other-window)
	(goto-char (point-max))
	(refresh-screen)
	(other-window)
	(refresh-screen))

(defun send-to-irb (str)
	(setq irb-count-send (length str))
	(process-send-string irb-process str))

(defun irb-quit ()
	(send-to-irb"quit\n"))

(defun irb-eval-paragraph ()
	(interactive)
	(let ((opoint (point)(rb-eol opoint)(rb-start opoint)))
	(save-excursion
		(setq rb-bol (progn (goto-bol)(point)))
		(setq rb-eol (progn (goto-eol)(point)))
		(if (scan-buffer "\\(?:^\\|;\\)[ \t]*end\\(?:[ \t]*\\|#.*\\)$"
										 :regexp t :reverse t :limit rb-bol)
				(progn
					(setq rb-start (irb-serch-paragraph rb-eol))
					(unless rb-start (return-from irb-eval-paragraph)))
			(setq rb-start (progn(goto-bol)(point))))
		(send-to-irb (concat (buffer-substring rb-start rb-eol) "\n" )))))

(defun irb-serch-paragraph (limit)
	(let ((b0 0)(p1 0)(n 0)(s nil)(rb-str nil)(rd-lin nil)(rb-exp (list)))
		(save-excursion
			(goto-char (point-min))
			(while (multiple-value-setq
								 (s rb-str rd-lin rb-exp)(rb-parse-and-set-attr limit rb-exp nil))
				(when (or rb-str rd-lin)(return))
				(if (or (string= s "end")(string= s "\}"))
						(decf n)
					(progn
						(incf n)
						(when (= n 1) (save-excursion (goto-bol)(setq p1 (point))))
						)))
			(unless (= n 0) (msgbox "定義の終端じゃないっす！")
				(return-from irb-serch-paragraph  nil)))
		p1))

(defun ruby-build-summary-of-functions ()
	(let ((result nil)(n 0)(s nil)(rb-str nil)(rd-lin nil)(rb-exp (list)))
		(save-excursion
			(goto-char 0)
			(while (multiple-value-setq (s rb-str rd-lin rb-exp)
							 (rb-parse-and-set-attr (point-max) rb-exp nil))
				(when (or rb-str rd-lin)(return))
				(if (or (string= s "end")(string= s "\}"))
						(decf n)
					(progn
						(when (find s '("def" "class" "module") :test #'string=)
							(looking-at "[ \t]+\\([^ \t\n{(]+\\)")
							(push (list
										 (current-line-number)
										 (concat
											(let ((r nil))(dotimes (x n r)(setq r (concat r "  "))))
											s " "(match-string 1))
										 ) result))
						(incf n)
						)))
			(nreverse result))))

(defun ruby-refresh ()
	(interactive)
	(save-excursion
		(goto-char 0)
		(clear-all-text-attributes)
		(rb-parse-and-set-attr (point-max) nil t)))

(defun perform-replace (pattern replacement query regexp interactive-p noerror)
	; from "search.l" modified by yukimi_sake@mbi.nifty.com
  (let ((literal (null regexp))
	(count 0)
	(nodup nil)
	(opoint (point))
	(not-found t)
        (def nil)
	(last-match nil)
	(last-match-char nil)
	(undo-bound (or interactive-p query)))
    (undo-boundary)
    (when interactive-p
      (if regexp
	  (setq *last-search-regexp* pattern
		*last-replace-regexp* replacement)
	(setq *last-search-string* pattern
	      *last-replace-string* replacement)))
    (if regexp
	(setq pattern (compile-regexp pattern *case-fold-search*)))
		(if (eq buffer-mode 'ruby-mode)(enable-post-buffer-modified-hook nil))
    (loop
      (unless query
	(long-operation
	  (setq count (+ count
			 (replace-buffer pattern
					 replacement
					 :regexp regexp
					 :no-dup nodup
					 :last-match (cons last-match last-match-char)
					 :case-fold *case-fold-search*
					 :left-bound *word-search*
					 :right-bound *word-search*
					 :literal literal))))
	(when not-found
	  (setq not-found (zerop count)))
	(return))
      (unless (scan-buffer pattern
			   :regexp regexp
			   :no-dup nodup
			   :last-match (cons last-match last-match-char)
			   :case-fold *case-fold-search*
			   :left-bound *word-search*
			   :right-bound *word-search*)
	(return))
      (if (and (eql (match-beginning 0) (match-end 0))
	       (eql last-match (match-beginning 0)))
	  (setq nodup t)
	(progn
	  (setq not-found nil)
	  (show-match)
	  (unless (pos-visible-in-window-p (point))
	    (recenter))
	  (refresh-screen)
	  (message (if (eq def 'help)
		       "(y)置換, (n)スキップ, (!)残り全部, (u)アンドゥ, (C-g)中止, (.)中止して戻る"
		     "置換する?"))
	  (setq def (lookup-keymap *query-replace-map* (read-char *keyboard*) t))
	  (when (cond ((eq def 'act)
		       t)
		      ((eq def 'skip)
		       (setq nodup t)
		       nil)
		      ((eq def 'automatic)
		       (setq query nil)
		       t)
		      ((eq def 'undo)
		       (and (plusp count)
			    (undo)
			    (setq count (1- count)))
		       (setq nodup nil)
		       nil)
		      ((eq def 'quit-and-back)
		       (goto-char opoint)
		       (setq def 'quit)
		       (return))
		      ((eq def 'quit)
		       (return))
		      ((eq def 'recenter)
		       (recenter)
		       (setq nodup nil)
		       nil)
		      ((and (consp def)
			    (eq (car def) 'throw))
		       (throw (cdr def) count))
		      (t (setq def 'help)
			 (setq nodup nil)
			 nil))
	    (setq last-match-char (unless (= (match-end 0) (point-min))
				    (char-before (match-end 0))))
	    (unless (replace-match replacement :literal literal)
	      (return))
	    (setq last-match (point))
	    (setq nodup (= (match-beginning 0) (match-end 0)))
	    (when undo-bound
	      (undo-boundary))
	    (setq count (1+ count)))))
      (when (eobp)
	(return)))
		
    (hide-match)
    (unless noerror
      (and (eq def 'quit)
	   (quit))
      (and not-found
	   (error "文字列が見つかりません")))
    (when (and interactive-p
	       (null *executing-macro*))
      (message "~d個置換しました" count))
		(when (eq buffer-mode 'ruby-mode)
			(save-excursion
				(goto-char 0)
				(rb-parse-and-set-attr (point-max) nil t))
		(enable-post-buffer-modified-hook t))
    count))

(defmacro check-escape ()
	`(save-excursion
		 (let ((mb (match-beginning 0)))
			 (goto-char mb)
			 (skip-chars-backward "\\")
			 (not (evenp (- mb (point)))))))

(defmacro check-valid-literal ()
	; 正規表現、%リテラル、ヒアドキュメントのチェック用マクロ
	`(or
		(bolp)
		(progn (setq opoint (point)) nil)
		(looking-back "=~")
		(looking-back "=>")
		(looking-back  "<<")
		(skip-chars-backward "=[;({|," )
		(and
		 (skip-syntax-spec-backward "w_")
		 (or
			(find (buffer-substring (point) opoint)
						'( "begin" "do" "else" "elsif" "ensure" "if" "rescue" "then" "unless" "until" "while"
							"when" "eval" "abort" "sub" "sub!" "gsub" "gsub!" "p" "print" "puts" "raise" "return"
							"scan" "system" "warn")
						:test #'string=)
			(and
			 (skip-chars-backward "." )
			 (skip-syntax-spec-backward "w_")
			 (progn
				 (skip-chars-backward " \t")
				 (or (bolp) (looking-back ";"))))))))

(defun rb-parse-and-set-attr (limit-pos rb-exp no-parse-indentp)
	;rb-exp:式展開文字のリスト
	(let ((opoint 0)(mbegin 0)(mend 0)(mstr)(m0)(m1)(m2)(mp)(xp)(xk)(ls)(rb-lit)(rb-bol 0)(rb-eol 0)(n)
				(rb-str)(rd-lin))
		(while (progn (setq mstr nil)
						 (scan-buffer rb-token-regexp2 :limit limit-pos :tail t))
			(setf mbegin (match-beginning 0)
						mend (match-end 0)
						mstr (match-string 0)
						m0 (substring mstr 0 1)
						m1 (concat m0 (match-string 1)(match-string 3))
						m2  (match-string 2)
						m2 (concat
								(if (setq mp (assoc m2 rb-parenthesis-alist :test #'string=)) (cdr mp) m2)
								(match-string 4)))
			(cond
			 ((and ruby-show-bold-keyword
						 no-parse-indentp
						 (find mstr ruby-bold-keywords :test #'string= ))
				(set-text-attribute mbegin (point) 'rb-bold :bold t))
			 
			 ;; ここからリテラルの処理。ここで属性変更する
			 
			 ((and ; 式展開なしのリテラル
				 (not rd-lin)
				 (find m1 '("\'" "\%q" "\%s" "\%w" "\<\'") :test #'string= )
				 (save-excursion (goto-char mbegin)
					 (and
						(or rb-str (not(or(looking-back "\$")(looking-back "?"))))
						(progn (skip-chars-backward "\\") (evenp (- mbegin (point)))) ; check escape
						(or (string= m1 "\'")
								(progn (setq mstr m2)(skip-chars-backward " \t") nil)
								(check-valid-literal));or
						))
				 ) ; and
				(if rb-str (setq rb-str nil) ; リテラル中ならフラグを下ろして次へ。
					(progn
						(unless ; 始端ならフラグを立てて対応する終端をサーチ
							(while (and
											(scan-buffer mstr :limit limit-pos :tail t)
											(check-escape)))
							(if (match-string 0)
									(setq mstr nil rb-str nil)
								(progn ;文末まで対応する終端なし
									(when no-parse-indentp (goto-char limit-pos))
									(setq rb-str (list mstr))
									(setq mstr nil))))
						(if no-parse-indentp
								(set-text-attribute
								 mbegin
								 (point)
								 (second (assoc m0 rb-literal-color-list  :test #'string=))
								 :foreground (eval(third (assoc m0 rb-literal-color-list :test #'string=)))
								 :background (eval(fourth (assoc m0 rb-literal-color-list :test #'string=)))
								 :bold nil)))))
			 
			 ((and ; 式展開ありまたは式展開終了後のリテラル
				 (not rd-lin)
				 (find m0 '("\"" "\`" "\/" "\}" "\%" "\<") :test #'string= )
				 (save-excursion (goto-char mbegin)
					 (and
						(or rb-str (not(or(looking-back "\$")(looking-back "?"))))
						(progn(skip-chars-backward "\\")(evenp (- mbegin (point)))) ; check escape
						(or (string= m1 "\"")
								(string= m1 "\}")
								(progn
									(unless (string= m1 "\/")(setq mstr m2))
									(skip-chars-backward " \t")
									nil)
								(check-valid-literal));or
						(if (string= m0 "\}") ; 式展開から戻り
								(progn
									(setf xp (pop rb-exp))
									(when xp
										(setq mstr (car xp))
										))
							(progn (setq xk m0)(setq xp nil) t))))) ; and
				(if rb-str
						(when(string= rb-str mstr)(setq rb-str nil));リテラル中ならフラグを下ろして次へ
					(progn
						(cond
						 ((string= mstr "\"")(setq m0 mstr))
						 ((string= m0 "\%")
							(if (or (string= m2 "$")(string= m2 "^"))
									(setq mstr (concat "\\" m2))
								(setq mstr m2)))
						 ((string= m0 "\<")(setq mstr (concat "^[ \t]*" m2 "$")))
						 )
						(unless ; 対応する終端または式展開をサーチ
								(while (and
												(scan-buffer (concat mstr "\\|#{") :limit limit-pos :tail t :regexp t)
												(check-escape)))
							(if (match-string 0)
									(progn
										(when (string= (match-string 0) "#{")
											(push (list mstr xk) rb-exp))
										(setq mstr nil rb-str nil))
								(progn  ;文末まで対応する終端なし
									(when no-parse-indentp (goto-char limit-pos))
									(setq rb-str (list mstr "\\|#{" xk))
									(setq mstr nil)))) ; unless
						(when xp (setq xk (second xp)))
						(if no-parse-indentp
								(set-text-attribute
								 mbegin
								 (point)
								 (second (assoc xk rb-literal-color-list  :test #'string=))
								 :foreground (eval (third (assoc xk rb-literal-color-list  :test #'string=)))
								 :background (eval (fourth (assoc xk rb-literal-color-list  :test #'string=)))
												:bold nil)))))
			 
			 ((and (string= mstr "\#")(not(or rb-str rd-lin))); is comment
					(goto-char mbegin) ;check escape character
					(if (and
							 (not(looking-back "?"))
							 (progn (skip-chars-backward "\\")(evenp (- mbegin (point)))))
							(progn (goto-eol)
								(if no-parse-indentp
										(set-text-attribute mbegin (+ 1 (point)) 'literal-rb-comment
																				:foreground ruby-comment-fore-color
																				:background ruby-comment-back-color
																				:bold nil)))
						(goto-char mend)))
			 
			 ((and (string= mstr "=begin") (not(or rb-str rd-lin))) ; is RD document
				(if (scan-buffer rd-end-regexp :limit limit-pos)
						(progn
							(setq rd-lin nil)
							(goto-eol))
					(progn (goto-char limit-pos) (setq rd-lin t)); 文末まで "^=end" なし
					) ;if
				(if no-parse-indentp
						(set-text-attribute mbegin (+ 1 (point)) 'literal-rd-document
																:foreground ruby-rd-fore-color
																:background ruby-rd-back-color
																:bold nil
																:extend t)))
			 
			 (no-parse-indentp nil)
			 
			 ;; 以降インデント用キーワード処理
			 ((find mstr '("if" "unless" "while" "until") :test #'string= )
				(save-excursion
					(save-excursion (goto-eol)(setq rb-eol (point)))
					(if (progn
								(goto-char (match-beginning 0))
								(skip-chars-backward " \t")
								(or (bolp)
										(looking-back "=~")
										(looking-back "=>")
										(looking-back  "<<")
										(skip-chars-backward "=[;({|," )
										))
							(progn (setq n 1)(return))
						(progn ; 後置記法処理
							(goto-char (match-end 0))
							(when (scan-buffer rb-then-regexp :limit rb-eol)
								(setq n 0)(return))
							(setq mstr nil)))))
			 ((and
				 (find mstr '("module" "class" "def" "begin") :test #'string= ) ; 要行頭チェック
				 (save-excursion
					 (goto-eol)(setq rb-eol (point))
						 (progn
							 (goto-char (match-beginning 0))
							 (skip-chars-backward " \t")
							 (or (bolp) (string= ";" (buffer-substring (1- (point)) (point)))))));and
				(setq n 1)(return))
			 ((find mstr '("do" "\{") :test #'string=)
				(save-excursion
					(setq opoint (point))
					(goto-bol) (setq rb-bol (point)) (goto-char opoint)
					(if (scan-buffer rb-while-until-for-regexp :limit rb-bol :reverse t)
							(setq mstr nil)
						(progn (setq n 1)(return)))))
			 ((find mstr '("case" "for") :test #'string=)
				(setq n 1)(return))
			 ((find mstr '("end" "}") :test #'string=)
				(setq n -1)(return))
			 );cond
			);while
		(values mstr rb-str rd-lin rb-exp n (match-end 0))
		);let
	);rb-parse-and-set-attr

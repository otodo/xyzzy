;;; -*- Lisp; syntax: Common-Lisp -*-
;;; KaTeX add-in function generator.
;;; katexgen.el rev.5.1.2
;;; fixed by Maeda Manabu
;;; Last fixed  "Thu May 24 2001 16:51:28 +0900"

;;; -*- Emacs-Lisp -*-
;;; YaTeX add-in function generator.
;;; yatexgen.el rev.5
;;; (c ) 1991-1995 by HIROSE Yuuji.[yuuji@gentei.org]
;;; Last modified Thu Feb 15 01:44:24 1996 on nsr
;;; $Old-Id: yatexgen.el,v 1.65 1997/12/16 13:34:01 yuuji Exp $

(provide "katexgen")

(in-package "elisp")

(require "katex")

(defun KaTeX-setq (var japanese english)
  (setq var (if KaTeX-japan japanese english)))

(Put 'KaTeX-setq 'lisp-indent-hook 1)

(KaTeX-setq KaTeX-generate-initial-message
  "             �����������[�h�ւ悤����!!

���߂Ă��l�͂��̃o�b�t�@�̗�ɂ��������Ďw���ʂ�ɂ���ė��K���ĂˁB
�{�Ԃ̎������̃o�b�t�@�ɏo�郁�b�Z�[�W�� *�悭�ǂ��* ���삵�Ȃ��Ƃ�
�܂��֐������Ȃ���!!

  �ł̓��^�[���L�[�������ĉ������B"
  "             Welcome to auto-generation mode!!

If this is your first trial, exercise this according to example and
following my messages.  Then, at making actual function, operate
reading my messages *carefully*, or you'll fail to generate appropriate
function.

  Hit return key!"
)

(KaTeX-setq KaTeX-generate-start-message
  "�����͂��߂��.\n1.�o�^�������⊮������Ă݂�.
���Ƃ��� section �^�⊮�� \\documentstyle �������� \\documentstyle{}
����������Ă݂Ă�. �����Ɓw�`�^�⊮�x���g��Ȃ��ƃ_����!�B
�ŁA���������肽�[��!!"
  "Let's begin completion for which you want to make add-in function.
If you want to make add-in function for \\documentstyle input only
`\\documentstyle{}' *with* completion of katex-mode.
If you finish this, please press RET."
)

(KaTeX-setq KaTeX-generate-abort-message
  "��߂��A��߂��`���߂�ǂ����`"
  "Aborted."
)

(KaTeX-setq KaTeX-generate-same-message
  "���ꂶ��A�Ȃɂ��ς���Ă˂�����[��! ��߂��B"
  "I found no difference between them.  So I'm quitting."
)

(KaTeX-setq KaTeX-generate-invalid-message
  "����́A���Ɩ����Ƃ������̂���."
  "It's impossible."
)

(KaTeX-setq KaTeX-generate-idontknow-message
  "���`��A����Ă悭�킩��Ȃ��Ȃ��B�΂��ł��߂�˃F�`"
  "Sorry I can't tell your adding method."
)

(KaTeX-setq KaTeX-generate-confirm-message
  "�Ƃ������Ƃ́A�t���������������͂���ł����̂�"
  "Is it additional string of add-in function?"
)

(KaTeX-setq KaTeX-generate-output-message
  "2.����A����ɂ������������̂� *�J�[�\���̈ʒu��* �����Ă݂�. 
�������� \\documentstyle{} �̗Ⴞ�� \\documentstyle[12pt]{} �Ƃ��ɂ���́B
�������悤�����ǁA���̈ʒu����J�[�\������������_����!!
�ŁA�܂����������肽�[��!!"
  "2.Then input additional string *at CURSOR POSITION*
According to last example \\documentstyle{},
modify it \\documentstyle[12pt]{}.  RET to finish."
)

(KaTeX-setq KaTeX-generate-put-arg-message
  "3.���̂����A�L�[�{�[�h����ǂݍ���ŗ~��������������ɓ���āB
�������� \\documentstyle[12pt]{} ��������A�t�����镶����[12pt]������
��œ��ꂽ���̂� 12pt �̕��������ł��ˁB
�ŁA�S������I������A�肽�[�񂾂������Ă�!!"
  "3.In this string, extract string which you want to input from key
board with quiry afterwards.  For example, though additional string is
\\documentstyle[12pt]{}, but you want enter only `12pt' by hand.
RET to finish!"
)

(KaTeX-setq KaTeX-generate-read-prompt-message
  "4.�ł́A���Ƃł����̕������ǂݍ��ގ��ɁA�ǂ������v�����v�g��
�o�������ł���? ���ɓ���ĉ������B�ʓ|�Ȃ�P�Ƀ��^�[����ł��ĂˁB
�������� 12pt �̕�����������A�w�T�C�Y�́x�Ƃ����������߁B"
  "4.When you use this add-in function afterwards, what message
do you like to be prompted with to enter these values.  In last
example `12pt', typical prompt string may be `Size?: '."
)

(KaTeX-setq KaTeX-generate-done-message
  "�悵! ���ꂪ�A�N�̍�肽�������֐����B~/.emacs �ɂł�����Ă�������
�y���Ă���B���̃o�b�t�@(*���ē�*)�� katex-mode �ɂ��Ă�������
�ł����֐����{���ɂ��]�݂̓�������邩�m���߂Ă݂�Ƃ��������ˁB
  �Ƃ���ŁA���̊֐�����ȂɊȒP���낤? ���낻�뎩���ŏ�������ǂ�?
"
  "OK! This is the definition of function you want to make!  Add
this description to your ~/.emacs or so.  Use this buffer(*Guide*)
for testing of this function please.
  But you can see this function quite easy, can't you? You had better
write your most favorite add-in function yourself!
"
)

(KaTeX-setq KaTeX-generate-nomatch-message
  "���炱��A����ȕ�����ǂ��ɂ��ˁ[��!!"
  "No such string in additional string."
)
(KaTeX-setq KaTeX-generate-buffer
  "*�t���֐������o�b�t�@*"
  "*Generate-add-in-function*"
)

(KaTeX-setq KaTeX-generate-message-buffer
  "*���ē�*"
  "*Guide*"
)

(KaTeX-setq KaTeX-generate-bug-message
  "���߁`��!! ������ƁA���̃A�h�C���֐�����̎��s����������݂���!!
��҂܂ŘA�����Ă������`�`�`��!"
  "Sorry I failed to make add-in function for you...
Send bug report to me."
)

(KaTeX-setq KaTeX-generate-narrow-message
  "��ʂ����܂�����悤�ȋC�����܂��B"
  "Too narrow screen height."
)

(defvar KaTeX-generate-message-height
  10 "Window height of KaTeX-generate-message-buffer")

;; Do you need learning for generated function?
;; If you need, please tell me (yuuji@ae.keio.ac.jp)
;;(defvar KaTeX-generate-variables-for-learning nil)
;;(defvar KaTeX-generate-current-completion-table nil)

;;;
;Generate mode.
;;;
(defun KaTeX-generate ()
  "Genarate KaTeX add-in function with enquiry."
  (interactive)
  (if (< (screen-height) (+ KaTeX-generate-message-height 10))
      (error KaTeX-generate-narrow-message))
  (put 'KaTeX-generate 'disabled t)
  (save-window-excursion
    (unwind-protect
	(let (input output (i 0) (beg 0) end add-in map map1 si str slist
		    (from (make-marker)) (to (make-marker)))
	  (delete-other-windows)
	  (switch-to-buffer KaTeX-generate-message-buffer)
	  (katex-mode)
	  (erase-buffer)
	  (insert KaTeX-generate-initial-message)
	  (read-string
	   (if KaTeX-japan "���^�[���L�[�������ĉ�����." "Press RETURN."))
	  (erase-buffer)
	  (insert KaTeX-generate-start-message)
	  (pop-to-buffer (get-buffer-create KaTeX-generate-buffer))
	  (enlarge-window (- (window-height) KaTeX-generate-message-height 1))
	  (erase-buffer)
	  (katex-mode)
	  (use-local-map (setq map (copy-keymap *KaTeX-mode-map*)))
	  (define-key (current-local-map) #\LFD 'exit-recursive-edit)
	  (define-key (current-local-map) #\RET 'exit-recursive-edit)
	  (define-key (current-local-map) #\C-g 'abort-recursive-edit)
	  (setq map1 (copy-keymap map))
	  (KaTeX-suppress-sparse-keymap map)
	  ;;First get input form.
	  (recursive-edit)
	  (setq input (buffer-string)
		end (1- (length input)))
	  (if (string= "" input) (error KaTeX-generate-abort-message))
	  (KaTeX-generate-move-to-add-in-position)
	  (set-marker from (1- (point)))  ;;Can't write before `from'
	  (set-marker to (1+ (point)))    ;;Can't write after `to'
	  ;;Second get output form.
	  (setq beg (1- (point)));;Cheat begin point!
	  (KaTeX-generate-display-message KaTeX-generate-output-message)
	  (use-local-map map1)
	  (fset 'si (symbol-function 'self-insert-command))
	  (lisp:defun self-insert-command (arg)
	    (interactive "p")
	    (if (or (not (equal (buffer-name) KaTeX-generate-buffer))
		    (and (> (point) (marker-position from))
			 (< (point) (marker-position to))))
		(insert (this-command-keys)) (ding)))
	  (unwind-protect
	      (recursive-edit)
	    (fset 'self-insert-command (symbol-function 'si)))
	  (setq output (buffer-string))
	  (cond ((string= "" output)	(error KaTeX-generate-abort-message))
		((string= input output)	(error KaTeX-generate-same-message))
		((< (length output) (length input))
		 (error KaTeX-generate-invalid-message)))
	  ;;(while (and (< beg end) (= (aref input beg) (aref output i)))
	  ;;  (setq beg (1+ beg) i (1+ i))) ;;for universal use.
	  (setq i (1- (length output)))
	  (while (and (>= end beg) (= (aref output i) (aref input end)))
	    (setq end (1- end) i (1- i)))
	  (setq add-in (substring output beg
				  (if (= i (1- (length output))) nil (1+ i))))
	  (erase-buffer)
	  (insert add-in)
	  (if (not (y-or-n-p KaTeX-generate-confirm-message))
	      (error KaTeX-generate-idontknow-message))
	  ;;Extract arguments.
	  (KaTeX-generate-display-message KaTeX-generate-put-arg-message)
	  (setq i 1)
	  (while (not (string=
		       "" (setq str (read-string (format nil "Arg ~D: " i)))))
	    (if (not (string-match (regexp-quote str) add-in))
		(progn
		  (ding)
		  (KaTeX-generate-display-message
		   KaTeX-generate-nomatch-message -1))
	      (setq slist (append slist (list (list str))) i (1+ i)))
	    );input all of arguments.
	  ;;Compare with output string.
	  (set-buffer KaTeX-generate-buffer) ;;for safety
	  (emacs-lisp-mode)
	  (if (> i 1)
	      (KaTeX-generate-parse-add-in slist add-in)
	    (progn
	      (erase-buffer)
	      (insert "(defun " (KaTeX-generate-function-name) " ()\n")
	      (insert "\"" (KaTeX-generate-lisp-quote add-in) "\")\n")
	      (indent-region (point-min) (point-max) nil)
	      (message (if KaTeX-japan
			   "���̂��炢�̊֐���ŏ���!!"
			 "You don't need me to make such easy function."))))
	  );let
      (put 'KaTeX-generate 'disabled nil)
      (put 'KaTeX-addin 'disabled nil)
    ))
  (KaTeX-generate-display-message KaTeX-generate-done-message)
  (switch-to-buffer KaTeX-generate-buffer)
  (setq error (handler-case
                  (eval-current-buffer)
		(error (insert KaTeX-generate-bug-message))))
  (pop-to-buffer KaTeX-generate-message-buffer)
)

(defun KaTeX-generate-parse-add-in (args add-in)
  "Parse add-in string and extract argument for it.
Variable add-in is referred in parent function."
  (let ((i 1) j (case-fold-search nil) ;i holds argument number
		(prompt (make-vector (length args) ""))
		(used (make-vector (length add-in) nil))
		func-name (string ""))
    ;;Phase 1. extract argument from add-in string.
    (mapcar
     '(lambda (arg)
	(let ((index 0) (match 0) beg end (carg (car arg)))
	  (KaTeX-generate-display-message
	   KaTeX-generate-read-prompt-message)
	  (aset prompt (1- i)
		(read-string
		 (format nil
		  (if KaTeX-japan "~D�Ԗ�(~A)��ǂގ�?: "
		    "When reading argument #~D(~A)?: ") i (car arg))))
	  (while (string-match (regexp-quote carg) (substring add-in index))
	    (setq beg (+ index (match-beginning 0))
		  end (+ index (match-end 0)))
	    (if (aref used beg) nil
	      (progn
		(setq match (1+ match))
	        (cond
	         ((= match 1)
		  ;;(setq arg (append arg (list (list beg end))))
		  (KaTeX-generate-register-match))
	         ((KaTeX-generate-ask-match-position)
		  (KaTeX-generate-register-match)))))
	    (setq index end))
	  (setq i (1+ i))))
     args)
    ;;Phase 2. Generate function!!
    (setq i 0)
    (setq func-name (KaTeX-generate-function-name))
    (while (< i (length add-in))
      (setq beg i j (aref used i))
      (while (and (< i (length add-in)) (equal j (aref used i)))
	(setq i (1+ i)))
      (if j		;If it is argument.
	  (setq string (concat string (format nil " arg~D" j)))
	(setq string
	      (concat string " \""
		      (KaTeX-generate-quote-quote (substring add-in beg i))
		      "\""))
	))
    (erase-buffer)
    (setq i 1)
    (insert
     "(defun " func-name " ()\n"
     "  (let (")
    (mapcar
     '(lambda (arg)
	(insert (format nil "(arg~D (read-string \"~A: \"))\n"
			i (aref prompt (1- i))))
	(setq i (1+ i)))
     args)
    (delete-region (point) (progn (forward-line -1) (end-of-line) (point)))
    (insert ")\n(concat " (KaTeX-generate-lisp-quote string)
	    ")))\n")
    (indent-region (point-min) (point) nil)
    used)
)

(defun KaTeX-generate-ask-match-position ()
  "Ask user whether match-position is in his expectation,
Referencing variables in parent function KaTeX-generate-parse-add-in."
  (pop-to-buffer KaTeX-generate-message-buffer)
  (goto-char (point-max))
  (insert "\n\n"
	  (format nil (if KaTeX-japan "~D �Ԗڂ̈��� ~A ����"
		    "Is argument #~D's value `~A' also corresponding to")
		  i carg) "\n" add-in "\n")
  (indent-to-column beg)
  (let ((c beg))
    (while (< c end) (insert "^") (setq c (1+ c))))
  (insert "\n" (if KaTeX-japan "�����ɂ��Ή����Ă��?"
		 "this underlined part too?"))
  (other-window -1)
  (y-or-n-p (if KaTeX-japan "�������͂����Ă܂���" "Is underline right"))
)

(defun KaTeX-generate-register-match ()
  (nconc arg (list (list beg end)))
  (let ((x beg))
    (while (< x end) (aset used x i)(setq x (1+ x))))
)

(defun KaTeX-generate-display-message (mes &optional bottom)
  "Display message to generation buffer."
  (pop-to-buffer KaTeX-generate-message-buffer)
  (goto-char (point-max))
  (insert "\n\n")
  (if bottom (recenter (1- bottom)) (recenter 0))
  (insert mes)
  (other-window -1)
)

(defun KaTeX-generate-move-to-add-in-position ()
  "Move cursor where add-in function should insert string."
  (cond
   ((eq KaTeX-current-completion-type 'begin)
    (goto-char (point-min))
    (skip-chars-forward "^{")
    (setq env-name
	  (buffer-substring (1+ (point))
			    (progn (skip-chars-forward "^}") (point))))
    (forward-char 1))
   ((eq KaTeX-current-completion-type 'section)
    (goto-char (point-min))
    (skip-chars-forward "^{"))
   ((eq KaTeX-current-completion-type 'maketitle)
    (goto-char (point-max))
    (if (= (preceding-char) #\SPC)
;    (if (char= (preceding-char) #\SPC)
	(forward-char -1)))
   )
)

(defun KaTeX-generate-function-name ()
  (concat
   "KaTeX:"
   (cond
    ((eq KaTeX-current-completion-type 'begin) env-name)
    ((eq KaTeX-current-completion-type 'section) section-name)
    ((eq KaTeX-current-completion-type 'maketitle) single-command)))
)

(defun KaTeX-generate-lisp-quote (str)
  (let ((len (length str))(i 0) (quote ""))
    (while (< i len)
      (if (= (aref str i) #\\)
;      (if (char= (aref str i) #\\)
	  (setq quote (concat quote "\\")))
      (if (= (aref str i) 127)
	  (setq quote (concat quote "\""))
	(setq quote (concat quote (substring str i (1+ i)))))
      (setq i (1+ i)))
    quote)
)

(defun KaTeX-generate-quote-quote (str)
  (let ((len (length str))(i 0) (quote ""))
    (while (< i len)
      (if (= (aref str i) #\")
;      (if (char= (aref str i) #\")
	  (setq quote (concat quote (char-to-string 127))))
      (setq quote (concat quote (substring str i (1+ i))))
      (setq i (1+ i)))
    quote)
)

(defun KaTeX-suppress-sparse-keymap (map)
  (let ((i #\SPC))
    (while (< i #\DEL) ;m.m (< i 127)
;    (while (char< i #\DEL) ;m.m (< i 127)
      (define-key map i 'undefined) ;m.m (char-to-string i)
      (setq i (1+ i))))
;      (setq i (char1+ i))))
)

;;;
;; Auto-generate Function for Lispers.
;;;
(defun KaTeX-generate-read-completion-type (nth)
  (message
"Read type(~D): (S)tring (C)omplete (F)ile ([)option (P)osition co(O)rd. (q)uit" nth)
  (let ((c (read-char)))
    (cond
     ((= c #\s) 'string)
     ((= c #\c) 'completion)
     ((= c #\f) 'file)
     ((= c #\[) 'option)
     ((= c #\p) 'oneof)
     ((= c #\o) 'coord)
;     ((char= c #\s) 'string)
;     ((char= c #\c) 'completion)
;     ((char= c #\f) 'file)
;     ((char= c #\[) 'option)
;     ((char= c #\p) 'oneof)
;     ((char= c #\o) 'coord)
     ;;((char= c #\m) 'macro)
     (t        'quit)))
 )
(defun KaTeX-generate-read-completion-table ()
  (let ((i 1) cand (cands "(") (cb (current-buffer))
		(buf (get-buffer-create " *Candidates*")))
    (save-window-excursion
      (save-excursion
      (KaTeX-showup-buffer buf nil)
      (set-buffer buf)
      (erase-buffer)
      (while (string<
	      ""
	      (setq cand (read-string (format nil "Item[~D](RET to exit): " i))))
	(setq cands (concat cands (format nil "(\"~A\")\n" cand))
	      i (1+ i))
	(insert cand "\n"))
      (kill-buffer buf)))
    ;;(set-buffer cb)
    (setq KaTeX-generate-current-completion-table (concat cands ")")))
)
(defun KaTeX-generate-corresponding-paren (left)
  (cond
   ((equal left "{") "}")
   ((equal left "[") "]")
   ((equal left "(") ")")
   ((equal left "<") ">")
   ((equal left "\\begin{") "}")
   (t left))
)
(defun KaTeX-generate-create-read-string (&optional nth)
  (concat
   "(read-string \""
   (read-string (if nth (format nil "Prompt for argument#~D: " nth) "Prompt: "))
   ": \"\n"
   "\"" (read-string "Default: ") "\""
   ")\n")
)
(defun KaTeX-generate-create-completing-read (&optional nth)
  (prog1
      (concat
       "(completing-read \""
       (read-string
	(if nth (format nil "Prompt for argument#~D: " nth) "Prompt: "))
       ": \"\n"
       (format nil "'~A\n" (KaTeX-generate-read-completion-table))
       "nil "
       (format nil "~A)" (y-or-n-p "Require match? ")))
    (if nil ;;;(y-or-n-p "Do you need learning for this completion?")
	(setq KaTeX-generate-variables-for-learning
	      (cons
	       (cons (format nil "KaTeX-~A-~D" command (or nth 0))
		     KaTeX-generate-current-completion-table)
	       KaTeX-generate-variables-for-learning))))
)
(defun KaTeX-generate-create-read-file-name (&optional nth)
  (concat
   "(read-file-name \""
   (read-string (if nth (format nil "Prompt for argument#~D: " nth) "Prompt: "))
   ": \" "" \"\" t \"\")\n")
)
(defun KaTeX-generate-create-read-oneof (&optional nth readpos)
  (concat
   (if readpos
       "(KaTeX:read-position \""
     "(KaTeX:read-oneof \"")
   (read-string "Acceptable characters: " "lcr") "\")\n")
)
(defun KaTeX-generate-option-type (command)
  (let ((func (format nil "KaTeX:~A" command)) leftp
		(buf (get-buffer-create KaTeX-generate-buffer)) type (n 1))
    (set-buffer buf)
    (erase-buffer)
    (insert "(defun " func " ()\n  (concat\n")
    (catch 'done
      (while t
	(setq type (KaTeX-generate-read-completion-type n))
	(insert 
	 (cond
	  ;;Read string
	  ((eq type 'string)
	   (concat "\"" (setq leftp (read-string "Left parenthesis: " "("))
		   "\"\n"
		   (KaTeX-generate-create-read-string)
		   "\"" (KaTeX-generate-corresponding-paren leftp) "\"")
	   )
	  ;;Completing-read
	  ((eq type 'completion)
	   (concat "\"" (setq leftp (read-string "Left parenthesis: " "{"))
		   "\"\n"
		   (KaTeX-generate-create-completing-read)
		   "\"" (KaTeX-generate-corresponding-paren leftp) "\"")
	   )
	  ((eq type 'file)
	   (concat "\"" (setq leftp (read-string "Left parenthesis: " "("))
		   "\"\n"
		   (KaTeX-generate-create-read-file-name)
		   "\"" (KaTeX-generate-corresponding-paren leftp) "\"")
	   )
	  ((eq type 'oneof)
	   (KaTeX-generate-create-read-oneof nil t)
	   )
	  ((eq type 'option)
	   (concat "(let ((op (read-string \""
		   (read-string "Prompt: ")
		   ": \")))\n"
		   "(if (string< \"\" op)\n"
		   "    (concat \"[\" op \"]\")\n"
		   "  \"\"))\n")
	   )
	  ((eq type 'coord)
	   (concat "(KaTeX:read-coordinates \""
		   (read-string "Prompt for coordinates: ")
		   ": \")\n")
	   )
	  ((eq type 'macro)
	   (error "not yet supported")
	   )
	  (t (throw 'done t))))
	(setq n (1+ n))))
    (insert "))\n")			;close defun
    (goto-char (point-min))
    (while (not (eobp)) (lisp-indent-line) (forward-line 1))
    (eval-current-buffer)
    buf)
)
(defun KaTeX-generate-argument-type (command argc)
  "Create an argument-type add-in function."
  (interactive)
  (let ((func (format nil "KaTeX::~A" command)) (argp 1)
		(cb (current-buffer))
		(buf (get-buffer-create KaTeX-generate-buffer)))
    (set-buffer buf)
    (erase-buffer)
    (insert "(defun " func " (&optional argp)\n(cond\n")
    (while (<= argp argc)
      (insert (format nil "((equal argp ~D)\n" argp))
      (setq type (KaTeX-generate-read-completion-type argp))
      (insert
       (cond
	((eq type 'string)
	 (concat (KaTeX-generate-create-read-string argp)))
	((eq type 'completion)
	 (concat (KaTeX-generate-create-completing-read argp)))
	((eq type 'oneof)
	 (KaTeX-generate-create-read-oneof))
	((eq type 'file)
	 (concat (KaTeX-generate-create-read-file-name argp)))
	(t ""))
       ")\n")
      (setq argp (1+ argp)))
    (insert "))\n")
    (goto-char (point-min))
    (while (not (eobp)) (lisp-indent-line) (forward-line 1))
    (eval-current-buffer)
    (set-buffer cb)
    (KaTeX-update-table
     (if (> argc 1) (list command argc) (list command))
     'section-table 'user-section-table 'tmp-section-table)
    buf)
)
(defun KaTeX-generate-simple (&optional command)
  "Simple but requiring some elisp knowledge add-in generator."
  (interactive)
  (setq KaTeX-generate-variables-for-learning nil)
  (or command
      (setq command
	    (completing-read
	     (format nil "Making add-in function for (default ~A): " section-name)
	     (append
	      section-table user-section-table tmp-section-table
	      env-table     user-env-table     tmp-env-table
	      singlecmd-table user-singlecmd-table tmp-singlecmd-table)
	     nil nil)
	    command (if (string= "" command) section-name command)))
  (message
   (cond
    (KaTeX-japan "(o)�ǉ��^? (a)�����^? (katexadd.doc���Q�Ƃ̂���) :")
    (t "(O)ption? (A)rgument?")))
  (KaTeX-showup-buffer
   (if (= (read-char) #\o)
;   (if (char= (read-char) #\o)
       (KaTeX-generate-option-type command)
     (KaTeX-generate-argument-type
      command
      (string-to-int (read-string "How many arguments?: ")))) nil)
)
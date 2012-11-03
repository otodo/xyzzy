;;; -*- Mode: Lisp; Package: EDITOR -*-
;;;
;;; This file is not part of xyzzy.
;;;
; $Id: perldb.l,v 1.1.1.1 2005/11/25 09:49:27 torihat Exp $
;
; Perl Debug Mode
;
; by HATTORI Masashi
;
;Å° License
;
; perldb.l
;
; Copyright (C) 2000-2005 Masashi Hattori
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions
; are met:
; 
; 1. Redistributions of source code must retain the above copyright
;    notice, this list of conditions and the following disclaimer.
; 
; 2. Redistributions in binary form must reproduce the above copyright
;    notice, this list of conditions and the following disclaimer in
;    the documentation and/or other materials provided with the
;    distribution.
; 
; 3. The name of the author may not be used to endorse or promote
;    products derived from this software without specific prior
;    written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
; PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
; STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
; ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE!
; POSSIBILITY OF SUCH DAMAGE.

(provide "perldb")

(require "perl")

(in-package "editor")

(export '(*perldb-mode-hook*
	  *perldb-prompt-regexp*
	  *perldb-mode-map*
	  *perldb-ret*
	  *perldb-prog*
	  *perldb-opts*
	  *perldb-attribute-filename*
	  *perldb-attribute-prompt*
	  *perldb-attribute-breakpoint*
	  perldb
	  perldb-send-input
	  perldb-send-interrupt
	  perldb-send-command
	  perldb-quit
	  perldb-alternate-send-input))

(defvar-local *perldb-minor-mode* nil)
(defvar *perldb-mode-hook* nil)

(defvar *perldb-prog* "perl")
(defvar *perldb-opts* nil)

(defvar *perldb-ret* "\n")
(defvar *perldb-buffer-debug* "*Perl Debug*")
(defvar *perldb-window-debug* nil)

(defvar *perldb-buffer-list* nil)

(defvar *perldb-last-command* nil)
(defvar *perldb-old-winconf* nil)

(define-key *perl-mode-map* '(#\C-c #\d) 'perldb)

(defvar *perldb-attribute-filename* '(:underline t))
(defvar *perldb-attribute-prompt* '(:bold t))
(defvar *perldb-attribute-breakpoint* '(:underline t
					:bold t))

(defvar *perldb-filename-regexp*
  "^\\([ \t]+DB<[0-9]+> \\)?[0-9a-zA-Z_:]+(\\(.+\\):\\(\[0-9]+\\)):")
(setq *perldb-filename-regexp* "^\\(\x1a\x1a\\)\\(.+\\):\\([0-9]+\\):[0-9]+")
;(setq *perldb-filename-regexp* "^\\(\\)\\(.+\\):\\([0-9]+\\):[0-9]+")
(defvar *perldb-prompt-regexp* "DB<[0-9]+>")
(defvar *perldb-process-line* "")
(defvar *perldb-wait-for-prompt* nil)
(defvar *perldb-p-last* nil)
(defvar *perldb-last-search* nil)
(defvar *perldb-break-points* nil)
(defvar *perldb-break-point-tag* 'break)

(defvar *perldb-mode-map* nil)
(unless *perldb-mode-map*
  (setq *perldb-mode-map* (make-sparse-keymap))
  (define-key *perldb-mode-map* #\RET 'perldb-send-command)
  (define-key *perldb-mode-map* #\h 'perldb-command-h)
  (define-key *perldb-mode-map* #\p 'perldb-command-p)
  (define-key *perldb-mode-map* #\x 'perldb-command-x)
  (define-key *perldb-mode-map* #\V 'perldb-command-v-large)
  (define-key *perldb-mode-map* #\X 'perldb-command-x-large)
  (define-key *perldb-mode-map* #\T 'perldb-command-t-large)
  (define-key *perldb-mode-map* #\s 'perldb-command-step)
  (define-key *perldb-mode-map* #\n 'perldb-command-next)
  (define-key *perldb-mode-map* #\c 'perldb-command-cont)
  (define-key *perldb-mode-map* #\/ 'perldb-command-search-forward)
  (define-key *perldb-mode-map* #\? 'perldb-command-search-backward)
  (define-key *perldb-mode-map* #\L 'perldb-command-l-large)
  (define-key *perldb-mode-map* #\S 'perldb-command-s-large)
  (define-key *perldb-mode-map* #\t 'perldb-command-t)
  (define-key *perldb-mode-map* #\b 'perldb-command-b)
  (define-key *perldb-mode-map* #\d 'perldb-command-d)
  (define-key *perldb-mode-map* #\D 'perldb-command-d-large)
  (define-key *perldb-mode-map* #\a 'perldb-command-a)
  (define-key *perldb-mode-map* #\A 'perldb-command-a-large)
  (define-key *perldb-mode-map* #\O 'perldb-command-o-large)
  (define-key *perldb-mode-map* #\< 'perldb-command-before)
  (define-key *perldb-mode-map* #\> 'perldb-command-after)
  (define-key *perldb-mode-map* #\! 'perldb-command-redo)
  (define-key *perldb-mode-map* #\H 'perldb-command-show)
  (define-key *perldb-mode-map* #\q 'perldb-command-quit)
  ;(define-key *perldb-mode-map* #\R 'perldb-command-restart)
)

(defun perldb-mode ()
  (setq mode-name "perldb")
  (setq buffer-mode 'perldb-mode)
  (use-keymap *perldb-mode-map*)
  (setq need-not-save t)
  (setq auto-save nil)
  (setq kept-undo-information nil)
  (set-buffer-fold-width 80)
  (run-hooks '*perldb-mode-hook*))

(defun perldb-minor-mode (&optional (arg nil sv))
  (interactive "p")
  (toggle-mode '*perldb-minor-mode* arg sv)
  (update-mode-line t)
  (if *perldb-minor-mode*
      (progn
	(set-minor-mode-map *perldb-mode-map*)
	(setq buffer-read-only t)
	(pushnew (buffer-name (selected-buffer)) *perldb-buffer-list* :test #'equal))
    (progn
      (unset-minor-mode-map *perldb-mode-map*)
      (setq buffer-read-only nil)
      (when (interactive-p)
	(loop
	  (let ((buf (pop *perldb-buffer-list*)))
	    (or buf (return))
	    (when (find-buffer buf)
	      (set-buffer buf)
	      (clear-all-text-attributes)
	      (when *perldb-minor-mode*
		(perldb-minor-mode))))))))
  t)

(pushnew '(*perldb-minor-mode* . "perldb") *minor-mode-alist* :key #'car)

(defun perldb ()
  (interactive)
  (call-interactively 'perldb-minor-mode)
  (unless *perldb-minor-mode*
    (when *perldb-old-winconf*
      (set-window-configuration *perldb-old-winconf*))
    (return-from perldb))
  (perldb-init)
  (setq *perldb-old-winconf* (current-window-configuration))
  (let (curw dbgcmd)
    (setq dbgcmd
	  (read-string "perl Debug: "
		       :default (format nil
					"~A -d ~A -emacs"
					*perldb-prog*
					(or (get-buffer-file-name) ""))))
    (delete-other-windows)
    (split-window)
    (setq curw (selected-window))
    (pop-to-buffer (get-buffer-create *perldb-buffer-debug*))
    (let ((proc (buffer-process (selected-buffer))))
      (and proc (eq (process-status proc) ':run)
	   (setq *perldb-process* proc)
	   (return-from perldb t)))
    (goto-char (point-max))
    (perldb-mode)
    (setq *perldb-process*
	  (make-process dbgcmd
			:output (selected-buffer)
			:environ *perldb-opts*
			))
    (set-process-filter *perldb-process* 'perldb-filter)
    (setq *perldb-window-debug* (selected-window))
    (set-window curw)))

(defun perldb-send-command (&optional cmd)
  (interactive "sCommand: " :default (or *perldb-last-command* ""))
  (save-window-excursion
    (pop-to-buffer *perldb-buffer-debug*)
    (let ((process (buffer-process (selected-buffer))))
      (when (and process
		 (eq (process-status process) :run))
	(goto-char (point-max))
	(insert (format nil "~A~%" cmd))
	(set-marker (process-marker process))
	(process-send-string process (concatenate 'string cmd *perldb-ret*))
      ))))

(setf (symbol-function 'perldb-send-interrupt) #'kill-subprocess)

(defun perldb-init ()
  (setq *perldb-display-list* nil)
  (setq *perldb-break-points* nil))

(defun perldb-quit ()
  (interactive)
  (perldb-command-quit t)
  (perldb))

(defun perldb-filter (process line)
  (let (file num curp)
    ;(setq line (substitute-string line "" ""))
    (setq line (concat *perldb-process-line* line))
    (when *perldb-wait-for-prompt*
      (if (string-match *perldb-prompt-regexp* line)
	  (setq *perldb-process-line* "")
	(progn
	  (setq *perldb-process-line* line)
	  (refresh-screen)
	  (return-from perldb-filter))))
    (set-window *perldb-window-debug*)
    (goto-char (point-max))
    (setq curp (point))
    ;(message-box line)
    (insert line)
    (when (string-match *perldb-prompt-regexp* line)
      (apply #'set-text-attribute
	     (+ curp (match-beginning 0))
	     (+ curp (match-end 0))
	     'prompt
	     *perldb-attribute-prompt*))
    (when (string-match *perldb-filename-regexp* line)
      (apply #'set-text-attribute
	     (+ curp (match-beginning 2))
	     (+ curp (match-end 2))
	     'file
	     *perldb-attribute-filename*)
      (delete-region (+ curp (match-beginning 1))
		     (+ curp (match-end 1)))
      )
    (when (pos-not-visible-in-window-p (point))
      (recenter (- (window-lines) 2)))
    (other-window)
    (when (string-match *perldb-filename-regexp* line)
      (setq file (substring line (match-beginning 2) (match-end 2)))
      (setq num (parse-integer
		 (substring line (match-beginning 3) (match-end 3))))
      (let ((buf (perldb-find-buffer file)))
	(if buf
	    (set-buffer buf)
	  (progn
	    (while (not (file-exist-p file))
	      (message-box (format nil "~AÇ™å©Ç¬Ç©ÇËÇ‹ÇπÇÒ" file))
	      (setq file (read-file "File: " :default file)))
	    (when (file-exist-p file)
	      (find-file file t)))))
      (unless *perldb-minor-mode*
	(perldb-minor-mode))
      (when (path-equal file (buffer-name (selected-buffer)))
	(goto-line num)
	(recenter)))
    (refresh-screen)))

(defun perldb-find-buffer (buf)
  (dolist (b (buffer-list))
    (when (equalp buf (buffer-name b))
      (return-from perldb-find-buffer b)))
  nil)

(defun perldb-send-input ()
  (interactive)
  (let (command)
    (goto-bol)
    (when (looking-at "([^)]+)[ \t]+")
      (goto-char (match-end 0))
      (unless (eolp)
	(let ((curp (point)))
	  (setq command (buffer-substring curp
					  (progn (goto-eol) (point))))
	  (delete-region curp (point))
	  (perldb-send-command command)
	)))))

(defun perldb-command-h (&optional command)
  "h [h|command]"
  (interactive "p")
  (when command
    (setq command (read-string "Help Command: ")))
  (perldb-send-command (format nil "h~@[ ~A~]" command)))

(defun perldb-command-p (&optional exp)
  "p exp"
  (interactive "sPrint exp: " :default0 (or *perldb-p-last* ""))
  (setq *perldb-p-last* exp)
  (perldb-send-command (format nil "p ~A" exp)))

(defun perldb-command-x (&optional exp)
  "x exp"
  (interactive "sPrint exp: " :default0 (or *perldb-p-last* ""))
  (setq *perldb-p-last* exp)
  (perldb-send-command (format nil "x ~A" exp)))

(defun perldb-command-v-large (&optional exp)
  "V [pkg [exp]]"
  (interactive "sPrint [pkg [vars]]: " :default0 (or *perldb-p-last* ""))
  (setq *perldb-p-last* exp)
  (perldb-send-command (format nil "V ~A" exp)))

(defun perldb-command--large (&optional exp)
  "X [vars]"
  (interactive "sPrint [vars]: " :default0 (or *perldb-p-last* ""))
  (setq *perldb-p-last* exp)
  (perldb-send-command (format nil "X ~A" exp)))

(defun perldb-command-t-large ()
  "T"
  (interactive)
  (perldb-send-command "T"))

(defun perldb-command-step ()
  "s"
  (interactive)
  (perldb-send-command "s"))

(defun perldb-command-next ()
  "n"
  (interactive)
  (perldb-send-command "n"))

(defun perldb-command-cont (&optional line)
  "c [line]"
  (interactive "p")
  (when line
    (setq line (read-integer "Break Point Line: ")))
  (perldb-send-command (format nil "c~@[ ~D~]" line)))

(defun perldb-command-search-forward (&optional search)
  "/pattern/"
  (interactive "sSearch: " :default0 (or *perldb-last-search* ""))
  (perldb-send-command (format nil "/~A/" search)))

(defun perldb-command-search-backward (&optional search)
  "?pattern?"
  (interactive "sSearch: " :default0 (or *perldb-last-search* ""))
  (perldb-send-command (format nil "?~A?" search)))

(defun perldb-command-l-large ()
  "L"
  (interactive)
  (perldb-send-command "L"))

(defun perldb-command-s-large (&optional search)
  "S [[!]pattern]"
  (interactive "sSearch [[!]pattern]: " :default0 (or *perldb-last-search* ""))
  (perldb-send-command (format nil "S ~A" search)))

(defun perldb-command-t (&optional expr)
  "t [exp]"
  (interactive "p")
  (when expr
    (setq expr (read-string "Trace expr: " :default *perldb-last-command*)))
  (perldb-send-command (format nil "t~@[ ~A~]" expr)))

(defun perldb-command-quit ()
  "q"
  (interactive)
  (perldb-send-command "q")
  (call-interactively 'perldb))

(defun perldb-break-point-add (line)
  (let ((num (1+ (list-length *perldb-break-points*))))
    (push (cons line num) *perldb-break-points*)
    (perldb-reverse-break-point line)))

(defun perldb-break-point (line)
  (cdr (assoc line *perldb-break-points*)))

(defun perldb-reverse-break-point (line)
  (save-excursion
    (goto-line line)
    (apply #'set-text-attribute
	   (progn (goto-eol) (point))
	   (progn (goto-bol) (point))
	   (cons *perldb-break-point-tag* line)
	   *perldb-attribute-breakpoint*)))

(defun perldb-clear-break-point (line)
  (save-excursion
    (delete-text-attributes (cons *perldb-break-point-tag* line) :test #'equal)))

(defun perldb-clear-break-point-all ()
  (save-excursion
    (delete-text-attributes *perldb-break-point-tag* :key #'car)))

(defun perldb-command-b ()
  "b [line]"
  (interactive)
  (let ((line (current-line-number)))
    (perldb-break-point-add line)
    (perldb-send-command (format nil "b ~D" line))))

(defun perldb-command-d (&optional num)
  "d line"
  (interactive)
  (let ((line (current-line-number)))
    (perldb-clear-break-point line)
    (perldb-send-command (format nil "d ~D" line))))

(defun perldb-command-d-large ()
  "D"
  (interactive)
  (perldb-clear-break-point-all)
  (perldb-send-command "D"))

(defun perldb-command-a (&optional line)
  "a [line] action"
  (interactive "p")
  (if line
      (setq line (read-integer "Action line: "))
    (setq line (current-line-number)))
  (let ((action (read-string "Action command: " :default (or *perldb-last-command* ""))))
    (perldb-send-command (format nil "a ~D ~A" line action))))

(defun perldb-command-a-large ()
  "A"
  (interactive)
  (perldb-send-command "A"))

(defun perldb-command-o-large (&optional opt)
  "O [opt[=var]]"
  (interactive "sOption [opt[=val]]: ")
  (perldb-send-command (format nil "O ~A" opt)))

(defun perldb-command-before (&optional command)
  "< command"
  (interactive "sCommand: " :default0 (or *perldb-last-command* ""))
  (perldb-send-command (format nil "< ~A" command)))

(defun perldb-command-after (&optional command)
  "> command"
  (interactive "sCommand: " :default0 (or *perldb-last-command* ""))
  (perldb-send-command (format nil "> ~A" command)))

(defun perldb-command-redo (&optional num)
  "! [[-]number]"
  (interactive "p")
  (when num
    (setq num (read-string "Command number [[-]number]: ")))
  (perldb-send-command (format nil "!~@[ ~A~]" num)))

(defun perldb-command-show (&optional num)
  "H [-number]"
  (interactive "p")
  (when num
    (setq num (read-string "Show Commands [-number]: ")))
  (perldb-send-command (format nil "H~@[ ~A~]" num)))

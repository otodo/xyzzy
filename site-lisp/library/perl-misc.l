;;; -*- Mode: Lisp; Package: EDITOR -*-
;;;
;;; This file is not part of xyzzy.
;;;
; $Id: perl-misc.l,v 1.1.1.1 2005/11/25 09:49:27 torihat Exp $
;
; Perl�p�}�N���Ƃ�
;
; by HATTORI Masashi
;
;�� License
;
; perl-misc.l
;
; Copyright (C) 1999-2005 Masashi Hattori
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

(require "perl")
(require "listfn")

(in-package "editor")

(defvar *perl-cmd* "perl")
(defvar *perldoc-cmd* "perldoc")

;;
;; perl-mode�ɕt��
;;
; C-c w		�X�N���v�g�̃G���[�`�F�b�N
; C-c x		�X�N���v�g�̎��s
; F1		�J�[�\���ʒu�̊֐���perldoc�ň���
; -		�ϐ��ȂǂɐF�t��
; -		list-function

(defun perl-syntax-check ()
  "�ҏW���̃X�N���v�g�̃G���[�`�F�b�N"
  (interactive)
  (let (command
	(bufname "*Syntax Check*")
	(file (get-buffer-file-name)))
    (when file
      (when (setq command (read-string "Check: "
				       :default (concat *perl-cmd* " -wc " file)))
	(perl-error-popup-buffer bufname)
	(execute-shell-command command nil bufname)))))

(define-key *perl-mode-map* '(#\C-c #\w) 'perl-syntax-check)

;;
;; Perl Error Minor Mode
;;
; F10		�G���[�s�փW�����v

(defvar-local perl-error-mode nil)

(defvar *perl-error-popup-ratio* 1/3)

(defun perl-error-popup-ratio ()
  (truncate (* (screen-height) *perl-error-popup-ratio*)))

(defun perl-error-popup-buffer (bufname)
  (pop-to-buffer (get-buffer-create bufname) (perl-error-popup-ratio))
  (perl-error-mode))

(defvar *perl-error-mode-map*
  (let ((keymap (make-sparse-keymap)))
    (define-key keymap #\F10 'perl-error-jump)
    keymap))

(defun perl-error-mode (&optional (arg nil sv))
  (interactive "p")
  (toggle-mode 'perl-error-mode arg sv)
  (if perl-error-mode
      (set-minor-mode-map *perl-error-mode-map*)
    (unset-minor-mode-map *perl-error-mode-map*))
  (setq *perl-error-last-range-begin* nil)
  (update-mode-line t))

(defun perl-error-jump ()
  "�G���[�̍s�ɃW�����v����"
  (interactive)
  (let (num)
    (save-excursion
      (save-restriction
	(goto-bol)
	(narrow-to-region (point) (progn (goto-eol) (point)))
	(goto-bol)
	(when (scan-buffer "line[ \t]+\\([0-9]+\\)" :regexp t :case-fold t))
	(setq num (parse-integer (match-string 1)))))
    (when num
      (other-window 1)
      (goto-line num)
      (recenter))))

; �X�N���v�g�𑖂点��
(defun perl-run-script ()
  (interactive)
  (let (command
	(bufname "*Run Script*")
	(file (get-buffer-file-name)))
    (when file
      (when (setq command (read-string "Run: "
				       :default (concat *perl-cmd* " " file)))
	(perl-error-popup-buffer bufname)
	(execute-shell-command command nil bufname)))))

(define-key *perl-mode-map* '(#\C-c #\x) 'perl-run-script)

;;
;; �팩����ɒ������}�j���A�������}�N���Ƃ�
;;
(defvar *perl-install-directory* "C:/perl")

(defun invoke-perl-help ()
  (interactive)
  (shell-execute (merge-pathnames "html/index.html" *perl-install-directory*)))

(defun perl-info-F1 ()
  (interactive)
  (let (beg end cmd word)
    (save-excursion
      (setq end (progn
		  (or (skip-syntax-spec-forward "w_j")
		      (skip-syntax-spec-backward "^w_j"))
		  (point)))
      (setq beg (progn
		  (skip-syntax-spec-backward "w_j")
		  (when (looking-at "^��")
		    (forward-char 1))
		  (point)))
      (setq word (buffer-substring beg end)))
    (setq cmd
	  (read-string "Perldoc: "
		       :default (format nil "~A ~:[-f ~;~]~A"
					*perldoc-cmd*
					(string-match "^[A-Z]" word) ; �啶���Ŏn�܂��Module�ƌ��Ȃ�
					word)))
    (pipe-command cmd)))

;(defun perl-info-modoki (kwd)
;  (execute-subprocess (concat "perldoc -f " kwd)))

;; perl���[�h�����[�h�����O��define-key������@
;; �Y�ꂽ^^;
(define-key *perl-mode-map*  #\S-F1   'invoke-perl-help)
(define-key *perl-mode-map*  #\F1   'perl-info-F1)

;;
;; �ϐ��ɐF��t����
;;
(setq *perl-variables-format*
      (compile-regexp-keyword-list
       '(
	 ("\\(->\\|::\\|&\\)\\([a-zA-Z0-9_]+\\)"
	  t (:keyword 1) nil 2 2)
	 ("\$[a-zA-Z0-9_]+"
	  t (:keyword 1))
	 ("@[a-zA-Z0-9_]+"
	  t (:keyword 2))
	 ("%[a-zA-Z0-9_]+"
	  t (:keyword 0)))))

(defun perl-mode-keyword-regexp ()
  (make-local-variable 'regexp-keyword-list)
  (setq regexp-keyword-list *perl-variables-format*))

(add-hook '*perl-mode-hook* 'perl-mode-keyword-regexp)

; 
; "M-x list-function" �Ŋ֐��ꗗ��\�����ăW�����v�B
; 
(defun perl-add-list-function ()
  (make-local-variable 'build-summary-function)
  (setq build-summary-function 'perl-build-summary-of-functions))

(defun perl-build-summary-of-functions ()
  (let ((result nil))
    (save-excursion
      (goto-char (point-min))
      (while (scan-buffer "^[ \t]*sub[ \t]+\\([^ \t\n{(]+\\)"
			  :regexp t :tail t)
	(push (list (current-line-number) (match-string 1)) result)))
    (nreverse result)))

(add-hook '*perl-mode-hook* 'perl-add-list-function)
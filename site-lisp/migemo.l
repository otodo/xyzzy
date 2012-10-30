;;; -*- Mode: Lisp; Package: EDITOR -*-
;;;
;;; This file is not part of xyzzy.
;;;
; $Id: migemo.l,v 1.3 2005/11/27 15:06:44 torihat Exp $
;
; migemo.l
;
; by Masashi Hattori
;
; �� migemo.l �Ƃ́H
; 
; 	���������"Migemo DLL"���g���ă��[�}���̂܂܃C���N�������^���T�[
; 	�`�ł���悤�ɂ�����̂ł��B
; 
; 	Migemo�ɂ��Ă̏ڍׂ́A�ȉ��̃T�C�g�������������B
; 	
; 	Migemo �{��
; 	http://migemo.namazu.org/
; 	
; 	Migemo DLL�i��������j
; 	http://www.kaoriya.net/
; 
; �� �����
; 
; 	xyzzy-0.2.2.225�ȍ~
; 
; 	Migemo DLL 1.1�ȍ~
; 	�i��L��������̃T�C�g����_�E�����[�h���ĉ������j
; 
; �� �C���X�g�[��
; 
; 	1. migemo.l �� site-lisp �Ȃǂɒu���ăo�C�g�R���p�C�����ĉ������B
; 	2. migemo.dll��xyzzy.exe�Ɠ����ꏊ�i�������̓p�X�̒ʂ����Ƃ���j
; 	   �ɒu���ĉ������B
; 	3. dict�ȉ��̎����t�@�C���́Axyzzy/dict�ɒu���ĉ������B�i�Ⴄ�ꏊ
; 	   �ɒu�����ꍇ�́A*migemo-dict-file* �� "migemo-dict"�ւ̃p�X��
; 	   �ݒ肵�Ă��������j
; 	4. .xyzzy�Ƃ��Ɉȉ��̂悤�ɏ�����xyzzy���ċN�����Ă��������B
; 
; 		(require "migemo")
; 
; ����������
; 
; 	"M-x migemo-toggle" �܂��́A"C-c m t" ���āA�X�e�[�^�X�o�[��
; 	"Migemo on."�ƕ\��������migemo�ł̌������[�h�ɓ����Ă��܂��B
; 
; 	�ݒ肪���܂������Ă���΁A"C-s"�A"C-r"�ŁA���[�}���̂܂܃C���N��
; 	�����^���T�[�`���ł���͂��ł��B
; 	�i����̌������ɂ�DLL���Ă�Ŏ�����ǂݍ��ނ̂ŏ������Ԃ�������
; 	�܂��B�܂��Axyzzy�̏I�����ɂ������]���Ɏ��Ԃ�������܂��j
; 	
; 	�ŏ�����migemo���[�h�ɂ���ɂ́A.xyzzy�Ƃ��ŏ�L�̐ݒ�̌�ɁA
; 
; 		(migemo-toggle t)
; 
; 	�Ə����Ă��������B
; 
; 	[���̑��̃L�[�o�C���h]
; 	C-c m t		������migemo���g�����ǂ������g�O��
; 	C-c m o		migemo.dll�����[�h���Ď�����ǂݍ���
; 				�i�ʏ�͕K�v����܂���j
; 	C-c m c		migemo.dll���A�����[�h����B
; 				�i�ʏ�͕K�v����܂���j
; 
; �� ���_
; 
; 	�EDLL�̌Ăяo�������������Ȃ̂Ŋ댯��������܂���B
; 	�Eisearch.l�̊֐����㏑�����܂��B
; 	�E���� migemo ���g�������Ƃ��Ȃ��̂ŁA�z���œK���ɍ���Ă��܂��B
; 	�E���̑��A�܂����܂�g���ĂȂ��̂ł悭�킩��܂��񂪁A���Ԃ񂢂�
; 	  ���날��ł��傤�B
; 
; �� �ӎ�
; 
; 	Migemo DLL���쐬����A�g�p���������ĉ���������������Ɋ��ӂ������܂��B
; 
; �� �ύX����
; 
; 	[2005/11/27]
; 		xyzzy Wiki�̎��┠10(NANRI����A�ȂȂ��Q����)����荞�݁B(__)
; 	[2005/11/25]
; 		���C�Z���X��K�p�Ƃ�
; 	[2003/06/18]
; 		�o�O���
; 	[2002/05/17]
; 		C/Migemo-1.1�Ή�
; 	[2002/03/14]
; 		xyzzy-0.2.2.225�ɂւȂ��傱�Ή��B(__)
; 	[2002/02/19]
; 		off�̎��Ɍ����𐳋K�\���ł��Ȃ��悤�ɂ���
; 	[2002/02/11]
; 	 	����
; 
;�� License
;
; migemo.l
;
; Copyright (C) 2002-2005 Masashi Hattori
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

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "foreign"))

(require "isearch")

(provide "migemo")

(in-package "editor")

(export '(*migemo-dict-file*
	  *migemo-init-hook*
	  migemo-toggle))

(defvar *migemo-dll* "migemo.dll")
(defvar *migemo-dict-file*
  (merge-pathnames "dict/migemo-dict" (si:system-root)))

(defvar *migemo-init-hook* nil)

(defvar *migemo-on* nil)
(defvar *migemo-session* nil)
(defvar *migemo-query-buf* (* 1024 8 8 8)) ; ���߂����K��

; for migemo_load
(defconstant *migemo-dictid-invalid* 0)
(defconstant *migemo-dictid-migemo* 1)
(defconstant *migemo-dictid-roma2hira* 2)
(defconstant *migemo-dictid-hira2kata* 3)
(defconstant *migemo-dictid-han2zen* 4)

; for migemo-set|get-operator
(defconstant *migemo-opindex-or* 0)
(defconstant *migemo-opindex-nest-in* 1)
(defconstant *migemo-opindex-nest-out* 2)
(defconstant *migemo-opindex-select-in* 3)
(defconstant *migemo-opindex-select-out* 4)
(defconstant *migemo-opindex-newline* 5)

(defconstant *migemo-set-operator-failed* 0)
(defconstant *migemo-is-not-enabled* 0)

(defvar *migemo-opindex*
  (list (cons *migemo-opindex-or* "\\|")
	(cons *migemo-opindex-nest-in* "\\(")
	(cons *migemo-opindex-nest-out* "\\)")
	(cons *migemo-opindex-newline* "[ \t\n]*")))

(c:define-dll-entry
  (c:void *) migemo-open-func ((c:char *)) *migemo-dll* "migemo_open")
(c:define-dll-entry
  c:void migemo-close-func ((c:void *)) *migemo-dll* "migemo_close")
(c:define-dll-entry
  (c:u_char *) migemo-query-func ((c:void *)
				  (c:u_char *)) *migemo-dll* "migemo_query")
(c:define-dll-entry
  c:void migemo-release-func ((c:void *)
			      (c:u_char *)) *migemo-dll* "migemo_release")
(c:define-dll-entry
  c:int migemo-set-operator-func ((c:void *)
				  c:int
				  (c:u_char *)) *migemo-dll* "migemo_set_operator")
(c:define-dll-entry
  (c:u_char *) migemo-get-operator-func ((c:void *)
					 c:int) *migemo-dll* "migemo_get_operator")
(c:define-dll-entry
  c:int migemo-is-enable-func ((c:void *)) *migemo-dll* "migemo_is_enable")

(defvar *migemo-saved-hook* nil)
(defvar *migemo-saved-regexp* nil)

(defun migemo-toggle (&optional (arg nil sv))
  (interactive "p")
  (toggle-mode '*migemo-on* arg sv)
  (if *migemo-on*
      (progn
	(setq *migemo-saved-hook* *isearch-scanner-hook*)
	(setq *migemo-saved-regexp* *isearch-regexp*)
	(setq *isearch-scanner-hook* #'migemo-query))
    (progn
      (setq *isearch-scanner-hook* *migemo-saved-hook*)
      (setq *isearch-regexp* *migemo-saved-regexp*)))
  (migemo-message (if *migemo-on* "on." "off.")))

(defun migemo-open ()
  (interactive)
  (unless *migemo-session*
    (migemo-message "loading ...")
    (unless *migemo-dict-file*
      (migemo-error "�����t�@�C�����ݒ肳��Ă��܂���B"))
    (unless (file-exist-p *migemo-dict-file*)
      (migemo-error (format nil "�����t�@�C��������܂���: ~S" *migemo-dict-file*)))
    (setq *migemo-session*
	  (migemo-open-func (si:make-string-chunk
			     (map-slash-to-backslash *migemo-dict-file*))))
    (unless (migemo-is-enable-p *migemo-session*)
      (migemo-error "�������ǂݍ��߂܂���"))
    (migemo-init)
    (migemo-message "loading ... done.")
    (add-hook '*kill-xyzzy-hook* 'migemo-close)))

(defun migemo-message (msg)
  (message "Migemo: ~A" msg))

(defun migemo-error (msg)
  (migemo-close)
  (error "Migemo: ~A" msg))

(defun migemo-is-enable-p (sess)
  (not (equal *migemo-is-not-enabled*
	      (migemo-is-enable-func sess))))

(defun migemo-init ()
  (dolist (op *migemo-opindex*)
    (let ((index (car op))
	  (regex (cdr op))
	  result)
      (setq result
	    (migemo-set-operator-func *migemo-session*
				      index
				      (si:make-string-chunk regex)))
      (when (eq *migemo-set-operator-failed* result)
	(migemo-error (format nil "���^�����w��G���[: ~S:~S" index result)))))
  (run-hooks '*migemo-init-hook*))

(defun migemo-query (query)
  (let (result
	regexp)
    (when (= (length query) 0)
      (return-from migemo-query ""))
    (setq *isearch-regexp* *migemo-on*)
    (migemo-open)
    (unwind-protect
	(progn
	  (migemo-message "converting ...")
	  (setq result (migemo-query-func *migemo-session*
					  (si:make-string-chunk query)))
	  (setq regexp (si:unpack-string
			(si:make-chunk nil *migemo-query-buf* nil result)
			0))
	  (migemo-message "converting ... done."))
      (when result
	(migemo-release-func *migemo-session* result)))
    (setq regexp (substitute-string regexp "\\]\\*\\+" "\\]\\*\\\\\\+"))
    (setq regexp (substitute-string regexp "\\]\\*\\?" "\\]\\*\\\\\\?"))
    ))

(defun migemo-close ()
  (interactive)
  (when *migemo-session*
    (migemo-message "closing ...")
    (migemo-close-func *migemo-session*)
    (migemo-message "closing ... done.")
    (setq *migemo-session* nil)))

(global-set-key '(#\C-c #\m #\t) 'migemo-toggle)
(global-set-key '(#\C-c #\m #\o) 'migemo-open)
(global-set-key '(#\C-c #\m #\c) 'migemo-close)
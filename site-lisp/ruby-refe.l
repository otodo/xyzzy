;;; -*- Mode: Lisp; Package: EDITOR; Last updated: "2010/04/01 23:39:52" -*-
;;;
;;; This file is not part of xyzzy.
;;;
;;;   ruby-refe.l --- �ւȂ��傱 ReFe �Q�Ɨp���[�h
;;;
;;;     by HIE Masahiro <madoinux@gmail.com>
#|

���T�v

  HATTORI Masashi ����� ruby-mode ����CReFe2 ���Q�Ƃ��܂��B

    ruby-mode:
      http://www7a.biglobe.ne.jp/~hat/xyzzy/ruby-mode.html

    Ruby���t�@�����X�}�j���A�����V�v��:
      http://redmine.ruby-lang.org/wiki/rurema/ReleasedProducts


���C���X�g�[��

  1. ruby-refe.l �� site-lisp �ɃR�s�[����B

  2. �K�v�ɉ����C�o�C�g�R���p�C������B(�C��)

       M-x byte-compile-file

  3. Ruby���t�@�����X�}�j���A���p�b�P�[�W�ł���肵�C�W�J����B
     c:/rubyrefm �ɓW�J����ꍇ�́C����Ȋ����B

       c:/rubyrefm/
        �� bitclust/
        �� �� bin/
        �� �� �� refe.rb
        �� �� lib/
        �� db-1_8_7/
        �� db-1_9_1/

     ��Ruby���t�@�����X�}�j���A���� c:/rubyrefm/ �ȊO�ɃC���X�g�[��
       ����ꍇ�́C�ݒ��ɏ]���C*ruby-refe-install-path* ��ݒ肷��
       �K�v������܂��B

  4. .xyzzy �� siteinit.l �Ɉȉ��̋L�q��ǉ�����B

       (require "ruby-refe")


���g����

  M-x ruby-refe ���āC��������V���{���ƃI�v�V�������w�肵�܂��B
  �I�v�V������ --help ���w�肷��ƁC�I�v�V�����ꗗ���\������܂��B

  ���s��́C<http://i.loveruby.net/ja/prog/refe.html> ��������Q��
  ���Ă��������B(ReFe2 �ɂȂ��ăI�v�V�������ς���Ă��܂�)

  [ruby-refe-mode]

    RET   : �J�[�\���ʒu�̃V���{��������
    F1    : �J�[�\���ʒu�̃V���{�������� (�ꗗ�\��)
    r     : refe ���s
    l     : refe -l ���s
    o     : ���̃E�B���h�E�Ɉړ�
    q     : �I��


���ݒ��

  F1 �L�[�ŁC�J�[�\���ʒu�̒P��� ReFe ��������B

    (define-key *ruby-mode-map* #\F1 'ruby-refe-line-point)

  ReFe �R�}���h�̃G�C���A�X�BM-x refe �Ŏ��s����悤�ɁB

    (setf (symbol-function 'refe) #'ruby-refe)

  ReFe �̃C���X�g�[���p�X��ύX�B(����l�� "c:/rubyrefm")

    (setq *ruby-refe-install-path* "d:/opt/rubyrefm")

  Ruby ReFe �̃f�[�^�x�[�X�����w��B(����l�� "db-1_8_7")

    (setq *ruby-refe-dbname* "db-1_9_1")


���X�V����

  [Version 2.00] 2010-04-01 (��)
  �EReFe2 �ɑΉ�����(�͂�)�B
  �EReFe1 ��Ή��ɂ����B
  �E�I�v�V�������w��ł���悤�ɂ����B
  �E���̑����낢��B

  [Version 1.00] 2008-01-06 (��)
  �E���ō쐬�B


�����C�Z���X

  ruby-refe.l ��MIT���C�Z���X�Ɋ�Â��ė��p�\�ł��B
  <http://www.opensource.org/licenses/mit-license.php>

Copyright (c) 2007-2010 HIE Masahiro

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

|#

(provide "ruby-refe")

(require "ruby")

(in-package "editor")

(export '(ruby-refe
	  ruby-refe-line
	  ruby-refe-point
	  ruby-refe-line-point
	  *ruby-refe-install-path*
	  *ruby-refe-dbname*
	  *ruby-refe-buffer1*
	  *ruby-refe-buffer2*
	  ))

;;; ������������������������������������������������������������������������ ;;;
;;;  �� �ϐ��ݒ� - �K���ɃJ�X�^�}�C�Y���邠����
;;; ������������������������������������������������������������������������ ;;;

(defvar *ruby-refe-install-path* "c:/rubyrefm"
  "ruby-refe: Ruby ReFe �C���X�g�[���t�H���_")

(defvar *ruby-refe-dbname* "db-1_8_7"
  "ruby-refe: Ruby ReFe �f�[�^�x�[�X��")

(defvar *ruby-refe-option-default* "-l"
  "ruby-refe: ruby-refe ���s���Ɏw�肷��I�v�V�����̊���l")

(defvar *ruby-refe-option-force* "-e sjis"
  "ruby-refe: �����I�Ɏw�肷��I�v�V����")

(defvar *ruby-refe-color-title* '(:keyword 0)
  "ruby-refe: �^�C�g��(?)�̐F")

(defvar *ruby-refe-color-head* '(:keyword 2)
  "ruby-refe: �^�C�g��(?)�ȊO�̃w�b�_(??)�̐F")


;;; ������������������������������������������������������������������������ ;;;
;;;  �� �ϐ��ݒ� - ���܂肳���Ȃ��ėǂ�����
;;; ������������������������������������������������������������������������ ;;;

(defvar *ruby-refe-command* "refe.rb"
  "ruby-refe: refe �R�}���h")

(defvar *ruby-refe-bitclust-lib-path* nil
  "ruby-refe: bitclust/lib �t�H���_")

(defvar *ruby-refe-bitclust-bin-path* nil
  "ruby-refe: bitclust/bin �t�H���_")

(defvar *ruby-refe-db-path* nil
  "ruby-refe: Ruby ReFe �f�[�^�x�[�X�t�H���_")

(defvar *ruby-refe-buffer1* " *ReFe1*"
  "ruby-refe: ReFe �o�b�t�@1")

(defvar *ruby-refe-buffer2* " *ReFe2*"
  "ruby-refe: ReFe �o�b�t�@2")

(defvar *ruby-refe-winconf* nil
  "ruby-refe: ���s�O�̃E�B���h�E�̏��")

(defvar *ruby-refe-mode-hook* nil
  "ruby-refe: refe ���s������")

(defvar *ruby-refe-mode-map* nil
  "ruby-refe: ReFe�o�b�t�@�p�L�[�}�b�v")

(defvar *ruby-refe-mode-syntax-table* nil
  "ruby-refe: ReFe�o�b�t�@�p�V���^�b�N�X�e�[�u��")

(defvar *ruby-refe-regexp-keyword-list*
  (compile-regexp-keyword-list
   `(
     ("^[A-Za-z0-9_#:.*=!?-]+$" t ((0 . ,*ruby-refe-color-title*)))
     ("^--- .*$"                t ((0 . ,*ruby-refe-color-head*)))
     ("^: .*$"                  t ((0 . ,*ruby-refe-color-head*)))
     ("^require.*$"             t ((0 . ,*ruby-refe-color-head*)))
     ))
  "ruby-refe: ���K�\���ɂ��F�t��")


;;; ������������������������������������������������������������������������ ;;;
;;;  �� �Θb�I�Ȋ֐�
;;; ������������������������������������������������������������������������ ;;;

(defun ruby-refe-point (&optional option)
  "ruby-refe: �J�[�\���ʒu�̃V���{��������"
  (interactive)
  (let ((pattern (ruby-refe-keyword)))
    (when (string= pattern "")
      (setq pattern nil))
    (ruby-refe pattern option)))

(defun ruby-refe-line-point ()
  "ruby-refe: �J�[�\���ʒu�̃V���{���� -l �I�v�V�����t���ň���"
  (interactive)
  (ruby-refe-point "-l"))

(defun ruby-refe (&optional pattern option)
  "ruby-refe: refe ���s"
  (interactive "sReFe: \nsOption: "
    :default0 (ruby-refe-keyword)
    :default1 *ruby-refe-option-default*)
  (let (buffer arg)
    (setq buffer (if (string= (buffer-name (selected-buffer)) *ruby-refe-buffer1*)
		     *ruby-refe-buffer2*
		   *ruby-refe-buffer1*))
    (when (string-match "\\(.+\\)\\.#\\(.+\\)" pattern)
      (setq pattern (string-replace-match pattern "\\1#\\2")))
    (let ((cbuf (selected-buffer))
	  (rbuf (find-buffer buffer)))
      (when rbuf
	(set-buffer rbuf)
	(setq buffer-read-only nil)
	(set-buffer cbuf)))
    (unless *ruby-refe-winconf*
      (setq *ruby-refe-winconf* (current-window-configuration)))
    (ruby-refe-set-pathname)
    (setq arg (concat *ruby-refe-option-force* " " (or option "") " " pattern))
    (execute-shell-command (format nil "@~A -I ~A ~A/~A -d file://~A ~A"
				   *ruby-prog*
				   *ruby-refe-bitclust-lib-path*
				   *ruby-refe-bitclust-bin-path*
				   *ruby-refe-command*
				   *ruby-refe-db-path*
				   arg)
			   :OUTPUT buffer
			   :DIRECTORY *ruby-refe-bitclust-bin-path*)
    (ruby-refe-mode arg)))

(defun ruby-refe-line ()
  "ruby-refe: -l �I�v�V�����t���Ŏ��s"
  (interactive "sReFe: " :default0 (ruby-refe-keyword))
  (ruby-refe nil "-l"))

(defun ruby-refe-quit ()
  "ruby-refe: �I��"
  (interactive)
  (when *ruby-refe-winconf*
    (ignore-errors
     (set-window-configuration *ruby-refe-winconf*))
    (setq *ruby-refe-winconf* nil)))


;;; ������������������������������������������������������������������������ ;;;
;;;  �� ruby-refe-mode
;;; ������������������������������������������������������������������������ ;;;

(unless *ruby-refe-mode-map*
  (setq *ruby-refe-mode-map* (make-sparse-keymap))
  (define-key *ruby-refe-mode-map* '#\F1  'ruby-refe-line-point)
  (define-key *ruby-refe-mode-map* '#\RET 'ruby-refe-point)
  (define-key *ruby-refe-mode-map* '#\r   'ruby-refe)
  (define-key *ruby-refe-mode-map* '#\l   'ruby-refe-line)
  (define-key *ruby-refe-mode-map* '#\o   'other-window)
  (define-key *ruby-refe-mode-map* '#\q   'ruby-refe-quit)
  )

(unless *ruby-refe-mode-syntax-table*
  (setq *ruby-refe-mode-syntax-table* (make-syntax-table))
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\_)
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\?)
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\!)
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\=)
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\-)
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\*)
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\.)
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\:)
  (set-syntax-symbol *ruby-refe-mode-syntax-table* #\#)
  )

(defun ruby-refe-mode (arg)
  "ruby-refe: ���t�@�����X�\���p���[�h"
  (interactive)
  (kill-all-local-variables)
  (setq buffer-mode 'ruby-refe)
  (setq mode-name "ReFe")
  (use-keymap *ruby-refe-mode-map*)
  (use-syntax-table *ruby-refe-mode-syntax-table*)
  (make-local-variable 'regexp-keyword-list)
  (setq regexp-keyword-list *ruby-refe-regexp-keyword-list*)
  (make-local-variable 'mode-line-format)
  (setq mode-line-format (format nil "--%*- %b (%M) [%k:%l] %P dbname: ~A  command: \"~A ~A\""
				 *ruby-refe-dbname*
				 *ruby-refe-command*
				 arg))
  (setq need-not-save t)
  (setq kept-undo-information nil)
  (setq auto-save nil)
  (set-buffer-modified-p nil)
  (setq buffer-read-only t)
  (let ((buf (selected-buffer)))
    (set-local-window-flags buf (+ *window-flag-newline*
				   *window-flag-tab*
				   *window-flag-full-width-space*
				   *window-flag-eof*
				   *window-flag-line-number*
				   *window-flag-half-width-space*
				   *window-flag-scrolling*)
			    nil)
    (set-local-window-flags buf (+ (if (boundp '*window-flag-fold-mark*)
				       *window-flag-fold-mark*
				     *window-flag-fold-line*))
			    t))
  (run-hooks '*ruby-refe-mode-hook*))


;;; ������������������������������������������������������������������������ ;;;
;;;  �� �⏕�֐�
;;; ������������������������������������������������������������������������ ;;;

(defun ruby-refe-set-pathname()
  "ruby-refe: Ruby ReFe �p�X�ݒ�"
  (setf *ruby-refe-bitclust-lib-path*
	(merge-pathnames "bitclust/lib" *ruby-refe-install-path*)
	*ruby-refe-bitclust-bin-path*
	(merge-pathnames "bitclust/bin" *ruby-refe-install-path*)
	*ruby-refe-db-path*
	(merge-pathnames *ruby-refe-dbname* *ruby-refe-install-path*)))

(defun ruby-refe-keyword ()
  "ruby-refe: �J�[�\���ʒu�̒P��܂��̓Z���N�V�����̕������Ԃ�"
  (or (selection-start-end (start end)
	(buffer-substring start end))
      (if (string-match "\\_s+" (format nil "~C" (char-after (point))))
	  (save-excursion
	    (buffer-substring (progn
				(skip-syntax-spec-forward "w_")
				(point))
			      (progn
				(skip-syntax-spec-backward "w_")
				(point))))
	"")))

;;; ruby-refe.l ends here.
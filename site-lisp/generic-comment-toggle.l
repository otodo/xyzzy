#|
This file is not part of xyzzy.

    generic-comment-toggle.l --- �ėp�R�����g&�A���R�����g ���s��

        by bove-crach

���T�v

    �o�b�t�@���[�h���̃R�����g�A�E�gor�A���R�����g���s���܂�
    �v�� HIE����̃y�[�W��NOTE->�ҏW->1 �s�R�����g���g�O�� ���������������ł�
        HIE���񑽎ӁI
            HIE no Page          : http://hie.s64.xrea.com/
            1 �s�R�����g���g�O�� : http://hie.s64.xrea.com/xyzzy/note/edit.html#toggle-one-line-comment

���C���X�g�[��

    1. generic-comment-toggle.l �� site-lisp �ɃR�s�[����B

    2. �K�v�ɉ����C�o�C�g�R���p�C������B
        M-x byte-compile-file

    3. .xyzzy �� siteinit.l �Ɉȉ��̋L�q��ǉ�����B
        (require "generic-comment-toggle")

���g����

    M-x generic-comment-toggle                  : �R�����g�A�E�gor�A���R�����g���s��
    M-x generic-comment-toggle-region           : ���[�W�����̃R�����g�A�E�gor�A���R�����g���s��
    M-x generic-comment-toggle-region-rectangle : ���[�W��������`�Ƃ��ăR�����g�A�E�gor�A���R�����g���s��
    M-x generic-comment-toggle-comment-out      : �R�����g�A�E�g���s��
    M-x generic-comment-toggle-uncomment        : �A���R�����g���s��

    �ʏ�͕K�v����܂��񂪁A�ȉ��̗v�̂Ń��[�h���̃R�����g��ǉ��ł��܂�
        (push ("���[�h��" "�R�����g�J�n����" "�R�����g�I������" "�R�����g����������" "���s������ꍇ�̑}������")
                 *generic-comment-list*)

    ��s�R�����g�̏ꍇ�͈ȉ��̂悤�ɐݒ�
        ��Flisp-mode
        (push (lisp-mode ";;" "" "" ";;" ) *generic-comment-list*)

    �͂݃R�����g�̏ꍇ�͈ȉ��̂悤�ɐݒ�
        ��Fc-mode
        (push (c-mode "/* " " */" "+" " * ") *generic-comment-list*)

���L�[�o�C���h

    ���Ɏw�肵�Ă��܂���

���ݒ��

    Ctrl + ; �L�[�ŃZ���N�V�����܂���1�s�̃R�����g�A�E�gor�A���R�����g���s��
        (global-set-key #\C-; 'generic-comment-toggle)

�����C�Z���X

    generic-comment-toggle.l �� NYSL Version 0.9982 �ɏ]���܂��B


NYSL Version 0.9982  http://www.kmonos.net/nysl/
----------------------------------------

A. �{�\�t�g�E�F�A�� Everyone'sWare �ł��B���̃\�t�g����ɂ�����l��l���A
   �������̍�������̂������̂Ɠ����悤�ɁA���R�ɗ��p���邱�Ƃ��o���܂��B

  A-1. �t���[�E�F�A�ł��B��҂���͎g�p������v�����܂���B
  A-2. �L��������}�̂̔@�����킸�A���R�ɓ]�ځE�Ĕz�z�ł��܂��B
  A-3. �����Ȃ��ނ� ���ρE���v���O�����ł̗��p ���s���Ă��\���܂���B
  A-4. �ύX�������̂╔���I�Ɏg�p�������̂́A���Ȃ��̂��̂ɂȂ�܂��B
       ���J����ꍇ�́A���Ȃ��̖��O�̉��ōs���ĉ������B

B. ���̃\�t�g�𗘗p���邱�Ƃɂ���Đ��������Q���ɂ��āA��҂�
   �ӔC�𕉂�Ȃ����̂Ƃ��܂��B�e���̐ӔC�ɂ����Ă����p�������B

C. ����Ґl�i���� bove-crach �ɋA�����܂��B���쌠�͕������܂��B

D. �ȏ�̂R���́A�\�[�X�E���s�o�C�i���̑o���ɓK�p����܂��B


NYSL Version 0.9982 (en) (Unofficial)
----------------------------------------
A. This software is "Everyone'sWare". It means:
  Anybody who has this software can use it as if you're
  the author.

  A-1. Freeware. No fee is required.
  A-2. You can freely redistribute this software.
  A-3. You can freely modify this software. And the source
      may be used in any software with no limitation.
  A-4. When you release a modified version to public, you
      must publish it with your name.

B. The author is not responsible for any kind of damages or loss
  while using or misusing this software, which is distributed
  "AS IS". No warranty of any kind is expressed or implied.
  You use AT YOUR OWN RISK.

C. Copyrighted to bove-crach.

D. Above three clauses are applied both to source and binary
  form of this software.


���@�\�l�@

 �R�����g�g�O���l�@
 1.�R�����g�Ƃ͉���
     �R�����g�͈ȉ��̂悤�Ȃ��̂�����
     ��P
         // �R�����g
     ��Q
         /* �R�����g */
     ��R
         /* �R�����g
          * �R�����g */
     ��S
         /* �R�����g /+* �R�����g *+/ */

 2.�����������̂�
     a.�J�[�\���̂���s���ۂ��ƃR�����g�A�E�g������
     b.�����C���f���g����Ă���ꍇ�́A�C���f���g���l�����ăR�����g�A�E�g������
       ��  ���񂽂�                  /* ���񂽂� */
             �ǂ�����        ->        /* �ǂ����� */
               ��������                  /* �������� */

     c.�J�[�\���̂���s���R�����g�A�E�g���Ȃ�΁A�A���R�����g������
     d.�Z���N�V�����܂��̓��[�W�����ň͂܂ꂽ�ꕶ���R�����g�A�E�g������
       ��    ���߂�Ƃ���<�Ƃ��܂���>        <��>�ŃZ���N�V��������Ă���ꍇ
                 ��
             ���߂�Ƃ���/* �Ƃ��܂��� */    �ƂȂ�

     e.�Z���N�V�����܂��̓��[�W�����ň͂܂ꂽ�ꕶ���R�����g�A�E�g����Ă�����A���R�����g������
     f.�����s�̃R�����g�A�E�g�̏ꍇ�A�C���f���g��̐擪�ɃR�����g�ƕ����镶������ꂽ��
     g.�����s�̃R�����g�A�E�g�̏ꍇ�A�C���f���g���l�����Ĉȉ��̂悤�ȃR�����g�A�E�g�Ƃ�����
       ��  �Ȃ񂽂�                  �Ȃ񂽂�
           ���񂽂�                  /* ���񂽂�
             �ǂ�����        ->       *   �ǂ�����
               ��������               *     ��������
             �ӂނӂ�                 *   �ӂނӂ� */

     h.��`�I������Ă���ꍇ�A�S�Ă̍s�ɃR�����g����ꂽ��
       ��  �Ȃ񂽂�                  �Ȃ񂽂�
           ���񂽂�                  ����/* ���� */
             �ǂ�����        ->        ��/* ������ */
               ��������                  /* �������� */
             �ӂނӂ�                  ��/* �ނӂ� */

     i.�R�����g�A�E�g���镶����̒��ɁA���łɃR�����g�A�E�g����Ă��镶����������A
       �r���̃R�����g�A�E�g�𖳌������Ă���R�����g�A�E�g���ė~����
       ��  �R�����g /* �R�����g */
             ��
           /* �R�����g /+* �R�����g *+/ */

     j.�A���R�����g���ɃR�����g���������������ė~����
       ��  /* �R�����g /+* �R�����g *+/ */
             ��
           �R�����g /* �R�����g */

 3.�{�i�̎���͈�
 ��قǋ������u2.�v�̂悤�ȋ@�\��S�ėL����

���X�V����

    [Version 3.00] 2007.12.02
    �E����ɂ���ɏ����œK��
    �E�R�����g�A�E�g/�A���R�����g����x�ɍs���Ă���(set-comment-words)���A
      �ŏ����ɂȂ�悤�ɁB
	�E�p�b�P�[�W�������B�Ǝ��̂��̂ɂ��悤���Ǝv�����ۗ�

    [Version 2.01] 2007.03.24
    �E�C���f���g�Ȃ�čl������ȁc���Đ��𕷂����̂ŁA�I���ł���悤�ɁB
    �E����ɏ����œK��

    [Version 2.00] 2007.03.19
    �E�閧���J
    �E�قڊ��S���C
    �E��`�͈͂̃R�����g�A�E�g������
    �E�Ƃ肠���������Ƃ������ƂŁA�p�b�P�[�W��editor�ɐݒ�
    �E�R�����g������������𕪊����č쐬����悤�ɕύX
    �E�R�����g��������������s���Ă��A�������������Ȃ��悤�ɏC��
    �Emmm-mode���l�����Aset-comment-words�̌Ăяo���𖳐����ɕύX
    �E���s���}�������� nil �̏ꍇ�ɃG���[�ƂȂ��Ă����̂��C��
    �E�S�[���J������ۑ�����悤�ɏC��(��������Ȃ��E�E�E)
    �E�S�̓I�ɏ������œK��(�r��)

    [Version 1.01] 2006.12.24
    �E�A���R�����g�̓�����A�u�R�����g�J�n�����ƃR�����g�I�����������폜�v����A
      �u�L���͈͓��ɂ���R�����g�J�n�����ƃR�����g�I���������폜�v�ɕύX
    �E���J�֐��Ɉȉ��̂��̂�ǉ�
        1.generic-comment-toggle-comment-out
        2.generic-comment-toggle-uncomment

    [Version 1.00] 2006.12.16
    �E����
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   ���܂��Ȃ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide "generic-comment-toggle")

;; (eval-when (:compile-toplevel :load-toplevel :execute)
;;   (unless (find-package "generic-comment-toggle")
;;     (defpackage "generic-comment-toggle"
;;       (:nicknames "gct")
;;       (:use "lisp" "editor"))))
;; (in-package "generic-comment-toggle")

(export '(;; variable
		  *generic-comment-list*
		  *generic-comment-toggle-before-hook*
		  *generic-comment-toggle-after-hook*
		  ;; function
		  generic-comment-toggle
		  generic-comment-toggle-region
		  generic-comment-toggle-region-rectangle
		  generic-comment-toggle-comment-out
		  generic-comment-toggle-uncomment
		  ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   �ϐ���`(���J�p)
;;;;;;;;;;;;;;;;
;; ���W���[���[�h���ɃR�����g�����X�g�o�^
;; �R�����g���X�g���e
;; '("���[�h��" "�R�����g�J�n����" "�R�����g�I������" "�R�����g����������" "���s������ꍇ�̑}������")
(defvar *generic-comment-list* nil
  ; �w��̎d��
  ; (lisp-mode ";; "  ""    ""  ";; " )
  ; (c-mode    "/* " " */" "+" " * ")
  )
;; �C���f���g���l������
(defvar *generic-comment-indent-consideration* t)
;; �ꉞ HOOK�Ƃ�����Ƃ��i�g�����́E�E�E�j
(defvar *generic-comment-toggle-before-hook* nil)
(defvar *generic-comment-toggle-after-hook*  nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   �ϐ���`(�����p)
;;;;;;;;;;;;;;;;
;; �R�����g�����󂯌�
(defvar comment-head          nil) ; �R�����g�J�n����
(defvar comment-tail          nil) ; �R�����g�I������
(defvar comment-invalid       nil) ; �R�����g����������
(defvar comment-split         nil) ; �R�����g���̉��s���}������
;; �R�����g�������������ێ����Ƃ�
(defvar regexp-head-invalid   nil) ; �R�����g�J�n�����̐��K�\��
(defvar regexp-tail-invalid   nil) ; �R�����g�I�������̐��K�\��
(defvar regexp-head-uninvalid nil) ; �R�����g�J�n�����̖��������K�\��
(defvar regexp-tail-uninvalid nil) ; �R�����g�I�������̖��������K�\��
;; �O�񓮍쎞�̃��[�h�iset-comment-words �̌Ăяo�����ŏ����Ɂj
(defvar *generic-comment-before-mode* nil)
;; �R�����g�A�E�g or �A���R�����g�X�e�[�^�X
;; 1:�C�� 2:�R�����g�A�E�g 3:�A���R�����g
;; �ʏ�� 1
(defvar *comment-status* 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   ���J�֐� (��P�w)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun generic-comment-toggle ( &optional (*region-status* nil) )
  "�R�����g�A�E�gor�A���R�����g���s��"
  (interactive)
  ;; ���݂̃o�b�t�@�ɓo�^����Ă���R�����g�������󂯎��
  (unless (eq *generic-comment-before-mode* buffer-mode)
	(set-comment-words))
  (run-hooks '*generic-comment-toggle-before-hook*)
  (let ((goal-column (goal-column)) start end)
	(save-excursion
	  (save-restriction
		;; �Z���N�V�����I��
		(cond
		 ((get-selection-type)
		  (case (get-selection-type)
			;; �s���[�h�I��
			;; �������[�h�I��
			((1 2) (generic-comment-toggle-normal (selection-mark) (selection-point)))
			;; ��`�I��
			(3 (generic-comment-toggle-rectangle (selection-mark) (selection-point)))))
		 ;; ���[�W�����I��
		 ((and *region-status* (mark))
		  (case *region-status*
			;; �ʏ�I��
			(1 (generic-comment-toggle-normal (mark) (point)))
			;; ��`�I��
			(2 (generic-comment-toggle-rectangle (mark) (point)))))
		 ;; 1�s�R�����g
		 (t
		  ;; ���ݍs�̍s���ƍs����ۑ�
		  (goto-bol)
		  (when *generic-comment-indent-consideration* (back-to-indentation))
		  (setf start (point))
		  (goto-eol)
		  (setf end (point))
		  (generic-comment-toggle-normal start end)))
		))
	(set-goal-column goal-column))
  (run-hooks '*generic-comment-toggle-after-hook*))

(defun generic-comment-toggle-region()
  "���[�W�����̃R�����g�A�E�gor�A���R�����g���s��"
  (interactive)
  ;; ���[�W�����̑�����@��ʏ�I���Ƃ���
  (generic-comment-toggle 1))

(defun generic-comment-toggle-region-rectangle()
  "���[�W��������`�I���Ƃ��ăR�����gor�A���R�����g���s��"
  (interactive)
  ;; ���[�W�����̑I����@����`�I���Ƃ���
  (generic-comment-toggle 2))

(defun generic-comment-toggle-comment-out()
  "�R�����g�A�E�g���s��"
  (interactive)
  ;; �R�����g�ݒ���R�����g�A�E�g�Ƃ���
  (setf *comment-status* 2)
  (generic-comment-toggle nil)
  (setf *comment-status* 1))

(defun generic-comment-toggle-uncomment()
  "�A���R�����g���s��"
  (interactive)
  ;; �R�����g�ݒ���A���R�����g�Ƃ���
  (setf *comment-status* 3)
  (generic-comment-toggle nil)
  (setf *comment-status* 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   �����֐� (��Q�w)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun set-comment-words()
;;; �R�����g�������Z�b�g����
  (let ((comment-list (find buffer-mode *generic-comment-list* :key #'car)))
	(cond
	 ;; ���� *generic-comment-list* �Ƀ��[�h���o�^����Ă����炻������g��
	 (comment-list
	  (setf comment-head    (nth 1 comment-list)) ; �R�����g�J�n����
	  (setf comment-tail    (nth 2 comment-list)) ; �R�����g�I������
	  (setf comment-invalid (nth 3 comment-list)) ; �R�����g����������
	  (setf comment-split   (nth 4 comment-list)) ; �R�����g���̉��s���}������
	  )
	 (t ;; ���݃��[�h����o�^����Ă���R�����g���������������Ă���
	  (setf comment-head    comment-start) ; �R�����g�J�n����
	  (setf comment-tail    comment-end  ) ; �R�����g�I������
	  ;; �����������Ɖ��s�}�������͏����l�����Ă���
	  (setf comment-invalid "+"          ) ; �R�����g����������
	  (setf comment-split   ""           ) ; �R�����g���̉��s���}������
	  ;; comment-tail ���󕶎��̎��́AC++�n�R�����g�Ȃ̂�
	  ;; comment-invalid ������Ȃ� ���� comment-split �� comment-head �ł���
	  (when (string= comment-tail "")
		(setf comment-invalid "")
		(setf comment-split comment-head))
	  )))
;;; �R�����g�����`�F�b�N
  ;; comment-head ���󕶎��̎��́A���������R�����g�ɂł��Ȃ�
  (when (or (string= comment-head "")
			(not comment-head) )
	(setf comment-head nil comment-tail nil comment-invalid nil comment-split nil)
	(plain-error "�R�����g�J�n�������󕶎��Ȃ�ŁA�R�����g�ɂł��܂��񂪁H"))
;;; �R�����g������������̍쐬
  ;; comment-invalid �� "" �łȂ� ���� �R�����g��������2�ȏ�Ȃ���
  (let ((head (string-trim " \t" comment-head))
		(tail (string-trim " \t" comment-tail)))
	(when (and (not (string= comment-invalid ""))
			   (> (length head) 1)
			   (> (length tail) 1))
	  (setf regexp-head-invalid
			(format nil "\\(~A\\)\\(~A*~A\\)"
					(regexp-quote (substring head 0 1))
					(regexp-quote comment-invalid)
					(regexp-quote (substring head 1))))
	  (setf regexp-head-uninvalid
			(format nil "\\(~A\\)~A\\(~A*~A\\)"
					(regexp-quote (substring head 0 1))
					(regexp-quote comment-invalid)
					(regexp-quote comment-invalid)
					(regexp-quote (substring head 1))))
	  (setf regexp-tail-invalid
			(format nil "\\(~A~A*\\)\\(~A\\)"
					(regexp-quote (substring tail 0 1))
					(regexp-quote comment-invalid)
					(regexp-quote (substring tail 1))))
	  (setf regexp-tail-uninvalid
			(format nil "\\(~A~A*\\)~A\\(~A\\)"
					(regexp-quote (substring tail 0 1))
					(regexp-quote comment-invalid)
					(regexp-quote comment-invalid)
					(regexp-quote (substring tail 1))))
	  ))
;;; �R�����g������̐��������������̂ŁA���݃o�b�t�@���[�h��ۑ�����
  (setf *generic-comment-before-mode* buffer-mode)
  )

(defun generic-comment-toggle-normal( start end )
  "�ʏ�I���̃R�����g�A�E�gor�A���R�����g���s��"
  ;; �R�����g�A�E�g���A���R�����g�����f
  (if (generic-comment-toggle-sub-setup start end)
	  ;; �R�����g�A�E�g����
	  (generic-comment-toggle-sub-comment-out)
	;; �A���R�����g����
	(generic-comment-toggle-sub-uncomment)))

(defun generic-comment-toggle-rectangle( start end )
  "��`�I���̃R�����g�A�E�gor�A���R�����g���s��"
  ;; �R�����g�A�E�g���A���R�����g�����f
  (let (func  goalcolumn  start-line start-coluwm  end-line  work-data)
	(if (generic-comment-toggle-sub-setup start end)
		(setf func 'generic-comment-toggle-sub-comment-out)
	  (setf func 'generic-comment-toggle-sub-uncomment))
;;; �K�v�ȏ���ݒ�
	(setf goalcolumn (goal-column))
	(goto-char start)
	(setf start-line (current-virtual-line-number))
	(setf start-coluwm (current-virtual-column))
	(goto-char end)
	(setf end-line (current-virtual-line-number))
;;; �����͈͂��m�肵�Ď��s
	(do ((counta start-line (incf counta)))
		;; �I���ʒu�̍s�𒴂�����I��
		((> counta end-line))
	  (widen)
	  (goto-virtual-line counta)
	  (goto-virtual-column start-coluwm)
	  (setf work-data (point))
	  (goto-virtual-column goalcolumn)
	  ;; �����Ƃ�����Ƃ��܂ɍs���߂���̂ŁA�߂�
	  (when (> (current-virtual-column) goalcolumn)
		(backward-char))
	  (narrow-to-region work-data (point))
	  (funcall func)))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;   �����֐� (��R�w)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun generic-comment-toggle-sub-setup(start end)
  "comment-out,uncomment�̋��ʏ��������o��"
  (let (string-that-comments keyreg which-proc)
	;; start > end ���Ɖ����ƕs�ւȂ̂ŁAstart <= end �ɓ���
	(if (> start end)  (rotatef start end))
	;; �i���[�C���O���s���A�ҏW�ӏ����w�肷��
	(narrow-to-region start end)
	;; ��������擾
	(setf string-that-comments (buffer-substring (point-min) (point-max)))
	;; �����s�̉\��������̂ŁA1�s�ɂ��Ă��܂�
	(setf string-that-comments (substitute-string string-that-comments "\n" ""))
	;; �R�����g�A�E�g���A���R�����g�����f
	(setq keyreg (format nil "^\\(~A\\)+\\(.*\\)\\(~A\\)+$"
						 (regexp-quote (string-trim " \t" comment-head))
						 (regexp-quote (string-trim " \t" comment-tail))))
	(if (string-looking-at keyreg string-that-comments)
		(setf which-proc nil)
	  (setf which-proc t))
	;; *comment-status*�̐ݒ�ɂ��ŏI���f
	(case *comment-status*
	  (2 (setf which-proc t))
	  (3 (setf which-proc nil)))
	which-proc
	))

(defun generic-comment-toggle-sub-comment-out()
  "������̃R�����g�A�E�g���s��"
  (unless *executing-macro*
	(message "comment-out"))
  ;; ���łɃR�����g������ꍇ�A�R�����g���������s��
  (when regexp-head-invalid
	(let ((work (format nil "\\1~A\\2" (regexp-quote comment-invalid))))
	  (goto-char (point-min))
	  (replace-buffer regexp-head-invalid work :regexp t)))
  (when regexp-tail-invalid
	(let ((work (format nil "\\1~A\\2" (regexp-quote comment-invalid))))
	  (goto-char (point-min))
	  (replace-buffer regexp-tail-invalid work :regexp t)))
  ;; �C���f���g�ʒu���l�������R�����g�A�E�g���s���̂ŁA�}���ʒu�����߂�
  ;; (point-max)�ʒu�Ɉړ����āA�I���ʒu�̕\���s�ԍ���ۑ�
  (goto-char (point-max))
  (setf comment-end-line (current-virtual-line-number))
  (setf point-end (point))
  ;; (point-min)�ʒu�Ɉړ����āA�J�n�ʒu�̕\���s�ԍ���ۑ�
  (goto-char (point-min))
  (setf comment-start-line (current-virtual-line-number))
  (setf comment-start-coluwm (current-virtual-column))
  ;; �C���f���g�̍ŏ��������Z�o
  (do ((counta comment-start-line (incf counta)))
	  ;; �I���ʒu�̍s�𒴂�����I��
	  ((> counta comment-end-line))
	;; counta �s�ڂ̐擪�s�Ɉړ�
	(goto-virtual-line counta)
	(goto-virtual-bol)
	;; �R�����g��������݌����傫�������猅�����ւ���
	(if (> comment-start-coluwm (current-virtual-column))
		(setf comment-start-coluwm (current-virtual-column))))
  ;; �擪�Ɩ����ɃR�����g�L�[��}������
  (goto-char (point-max))
  (insert comment-tail)
  (goto-char (point-min))
  (goto-column comment-start-coluwm)
  (insert comment-head)
  ;; �R�����g�͈͂ɉ��s���܂܂��Ȃ�
  (when (and (> comment-end-line comment-start-line)
			 (not (string= comment-split "")))
	(let (start-position end-position)
	  (goto-virtual-line (+ comment-start-line 1))
	  (goto-column comment-start-coluwm)
	  (setf start-position (point))
	  (goto-virtual-line comment-end-line)
	  (goto-column comment-start-coluwm)
	  (setf end-position (point))
	  ;; �R�����g���̉��s���}��������}������
	  (string-rectangle start-position end-position comment-split)))
  )

(defun generic-comment-toggle-sub-uncomment()
  "������̃A���R�����g���s��"
  (unless *executing-macro*
	(message "uncomment"))
  ;; �擪�̃R�����g�L�[���폜����
  (goto-char (point-min))
  (let ((head (concat (regexp-quote (string-trim " \t" comment-head)) "[ \t]?")))
	(replace-buffer head "" :regexp t :once t))
  ;; �����̃R�����g�L�[���폜����
  (when (not (string= comment-tail ""))
	(goto-char (point-min))
	(let ((tail (concat "[ \t]?" (regexp-quote (string-trim " \t" comment-tail)))))
	  (replace-buffer tail "" :regexp t :once t )))
  ;; �R�����g���̉��s���}���������폜����
  (goto-char (point-min))
  (unless (string= comment-split "")
	(replace-buffer (format nil "^\\([ \t]*\\)\\(~A\\)" (regexp-quote comment-split)) "\\1" :regexp t))
  ;; �r���ɃR�����g�����������񂪂���ꍇ�́A�R�����g����������������
  (when regexp-head-uninvalid
	(goto-char (point-min))
	(replace-buffer regexp-head-uninvalid "\\1\\2":regexp t))
  (when regexp-tail-uninvalid
	(goto-char (point-min))
	(replace-buffer regexp-tail-uninvalid "\\1\\2":regexp t))
  )

#| ���܂�

(defun gct-region-or-other()
  "rv-region�I�� �� generic-comment-toggle-region ���g�p����"
  (interactive)
  (if (and (modulep "rv-region")
		   *rv-region-stay-on*)
	  (generic-comment-toggle-region)
	(generic-comment-toggle)))

|#
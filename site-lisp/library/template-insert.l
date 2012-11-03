;; template-insert.l --- �e���v���[�g�̑}��
;; -*- mode:lisp; package:template-insert -*-
;;
;; $Id: template-insert.l 204 2005-09-25 07:25:07Z kia $
;;
;; �J�����t�@�C�����܂��쐬����Ă��Ȃ��V�����t�@�C���ł������Ƃ��A���̃t�@
;; �C������ݒ肳�ꂽ�ҏW���[�h�ɉ����āA�\�ߗp�ӂ��Ă������e���v���[�g�̃e
;; �L�X�g���o�b�t�@�ɑ}�����܂��B�܂��e���v���[�g��}������ۃe���v���[�g��
;; �L�q�����L�[���[�h���w�����ꂽ������ɒu�����܂��B
;;
;;
;; �C���X�g�[��
;; ============
;;
;; xyzzy���C���X�g�[�������f�B���N�g���ɂ���site-lisp�t�H���_��
;; template-insert.l���R�s�[���܂��B
;;
;; ~/.xyzzy��template-insert.l�����[�h����悤�ɐݒ肵�܂��B���̂悤�ɋL�q
;; ���Ă��������B
;;
;;     (require "template-insert")
;;     (use-package "template-insert")
;;
;; ���Ƀe���v���[�g�ƂȂ�t�@�C����u���Ă����f�B���N�g����ݒ肵�܂��B�f�t
;; �H���g�� ~/templates/ �ł��̂ŁA�ύX���K�v�ȂƂ��������̂悤�ɐݒ肵�Ă�
;; �������B
;;
;;     (setq *template-insert-directory* "~/insert/")
;;
;; Xyzzy���ċN�����Ă��������B
;;
;;
;; �g����
;; ======
;;
;; ��{�̎g����
;; ------------
;;
;; �ł��ȒP�Ȏg�����́A*template-insert-directory*�ɐݒ肵���f�B���N�g����
;; �e���v���[�g�ƂȂ�t�@�C�������Ă��������ł��B�e���v���[�g�t�@�C���̖�
;; �O�ɂ̓t�@�C���̌`���ɉ������g���q��t���Ă��������B
;;
;; find-file�R�}���h�⃁�j���[�́u�t�@�C�� �� �J���v�ŁA�܂��쐬����Ă���
;; ���t�@�C�������w�肷��ƁAtemplate-insert��*template-insert-directory*��
;; �����瓯���g���q�����e���v���[�g�t�@�C����T���A�V�����J�����o�b�t�@��
;; �}�����邩�ǂ��������[�U�Ɋm�F����v�����v�g���o���܂��B
;;
;; �܂��A�����g���q�����e���v���[�g�t�@�C�����������������Ƃ��́A�ǂ̃t
;; �@�C�����o�b�t�@�ɑ}������̂������[�U�Ɋm�F����v�����v�g���o�܂�����A
;; ���̓s�x�w�����Ă��������B
;;
;; �e���v���[�g�t�@�C���ƃe�L�X�g�ׂ̍�������
;; ------------------------------------------
;;
;; �u��{�̎g�����v�̓���ɂ܂������ɁA�}������e���v���[�g�t�@�C����I����
;; ����A�e���v���[�g�t�@�C���Ɏg�킸�Ƀe�L�X�g���o�b�t�@�ɑ}���������悤��
;; �Ƃ��́A*template-insert-alist*�ϐ����g���܂��B
;;
;; *template-insert-alist*�ϐ��ɂ͐V�����J���t�@�C�����₻�̕ҏW���[�h�ƃe
;; ���v���[�g�Ƃ̊֌W��ݒ肵�܂��B
;;
;;     (setq *template-insert-alist* '((html+-mode . "newfile.html")))
;;
;; *template-insert-alist*�ϐ��͂������̃y�A����Ȃ郊�X�g�ŁA�e�y�A�̓L
;; �[�����i�h�b�g�̍����j�ƃf�[�^�����i�h�b�g�̉E���j����Ȃ�܂��B
;;
;;     '((�L�[ . �f�[�^) (�L�[ . �f�[�^) ...)
;;
;; �u�L�[�v�̓t�@�C������\��������(���K�\��)���A���邢�̓o�b�t�@�̕ҏW���[
;; �h������킷�V���{���ł��B�܂��u�f�[�^�v�̓t�@�C������\�������񂩁A����
;; ���͔C�ӂ̕������Ԃ��֐��ł��B
;;
;; �V�����t�@�C�����J���ƁAtemplate-insert��*template-insert-alist*�ϐ��ɐ�
;; �肵���y�A�́u�L�[�v�����ɒ��ׂ܂��B
;;
;; �u�L�[�v��������̂Ƃ��͂��̕�������t�@�C������\�킷���K�\���Ƃ݂Ȃ��A
;; �V�����J�����t�@�C�����Ɣ�r���܂��B
;;
;; �u�L�[�v���V���{���̎��͐V�����J�����o�b�t�@�̕ҏW���[�h�Ɣ�r���܂��B
;;
;; �����́u�L�[�v�̔�r���^(��nil)�������Ƃ��A���́u�L�[�v�ɑΉ�����u�f
;; �[�^�v�����ƂɃe���v���[�g�̑}�����s���܂��B
;;
;; �e���v���[�g�̑}���́u�f�[�^�v��������Ȃ̂��֐��Ȃ̂��ɂ���ē��삪�ς�
;; ��܂��B
;;
;; �u�f�[�^�v��������ł���΁A���̕�������t�@�C�����Ƃ݂Ȃ��A
;; *template-insert-directory*�ϐ��ɐݒ肳�ꂽ�f�B���N�g���ɂ���(�͂���)��
;; ���̃t�@�C���̓��e��V�����J�����o�b�t�@�ɑ}�����܂��B
;;
;; �܂��u�f�[�^�v���֐��ł���΁A���̊֐������s���A���s���ʂ̕������V����
;; �J�����o�b�t�@�ɑ}�����܂��B�֐��̎��s���ʂ�������ȊO�ł���΃o�b�t�@��
;; �͉����}�����܂���B
;;
;; ���ɂ������ݒ��������܂��B
;;
;;     �f�B���N�g���ɂ��؂�ւ�
;;     (setq *template-insert-alist*
;;           (append '(("/website1/.*\\.html?" . "template1.html")
;;                     ("/website2/.*\\.html?" . "template2.html"))
;;                   *template-insert-alist*))
;;
;;     �t�@�C�����g�킸�������}��
;;     (push `(ruby-mode . ,#'(lambda () "#!/usr/local/bin/ruby\n\n"))
;;           *template-insert-alist*)
;;
;;     �e���v���[�g��ǂ݂��ނ��łɕ����R�[�h�Ȃ񂩂��ς��Ƃ��Ă݂�
;;     (push `(html+-mode . ,#'(lambda ()
;;                               (set-buffer-fileio-encoding (read-char-encoding "Encoding: "))
;;                               (ti::insert-template-type '("*.html" "*.htm"))))
;;           *template-insert-alist*)
;;
;; *template-insert-alist*�ϐ��̐ݒ�́A��Ɂu��{�̎g�����v�ɏq�ׂ��A����
;; �g���q�ɂ��t�@�C���̑}���ɗD�悵�܂��B�����A*template-insert-alist*��
;; ���ɊY������ݒ肪������΁A�g���q�𒲂ׂăt�@�C���}�������݁A������_��
;; �Ȃ牽�����܂���B
;;
;; �L�[���[�h�̒u��
;; ----------------
;;
;; �e���v���[�g�̑}�����s��ꂽ�Ƃ��́A�e���v���[�g�ɋL�q���ꂽ�L�[���[�h��
;; �u�������s���܂��B�L�[���[�h��`@'�ŗ��[�����܂ꂽ�A�p�����ƃA���_�[�X�R�A
;; ����Ȃ镶����ł��i@ABC@�A@123@�A@XYZ_999@�Ȃǁj�B�ȉ��ɒ�`�ς݂̃L�[
;; ���[�h�������܂��B
;;
;;     @FILENAME@     --- �t�@�C���̃p�X��
;;     @_FILENAME@     --- �t�@�C���̃p�X���B�f�B���N�g���̋�؂�̓o�b�N�X���b�V��
;;     @BASEFILENAME@ --- �f�B���N�g�����������t�@�C�����̂����g���q�ȊO�̕���
;;     @EXTENSION@    --- �t�@�C���̊g���q�B
;;     @DIRECTORY@    --- �t�@�C���̃f�B���N�g��
;;     @_DIRECTORY@    --- �t�@�C���̃f�B���N�g���B�f�B���N�g���̋�؂�̓o�b�N�X���b�V��
;;     @DATETIME@     --- ����(ex. 2003-03-30 01:53:34+09:00)
;;     @DATE@         --- ���t(ex. 2003-03-30)
;;     @USERNAME@     --- ���ϐ� USERNAME �̒l
;;     @AUTHOR@       --- @USERNAME@�ɓ���
;;     @POINT@        --- �L�[���[�h�u�����s��ꂽ���Ƃ̃J�[�\���ʒu
;;     @DOT@          --- @POINT@�ɓ���
;;     @@             --- @
;;     @ASK_�`@       --- @ASK_�Ŏn�܂�ꍇ�ɂ̓v�����v�g���o���A���͂��ꂽ������ɒu�����܂��B
;;                        (ex. @ASK_Please_input_your_ID@)
;;     @�`@           --- ��L������ɂ���v���Ȃ���΁u�`�v�����ɖ��O����v������ϐ��̒l
;;
;; �����̒�`�ς݃L�[���[�h�̒��ŁA@POINT@��@DOT@�͋󕶎���ƒu���������
;; �܂��B
;;
;; �L�[���[�h�ƕ���킵���e�L�X�g�̒���`@'���̂��̂�\������Ƃ���"@@"�̂�
;; ����`@'���d�˂ď����Ă��������B
;;
;; �����̃L�[���[�h��*template-insert-variables-alist*�Ƃ����ϐ��ɒ�`��
;; �Ă���܂��B�ق��ɒu�����������̂�����Ƃ���
;; *template-insert-variables-alist*�ϐ��ɒǉ����Ă��������B���łɒ�`�ς�
;; �̂��̂ł�*template-insert-variables-alist*�ϐ��̐擪�ɓ����L�[���[�h��
;; �ǉ����Ă������ƂŕύX���邱�Ƃ��ł��܂��B
;;
;; *template-insert-alist*�ϐ��Ɠ��l�ɁA*template-insert-variables-alist*��
;; ���͂������̃y�A����Ȃ郊�X�g�ŁA�e�y�A�́u�L�[�v�����i�h�b�g�̍����j
;; �Ɓu�f�[�^�v�����i�h�b�g�̉E���j����Ȃ�܂��B
;;
;;     '((�L�[ . �f�[�^) (�L�[ . �f�[�^) ...)
;;
;; �u�L�[�v�̓L�[���[�h��\��������ł��B`@'�ŗ��[�����܂ꂽ������łȂ���
;; �΂Ȃ�܂���B�啶���������͋�ʂ��܂��B�u�f�[�^�v�͕����񂩁A���邢�͔C
;; �ӂ̕������Ԃ��֐��ł��B
;;
;; ���ɃL�[���[�h��ǉ������������������܂��B
;;
;;     (push '("@EMAIL@" . "meshinsha@yahoo.co.jp") *template-insert-variables-alist*)
;;
;;     (push `("@CHARSET@" . ,#'(lambda ()
;;                                 (let ((enc (buffer-fileio-encoding)))
;;                                   (cond
;;                                    ((eq enc *encoding-sjis*) "Shift_JIS")
;;                                    ((eq enc *encoding-euc-jp*) "EUC-JP")
;;                                    ((eq enc *encoding-jis*) "iso-2022-jp")
;;                                    (t "Shift_JIS")))))
;;           *template-insert-variables-alist*)
;;
;;
;; ����
;; ====
;;
;; ���̃X�N���v�g���g�p�������ƂŔ����������Q�ɑ΂���ӔC�͕������˂܂��B��
;; �̃X�N���v�g���g�p����O�ɂ́A�K���t�@�C���̃o�b�N�A�b�v�����ȂǁA����
;; ���񕜂����i���m�ۂ�����Ŋe���̐ӔC�ɂ����Ďg�p���Ă��������B
;;
;;
;; �A�h���X
;; ========
;;
;; kia <meshinsha@yahoo.co.jp>
;; http://www.geocities.jp/kiaswebsite/

(provide "template-insert")
(defpackage "template-insert" (:use "lisp" "editor") (:nicknames "ti"))
(in-package "template-insert")
(shadow '(insert-template
          insert-template-type
          template-insert
          *template-insert-directory*
          *template-insert-alist*
          *template-insert-variables-alist*
          *popup-template-files*
          choose-template-file
          expand-variables
          get-directory-name
          get-backslashed-directory-name
          get-user-name
;          get-template-name
          get-template-names
          lookup
          set-initial-cursor-position
          yn
          *initial-cursor-position*
          *variable-beginning*
          *variable-end*
          *variable-string*
          *variable-name*
          RE-VARIABLE))
(export '(template-insert
          *template-insert-directory*
          *template-insert-alist*
          *template-insert-variables-alist*))

(defconstant RE-VARIABLE (compile-regexp "@\\([A-Za-z0-9_]*\\)@"))

(defvar *template-insert-directory* "~/templates/")

(defvar *template-insert-alist* nil)

(defvar *popup-template-files* nil)

(defun get-directory-name ()
  (directory-namestring (get-buffer-file-name)))

(defun get-backslashed-directory-name ()
  (map-slash-to-backslash (get-directory-name)))

(defun get-user-name ()
  (or (si:getenv "USERNAME") ""))

(defun set-initial-cursor-position ()
  (setq *initial-cursor-position* *variable-beginning*)
  "")

(defvar *template-insert-variables-alist*
  `(("@FILENAME@"     . ,#'get-buffer-file-name)
    ("@_FILENAME@"    . ,#'(lambda ()
                             (map-slash-to-backslash (get-buffer-file-name))))
    ("@BASEFILENAME@" . ,#'(lambda ()
                             (pathname-name (get-buffer-file-name))))
    ("@EXTENSION@"    . ,#'(lambda ()
                             (pathname-type (get-buffer-file-name))))
    ("@DIRECTORY@"    . ,#'get-directory-name)
    ("@DIR@"          . ,#'get-directory-name)
    ("@_DIRECTORY@"   . ,#'get-backslashed-directory-name)
    ("@_DIR@"         . ,#'get-backslashed-directory-name)
    ("@DATETIME@"     . ,#'(lambda ()
                             (format-date-string "%Y-%m-%d %H:%M:%S%#Z")))
    ("@DATE@"         . ,#'(lambda ()
                             (format-date-string "%Y-%m-%d")))
    ("@USERNAME@"     . ,#'get-user-name)
    ("@AUTHOR@"       . ,#'get-user-name)
    ("@POINT@"        . ,#'set-initial-cursor-position)
    ("@DOT@"          . ,#'set-initial-cursor-position)
    ("@@"             . "@")
    ("@ASK_\\(.+\\)@"  . ,#'(lambda ()
                              (read-string (format nil "~A: " (substitute-string (match-string 1) "_" " ")))))
    ("@\\(.+\\)@"     . ,#'(lambda ()
                             (let ((env (si:getenv *variable-name*)))
                               (if env
                                   env
                                 *variable-string*))))))


(defvar *initial-cursor-position* nil)
(defvar *variable-beginning* nil)
(defvar *variable-end* nil)
(defvar *variable-string* nil)
(defvar *variable-name* nil)

(defun choose-template-file (lst)
  (if *popup-template-files*
      (let (fn)
        (popup-list lst #'(lambda (x) (setq fn x)))
        (while (not fn)
          (sit-for .3))
        fn)
    (completing-read "�ǂ̃t�@�C��? " lst :must-match t)))

(defun expand-variables ()
  (setq *initial-cursor-position* nil)
  (goto-char 0)
  (while (scan-buffer RE-VARIABLE :tail t :no-dup nil)
    (let ((*variable-beginning* (match-beginning 0))
          (*variable-end* (match-end 0))
          (*variable-string* (match-string 0))
          (*variable-name* (match-string 1)))
      (flet ((get-replacement ()
               (let ((rep (cdr (assoc-if #'(lambda (x)
                                             (string-match x *variable-string*))
                                         *template-insert-variables-alist*))))
                 (cond ((stringp rep) rep)
                       ((functionp rep) (funcall rep))))))
        (let ((repstr (get-replacement)))
          (when repstr
            (delete-region *variable-beginning* *variable-end*)
            (insert repstr))))))
  (goto-char (or *initial-cursor-position* 0)))

;; (defun get-template-name (wild)
;;   (car (get-template-names wild)))

(defun get-template-names (wild)
  (directory *template-insert-directory* :file-only t :wild wild :recursive t))

(defun insert-template (fname)
  (insert-file-contents (merge-pathnames fname *template-insert-directory*))
  t)

(defun insert-template-type (wild)
  (let ((lst (get-template-names wild)))
    (when lst
      (insert-template
       (if (= (length lst) 1)
           (car lst)
         (choose-template-file lst))))))

(defun lookup (fname mode)
  (assoc-if #'(lambda (x)
                (cond ((symbolp x) (eq x mode))
                      ((stringp x) (string-match x fname)) ))
            *template-insert-alist*))

(defun template-insert ()
  (let* ((buf (selected-buffer))
         (fname (get-buffer-file-name buf)))
    (when (and fname (not (file-exist-p fname)))
      (let ((pair (lookup fname (buffer-local-value buf 'buffer-mode))))
        (if pair
            (let ((act-or-fname (cdr pair)))
              (when (yn (string (car pair)))
                (if (functionp act-or-fname)
                    (progn
                      (let ((s (funcall act-or-fname)))
                        (and (stringp s) (insert s)))
                      (expand-variables))
                  (progn
                    (insert-template act-or-fname)
                    (expand-variables)))))
          (let* ((type (pathname-type fname))
                 (wild (format nil "*.~A" type)))
            (when (and (get-template-names wild) (yn wild))
              (insert-template-type wild)
              (expand-variables))))))))

(defun yn (s)
  (y-or-n-p "�e���v���[�g��}�����܂����H (~A)" s))

(add-hook '*find-file-hooks* 'template-insert)

;;; template-insert.l�͂����܂�
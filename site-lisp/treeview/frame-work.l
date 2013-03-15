;;; -*- Mode: Lisp; Package: TREEVIEW -*-
;;; frame-work.l --- treeview

;; Copyright (C) 2001-2005 OHKUBO Hiroshi <ohkubo@s53.xrea.com>

;; Author: OHKUBO Hiroshi <ohkubo@s53.xrea.com>
;; Time-stamp: <2005/11/12 12:54:35 +0900>

;;; Code:

(provide "treeview/frame-work")

(require "cmdbar")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "treeview/defs")
  (require "treeview/macro"))

(in-package "treeview")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-nop (&optional hitem)
  "�������Ȃ������B"
  (interactive)
  nil)

(defun treeview-message (fmt &rest args)
  "display-name ��擪�ɂ��� message ���o�́B"
  (apply #'message
         (concat (treeview-data-get 'treeview::display-name "TreeView") ": "
                 fmt) args))

(defun treeview-minibuffer-prompt (fmt &rest args)
  "display-name ��擪�ɂ��� minibuffer-prompt ���o�́B"
  (apply #'minibuffer-prompt
         (concat (treeview-data-get 'treeview::display-name "TreeView") ": "
                 fmt) args))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; treeview-id
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-get-active-treeview-id ()
  "���݃A�N�e�B�u�� treeview �� treeview-id ��Ԃ��B"
  (let ((htree (winapi::GetFocus)))
    (dolist (treeview-id (treeview-get-treeview-id-list))
      (with-treeview (treeview-id)
        (when (eql htree (treeview-get-htree))
          (return-from treeview-get-active-treeview-id treeview-id))))))

(defun treeview-get-mouse-htree ()
  "���݃}�E�X�̏���Ă��� treeview �� htree ��Ԃ��B"
  (let ((po (winapi:make-POINT)))
    (winapi:GetCursorPos po)
    (winapi:WindowFromPoint (winapi:POINT-x po) (winapi:POINT-y po))))

(defun treeview-get-mouse-treeview-id ()
  "���݃}�E�X�̏���Ă��� treeview �� treeview-id ��Ԃ��B"
  (let ((htree (treeview-get-mouse-htree)))
    (dolist (treeview-id (treeview-get-treeview-id-list))
      (with-treeview (treeview-id)
        (when (eql htree (treeview-get-htree))
          (return-from treeview-get-mouse-treeview-id treeview-id))))))

(defun treeview-get-treeview-id ()
  "���݁A�������͒��߂� treeview-id ��Ԃ��B"
  (or *treeview-id* *treeview-last-id* 0))

(defun treeview-get-any-treeview-id ()
  "�K�؂Ǝv����D��x�ŁA�Ȃ�炩�� treeview-id ��Ԃ��B"
  (or *treeview-id*
      *treeview-last-id*
      (treeview-get-active-treeview-id)
      (treeview-get-mouse-treeview-id)
      (car (treeview-get-treeview-id-list))
      0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keymap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *treeview-fix-map* nil
  "treeview keymap (�f�t�H���g����΍�) (�T���v��)�B
treeview ���C�u�������ł͎g�p���Ă��Ȃ����A���C�u�������g�p���鑤����
copy-keymap ���Ƃ��ėp�����邱�Ƃ�z�肵�ėp�ӂ��Ă���B")
(unless *treeview-fix-map*
  ;; �L�[�o�C���h�ύX�s��
  (setq *treeview-fix-map* (make-sparse-keymap))
  (define-key *treeview-fix-map* #\SPC          'treeview-nop)
;  (define-key *treeview-fix-map* #\Up           'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\Down         'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\Left         'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\Right        'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\S-Up         'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\S-Down       'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\S-Left       'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\S-Right      'treeview-select-node-delay)
  (define-key *treeview-fix-map* #\C-Up         'treeview-nop)
  (define-key *treeview-fix-map* #\C-Down       'treeview-nop)
  (define-key *treeview-fix-map* #\C-Left       'treeview-nop)
  (define-key *treeview-fix-map* #\C-Right      'treeview-nop)
  (define-key *treeview-fix-map* #\S-C-Up       'treeview-nop)
  (define-key *treeview-fix-map* #\S-C-Down     'treeview-nop)
  (define-key *treeview-fix-map* #\S-C-Left     'treeview-nop)
  (define-key *treeview-fix-map* #\S-C-Right    'treeview-nop)
;  (define-key *treeview-fix-map* #\PageUp       'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\PageDown     'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\Home         'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\End          'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\S-PageUp     'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\S-PageDown   'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\S-Home       'treeview-select-node-delay)
;  (define-key *treeview-fix-map* #\S-End        'treeview-select-node-delay)
  (define-key *treeview-fix-map* #\C-PageUp     'treeview-nop)
  (define-key *treeview-fix-map* #\C-PageDown   'treeview-nop)
  (define-key *treeview-fix-map* #\C-Home       'treeview-nop)
  (define-key *treeview-fix-map* #\C-End        'treeview-nop)
  (define-key *treeview-fix-map* #\S-C-PageUp   'treeview-nop)
  (define-key *treeview-fix-map* #\S-C-PageDown 'treeview-nop)
  (define-key *treeview-fix-map* #\S-C-Home     'treeview-nop)
  (define-key *treeview-fix-map* #\S-C-End      'treeview-nop))

(defvar *treeview-map* nil
 "treeview keymap (�T���v��)�B
treeview ���C�u�������ł͎g�p���Ă��Ȃ����A���C�u�������g�p���鑤����
copy-keymap ���Ƃ��ėp�����邱�Ƃ�z�肵�ėp�ӂ��Ă���B")
(unless *treeview-map*
  (setq *treeview-map* (make-keymap))
  ;;
  (define-key *treeview-map* '(#\C-c #\C-f) 'open-filer)
;  (define-key *treeview-map* #\TAB 'treeview-focus-editor)
  (define-key *treeview-map* #\TAB 'treeview-other-treeview-window)
;  (define-key *treeview-map* #\C-g 'treeview-focus-editor)
  (define-key *treeview-map* #\C-g 'quit)
  (define-key *treeview-map* #\Apps 'treeview-std-track-popup-menu)
  (define-key *treeview-map* #\C-l 'treeview-recenter)
  ;;
  (define-key *treeview-map* '(#\C-x #\o) 'treeview-other-window)
  (define-key *treeview-map* '(#\C-x #\p) 'treeview-move-previous-window)
  (define-key *treeview-map* '(#\C-x #\0) 'treeview-close)
  (define-key *treeview-map* '(#\C-x #\1) 'treeview-open)
  (define-key *treeview-map* '#\C-: 'treeview-toggle-open)
  ;;
  (define-key *treeview-map* #\< 'treeview-hscroll-window-left)
  (define-key *treeview-map* #\> 'treeview-hscroll-window-right)
  ;;
  (define-key *treeview-map* '(#\C-c #\w #\t) 'treeview-setpos-top)
  (define-key *treeview-map* '(#\C-c #\w #\b) 'treeview-setpos-bottom)
  (define-key *treeview-map* '(#\C-c #\w #\l) 'treeview-setpos-left)
  (define-key *treeview-map* '(#\C-c #\w #\r) 'treeview-setpos-right)
  (define-key *treeview-map* '(#\C-c #\w #\w) 'treeview-setpos-rotate)
  ;;
  (define-key *treeview-map* '(#\C-x #\?) 'treeview-describe-key-briefly))

;; TreeView ���������݂��Ă��Acall-back function �͂ЂƂ����ݒ�ł��Ȃ����H
(defun treeview-set-std-keydown-callback ()
  "treeview ���C�u�����ŕW���I�ɗp���� keydown-callback�B
keydown-callback �𑼂̂��̂ɕύX���邱�Ƃ͑z�肵�Ă��Ȃ��B"
  (let (fix-keymap-symbol keymap-symbol key x)
    (treeview-keydown-callback
     #'(lambda (hitem vkey flag)
         (with-app ((treeview-get-active-app-id))
           (setq fix-keymap-symbol (treeview-data-get 'treeview::fix-keymap-symbol))
           (setq keymap-symbol (treeview-data-get 'treeview::keymap-symbol))
           (unless (keymapp (treeview-data-get 'treeview::keydown-callback-keymap))
             (treeview-data-set 'treeview::keydown-callback-keymap (symbol-value keymap-symbol))
             (treeview-data-set 'treeview::keydown-callback-key-str ""))
           (when (setq key (win-user:vkey-to-key vkey))
             (run-hooks 'ed::*pre-command-hook*)
             (setq x (lookup-keymap (symbol-value fix-keymap-symbol) key))
             (if x
                 ;; fix-keymap �ɊY��
                 (progn
                   (treeview-data-set 'treeview::keydown-callback-keymap nil)
                   (treeview-data-set 'treeview::keydown-callback-key-str "")
                   (treeview-message "[fix] ~A" (key-to-string key))
                   (when (and (fboundp x) (commandp x))
                     (setq ed::*last-command* ed::*this-command*)
                     (setq ed::*this-command* x)
                     (call-interactively x)
                     (run-hooks 'ed::*post-command-hook*)))
               ;; fix-keymap �ɔ�Y��
               (progn
                 (setq x (lookup-keymap (treeview-data-get 'treeview::keydown-callback-keymap) key))
                 (if (keymapp x)
                     (progn
                       (if (string= (treeview-data-get 'treeview::keydown-callback-key-str) "")
                           (treeview-data-set 'treeview::keydown-callback-key-str (key-to-string key))
                         (treeview-data-set 'treeview::keydown-callback-key-str
                                            (concat (treeview-data-get 'treeview::keydown-callback-key-str)
                                                    " " (key-to-string key))))
                       (treeview-message "~A-" (treeview-data-get 'treeview::keydown-callback-key-str))
                       (treeview-data-set 'treeview::keydown-callback-keymap x))
                   (progn
                     (if (string/= (treeview-data-get 'treeview::keydown-callback-key-str) "")
                         (progn
                           (treeview-data-set 'treeview::keydown-callback-key-str
                                              (concat (treeview-data-get 'treeview::keydown-callback-key-str)
                                                      " " (key-to-string key)))
                           (treeview-message "~A" (treeview-data-get 'treeview::keydown-callback-key-str)))
                       (message " "))
                     (treeview-data-set 'treeview::keydown-callback-keymap nil)
                     (when (and (fboundp x) (commandp x))
                       (setq ed::*last-command* ed::*this-command*)
                       (setq ed::*this-command* x)
                       (call-interactively x)
                       (refresh-screen)
                       (do-events)
                       (run-hooks 'ed::*post-command-hook*))))))))))))

(require "keymap")
(defun treeview-describe-bindings ()
  "treeview �E�B���h�E�ł̃L�[�o�C���f�B���O�ꗗ��\������B
�u�Œ�o�C���f�B���O�v�u�o�C���f�B���O�v�u�C���N�������^���T�[�`�o�C���f�B
���O�v�� 3 ��ނ�\������B"
  (interactive)
  (let ((shadow nil)
        (fix-keymap (symbol-value (treeview-data-get 'treeview::fix-keymap-symbol)))
        (keymap (symbol-value (treeview-data-get 'treeview::keymap-symbol))))
    (long-operation
      (treeview-message "Building binding list...")
      (with-output-to-temp-buffer ("*Help*")
        (format t "~A Fix Bindings:~%key~20Tbinding~%---~20T-------~%"
                (treeview-data-get 'treeview::display-name))
        (ed::describe-bindings-1 "" fix-keymap nil)
        (push fix-keymap shadow)
        (format t "~%~A Bindings:~%key~20Tbinding~%---~20T-------"
                (treeview-data-get 'treeview::display-name))
        (ed::describe-bindings-1 "" keymap shadow)
        (format t "~%~A I-search Bindings:~%key~20Tbinding~%---~20T-------"
                (treeview-data-get 'treeview::display-name))
        (ed::describe-bindings-1 "" *treeview-isearch-map* nil)
        (goto-char 0))
      (refresh-screen)
      (treeview-message "Building binding list...done"))))

;; �w���v (help.l)
(defun treeview-describe-key-briefly (key &optional arg)
  "treeview �E�B���h�E�ł́A�w�肳�ꂽ�L�[�̃o�C���h����\������B"
  (interactive
      (list
       (let (key one-key (keymap (symbol-value (treeview-data-get 'treeview::keymap-symbol))) x (key-str ""))
         (loop
           (treeview-focus-editor)
           (treeview-minibuffer-prompt "Describe key briefly: ~A" key-str)
           (setq one-key (read-char *keyboard*))
           (push one-key key)
           (when (lookup-keymap (symbol-value (treeview-data-get 'treeview::fix-keymap-symbol)) one-key)
             (setq key (list one-key))
             (return))
           (setq x (lookup-keymap keymap one-key))
           (if (keymapp x)
               (progn
                 (setq key-str (concat key-str (key-to-string one-key) " "))
                 (setq keymap x))
             (return)))
         (minibuffer-message "")
         (nreverse key))
       nil))
  (let (command)
    (if (setq command (lookup-keymap (symbol-value (treeview-data-get 'treeview::fix-keymap-symbol)) key))
        (progn
          (setq key (key-to-string key))
          (cond
           (arg
            (save-excursion
              (insert (format nil "~a: [fix] ~a (~a)"
                              (treeview-data-get 'treeview::display-name) key command))))
           (t
            (treeview-message "[fix] ~a runs the command ~A" key command))))
      (progn
        (setq command (lookup-keymap (symbol-value (treeview-data-get 'treeview::keymap-symbol)) key))
        (setq key (key-to-string key))
        (cond ((null command)
               (treeview-message "~a is not bound" key))
              (arg
               (save-excursion
                 (insert (format nil "~a: ~a (~a)"
                                 (treeview-data-get 'treeview::display-name) key command))))
              (t
               (treeview-message "~a runs the command ~A" key command)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mouse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; click �̏������I�����Ă��� rclick �����삷��悤��
(defvar *treeview-interval-click* 0.01
  "treeview ��ō��N���b�N���삳���邽�߂� interval �^�C���B")
(defvar *treeview-interval-dblclk* 0.01
  "treeview ��ō��_�u���N���b�N���삳���邽�߂� interval �^�C���B")
(defvar *treeview-interval-rclick* 0.1
  "treeview ��ŉE�N���b�N���삳���邽�߂� interval �^�C���B
�E�N���b�N���ɁA�ÖٓI�ɐ�ɍ��N���b�N����������邽�߂ɁA
*treeview-interval-rclick* �̒l�́A*treeview-interval-click*�A
*treeview-interval-dblclk* ����������x�傫���l(���� interval)�łȂ����
�Ȃ�Ȃ��B")

(defun click (&optional x y)
  "�}�E�X�ʒu�ɑ΂��č��N���b�N����𔭐�������B
xyzzy ��Ɍ��炸�A�N���b�N����͔�������B"
  (let ((po (winapi::make-POINT)))
    (winapi::GetCursorPos po)
    (when (or x y)
      (winapi::SetCursorPos (or x (winapi::POINT-x po))
                            (or y (winapi::POINT-y po))))
    (winapi:mouse_event winapi:MOUSEEVENTF_LEFTDOWN 0 0 0 0)
    (winapi:mouse_event winapi:MOUSEEVENTF_LEFTUP 0 0 0 0)
    (when (or x y)
      (winapi::SetCursorPos (winapi::POINT-x po)
                            (winapi::POINT-y po)))
    (refresh-screen)))

(defun treeview-set-std-click-callback ()
  "treeview ���C�u�����ŕW���I�ɗp���� ���N���b�N�R�[���o�b�N�֐��B
���̂��̂ɕύX���邱�Ƃ͑z�肵�Ă��Ȃ��B"
  (let (pre-time pre-hitem time)
    (treeview-click-callback
     #'(lambda (hitem)
         (setq time (get-internal-real-time))
         (with-app ((treeview-treeview-id-get-app-id (treeview-get-mouse-treeview-id)))
           ;; treeview �t�H�[�J�X���ɍs��
           (treeview-focus-treeview)
           (setq hitem (treeview-hittest))
           (when (treeview-hitem-valid-p hitem)
             (treeview-select-item hitem))
           (let* (func-gen func)
             (when (and (setq func-gen (treeview-data-get 'treeview::implicit-func-gen))
                        (setq func (funcall func-gen hitem)))
               (stop-timer func)
               (start-timer *treeview-interval-click* func t))))))))
(defun treeview-set-std-dblclk-callback ()
  "treeview ���C�u�����ŕW���I�ɗp���� ���_�u���N���b�N�R�[���o�b�N�֐��B
���̂��̂ɕύX���邱�Ƃ͑z�肵�Ă��Ȃ��B"
  (treeview-dblclk-callback
   #'(lambda (hitem)
       (with-app ((treeview-treeview-id-get-app-id (treeview-get-mouse-treeview-id)))
         (setq hitem (treeview-hittest))
         (when (treeview-hitem-valid-p hitem)
           (treeview-select-item hitem))
         (let* (func-gen func)
           (when (and (setq func-gen (treeview-data-get 'treeview::explicit-func-gen))
                      (setq func (funcall func-gen hitem)))
             (stop-timer func)
             (start-timer *treeview-interval-dblclk* func t)))))))
(defun treeview-set-std-rclick-callback ()
  "treeview ���C�u�����ŕW���I�ɗp���� �E�N���b�N�R�[���o�b�N�֐��B
�E�N���b�N���ꂽ�ꍇ�ɂ́A���N���b�N�𔭐������A��ɍ��N���b�N���������s���A
���̌�E�N���b�N����Ƃ��ă|�b�v�A�b�v���j���[��\������B
treeview-set-std-rclick-callback �𑼂̂��̂ɕύX���邱�Ƃ͑z�肵�Ă��Ȃ��B"
  (treeview-rclick-callback
   #'(lambda (hitem)
       ; ���N���b�N���܂����������A�������s��
       (click)
       (with-app ((treeview-treeview-id-get-app-id (treeview-get-mouse-treeview-id)))
         (setq hitem (treeview-hittest))
         (let* (func-gen func)
           (when (setq func
                       (let* ((popup-menu-gen (treeview-data-get 'treeview::menu-gen))
                              (popup-menu (and popup-menu-gen (funcall popup-menu-gen hitem))))
                         (when (menup popup-menu)
                           #'(lambda ()
                               (track-popup-menu popup-menu :button2)))))
             (stop-timer func)
             (start-timer *treeview-interval-rclick* func t)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-std-track-popup-menu (&optional hitem)
  "treeview ���C�u�����ŕW���I�ɗp����|�b�v�A�b�v���j���[�R�}���h�B
�E�N���b�N�R�[���o�b�N�֐�������Ă΂��B"
  (interactive)
  (with-app ((treeview-treeview-id-get-app-id (treeview-get-treeview-id)))
    (unless hitem
      (setq hitem (treeview-get-selected-item)))
    (let* ((popup-menu-gen (treeview-data-get 'treeview::menu-gen))
           (popup-menu (and popup-menu-gen (funcall popup-menu-gen hitem))))
      (when (menup popup-menu)
        (track-popup-menu popup-menu)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; treeview �z�u�ʒu�ύX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-setpos-top ()
  "treeview �̈ʒu����ɐݒ肷��B"
  (interactive)
  (treeview-setpos XPIS_TOP))
(defun treeview-setpos-bottom ()
  "treeview �̈ʒu�����ɐݒ肷��B"
  (interactive)
  (treeview-setpos XPIS_BOTTOM))
(defun treeview-setpos-left ()
  "treeview �̈ʒu�����ɐݒ肷��B"
  (interactive)
  (treeview-setpos XPIS_LEFT))
(defun treeview-setpos-right ()
  "treeview �̈ʒu���E�ɐݒ肷��B"
  (interactive)
  (treeview-setpos XPIS_RIGHT))
(defun treeview-setpos-rotate ()
  "treeview �̈ʒu������E���̏��ɕύX����B"
  (interactive)
  (let ((pos-list (list XPIS_LEFT XPIS_TOP XPIS_RIGHT XPIS_BOTTOM)) pos)
    (setq pos (cadr (member (treeview-data-get 'treeview::window-position) pos-list)))
    (unless pos
      (setq pos XPIS_LEFT))
    (treeview-setpos pos)))

(defun treeview-popup-menu-position ()
  "���݂� app-id �� treeview �̈ʒu��ύX����|�b�v�A�b�v���j���[�𐶐�����B"
  (let ((menu (create-popup-menu 'position))
        (app-id *treeview-app-id*))
    (add-menu-item menu 'treeview-setpos-top "��(&T)"
     #'(lambda () (interactive) (with-app (app-id) (treeview-setpos-top)))
     #'(lambda ()
         (with-app (app-id)
           (and (eql (treeview-data-get 'treeview::window-position) XPIS_TOP) :check))))
    (add-menu-item menu 'treeview-setpos-bottom "��(&B)"
     #'(lambda () (interactive) (with-app (app-id) (treeview-setpos-bottom)))
     #'(lambda ()
         (with-app (app-id)
           (and (eql (treeview-data-get 'treeview::window-position) XPIS_BOTTOM) :check))))
    (add-menu-item menu 'treeview-setpos-left "��(&L)"
     #'(lambda () (interactive) (with-app (app-id) (treeview-setpos-left)))
     #'(lambda ()
         (with-app (app-id)
           (and (eql (treeview-data-get 'treeview::window-position) XPIS_LEFT) :check))))
    (add-menu-item menu 'treeview-setpos-right "�E(&R)"
     #'(lambda () (interactive) (with-app (app-id) (treeview-setpos-right)))
     #'(lambda ()
         (with-app (app-id)
           (and (eql (treeview-data-get 'treeview::window-position) XPIS_RIGHT) :check))))
    menu))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window size
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-data-save-window-size ()
  "treeview �� window �T�C�Y��ۑ�����B
�ʒu���㉺�̏ꍇ�͍������A���E�̏ꍇ�͕���ۑ�����B"
  (when (treeview-exist-p)
    (let ((pos (treeview-data-get 'treeview::window-position)))
      (cond
       ((find pos (list XPIS_LEFT XPIS_RIGHT))
        (treeview-data-set 'treeview::window-width
                           (win-user::get-wwindow-width (treeview-get-hwnd))))
       ((find pos (list XPIS_TOP XPIS_BOTTOM))
        (treeview-data-set 'treeview::window-height
                           (win-user::get-wwindow-height (treeview-get-hwnd))))))))

(defun treeview-data-load-window-size ()
  "treeview �� window �T�C�Y���A�ۑ����Ă������T�C�Y�ɏ]���ύX����B"
  (when (treeview-exist-p)
    (let ((pos (treeview-data-get 'treeview::window-position)))
      (cond
       ((find pos (list XPIS_LEFT XPIS_RIGHT))
        (treeview-setsize
         (treeview-data-get 'treeview::window-width *treeview-window-size-default*)
         *treeview-window-size-min* 10000 1))
       ((find pos (list XPIS_TOP XPIS_BOTTOM))
        (treeview-setsize
         (treeview-data-get 'treeview::window-height *treeview-window-size-default*)
         *treeview-window-size-min* 10000 1))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window display style
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-effect-window-display-style-on-create ()
  "treeview �쐬�� xyzzy �̓����ɂ��̂܂ܕ\�����Ȃ��ꍇ�̂��߂� window ����B"
  (when (treeview-exist-p)
    (case (treeview-data-get 'treeview::window-display-style)
      (:xyzzy-position
       (win-user::enlarge-xyzzy-by-wwindow-size
        (treeview-get-hwnd)
        (treeview-data-get 'treeview::window-position)
        t))
      (:fixed-editor
       (win-user::enlarge-xyzzy-by-wwindow-size
        (treeview-get-hwnd)
        (treeview-data-get 'treeview::window-position)
        nil)))))

(defun treeview-effect-window-display-style-on-delete ()
  "xyzzy �̓����ɂ��̂܂ܕ\�����Ă��Ȃ��ꍇ�� treeview ���폜�� window ����B"
  (when (treeview-exist-p)
    (case (treeview-data-get 'treeview::window-display-style)
      (:xyzzy-position
       (win-user::shrink-xyzzy-by-wwindow-size
        (treeview-get-hwnd)
        (treeview-data-get 'treeview::window-position)
        t))
      (:fixed-editor
       (win-user::shrink-xyzzy-by-wwindow-size
        (treeview-get-hwnd)
        (treeview-data-get 'treeview::window-position)
        nil)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-data-load-color ()
  "�ݒ肩�當���F�E�w�i�F���擾���Atreeview �ɔ��f������B"
  (let (rgb color-name)
    (when (treeview-exist-p)
      ;; text-color
      (if (treeview-data-get 'treeview::color-text-manual-p)
          (progn
            (cond
             ((numberp (setq rgb (treeview-data-get 'treeview::color-text)))
              (treeview-set-text-color (ed::color-rgb2bgr rgb)))
             ((stringp (setq color-name (treeview-data-get 'treeview::color-text)))
              (setq rgb (cdr (assoc color-name ed::*color-all-colors-name-alist*
                                    :test 'string=)))))
            (when rgb
              (treeview-set-text-color (ed::color-rgb2bgr rgb))))
        (treeview-set-text-color -1))
      ;; bk-color
      (if (treeview-data-get 'treeview::color-bk-manual-p)
          (progn
            (cond
             ((numberp (setq rgb (treeview-data-get 'treeview::color-bk)))
              (treeview-set-bk-color (ed::color-rgb2bgr rgb)))
             ((stringp (setq color-name (treeview-data-get 'treeview::color-bk)))
              (setq rgb (cdr (assoc color-name ed::*color-all-colors-name-alist*
                                    :test 'string=)))))
            (when rgb
              (treeview-set-bk-color (ed::color-rgb2bgr rgb))))
        (treeview-set-bk-color -1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-data-load-font ()
  "�ݒ肩��t�H���g�ݒ���擾���Atreeview �ɔ��f������B"
  (when (treeview-exist-p)
    (treeview-font-set
     :font-facename (and (treeview-data-get 'treeview::font-facename-manual-p)
                         (treeview-data-get 'treeview::font-facename))
     :font-height (if (treeview-data-get 'treeview::font-height-manual-p)
                      (treeview-data-get 'treeview::font-height) 12)
     :font-bold (treeview-data-get 'treeview::font-bold)
     :font-italic (treeview-data-get 'treeview::font-italic)
     :font-underline (treeview-data-get 'treeview::font-underline))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; style
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *treeview-style-list*
  ;  SYMBOL                     REV TAG                            LABEL
  '((winapi:TVS_HASBUTTONS      nil treeview::style-hasbuttons     "���݂�\��(&N)")
    (winapi:TVS_HASLINES        nil treeview::style-haslines       "ײ݂�\��(&L)")
    (winapi:TVS_LINESATROOT     nil treeview::style-linesatroot    "ײ݁E���݂�ٰĂ���\��(&R)")
    (winapi:TVS_EDITLABELS      nil treeview::style-editlabels     "���ٕҏW�\(&E)")
    (winapi:TVS_DISABLEDRAGDROP   t treeview::style-enabledragdrop "��ׯ�ޱ�����ۯ�߉�(&D)")
    (winapi:TVS_SHOWSELALWAYS   nil treeview::style-showselalways  "�ق���ɑI��\��(&A)")
    (winapi:TVS_RTLREADING      nil treeview::style-rtlreading     "�E���獶�ɕ\��(&U)")
    (winapi:TVS_NOTOOLTIPS        t treeview::style-tooltips       "°����߂�\��(&S)")
    (winapi:TVS_CHECKBOXES      nil treeview::style-checkboxes     "�����ޯ����\��(&C)")
    (winapi:TVS_TRACKSELECT     nil treeview::style-trackselect    "�ׯ��ڸ�(&T)")
    (winapi:TVS_SINGLEEXPAND    nil treeview::style-singleexpand   "��̂ݓW�J(&G)")
    (winapi:TVS_INFOTIP         nil treeview::style-infotip        "°����ߏ��擾(&I)")
    (winapi:TVS_FULLROWSELECT   nil treeview::style-fullrowselect  "��s�I��\��(ײݕ\��������)(&O)")
    (winapi:TVS_NOSCROLL          t treeview::style-scroll         "�c��۰�(&V)")
    (winapi:TVS_NONEVENHEIGHT   nil treeview::style-nonevenheight  "�ٖ��̍����̐ݒ�(&F)")
    (winapi:TVS_NOHSCROLL         t treeview::style-hscroll        "����۰�(&H)"))
  "treeview �̃X�^�C���̕ۑ��A�K�p�̎��{�A����сA�ݒ�_�C�A���O�̂��߂̏��B")

(defun treeview-data-save-style ()
  "treeview ���猻�݂� sytle �ݒ���擾���A�ۑ�����B"
  (when (treeview-exist-p)
    (let ((current-style (winapi:GetWindowStyle (treeview-get-htree)))
          symbol rev tag label)
      (dolist (x *treeview-style-list*)
        (setq symbol (nth 0 x) rev (nth 1 x) tag (nth 2 x) label (nth 3 x))
        (unless (eq (treeview-data-get tag) :ignore)
          (if (zerop (logand current-style (symbol-value symbol)))
              (treeview-data-set tag (if rev t nil))
            (treeview-data-set tag (if rev nil t))))))))

(defun treeview-data-load-style ()
  "�ݒ肩�� style �ݒ���擾���Atreeview �ɔ��f������B"
  (when (treeview-exist-p)
    (let ((current-style (winapi:GetWindowStyle (treeview-get-htree)))
          symbol rev tag label val)
      (dolist (x *treeview-style-list*)
        (setq symbol (nth 0 x) rev (nth 1 x) tag (nth 2 x) label (nth 3 x))
        (setq val (treeview-data-get tag :ignore))
        (cond
         ((eq val :ignore))
         (val
          (if rev
              (treeview-modify-style (symbol-value symbol) 0 0)
            (treeview-modify-style 0 (symbol-value symbol) 0)))
         (t
          (if rev
              (treeview-modify-style 0 (symbol-value symbol) 0)
            (treeview-modify-style (symbol-value symbol) 0 0))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; indent
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-data-load-indent ()
  "�ݒ肩��C���f���g�ݒ���擾���Atreeview �ɔ��f������B"
  (when (treeview-exist-p)
    (if (treeview-data-get 'treeview::indent-manual-p)
        (if (integerp (treeview-data-get 'treeview::indent))
            (treeview-set-indent (treeview-data-get 'treeview::indent)))
      (treeview-set-indent 0))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; item-height
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-data-load-item-height ()
  "�ݒ肩��A�C�e���̍����ݒ���擾���Atreeview �ɔ��f������B"
  (when (treeview-exist-p)
    (if (treeview-data-get 'treeview::item-height-manual-p)
        (if (integerp (treeview-data-get 'treeview::item-height))
            (treeview-set-item-height (treeview-data-get 'treeview::item-height)))
      (treeview-set-item-height -1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window �ړ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *treeview-other-window-pre-hook* nil
  "treeview-other-window �O hook")
(defvar *treeview-other-window-hook* nil
  "treeview-other-window �� hook")
(defun treeview-other-treeview-window (&optional (arg 1 f) no-error)
  "treeview �E�B���h�E�݂̂�ΏۂƂ��� other-window ������s���B"
  (interactive "p")
  (treeview-other-window arg no-error t))

(defun treeview-other-window (&optional (arg 1 f) no-error treeview-only)
  "treeview �E�B���h�E���܂߂� other-window ������s���B"
  (interactive "p")
  (run-hooks '*treeview-other-window-pre-hook*)
  (let* ((first-window (car (caaddr (current-window-configuration))))
         window-list hwnd-list target-list target current next pos)
    (push first-window window-list)
    (setq next (next-window first-window))
    (while (not (eq first-window next))
      (push next window-list)
      (setq next (next-window next)))
    (setq window-list (nreverse window-list))
    (setq hwnd-list
          (delete 0
                  (mapcar #'(lambda (treeview-id)
                              (with-treeview (treeview-id) (treeview-get-htree)))
                          (treeview-get-treeview-id-list))
                  :test 'eql))
    (if (treeview-get-active-app-id)
        (setq current
              (with-app ((treeview-get-active-app-id))
                (treeview-get-htree)))
      (setq current (selected-window)))
    (when treeview-only
      (setq window-list nil))
    (setq target-list (append window-list hwnd-list))
    (setq pos (position current target-list :test 'eql))
    (when pos
      (setq target-list (cdr (append (subseq target-list pos)
                                     (subseq target-list 0 pos)))))
    (if (plusp arg)
        (dotimes (x arg)
          (setq target (pop target-list)))
      (progn
        (setq target-list (nreverse target-list))
        (dotimes (x (- arg))
          (setq target (pop target-list)))))
    (when (null target)
      (and f (not no-error)
           (error 'range-error :datum arg)))
    (if (windowp target)
        ;; target �� (xyzzy �ł�) window �̏ꍇ
        (progn
          (treeview-focus-editor)
          (set-window target)
          (refresh-screen))
      ;; target �� hwnd �̏ꍇ
      (progn
        ;; hwnd ���擾���Ă��邪�Atreeview-focus-treeview ��p���邽�߂�
        ;; �����đΉ����� treeview-id ���擾���Ȃ������Ƃɂ���
        (with-app ((treeview-treeview-id-get-app-id
                    (dolist (treeview-id (treeview-get-treeview-id-list))
                      (with-treeview (treeview-id)
                        (when (eq target (treeview-get-htree))
                          (return treeview-id)))))
                   t)
          (treeview-focus-treeview)))))
  (run-hooks '*treeview-other-window-hook*))

(defun treeview-move-previous-window (&optional (arg 1 f))
  "treeview �E�B���h�E���܂߂� move-previous-window ������s���B"
  (interactive "p")
  (treeview-other-window (- arg) (null f)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; �ĕ`��
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-refresh-treeview ()
  "treeview ���ĕ`�悷��B"
  (winapi:InvalidateRect (treeview-get-hwnd) 0 0))

(defun treeview-refresh-screen-force ()
  "��ʑS�̂��ĕ`�悷��B"
  (winapi:InvalidateRect 0 0 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab-bar
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-app-bar ()
  "treeview �^�u�o�[��\������B"
  (create-tab-bar 'treeview-app-bar
                  'treeview-app-bar-func)
  (mapc #'(lambda (app-id)
            (with-app (app-id)
              (when (treeview-exist-p)
                (treeview-app-bar-add-item app-id))))
        (reverse *treeview-app-id-list*))
;  (tab-bar-select-item 'treeview-app-bar (car *treeview-app-id-list*))
  )
(define-command-bar 'treeview-app-bar "TreeView(&T)")

(defun treeview-app-bar-func (app-id)
  "treeview �^�u�o�[��I�������ۂ̏����B"
  (let ((treeview-active-p (treeview-get-active-app-id)))
    (with-app (app-id)
      (treeview-focus-treeview)
      (unless treeview-active-p
        (focus-tool-bar)))))

(defun treeview-app-bar-add-item (&optional app-id select)
  "treeview �^�u�o�[�Ǘ����� treeview ��ǉ�����B"
  (unless (tool-bar-exist-p 'treeview-app-bar)
    (treeview-app-bar))
  (unless app-id
    (setq app-id *treeview-app-id*))
  (unless (tab-bar-find-item 'treeview-app-bar app-id)
    (with-app (app-id)
      (let* ((popup-menu-gen (treeview-data-get 'treeview::menu-gen))
             (popup-menu (and popup-menu-gen (funcall popup-menu-gen -1))))
        (tab-bar-add-item 'treeview-app-bar app-id
                          (treeview-data-get 'treeview::display-name (symbol-name app-id))
                          nil
                          popup-menu))))
  (when select
    (tab-bar-select-item 'treeview-app-bar app-id))
  (refresh-screen))
(defun treeview-app-bar-del-item (&optional app-id)
  "treeview �^�u�o�[�Ǘ������� treeview ���폜����B"
  (unless (tool-bar-exist-p 'treeview-app-bar)
    (treeview-app-bar))
  (unless app-id
    (setq app-id *treeview-app-id*))
  (tab-bar-delete-item 'treeview-app-bar app-id)
  ;; ���̂�����Ȃ���TAB�o�[�ɃS�~���c��ꍇ������̂ňȉ�������
;;  (while (tab-bar-delete-item 'treeview-app-bar app-id)
;;    t)
  (refresh-screen))
(defun treeview-app-bar-delete ()
  "treeview �^�u�o�[���폜����B"
  (delete-command-bar 'treeview-app-bar))
(add-hook '*treeview-uninstall-hook* 'treeview-app-bar-delete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun treeview-operation-on-kill-xyzzy ()
  "xyzzy �I�����Ɏ��s���� treeview �����B
�E�E�B���h�E�T�C�Y�ݒ�̕ۑ�
�E�e��f�[�^�̕ۑ�
�Exyzzy �E�B���h�E�ʒu�A�T�C�Y�̏C��"
  (maphash
   #'(lambda (app-id treeview-id)
       (with-app (app-id)
         (when (treeview-exist-p)
           (treeview-data-save-window-size)
           (treeview-data-save-style)
           (treeview-effect-window-display-style-on-delete))))
   *treeview-app-to-treeview-hash*))

(add-hook 'ed::*kill-xyzzy-hook* 'treeview-operation-on-kill-xyzzy)

;;; frame-work.l ends here
;;; -*-Lisp-*-
;;;
;;; This file is part of xyzzy.
;;;

;; ���x���̐���12�ɐݒ�(4, 5, 8, 10, 12, 15�̂ǂꂩ)
(set-number-of-function-bar-labels 12)

;; ���x���̕�����ݒ�
(set-function-bar-label #\F1 "VC�w���v")
(set-function-bar-label #\F2 "�o�b�t�@")
(set-function-bar-label #\F3 "InfoView")
(set-function-bar-label #\F4 "�^�O�W�����v")
(set-function-bar-label #\F5 "������/��")
(set-function-bar-label #\F6 "�s�u���b�N")
(set-function-bar-label #\F7 "�폜")
(set-function-bar-label #\F8 "�R�s�[")
(set-function-bar-label #\F9 "�y�[�X�g")
(set-function-bar-label #\F10 "�G���[")
(set-function-bar-label #\F11 "���G���[")
(set-function-bar-label #\F12 "Redo")

;; Shift+?
(set-function-bar-label #\S-F5 "������/��")
(set-function-bar-label #\S-F6 "�����u���b�N")
(set-function-bar-label #\S-F9 "��`�y�[�X�g")

;; Control+?
(set-function-bar-label #\C-F1 "�w���v")
(set-function-bar-label #\C-F2 "�}�[�N")

;; ���܂�
;; Shift+Control+?
(set-function-bar-label #\S-C-F1 "S-C-F1")
;; Alt+?
(set-function-bar-label #\M-F2 "M-F2")
;; Alt+Control+?
(set-function-bar-label #\C-M-F3 "C-M-F3")
;; Alt+Shift+?
(set-function-bar-label #\S-M-F4 "S-M-F4")
;; Alt+Control+Control+?
(set-function-bar-label #\S-C-M-F5 "S-M-C-F5")

;; nil�ŏ�����
(set-function-bar-label #\M-F2 nil)
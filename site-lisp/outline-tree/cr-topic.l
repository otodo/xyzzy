;;; -*- Mode: Lisp; Package: OUTLINE-TREE2 -*-
;;; cr-topic.l --- outline-tree

;; Copyright (C) 2001-2009 OHKUBO Hiroshi <ohkubo@s53.xrea.com>

;; Author: OHKUBO Hiroshi <ohkubo@s53.xrea.com>
;; Time-stamp: <2009/04/03 14:24:54 +0900>

;;; Code:

(provide "outline-tree/cr-topic")

(require "outline-tree/outline-tree")
(require "outline-tree/cr-topic-internal")
(require "outline-tree/utils")

(in-package "outline-tree2")

;; ���o����̓f�t�H���g�ݒ�
(defvar *outline-tree-create-outline-topic-heading-chars-default*
  "�i(�m[�u�w�y�������������������������E��������|��"
  "�P�ꌩ�o������")
(defvar *outline-tree-create-outline-topic-heading-chars-group-list-default*
  '("�@�A�B�C�D�E�F�G�H�I�J�K�L�M�N�O�P�Q�R�S" "�T�U�V�W�X�Y�Z�[�\�]")
  "�O���[�v���o������")
(defvar *outline-tree-create-outline-topic-heading-skip-regexp-default*
  "[ �@\t]*"
  "�X�L�b�v���K�\��")
(defvar *outline-tree-create-outline-topic-heading-regexp-list-default*
  '("[0-9]+[.�D:�F)�j]"
    "[�O-�X]+[.�D:�F)�j]"
    "[�Z���O�l�ܘZ������\���Q��]+[.�D:�F)�j]")
  "���K�\�����o��")
(defvar *outline-tree-create-outline-topic-heading-regexp-list-case-fold-default*
  nil
  "���K�\���̑啶�������������")
(defvar *outline-tree-create-outline-topic-enable-skip-width-default*
  t
  "���o����͂ŃX�L�b�v�����l��")

(defvar-local outline-tree-create-outline-topic-heading-chars
  (copy-string *outline-tree-create-outline-topic-heading-chars-default*)
  "�o�b�t�@���[�J���F�P�ꌩ�o������")
(defvar-local outline-tree-create-outline-topic-heading-chars-group-list
  (copy-tree *outline-tree-create-outline-topic-heading-chars-group-list-default*)
  "�o�b�t�@���[�J���F�O���[�v���o������")
(defvar-local outline-tree-create-outline-topic-heading-skip-regexp
  (copy-string *outline-tree-create-outline-topic-heading-skip-regexp-default*)
  "�o�b�t�@���[�J���F�X�L�b�v���K�\��")
(defvar-local outline-tree-create-outline-topic-heading-regexp-list
  (copy-tree *outline-tree-create-outline-topic-heading-regexp-list-default*)
  "�o�b�t�@���[�J���F���K�\�����o��")
(defvar-local outline-tree-create-outline-topic-heading-regexp-list-case-fold
  *outline-tree-create-outline-topic-heading-regexp-list-case-fold-default*
  "�o�b�t�@���[�J���F���K�\���̑啶�������������")
(defvar-local outline-tree-create-outline-topic-enable-skip-width
  *outline-tree-create-outline-topic-enable-skip-width-default*
  "�o�b�t�@���[�J���F���o����͂ŃX�L�b�v�����l��")

(let ((variables
       '(outline-tree-create-outline-topic-heading-chars
         outline-tree-create-outline-topic-heading-chars-group-list
         outline-tree-create-outline-topic-heading-skip-regexp
         outline-tree-create-outline-topic-heading-regexp-list
         outline-tree-create-outline-topic-heading-regexp-list-case-fold
         outline-tree-create-outline-topic-enable-skip-width)))
  ;; �q�X�g���ϐ��Ƃ��Đݒ�
  (register-history-variable variables)
  ;; �o�b�t�@���[�J���L��/�����̓���
  (push variables *outline-tree-sync-local-variables-list*))

;; ���o�����
(defun outline-tree-create-outline-topic (root-node)
  (outline-tree-create-outline-topic-internal
   :root-node root-node
   :enable-skip-width outline-tree-create-outline-topic-enable-skip-width
   :heading-skip-regexp outline-tree-create-outline-topic-heading-skip-regexp
   :heading-chars outline-tree-create-outline-topic-heading-chars
   :heading-chars-group-list outline-tree-create-outline-topic-heading-chars-group-list
   :heading-regexp-list outline-tree-create-outline-topic-heading-regexp-list
   :heading-regexp-list-case-fold outline-tree-create-outline-topic-heading-regexp-list-case-fold
   :sub-type :heading-node
   :line-oriented t
   :title-converter nil))
(outline-tree-add-create-outline-function
 'outline-tree-create-outline-topic "**���o����� (�_�C�A���O�ݒ�L)" '(:type-general :line-oriented :sequential)
 "�e�s�̐擪�󔒂̕��A�y�сA�擪�󔒂��������s�����o�������̏o��������
����Č��o������͂��A�A�E�g���C���\�����܂��B

[�A�E�g���C���c���[�ݒ�]-[���o�����] �ŉ�͕��@�̃J�X�^�}�C�Y���\�ł��B

[�A�E�g���C���쐬�֐��̐���]-[�u���o����́v�ݒ肩��] ���j���[����A
���݂̐ݒ�����ɁA���[�U��`�A�E�g���C���쐬�֐��𐶐��ł��܂��B")

;; property-sheet
(outline-tree-add-option-prop-page
 'outline-tree-create-outline-topic
 (let (dialog-base-side dialog-base-height dialog-side dialog-height dialog-size controls)
   ;; ����/���[�J��
   (setq dialog-base-side 4)
   (setq dialog-base-height 4)
   (setq dialog-side dialog-base-side)
   (setq dialog-height dialog-base-height)
   (push `(:button nil "" #x50020007
           ,dialog-side ,dialog-height 238 22) controls)
   (incf dialog-height 6)
   (push `(:button setting-default          "���ʐݒ�(&1)"           #x50000009
           ,(incf dialog-side 4) ,dialog-height 50 14) controls)
   (push `(:button setting-local            "���[�J���ݒ�(&2)"       #x50000009
           ,(incf dialog-side 50) ,dialog-height 62 14) controls)
   (push `(:button setting-local-to-default "���[�J���ݒ聨���ʐݒ�(&3)" #x50000009
           ,(incf dialog-side 62) ,dialog-height 95 14) controls)
   (push `(:button dummy-trigger ""                                  #x50000009
           10000 ,dialog-height 0 0) controls)

   ;; ���o������
   (setq dialog-base-height (+ dialog-base-height 22 4))
   (setq dialog-side dialog-base-side)
   (setq dialog-height dialog-base-height)
   (push `(:button heading-chars-frame "���o��"                     #x50000007
           ,dialog-side ,dialog-height 170 162) controls)

   (incf dialog-side 4)
   (push `(:static heading-chars-str "�P�ꕶ���w��(&S):"              #x50020000
           ,dialog-side ,(incf dialog-height 10) 160 8) controls)
   (push `(:edit heading-chars nil                                      #x508100c0
           ,dialog-side ,(incf dialog-height 10) 160 14) controls)
   (push `(:static heading-chars-group-list-str "�O���[�v�����w��(&G):" #x50020000
           ,dialog-side ,(incf dialog-height 18) 160 8) controls)
   (push `(:edit heading-chars-group-list nil                           #x50a110c4
           ,dialog-side ,(incf dialog-height 10) 160 30) controls)
   (setq dialog-height dialog-base-height)

   ;; ���o�����K�\��
   (setq dialog-base-height (+ dialog-base-height 74))
   (setq dialog-height dialog-base-height)
   (setq dialog-side dialog-base-side)
   (incf dialog-side 4)
   (push `(:static heading-chars-str "���K�\���w��(&R):"              #x50020000
           ,dialog-side ,(incf dialog-height 10) 160 8) controls)
   (push `(:edit heading-regexp-list nil                                        #x50a110c4
           ,dialog-side ,(incf dialog-height 10) 160 60) controls)

   ;;
   (setq dialog-base-height 30)
   (setq dialog-height dialog-base-height)
   (incf dialog-side 172)
   (push `(:static heading-skip-regexp-str "�X�L�b�v���K�\��(&B):"         #x50020000
           ,dialog-side ,(incf dialog-height 10) 64 8) controls)
   (push `(:edit heading-skip-regexp nil                                #x508100c0
           ,dialog-side ,(incf dialog-height 10) 64 14) controls)

   (push `(:button enable-skip-width "�X�L�b�v����\n�l�����ĉ�͂���(&E)" #x50012003
           ,dialog-side ,(incf dialog-height 20) 80 24) controls)

   (push `(:button heading-regexp-list-case-fold "���K�\���̑啶��\n����������ʂ���(&C)" #x50012006
           ,dialog-side ,(incf dialog-height 40) 80 24) controls)

   ;;
   (push `(:button initialize "�f�t�H���g�ݒ��\n�߂�(&I)"             #x50012003
           ,dialog-side ,(incf dialog-height 60) 64 20) controls)

   (setq controls (nreverse controls))
   `(dialog 0 0 260 220
     (:caption "���o�����")
     (:control
      ,@controls)))
 #'(lambda ()
     (let ((local-p (outline-tree-local-variables-local-p
                     'outline-tree-create-outline-topic-heading-regexp-list)))
       (list
        ;; ����/���[�J��
        (cons 'setting-default (not local-p))
        (cons 'setting-local local-p)
        (cons 'dummy-trigger (not local-p))

        ;; �X�L�b�v
        (cons 'heading-skip-regexp
              (outline-tree-encode-escape-sequence
               (cond
                ((symbolp outline-tree-create-outline-topic-heading-skip-regexp)
                 (symbol-value outline-tree-create-outline-topic-heading-skip-regexp))
                ((stringp outline-tree-create-outline-topic-heading-skip-regexp)
                 outline-tree-create-outline-topic-heading-skip-regexp)
                (t ""))))
        (cons 'enable-skip-width
              (cond
               ((symbolp outline-tree-create-outline-topic-enable-skip-width)
                (symbol-value outline-tree-create-outline-topic-enable-skip-width))
               (t
                outline-tree-create-outline-topic-enable-skip-width)))

        ;; ���o��
        (cons 'heading-chars
              (cond
               ((symbolp outline-tree-create-outline-topic-heading-chars)
                (symbol-value outline-tree-create-outline-topic-heading-chars))
               ((stringp outline-tree-create-outline-topic-heading-chars)
                outline-tree-create-outline-topic-heading-chars)
               (t "")))
        (cons 'heading-chars-group-list
              (format nil "~{~A\r\n~}"
                      (cond
                       ((symbolp outline-tree-create-outline-topic-heading-chars-group-list)
                        (symbol-value outline-tree-create-outline-topic-heading-chars-group-list))
                       ((listp outline-tree-create-outline-topic-heading-chars-group-list)
                        outline-tree-create-outline-topic-heading-chars-group-list)
                       (t nil))))

        ;; ���K�\�����X�g
        (cons 'heading-regexp-list
              (format nil "~{~A\r\n~}"
                      (mapcar 'outline-tree-encode-escape-sequence
                              (cond
                               ((symbolp outline-tree-create-outline-topic-heading-regexp-list)
                                (symbol-value outline-tree-create-outline-topic-heading-regexp-list))
                               ((listp outline-tree-create-outline-topic-heading-regexp-list)
                                outline-tree-create-outline-topic-heading-regexp-list)
                               (t nil)))))
        (cons 'heading-regexp-list-case-fold
              (ed::cfs2dialog outline-tree-create-outline-topic-heading-regexp-list-case-fold)))))
 '((dummy-trigger :disable (setting-local-to-default)))
 #'(lambda (data)
     (let (local)
       ;; ����/���[�J��
       (cond ((cdr (assoc 'setting-local data))
              (setq local t)
              (outline-tree-sync-local-variables
               'outline-tree-create-outline-topic-heading-regexp-list local))
             ((cdr (assoc 'setting-local-to-default data))
              (outline-tree-sync-local-variables
               'outline-tree-create-outline-topic-heading-regexp-list local)))
       (cond (local
              (cond
               ((cdr (assoc 'initialize data))
                ;; �X�L�b�v
                (setq outline-tree-create-outline-topic-heading-skip-regexp
                      *outline-tree-create-outline-topic-heading-skip-regexp-default*)
                (setq outline-tree-create-outline-topic-enable-skip-width
                      *outline-tree-create-outline-topic-enable-skip-width-default*)
                ;; ���o������
                (setq outline-tree-create-outline-topic-heading-chars
                      *outline-tree-create-outline-topic-heading-chars-default*)
                (setq outline-tree-create-outline-topic-heading-chars-group-list
                      *outline-tree-create-outline-topic-heading-chars-group-list-default*)
                ;; ���K�\�����X�g
                (setq outline-tree-create-outline-topic-heading-regexp-list
                      *outline-tree-create-outline-topic-heading-regexp-list-default*)
                (setq outline-tree-create-outline-topic-heading-regexp-list-case-fold
                      *outline-tree-create-outline-topic-heading-regexp-list-case-fold-default*))
               (t
                ;; �X�L�b�v
                (setq outline-tree-create-outline-topic-heading-skip-regexp
                      (decode-escape-sequence (cdr (assoc 'heading-skip-regexp data)) t))
                (setq outline-tree-create-outline-topic-enable-skip-width
                      (cdr (assoc 'enable-skip-width data)))
                ;; ���o������
                (setq outline-tree-create-outline-topic-heading-chars
                      (cdr (assoc 'heading-chars data)))
                (setq outline-tree-create-outline-topic-heading-chars-group-list
                      (mapcar #'(lambda (str) (decode-escape-sequence str t))
                              (split-string
                               (substitute-string
                                (cdr (assoc 'heading-chars-group-list data)) "\r\n" "\n") #\LFD)))
                ;; ���K�\�����X�g
                (setq outline-tree-create-outline-topic-heading-regexp-list
                      (mapcar #'(lambda (str) (decode-escape-sequence str t))
                              (split-string
                               (substitute-string
                                (cdr (assoc 'heading-regexp-list data)) "\r\n" "\n") #\LFD)))
                (setq outline-tree-create-outline-topic-heading-regexp-list-case-fold
                      (ed::dialog2cfs (cdr (assoc 'heading-regexp-list-case-fold data)))))))
             (t
              (cond
               ((cdr (assoc 'initialize data))
                ;; �X�L�b�v
                (setq-default outline-tree-create-outline-topic-heading-skip-regexp
                              *outline-tree-create-outline-topic-heading-skip-regexp-default*)
                (setq-default outline-tree-create-outline-topic-enable-skip-width
                              *outline-tree-create-outline-topic-enable-skip-width-default*)
                ;; ���o������
                (setq-default outline-tree-create-outline-topic-heading-chars
                              *outline-tree-create-outline-topic-heading-chars-default*)
                (setq-default outline-tree-create-outline-topic-heading-chars-group-list
                              *outline-tree-create-outline-topic-heading-chars-group-list-default*)
                ;; ���K�\�����X�g
                (setq-default outline-tree-create-outline-topic-heading-regexp-list
                              *outline-tree-create-outline-topic-heading-regexp-list-default*)
                (setq-default outline-tree-create-outline-topic-heading-regexp-list-case-fold
                              *outline-tree-create-outline-topic-heading-regexp-list-case-fold-default*))
               (t
                ;; �X�L�b�v
                (setq-default outline-tree-create-outline-topic-heading-skip-regexp
                              (decode-escape-sequence (cdr (assoc 'heading-skip-regexp data)) t))
                (setq-default outline-tree-create-outline-topic-enable-skip-width
                              (cdr (assoc 'enable-skip-width data)))
                ;; ���o������
                (setq-default outline-tree-create-outline-topic-heading-chars
                              (cdr (assoc 'heading-chars data)))
                (setq-default outline-tree-create-outline-topic-heading-chars-group-list
                              (mapcar #'(lambda (str) (decode-escape-sequence str t))
                                      (split-string
                                       (substitute-string
                                        (cdr (assoc 'heading-chars-group-list data)) "\r\n" "\n") #\LFD)))
                ;; ���K�\�����X�g
                (setq-default outline-tree-create-outline-topic-heading-regexp-list
                              (mapcar #'(lambda (str) (decode-escape-sequence str t))
                                      (split-string
                                       (substitute-string
                                        (cdr (assoc 'heading-regexp-list data)) "\r\n" "\n") #\LFD)))
                (setq-default outline-tree-create-outline-topic-heading-regexp-list-case-fold
                              (ed::dialog2cfs (cdr (assoc 'heading-regexp-list-case-fold data)))))))))
     ;; �A�E�g���C�����ŐV�łȂ��悤�ɐݒ�
     (save-excursion
       (dolist (buffer (buffer-list))
         (set-buffer buffer)
         (when (eq (outline-tree-get-create-outline-function-by-buffer buffer)
                   'outline-tree-create-outline-topic)
           (setq outline-tree-outline-modified nil))))))

;;; cr-topic.l ends here
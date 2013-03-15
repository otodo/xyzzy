;;; -*- Mode: Lisp; Package: OUTLINE-TREE2 -*-
;;; output.l --- outline-tree

;; Copyright (C) 2001-2007 OHKUBO Hiroshi <ohkubo@s53.xrea.com>

;; Author: OHKUBO Hiroshi <ohkubo@s53.xrea.com>
;; Time-stamp: <2007/02/11 11:06:22 +0900>

;;; Code:

(provide "outline-tree/output")

(require "buf2html")
(require "outline-tree/outline-tree")

(in-package "outline-tree2")

(defvar *outline-tree-output-directory* nil)
(defvar *outline-tree-output-buffer* "*OutlineTree OUTPUT*")

(defun outline-tree-set-output-buffer ()
  (save-excursion
    (let (output-buffer)
      (setq output-buffer (get-buffer-create *outline-tree-output-buffer*))
      (set-buffer output-buffer)
      (erase-buffer (selected-buffer))
      (make-local-variable 'ed::need-not-save)
      (setq ed::need-not-save t)
      output-buffer)))

(defun outline-tree-output-get-output-dir ()
  (or *outline-tree-output-directory*
      (and (get-buffer-file-name)
           (directory-namestring (get-buffer-file-name)))
      (default-directory)))

(defun outline-tree-output-pre-check (&optional target-buffer)
  "�ŐV�̃A�E�g���C�������݂��Ă��邩�m�F���A�쐬�E�X�V�𑣂�"
  (cond ((not (outline-tree-exist-outline-p-by-buffer target-buffer))
         (when (yes-or-no-p "<~A> �o�b�t�@�ɂ̓A�E�g���C�������݂��܂���B~%�A�E�g���C�����쐬���܂����H"
                            (buffer-name target-buffer))
           (outline-tree-create-outline-by-buffer target-buffer)
           t))
        ((not (outline-tree-latest-outline-p-by-buffer target-buffer))
         (when (yes-or-no-p "<~A> �o�b�t�@�̃A�E�g���C�����ŐV�ł͂���܂���B~%�A�E�g���C�����X�V���܂����H"
                            (buffer-name target-buffer))
           (outline-tree-create-outline-by-buffer target-buffer)
           t))
        (t
         t)))

(defun outline-tree-output-confirm-output-files-p (files &optional directory)
  "�t�@�C�����o�͂��Ă悯��� non-nil�A�����łȂ���� nil ��Ԃ�"
  (let (exist-output-files)
    (dolist (file files)
      (if (file-exist-p (merge-pathnames file directory))
          (push file exist-output-files)))
    (not (and exist-output-files
              (not (no-or-yes-p "~A~{        ~A~%~}�t�@�C�������݂��Ă��܂��B~%�㏑�����Ă���낵���ł����H"
                                (if directory (format nil "~A �t�H���_��~%" directory) "")
                                (nreverse exist-output-files)))))))

;;; output.l ends here
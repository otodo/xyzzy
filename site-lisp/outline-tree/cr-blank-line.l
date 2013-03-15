;;; -*- Mode: Lisp; Package: OUTLINE-TREE2 -*-
;;; cr-blank-line.l --- outline-tree

;; Copyright (C) 2001-2009 OHKUBO Hiroshi <ohkubo@s53.xrea.com>

;; Author: OHKUBO Hiroshi <ohkubo@s53.xrea.com>
;; Time-stamp: <2009/04/03 14:25:54 +0900>

;;; Code:

(provide "outline-tree/cr-blank-line")

(require "outline-tree/outline-tree")

(in-package "outline-tree2")

;; ��s��؂�
(defun outline-tree-create-outline-blank-line (root-node)
  (let (from to title-range title)
    (goto-char (point-min))
    (setq from (point))
    (while (scan-buffer "^[ \t]*\\(.+?\\)[ \t]*$" :regexp t)
      (goto-char (match-beginning 1))
      (setq title (concat (format nil "~V@{~A~:*~}" (current-column) " ") (match-string 1)))
      (setq title-range (cons (match-beginning 0) (match-end 1)))
      (if (and (scan-buffer "^[ \t]*$" :regexp t)
               (scan-buffer "^[ \t]*[^ \t\n]" :regexp t))
          (setq to (point))
        (setq to nil))
      (outline-tree-insert-range-node
       title root-node
       :title-range title-range :whole-range (cons from to))
      (unless to
        (return))
      (setq from to))))
(outline-tree-add-create-outline-function
 'outline-tree-create-outline-blank-line "��s��؂�" '(:type-general :blank-line-oriented :sequential)
 "��s�ŋ�؂�ꂽ�e�L�X�g�� 1 �m�[�h�Ƃ��ď������܂��B
�A�E�g���C����ɂ͐擪�s��\�����܂��B")

;;; cr-blank-line.l ends here
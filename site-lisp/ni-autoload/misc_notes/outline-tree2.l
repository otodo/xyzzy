;;; -*- Mode: Lisp; Package: user -*-
;;; outline-tree2.l --- outline-tree.l �� ni-autoload �p���W���[��

;; Copyright (C) 2001-2005 OHKUBO Hiroshi <ohkubo@s53.xrea.com>

;; Author: OHKUBO Hiroshi <ohkubo@s53.xrea.com>
;; Time-stamp: <2005/12/23 22:15:52 +0900>

;; Description:
;;
;;     outline-tree.l �� ni-autoload �p���W���[��
;;

; �N��������g�p���邽�� require �œǂݍ���
(require "outline-tree/outline-tree")

; autoload, config �t�@�C����ǂݍ���ł���
(outline-tree2::outline-tree-autoload)
(outline-tree2::outline-tree-config-load)

;;; outline-tree2.l ends here
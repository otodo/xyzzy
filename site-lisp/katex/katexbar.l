;;; -*- Lisp; syntax: Common-Lisp -*-
;;; Yet Another tex-mode for xyzzy - //花鳥//
;;; katex.l, v 1.67.1.7
;;; fixed by Maeda Manabu
;;; Last fixed  "Mon Aug 18 2003 20:37:22 +0900"

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Software Foundation Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

; toolbarを使用する場合は、~/.xyzzyもしくはsitinit.lに以
; 下を追加してください。
;    (setq *KaTeX-use-toolbar* t)
;
; toolbarの絵を変更する場合は、~/.xyzzyもしくはsitinit.lに以
; 下を追加してください。
;    (setq *KaTeX-toolbar-bitmap* [filename])
; [filename] は、絵が入っているファイルのファイル名
; position 0 がtypesetの絵に、
; position 1 がpreviewの絵になるようにしてください。

(in-package "elisp")

(defvar *KaTeX-use-toolbar* nil)
(defvar *KaTeX-toolbar-bitmap* (merge-pathnames "site-lisp/katex/KaTeX-toolbar.bmp" (si:system-root)))

(defun KaTeX-check-KaTeX-mode-p ()
  (eq buffer-mode 'katex-mode))

(defun KaTeX-typeset-menu-after-mode-check (arg &optional char)
  (when (KaTeX-check-KaTeX-mode-p)
    (KaTeX-typeset-menu arg char)))

(defun KaTeX-tool-bar ()
  (create-tool-bar
   'KaTeX-tool-bar
   *KaTeX-toolbar-bitmap*
   '(("LaTeX" 0 (lambda () (interactive) (KaTeX-typeset-menu-after-mode-check nil #\j)))
     ("Preview" 1 (lambda () (interactive) (KaTeX-typeset-menu-after-mode-check nil #\p)))
    )))

(defun KaTeX-delete-tool-bar ()
  (interactive)
  (when (find-command-bar 'elisp::KaTeX-tool-bar)
    (delete-command-bar 'elisp::KaTeX-tool-bar)))

(unless (find-command-bar 'elisp::KaTeX-tool-bar)
  (if *KaTeX-use-toolbar*
      (define-command-bar 'elisp::KaTeX-tool-bar "かてふ(&K)")))

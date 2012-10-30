;;; -*- Mode: Lisp; Package: EDITOR -*-
;;;
;;; This file is not part of xyzzy.
;;;
; $Id: migemo.l,v 1.3 2005/11/27 15:06:44 torihat Exp $
;
; migemo.l
;
; by Masashi Hattori
;
; ■ migemo.l とは？
; 
; 	村岡さんの"Migemo DLL"を使ってローマ字のままインクリメンタルサー
; 	チできるようにするものです。
; 
; 	Migemoについての詳細は、以下のサイトをご覧下さい。
; 	
; 	Migemo 本家
; 	http://migemo.namazu.org/
; 	
; 	Migemo DLL（村岡さん）
; 	http://www.kaoriya.net/
; 
; ■ 動作環境
; 
; 	xyzzy-0.2.2.225以降
; 
; 	Migemo DLL 1.1以降
; 	（上記村岡さんのサイトからダウンロードして下さい）
; 
; ■ インストール
; 
; 	1. migemo.l を site-lisp などに置いてバイトコンパイルして下さい。
; 	2. migemo.dllはxyzzy.exeと同じ場所（もしくはパスの通ったところ）
; 	   に置いて下さい。
; 	3. dict以下の辞書ファイルは、xyzzy/dictに置いて下さい。（違う場所
; 	   に置いた場合は、*migemo-dict-file* に "migemo-dict"へのパスを
; 	   設定してください）
; 	4. .xyzzyとかに以下のように書いてxyzzyを再起動してください。
; 
; 		(require "migemo")
; 
; ■動かし方
; 
; 	"M-x migemo-toggle" または、"C-c m t" して、ステータスバーに
; 	"Migemo on."と表示されるとmigemoでの検索モードに入っています。
; 
; 	設定がうまくいっていれば、"C-s"、"C-r"で、ローマ字のままインクリ
; 	メンタルサーチができるはずです。
; 	（初回の検索時にはDLLを呼んで辞書を読み込むので少し時間がかかり
; 	ます。また、xyzzyの終了時にも少し余分に時間がかかります）
; 	
; 	最初からmigemoモードにするには、.xyzzyとかで上記の設定の後に、
; 
; 		(migemo-toggle t)
; 
; 	と書いてください。
; 
; 	[その他のキーバインド]
; 	C-c m t		検索にmigemoを使うかどうかをトグル
; 	C-c m o		migemo.dllをロードして辞書を読み込む
; 				（通常は必要ありません）
; 	C-c m c		migemo.dllをアンロードする。
; 				（通常は必要ありません）
; 
; ■ 問題点
; 
; 	・DLLの呼び出しがいい加減なので危険かもしれません。
; 	・isearch.lの関数を上書きします。
; 	・私は migemo を使ったことがないので、想像で適当に作っています。
; 	・その他、まだあまり使ってないのでよくわかりませんが、たぶんいろ
; 	  いろあるでしょう。
; 
; ■ 謝辞
; 
; 	Migemo DLLを作成され、使用を快諾して下さった村岡さんに感謝いたします。
; 
; ■ 変更履歴
; 
; 	[2005/11/27]
; 		xyzzy Wikiの質問箱10(NANRIさん、ななし２さん)を取り込み。(__)
; 	[2005/11/25]
; 		ライセンスを適用とか
; 	[2003/06/18]
; 		バグ取り
; 	[2002/05/17]
; 		C/Migemo-1.1対応
; 	[2002/03/14]
; 		xyzzy-0.2.2.225にへなちょこ対応。(__)
; 	[2002/02/19]
; 		offの時に検索を正規表現でしないようにした
; 	[2002/02/11]
; 	 	初版
; 
;■ License
;
; migemo.l
;
; Copyright (C) 2002-2005 Masashi Hattori
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions
; are met:
; 
; 1. Redistributions of source code must retain the above copyright
;    notice, this list of conditions and the following disclaimer.
; 
; 2. Redistributions in binary form must reproduce the above copyright
;    notice, this list of conditions and the following disclaimer in
;    the documentation and/or other materials provided with the
;    distribution.
; 
; 3. The name of the author may not be used to endorse or promote
;    products derived from this software without specific prior
;    written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
; PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
; STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
; ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE!
; POSSIBILITY OF SUCH DAMAGE.

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "foreign"))

(require "isearch")

(provide "migemo")

(in-package "editor")

(export '(*migemo-dict-file*
	  *migemo-init-hook*
	  migemo-toggle))

(defvar *migemo-dll* "migemo.dll")
(defvar *migemo-dict-file*
  (merge-pathnames "dict/migemo-dict" (si:system-root)))

(defvar *migemo-init-hook* nil)

(defvar *migemo-on* nil)
(defvar *migemo-session* nil)
(defvar *migemo-query-buf* (* 1024 8 8 8)) ; ←めっさ適当

; for migemo_load
(defconstant *migemo-dictid-invalid* 0)
(defconstant *migemo-dictid-migemo* 1)
(defconstant *migemo-dictid-roma2hira* 2)
(defconstant *migemo-dictid-hira2kata* 3)
(defconstant *migemo-dictid-han2zen* 4)

; for migemo-set|get-operator
(defconstant *migemo-opindex-or* 0)
(defconstant *migemo-opindex-nest-in* 1)
(defconstant *migemo-opindex-nest-out* 2)
(defconstant *migemo-opindex-select-in* 3)
(defconstant *migemo-opindex-select-out* 4)
(defconstant *migemo-opindex-newline* 5)

(defconstant *migemo-set-operator-failed* 0)
(defconstant *migemo-is-not-enabled* 0)

(defvar *migemo-opindex*
  (list (cons *migemo-opindex-or* "\\|")
	(cons *migemo-opindex-nest-in* "\\(")
	(cons *migemo-opindex-nest-out* "\\)")
	(cons *migemo-opindex-newline* "[ \t\n]*")))

(c:define-dll-entry
  (c:void *) migemo-open-func ((c:char *)) *migemo-dll* "migemo_open")
(c:define-dll-entry
  c:void migemo-close-func ((c:void *)) *migemo-dll* "migemo_close")
(c:define-dll-entry
  (c:u_char *) migemo-query-func ((c:void *)
				  (c:u_char *)) *migemo-dll* "migemo_query")
(c:define-dll-entry
  c:void migemo-release-func ((c:void *)
			      (c:u_char *)) *migemo-dll* "migemo_release")
(c:define-dll-entry
  c:int migemo-set-operator-func ((c:void *)
				  c:int
				  (c:u_char *)) *migemo-dll* "migemo_set_operator")
(c:define-dll-entry
  (c:u_char *) migemo-get-operator-func ((c:void *)
					 c:int) *migemo-dll* "migemo_get_operator")
(c:define-dll-entry
  c:int migemo-is-enable-func ((c:void *)) *migemo-dll* "migemo_is_enable")

(defvar *migemo-saved-hook* nil)
(defvar *migemo-saved-regexp* nil)

(defun migemo-toggle (&optional (arg nil sv))
  (interactive "p")
  (toggle-mode '*migemo-on* arg sv)
  (if *migemo-on*
      (progn
	(setq *migemo-saved-hook* *isearch-scanner-hook*)
	(setq *migemo-saved-regexp* *isearch-regexp*)
	(setq *isearch-scanner-hook* #'migemo-query))
    (progn
      (setq *isearch-scanner-hook* *migemo-saved-hook*)
      (setq *isearch-regexp* *migemo-saved-regexp*)))
  (migemo-message (if *migemo-on* "on." "off.")))

(defun migemo-open ()
  (interactive)
  (unless *migemo-session*
    (migemo-message "loading ...")
    (unless *migemo-dict-file*
      (migemo-error "辞書ファイルが設定されていません。"))
    (unless (file-exist-p *migemo-dict-file*)
      (migemo-error (format nil "辞書ファイルがありません: ~S" *migemo-dict-file*)))
    (setq *migemo-session*
	  (migemo-open-func (si:make-string-chunk
			     (map-slash-to-backslash *migemo-dict-file*))))
    (unless (migemo-is-enable-p *migemo-session*)
      (migemo-error "辞書が読み込めません"))
    (migemo-init)
    (migemo-message "loading ... done.")
    (add-hook '*kill-xyzzy-hook* 'migemo-close)))

(defun migemo-message (msg)
  (message "Migemo: ~A" msg))

(defun migemo-error (msg)
  (migemo-close)
  (error "Migemo: ~A" msg))

(defun migemo-is-enable-p (sess)
  (not (equal *migemo-is-not-enabled*
	      (migemo-is-enable-func sess))))

(defun migemo-init ()
  (dolist (op *migemo-opindex*)
    (let ((index (car op))
	  (regex (cdr op))
	  result)
      (setq result
	    (migemo-set-operator-func *migemo-session*
				      index
				      (si:make-string-chunk regex)))
      (when (eq *migemo-set-operator-failed* result)
	(migemo-error (format nil "メタ文字指定エラー: ~S:~S" index result)))))
  (run-hooks '*migemo-init-hook*))

(defun migemo-query (query)
  (let (result
	regexp)
    (when (= (length query) 0)
      (return-from migemo-query ""))
    (setq *isearch-regexp* *migemo-on*)
    (migemo-open)
    (unwind-protect
	(progn
	  (migemo-message "converting ...")
	  (setq result (migemo-query-func *migemo-session*
					  (si:make-string-chunk query)))
	  (setq regexp (si:unpack-string
			(si:make-chunk nil *migemo-query-buf* nil result)
			0))
	  (migemo-message "converting ... done."))
      (when result
	(migemo-release-func *migemo-session* result)))
    (setq regexp (substitute-string regexp "\\]\\*\\+" "\\]\\*\\\\\\+"))
    (setq regexp (substitute-string regexp "\\]\\*\\?" "\\]\\*\\\\\\?"))
    ))

(defun migemo-close ()
  (interactive)
  (when *migemo-session*
    (migemo-message "closing ...")
    (migemo-close-func *migemo-session*)
    (migemo-message "closing ... done.")
    (setq *migemo-session* nil)))

(global-set-key '(#\C-c #\m #\t) 'migemo-toggle)
(global-set-key '(#\C-c #\m #\o) 'migemo-open)
(global-set-key '(#\C-c #\m #\c) 'migemo-close)

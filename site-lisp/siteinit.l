;KaTeX
(push (merge-pathnames "site-lisp/katex" (si:system-root)) *load-path*)
(require "elisp")
(push '("\\.tex$" . elisp::katex-mode) *auto-mode-alist*)
(push '("\\.sty$" . elisp::katex-mode) *auto-mode-alist*)
(autoload 'elisp::katex-mode "katex" t)

; Alt+Ret が使えるようにする
(set-extended-key-translate-table exkey-M-return #\M-RET)

;;; 各種設定
; TeXのコマンド
(setq elisp::tex-command "platex")
;(setq elisp::tex-command "platex -src") ; source specialを使う
(setq elisp::dvi2-command "C:/ptex/dviout/dviout -1")

; 全般的な設定
;(setq elisp::KaTeX-use-AMS-LaTeX t) ; AMS-LaTeXを使う
;(setq elisp::KaTeX-math-need-image t) ; 数式モードでTABを押したときにイメージを表示する
;(setq elisp::*KaTeX-math-formats*
;      (compile-regexp-keyword-list
;       '(("\\$[^$]*\\$" t (:keyword 2) nil)))) ; 正規表現での色付け

; toolbar
(setq elisp::*KaTeX-use-toolbar* t) ; KaTeX toolbarを表示する

; プロセス関係
;(setq elisp::*typeset-with-shell-command* t) ; TeXの実行に *shell* を使う
;(setp elisp::*preview-with-typeset* t) ; previewするファイルがなければ、typesetする

; 補完関係
;(setq elisp::KaTeX-no-begend-shortcut t) ; [prefix] b ?? のショートカットを使わない
(setq elisp::KaTeX-default-document-style "jsarticle") ; document-styleの初期値
(setq elisp::env-name "eqnarray") ; begin型補完の初期値
(setq elisp::section-name "section") ; section型補完の初期値
(setq elisp::fontsize-name "bf") ; large型補完の初期値
(setq elisp::single-command "newpage") ; maketitle型補完の初期値

; その他
(setq elisp::KaTeX-default-pop-window-height 3) ; 画面を分割するときの高さ
;(setq elisp::KaTeX-template-file "~/template.tex") ; 新規ファイル作成時に読み込むファイル
;(setq elisp::KaTeX-fill-column 60) ; 自動改行の幅を変える

; hook、自動改行、olt
(add-hook 'elisp::katex-mode-hook
	  #'(lambda ()
	      (auto-fill-mode nil) ; 自動改行をやめる 
             (run-hooks '*text-mode-hook*) ; *text-mode-hook* を走らせる
	      ))


;;grep dialog
(global-set-key '(#\C-c #\g) 'grep-dialog)

;;calendar
(global-set-key '(#\C-c #\C-a) 'calendar)

;;C-a
(global-set-key  '(#\C-a) 'selection-whole-buffer)

;;netinstaller
(require "ni/setup")
  ;; 自動設定を利用する
  (ni-autoload)


;自動インデント
(global-set-key #\RET 'newline-and-indent)


;kill all buffer
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key '(#\M-k) 'close-all-buffers)


;ttray
(require "ttray")
(global-set-key '(#\C-x #\C-z) 'ttray-hide-xyzzy)


;;;Ruby-mode
;(load-library "Gates"); Gates が好きならファイルの先頭に
(load-library "ruby-mode")
(push '("\\.rb$" . ruby-mode) *auto-mode-alist*)


;;; comment-out
(require "comment-out-select-oneline")
(global-set-key #\C-\; 'comment-out-selection-or-one-line)

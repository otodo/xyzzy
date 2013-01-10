;;; Ruby Hilite Copyrite by Yukio Sakaue <yukimi_sake@mbi.nifty.com>

;;  リテラルとキーワードの表示設定

(setf
 ruby-str-fore-color      9     ; 文字列の色
 ruby-str-back-color      0
 ruby-comment-fore-color 10     ; コメントの色
 ruby-comment-back-color  0
 ruby-rd-fore-color       8     ; RDの色
 ruby-rd-back-color      15
 ruby-rgx-fore-color      3     ; 正規表現の色
 ruby-rgx-back-color      0
 ruby-percent-fore-color  3     ; %リテラルの色
 ruby-percent-back-color  0
 ruby-here-fore-color     9     ; ヒアドキュメントの色
 ruby-here-back-color     0
 ruby-show-bold-keyword   t     ; キーワードをボールドにする
 )

;;; ruby-bold-keywords は廃止

(defvar *ruby-variables-regexp* 
	;変数その他の強調表示 :boldも使えるがRDや文字列系でもボールドのままなので要注意
	(compile-regexp-keyword-list
	 '(
		 ("\$[0-9_\x7f-\xff]"           t (:keyword 2))            ; 特殊変数
		 ("\$[a-z_][a-z0-9_]*"          t (:keyword 2))            ; グローバル変数
		 ("@[a-z_][a-zA-Z0-9_]*"        t (:color   4))            ; インスタンス変数
		 ("\\<[+-]?[0-9]+\\.?[0-9]*[eE][+-]?[0-9]+\\.?[0-9]*\\>" t (:color 1)) ; 指数リテラル
		 ("\\<[+-]?[0-9]+\\.?[0-9]*\\>" t (:color   1))            ; 数値リテラル
		 ("\\<0[xX][0-9a-f]+\\>"        t (:color   1))            ; 16進リテラル
		 ("[^:]\\(:[a-z_][a-z0-9_]*\\)" t (:color  11 0 ) t 1)     ; シンボル
		 )))


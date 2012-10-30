;;;; -*- mode: lisp -*-

("name" . "カフェイン中毒")
("author" . "bowbow99 <bowbow99@gmail.com>")
("url" . "http://d.hatena.ne.jp/bowbow99/" )
("description" . "ゲームは1日1時間")

("packages"

;; * ansify
(("name" . "ansify")
 ("version" . "0.03.03")
 ("file" . "ansify-0.03.03.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/ansify-0.03.03.zip")
 ("description" . "ANSI Common Lisp にあって xyzzy にないもの詰め合わせ")
 ("md5" . "46a1703d811a7ccec1bdd1b8f884ebab")
 ("time" . 3542021675)
 ("category" "Lisp" "Libraries")
 ("changes" . "2012-03-29  Ver. 0.03.03
========================
- リファレンスに typo や古い記述があったのを修正; thx to @youz
- リファレンスが間違って SJIS になってたのを修正; thx to @youz

2012-02-16  Ver. 0.03.02
========================
- リファレンスを生成できないのがバレたので xy-reference から見える所へ
  引っ越し; thx to @miyamuko

2012-01-09  Ver. 0.03.01
========================
- cmu_loop 使うのをやめた
- パッケージ \"compiler\" のパッケージ定義だけ同梱
  compile.l を丸ごと読み込まずに `compiler::optimize-form` を使えるように
- バグ修正など
  - ansify をダンプイメージに含めると `optimize-type-check` を利用したマクロ
    （`typecase` など）が壊れてた; thx to @miyamuko
  - `ansify:defun` のインデント情報が無かった
  - `ansify:symbol-macrolet` で `multiple-value-setq` の多値式に symbol macro
    を置くと展開されてなかった; thx to @miyamuko

2011-11-04  Ver. 0.03.00
========================
- 一部の型指定子をグローバルに修正
  - `eql` -- 不要な deftype による定義を削除（実は前のバージョンでやってた）
  - `real`, `cons` -- リストでの指定にできなかったのを修正
  この修正は lisp パッケージの方を直接修正してるのでグローバルに影響するけど
  正しく書かれたプログラムでは問題は起きないはず。
- setf function サポート
  `(setf READER)` という形式の関数名を使えるようにした。
  - `defun`
  - `fdefinition`
  - `fboundp`
  - `fmakunbound`
- 細々したオペレータを追加
  - `sleep`

2011-10-16  Ver. 0.02.00
========================
- パッケージ周りを調整
  ANSI 標準のシンボルは \"ansify\" から export して、それ以外で xyzzy/ansify
  特有の機能などは \"ansify.ext\" から export するように
  ちゃんと export するようにしたので `ansify:etypecase` とか書けるようになった
- 細々したオペレータを追加
  - `type-of`（structure に対して `lisp:structure` ではなく構造体名を返す）
  - `constantly`
  - `the`
  - `nth-value`
  - `upgraded-complex-part-type`
  - 単に名前が変わったもの
    - `special-operator-p`
    - `get-setf-expansion`
    - `define-setf-expander`
- バグ修正（主に typespec 周り）

2011-10-05  Ver. 0.01.01
========================
- バージョン変数 `ansify::+version+` を追加
- バグ2つ修正（thx to @miyamuko）

2011-09-30  Ver. 0.01.00
========================
- 初リリース
- バラバラに作ってた Common Lisp なものを集めた
  - [symbol-macrolet](https://github.com/bowbow99/xyzzy.symbol-macrolet)
  - [condition-restart](https://github.com/bowbow99/xyzzy.condition-restart)
  - [destructuring-bind](https://github.com/bowbow99/xyzzy.destructuring-bind)
  - [typespec+](https://github.com/bowbow99/xyzzy.typespec-plus)
  - [typecase](https://github.com/bowbow99/xyzzy.typecase)
- case, ecase, ccase を実装
- print-unreadable-object を実装
"))

;; * setf-values
(("name" . "setf-values")
 ("version" . "0.01.02")
 ("file" . "setf-values-0.01.02.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/setf-values-0.01.02.zip")
 ("description" . "setf で多値を扱えるようにする")
 ("md5" . "14fc77ea9e2c5de718da8fe222bfb607")
 ("time" . 3526381979)
 ("category" "Lisp" "Libraries")
 ("changes" . "\
2011-09-30  bowbow99  <bowbow99@gmail.com>

	* version 0.01.02

2011-09-30  MIYAMUKO Katsuyuki  <miyamuko@gmail.com>

	* (setf (values a b c) (progn (values 1 2 3))) とかしたときに、
	  「変数が定義されていません: #:G2532」というエラーになっていた
	  のを修正

2011-09-30  bowbow99  <bowbow99@gmail.com>

	* (setf 3 8) とかしたときに、(setq 3 8) に展開されてからエラーに
	  なっていたのを展開時にエラー投げるようにした。

2011-04-09  bowbow99  <bowbow99@gmail.com>

	* version 0.01.01

	* `values` の setf-expander が色々ダメだったのをマシにした。
	  - subforms の setf-expansion を使うように。
	  - store-form が設定した多値を返すように（最後の値だけ返ってた）。

	* `setf-expand-1` で特定の場合に何かしてたのを削除
	  - 1つ目（`macroexpand-1` して再帰する）は、どうせ `get-setf-method`
	    が同じ事してくれるのでいらない。
	  - 2つ目（`setf-update` プロパティがあったら、その関数の呼び出しに
	    展開）は、`macrolet` で shadow した場合にもグローバルな setf-expander
	    を使って展開することになってしまうので削除。

2009-07-16  bowbow99  <bowbow99@gmail.com>

	* MIT ライセンスを適用したらしい。

2009-07-0?  bowbow99  <bowbow99@gmail.com>

	* 始めたらしい。
"))

;;;; jaunte
(("name" . "jaunte")
 ("version" . "0.00.01")
 ("file" . "jaunte-0.00.01.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/jaunte-0.00.01.zip")
 ("description" . "画面内にヒントを散らかしてそこへジャンプ")
 ("md5" . "39ce5368cd9e2f4603bcda1c28fa7f15")
 ("time" . 3528031205)
 ("depends" "ansify" "ansi-loop")
 ("category" "Utilities")
 ("changes" . "2011-10-20  Ver. 0.00.01
========================
- 折り返し表示を再現してなかったせいでズレてたのを修正

2011-10-19  Ver. 0.00.00
========================
- こっそりと初リリース
  - ブログ記事書いてたら バグ発見 > 修正> Ver.up コンボ発動
"))

;; * symbol-macrolet
(("name" . "symbol-macrolet")
 ("version" . "0.01.06")
 ("file" . "symbol-macrolet-0.01.06.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/symbol-macrolet-0.01.06.zip")
 ("description" . "マクロで実装した Common Lisp の symbol-macrolet")
 ("md5" . "cccaeb61fbfba8d52f95cfa53d96447c")
 ("time" . 3510204196)
 ("depends" "setf-values")
 ("category" "Lisp" "Libraries")
 ("changes" . "2011-03-27  bowbow99  <bowbow99@gmail.com>
	* version 0.01.06
	- symbol-macrolet 内に現れる multiple-value-bind の body の先頭の式が
	  symbol-macro として展開されてなかったバグを修正
	- コード見直し

2011-01-30  bowbow99  <bowbow99@gmail.com>
	* version 0.01.05
	- symbol-macrolet 内の macrolet で定義したローカルマクロが展開されない
	  場合があったバグを修正
	- オペレータに置いた lambda 式内の symbol-macro が展開されてなかった
	  バグを修正
	- lambda, labels, flet, macrolet の lambda-list （仮引数）で、初期値式
	  の symbol-macro が展開されてなかったバグを修正
	- コード見直し

2010-05-19  bowbow99  <bowbow99@gmail.com>
	* version 0.01.04
	- リファレンスを UTF-8 にした
	- リファレンスにXML宣言とDOCTYPE宣言を付けた

2010-05-18  bowbow99  <bowbow99@gmail.com>
	* version 0.01.03
	- reference.xml 形式のリファレンスを付けた

2009-08-14  bowbow99  <bowbow99@gmail.com>
	* version 0.01.02
	- #'symbol を #'(lambda ...) 同様に展開しようとしてたバグを修正
	- lambda form の body の最初の式を展開していなかったバグを修正

2009-08-10  bowbow99  <bowbow99@gmail.com>
	* version 0.01.01
	- let や let* でシンボルのみだった場合のバグを修正

2009-07-17  bowbow99  <bowbow99@gmail.com>
	* version 0.01.00
	- 作った。公開した。
"))

;; * condition-restart
(("name" . "condition-restart")
 ("version" . "0.01.05")
 ("file" . "condition-restart-0.01.05.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/condition-restart-0.01.05.zip")
 ("description" . "Common Lisp の再起動（Restart）")
 ("md5" . "c5f36b98e3e7f753b90d7c21427512cd")
 ("time" . 3507326046)
 ("category" "Lisp" "Libraries")
 ("changes" . "2011-02-22  Ver. 0.01.05
========================
- リファレンスの `restart-name` に閉じてない要素があったのを修正

2011-02-22  Ver. 0.01.04
========================
- `check-type` で [typespec+] を使うようにした。

- `assert` と `check-type` を別ファイル \"assertions.l\" に移動。
  上記の変更で `check-type` が [typespec+] に依存するようになったけど、
  \"condition-restart\" 自体は依存しないでおくために。
  - これらのマクロを使うには（\"condition-restart\" ではなく）\"assertions\" 
    を `require` する必要があります。
  - 別途 [typespec+] をインストールしておく必要があります。

  [typespec+]: http://github.com/bowbow99/xyzzy.typespec-plus

- `ed:read-value` を追加
  ミニバッファから値の入力を受け付ける関数。再起動の INTERACTIVE-FUNCTION
  で使うのに欲しかったので。

- 関数 `abort`: 再起動 `abort` が見つからなかったらエラー `quit` を投げ
  るようにした。
  結果的に、再起動 `abort` があれば使う関数 `quit` みたいになった。

- パッケージ condition-restart から以下を export しておいた。
  - +version+
  - restart-not-found
  - restart-not-fonud-designator
  - restart-not-found-condition

- リファレンスをあちこち書き直し。

- いろいろバグ修正。
  詳しくは [ChangeLog] かリポジトリの [Commits] あたり参照してください。

  [ChangeLog]: http://github.com/bowbow99/xyzzy.condition-restart/blob/master/ChangeLog
  [Commits]: http://github.com/bowbow99/xyzzy.condition-restart/commits

2010-08-06  Ver. 0.01.03
========================
- assert のメッセージを少しマシにした。
- 配布物にゴミが混入してたので削除。(thx to @southly)

2010-06-13  Ver. 0.01.02
========================
- リファレンスの file が間違ってたのを修正した。

- select-restart-interactively が再帰的に呼ばれた時にウィンドウのサイズ
がおかしくなってたのを修正したつもり。

- assert の PLACES が nil のときのメッセージを変更した。

2010-06-10  Ver. 0.01.01
========================
- 再起動選択を繰り返した時の画面分割のバグに対処した。

2010-06-10  Ver. 0.01.00
========================
- 作った。公開なう。
"))

;; typespec+
(("name" . "typespec+")
 ("version" . "0.01.02")
 ("file" . "typespec+-0.01.02.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/typespec+-0.01.02.zip")
 ("description" . "type specifier （型指定子）を便利に")
 ("md5" . "d2b33b30d157fa1c345738ab2e53a843")
 ("time" . 3507702933)
 ("category" "Lisp" "Libraries")
 ("changes" . "2011-02-26  Ver. 0.01.02
========================
- Fix: 開発中に名前を変えた変数の古い名前が残ってたのを修正。
- リファレンスのファイルにもライセンス表示を追加。

2011-02-08  Ver. 0.01.01
========================
- Fix: リファレンスに実体参照になっていない \"<\" や \">\" があったのを修正。

2011-02-08  Ver. 0.01.00
========================
- 初公開。

"))
)
(("src" . "http://ironsand.net/xyzzy/packages.l") ("name" . "原子番号26") ("author" . "鉄") ("url" . "ironsand.net") ("description" . "原子番号26") ("packages" (("name" . "FTP-file-handling-with-exe") ("version" . "0.02") ("author" . "鉄") ("file" . "ftp-file-handling-with-exe.lzh") ("src" . "http://ironsand.net/misc/ftp-file-handling-with-exe.lzh") ("description" . "FTPサーバ上のファイルを編集(pythonがない環境用)") ("category") ("md5" . "32a2f170a6e1ab43dcb4f904a900b495") ("time" . 3461008494) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "ftp-file-handling/ftp-file-handling.l") ("load-before-uninstall" . "")) (("name" . "FTP-file-handling") ("version" . "0.02") ("author" . "鉄") ("file" . "ftp-file-handling.lzh") ("src" . "http://ironsand.net/misc/ftp-file-handling.lzh") ("description" . "FTPサーバ上のファイルを編集します") ("category") ("md5" . "0c4a5d5167e2333dc2a58a7a2e92fa9b") ("time" . 3461008735) ("depends") ("changes" . "ちょっと修正") ("notice" . "") ("load-after-install" . "ftp-file-handling/ftp-file-handling.l") ("load-before-uninstall" . "")) (("name" . "ton input") ("version" . "0.01") ("author" . "鉄") ("file" . "ton-input.lzh") ("src" . "http://ironsand.net/xyzzy/ton-input.lzh") ("description" . "中国語の声調の入力をするマイナーモードです") ("category" . "Editing") ("md5" . "2515b55508f7c4939a0cb8b69f3e6f4c") ("time" . 3514332617) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "ton-input.l") ("load-before-uninstall" . ""))))
(("src" . "http://up.xyzzy.jp/public/Michael/") ("name" . "up.xyzzy.jp/public/Michael/") ("author" . "") ("url" . "http://up.xyzzy.jp/public/Michael/") ("description" . "") ("packages" (("name" . "lib-hanako") ("version" . "2011.02.03") ("author" . "YAMAMOTO Naoaki") ("file" . "lib-hanako2011.02.03b0ca95b862b9ef03397d027c4fa201a0.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2FMichael%2Flib-hanako&file=lib-hanako2011.02.03b0ca95b862b9ef03397d027c4fa201a0.tar.gz") ("description" . "環境省花粉観測システム（愛称：はなこさん）から
花粉飛散情報を取得するライブラリーです。
詳細情報：環境省花粉観測システム
          ⇒ http://kafun.taiki.go.jp/

インストールしただけでは動作しません。
簡易使用例を参照してください。") ("md5" . "9ae15c321997adef71c7103319de7aef") ("time" . 3505649363) ("depends" "xml-http-request") ("category" "Network" "Libraries" "Resource") ("changes" . "初公開") ("notice" . "* 得られた情報は転用や営利目的とした利用を
  禁止していますので、個人利用にとどめてください。

* 関東以西のデータの提供期間は、2月初めから5月末までのようです。 [#o870372e]

* MIYAMUKO Katsuyuki さんの 「xml-http-request」を使用しています。 [#c45e5896]
  NetInstaller でインストールできます。
") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "weather-forecast") ("version" . "2012.06.08") ("author" . "YAMAMOTO Naoaki") ("file" . "weather-forecast2012.06.086564428685a55204a706fb8d5cd5bf5b.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2FMichael%2Fweather-forecast&file=weather-forecast2012.06.086564428685a55204a706fb8d5cd5bf5b.tar.gz") ("description" . "気象庁発表の天気予報文を見るためのへなちょこツールです。
  情報提供：国際気象海洋株式会社 (URL = http://www.imocwx.com/)
") ("md5" . "d5b87b5d99d2fcfd40d40653f6217ebe") ("time" . 3548071876) ("depends") ("category" "Network" "Miscellaneous") ("changes" . "2012-06-07	0.27
	- コンフィグサンプルの府県予報用キーワードを更新

2011-02-05	0.26
	- Netinstaller対応
	- 最適化

2010-01-26	0.25
	- フレーム名、コンフィグファイル名の defconstant を defvar 変更

2009-11-18	0.24
	- 予報文の発表時刻を表示

2007-03-17	0.23
	- Licenceファイル添付

2006-12-26	0.22
	- hookの名前を変更

2006-11-28	0.21
	- *weather-forecast-file-list*の順番を変更
	- コンテキストメニュー対応
	- 色づけをもっと柔軟に(完了?)

2006-10-17	0.20
	- 色付けの指定方法をもっと柔軟に(其れなり)
	- 週間天気予報対応(仮対応?)

2006-10-13	0.19
	- 色付けの指定方法を柔軟に(其れなり)

2006-09-28	0.18
	- 色付け表示(其れなり)
	- パッケージ化

2006-09-20	0.17
	- ファイル構成を変更

2006-03-22	0.16
	- 予報府県名の指定を正規表現可能に変更(一時的)

2005-08-30	0.15
	- 情報提供元サーバの処理分散化に対応した
	    旧：http://www.imoc.co.jp/
	    新：http://www.imocwx.com/

2004-06-28	0.14
	- 使用するブラウザを指定出来るようにした

2004-06-18	0.13
	- 標準のブラウザを起動出来るようにした

2004-04-09	0.12
	- IME制御(暫定)

2004-03-31	0.11
	- 必要最小限のファイル取得
	- モードキー追加&修正

2004-03-28	0.10
	- 展開先を専用バッファに変更
	- フレーム対応

2004-03-25	0.04
	- 取得時間表示停止
	- 公開の為ソース整理

2004-03-09	0.03
	- 取得時間表示
	- バグ対応

2004-03-05	0.02
	- インタラクティブに変更
	- 処理対象を全国に変更

2004-03-04	0.01
	- 初版作成
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://youz.github.com/xyzzy/package.l") ("name" . "*scrap*") ("author" . "Yousuke Ushiki") ("url" . "http://github.com/youz/") ("description" . "趣味的xyzzy lisp") ("packages" (("version" . "1.0.0") ("file" . "oauth1.0.0.tgz") ("src" . "http://dl.dropbox.com/u/215714/xyzzy/oauth1.0.0.tgz") ("md5" . "24671116f5350e6ef86fd2222a1024ff") ("time" . 3528893888) ("name" . "xl-oauth") ("category" "Network" "Libraries") ("depends" "xml-http-request") ("description" . "OAuth1.0 クライアントライブラリ for xyzzy
OAuth認証ヘッダの生成機能と、Webブラウザ経由でのアクセストークン取得機能を提供します。") ("changes" . "2011/10/30: 1st release")) (("version" . "1.1.3b") ("file" . "xyttr.tgz") ("src" . "http://dl.dropbox.com/u/215714/xyzzy/xyttr.tgz") ("md5" . "37e591b2abcf21d2db3a4d3360fa8a8c") ("time" . 3534577939) ("name" . "xyttr") ("category" "Network") ("description" . "xyzzy上で動作するミニマムなtwitterクライアント") ("depends" "xml-http-request" "json") ("changes" . "2012/01/03:
* xyttr-listコマンドのリスト選択肢に自作リストを追加
* DMの削除に対応 (通常のツイートと同じくdキー)
* ~/.xyttr/config.l のサンプルを追加 (postbuf.l)")) (("version" . "1.0.0") ("file" . "ldrpin-mode1.0.0.tgz") ("src" . "http://dl.dropbox.com/u/215714/xyzzy/ldrpin-mode1.0.0.tgz") ("md5" . "c0d0bbecdca380375012a673046e99d4") ("time" . 3528893888) ("name" . "ldrpin-mode") ("category" "Network") ("description" . "Livedoor Readerのピンリストを表示します。") ("depends" "xml-http-request" "json") ("changes" . "2011/10/30: 1st release")) (("version" . "1.1.0") ("file" . "xl-rt.tgz") ("src" . "http://dl.dropbox.com/u/215714/xyzzy/xl-rt.tgz") ("md5" . "fe8362e5eece4ee4aef16c6240c95c9d") ("time" . 3549411337) ("name" . "xl-rt") ("category" "Lisp" "Libraries" "Development") ("description" . "sbcl付属のsb-rtをxyzzy lisp用に移植") ("changes" . "
2012/06/23: 成功/失敗の表示とconditionの表示を改善

2011/10/30: 1st release")) (("version" . "1.0.0") ("file" . "coco-mode1.0.0.tgz") ("src" . "http://dl.dropbox.com/u/215714/xyzzy/coco-mode1.0.0.tgz") ("md5" . "b4571be10d2dfba8e397a7a3324b43e7") ("time" . 3528935703) ("name" . "coco-mode") ("category" "Development" "Editing") ("description" . "Coco用のメジャーモード") ("changes" . "2011/10/30: 1st release")) (("version" . "1.0.0") ("file" . "coffee-mode1.0.0.tgz") ("src" . "http://dl.dropbox.com/u/215714/xyzzy/coffee-mode1.0.0.tgz") ("md5" . "d65453a757bbb68fc2f9eaedc00df70a") ("time" . 3528935703) ("name" . "coffee-mode") ("category" "Development" "Editing") ("description" . "CoffeeScript用のメジャーモード") ("changes" . "2011/10/30: 1st release")) (("version" . "1.0.1") ("file" . "xl-growl") ("src" . "http://dl.dropbox.com/u/215714/xyzzy/xl-growl.tgz") ("md5" . "4a317ec484491ac7e69e61015b285c3c") ("time" . 3533384527) ("name" . "xl-growl") ("category" "Network" "Libraries") ("description" . "GNTP - Growl Network Transport Protocol による通信機能を提供します。") ("changes" . "2011/12/20
notify-with-socket-callbackのコールバック引数省略時の不具合を修正")) (("version" . "1.2.1") ("file" . "xl-repl.tgz") ("src" . "http://dl.dropbox.com/u/215714/xyzzy/xl-repl.tgz") ("md5" . "dbd577879c7b031228135d82ba1aafba") ("time" . 3549878326) ("name" . "xl-repl") ("category" "Lisp" "Development") ("depends") ("description" . "lisp-repl-mode for xyzzy") ("changes" . "2012/06/28: ver. 1.2.1
======================
### 修正点

* referenceコマンド 表示機能強化
  - 説明文中のシンボルやseealso項目上でReturn もしくは
    左クリックすると該当記事にジャンプするように
  - Backspace, Alt+Leftで戻る / Alt+Rightで進む
  - j,k で1行スクロール
  - J,Kで記事移動 (:part or :ftsオプションを使用して複数記事表示時)

2012/06/23: ver. 1.2.0
======================
### 修正点

* Ctrl+Gで評価を中断した時に次のプロンプトが表示されない問題を修正
* ls系コマンドでシンボルが重複して表示される場合がある問題を修正

### 新機能 (REPLコマンド)
* reference -- リファレンス検索
* lscmd     -- コマンド名検索
* step      -- ステップ実行
* log       -- ログ取り用ユーティリティ
* calc      -- 電卓
* clip      -- 標準出力をクリップボードにコピー

詳細はREADME参照

2012/02/25: ver. 1.1.0
======================
### 新機能
* 標準出力と評価結果の表示にtext-attributeを適用
* *return-behavior*の値によってReturn押下時の挙動を切り替えられるように
* キーバインド追加

### 変更点
* 式途中/過去入力/過去評価結果の各表示位置でReturnを押した時の挙動をSLIME風に
* si:*trace-on-error* => t の時、*error-output*への出力を全て横取りしていたのを
   broadcastを使い、コピーを取得するように変更
* 入力履歴のキーバインドはM-n,M-pとし、C-n,C-pは*lisp-mode-map*のままにした

2012/02/20: ver. 1.0.1
======================
* 評価結果がnilの時に印字されない不具合を修正

2012/02/17: ver. 1.0.0
======================
### 新機能
* expandコマンド -- マクロフォームを展開して表示
* timeコマンド -- 処理時間を計測して表示

### 変更点
* ls系コマンドの表示で、カレントパッケージのシンボルにもパッケージ修飾子を付けるように変更
* ls系コマンドの表示で、関数/マクロは引数も表示するように変更
* 評価結果がprint-functionを持つ構造体の場合、format指示子~Aを使って印字するように変更

### 修正
* 評価結果が循環参照を含む場合に対応
* REPL変数 `/` の内容をCL仕様準拠に変更
* 評価結果表示の前にfresh-lineを行うように変更
"))))
(("src" . "http://bowbow99.sakura.ne.jp/xyzzy/packages.l") ("name" . "カフェイン中毒") ("author" . "bowbow99 <bowbow99@gmail.com>") ("url" . "http://d.hatena.ne.jp/bowbow99/") ("description" . "ゲームは1日1時間") ("packages" (("name" . "ansify") ("version" . "0.03.03") ("file" . "ansify-0.03.03.zip") ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/ansify-0.03.03.zip") ("description" . "ANSI Common Lisp にあって xyzzy にないもの詰め合わせ") ("md5" . "46a1703d811a7ccec1bdd1b8f884ebab") ("time" . 3542021675) ("category" "Lisp" "Libraries") ("changes" . "2012-03-29  Ver. 0.03.03
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
")) (("name" . "setf-values") ("version" . "0.01.02") ("file" . "setf-values-0.01.02.zip") ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/setf-values-0.01.02.zip") ("description" . "setf で多値を扱えるようにする") ("md5" . "14fc77ea9e2c5de718da8fe222bfb607") ("time" . 3526381979) ("category" "Lisp" "Libraries") ("changes" . "2011-09-30  bowbow99  <bowbow99@gmail.com>

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
")) (("name" . "jaunte") ("version" . "0.00.01") ("file" . "jaunte-0.00.01.zip") ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/jaunte-0.00.01.zip") ("description" . "画面内にヒントを散らかしてそこへジャンプ") ("md5" . "39ce5368cd9e2f4603bcda1c28fa7f15") ("time" . 3528031205) ("depends" "ansify" "ansi-loop") ("category" "Utilities") ("changes" . "2011-10-20  Ver. 0.00.01
========================
- 折り返し表示を再現してなかったせいでズレてたのを修正

2011-10-19  Ver. 0.00.00
========================
- こっそりと初リリース
  - ブログ記事書いてたら バグ発見 > 修正> Ver.up コンボ発動
")) (("name" . "symbol-macrolet") ("version" . "0.01.06") ("file" . "symbol-macrolet-0.01.06.zip") ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/symbol-macrolet-0.01.06.zip") ("description" . "マクロで実装した Common Lisp の symbol-macrolet") ("md5" . "cccaeb61fbfba8d52f95cfa53d96447c") ("time" . 3510204196) ("depends" "setf-values") ("category" "Lisp" "Libraries") ("changes" . "2011-03-27  bowbow99  <bowbow99@gmail.com>
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
")) (("name" . "condition-restart") ("version" . "0.01.05") ("file" . "condition-restart-0.01.05.zip") ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/condition-restart-0.01.05.zip") ("description" . "Common Lisp の再起動（Restart）") ("md5" . "c5f36b98e3e7f753b90d7c21427512cd") ("time" . 3507326046) ("category" "Lisp" "Libraries") ("changes" . "2011-02-22  Ver. 0.01.05
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
")) (("name" . "typespec+") ("version" . "0.01.02") ("file" . "typespec+-0.01.02.zip") ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/typespec+-0.01.02.zip") ("description" . "type specifier （型指定子）を便利に") ("md5" . "d2b33b30d157fa1c345738ab2e53a843") ("time" . 3507702933) ("category" "Lisp" "Libraries") ("changes" . "2011-02-26  Ver. 0.01.02
========================
- Fix: 開発中に名前を変えた変数の古い名前が残ってたのを修正。
- リファレンスのファイルにもライセンス表示を追加。

2011-02-08  Ver. 0.01.01
========================
- Fix: リファレンスに実体参照になっていない \"<\" や \">\" があったのを修正。

2011-02-08  Ver. 0.01.00
========================
- 初公開。

"))))
(("src" . "http://ironsand.net/misc/packages.l") ("name" . "原子番号26") ("author" . "tetsu") ("url" . "ironsand.net") ("description" . "鉄のサイト") ("packages" (("name" . "FTP-file-handling-with-exe") ("version" . "0.02") ("author" . "tetsu") ("file" . "ftp-file-handling-with-exe.lzh") ("src" . "http://ironsand.net/misc/ftp-file-handling-with-exe.lzh") ("description" . "FTPサーバ上のファイルを編集(pythonがない環境用)") ("category") ("md5" . "32a2f170a6e1ab43dcb4f904a900b495") ("time" . 3461008494) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "ftp-file-handling/ftp-file-handling.l") ("load-before-uninstall" . "")) (("name" . "FTP-file-handling") ("version" . "0.02") ("author" . "tetsu") ("file" . "ftp-file-handling.lzh") ("src" . "http://ironsand.net/misc/ftp-file-handling.lzh") ("description" . "FTPサーバ上のファイルを編集します") ("category") ("md5" . "0c4a5d5167e2333dc2a58a7a2e92fa9b") ("time" . 3461008735) ("depends") ("changes" . "ちょっと修正") ("notice" . "") ("load-after-install" . "ftp-file-handling/ftp-file-handling.l") ("load-before-uninstall" . ""))))
(("src" . "http://www7.atwiki.jp/knenet?cmd=upload&act=open&pageid=62&file=packages.l") ("name" . "世界の仕組み研究所") ("author" . "knenet") ("url" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=packages.l") ("description" . "雑多なありがちなスクリプトを適当に配布しています。") ("packages" (("name" . "ibuki") ("version" . "00D") ("author" . "knenet") ("file" . "ibuki00D.tar.gz") ("src" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=ibuki00D.tar.gz") ("description" . "漢直「息吹」") ("category" "Text Processing") ("md5" . "fe57dead657212e35954b686085a999d") ("time" . 3549347399) ("depends") ("changes" . "keymapがeditorパッケージから見えていたのでshadowした。") ("notice" . "") ("load-after-install" . "site-lisp/ni-autoload/skmkn/ibuki.l") ("load-before-uninstall" . "")) (("name" . "ibuki-practice") ("version" . "001") ("author" . "knenet") ("file" . "ibuki-practice001.tar.gz") ("src" . "http://www7.atwiki.jp/knenet?cmd=upload&act=open&pageid=62&file=ibuki-practice001.tar.gz") ("description" . "漢直「息吹」用の練習機能

少しずつ文字を覚えて、
覚えた文字だけ拾い読みして
練習するための機能です。") ("category" "Games") ("md5" . "bb40fb38577a683a33224258d03cffb5") ("time" . 3525774179) ("depends" "ibuki" "stroke-practice") ("changes" . "") ("notice" . "") ("load-after-install" . "site-lisp/ni-autoload/skmkn/ibuki-practice.l") ("load-before-uninstall" . "")) (("name" . "stroke-practice") ("version" . "001") ("author" . "knenet") ("file" . "stroke-practice001.tar.gz") ("src" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=stroke-practice001.tar.gz") ("description" . "タイピング練習機能
適当なテキストを利用して漢字交じり文の
入力練習が行えます。
入力した文字数や時間が計測できます。") ("category" "Games") ("md5" . "e5a465e309c4e7b7530527c159b27ca5") ("time" . 3525774063) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "~/site-lisp/ni-autoload/skmkn/stroke-practice.l") ("load-before-uninstall" . "")) (("name" . "bfmc") ("version" . "009") ("author" . "knenet") ("file" . "bfmc009.tar.gz") ("src" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=bfmc009.tar.gz") ("description" . "buffer pseudo-frame の切り替えなどを行えます。") ("category" "Shells") ("md5" . "0e428851d1dfe5a8830ec6b16f9891c9") ("time" . 3515378291) ("depends") ("changes" . "bfmcフレームを抜ける際のバグ回避") ("notice" . "") ("load-after-install" . "~/site-lisp/ni-autoload/skmkn/bfmc.l") ("load-before-uninstall" . "")) (("name" . "embedded-grep") ("version" . "006") ("author" . "knenet") ("file" . "embedded-grep006.tar.gz") ("src" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=embedded-grep006.tar.gz") ("description" . "ファイルに検索表現を埋め込みます。") ("category" "Editing" "Documentation") ("md5" . "eee1156eae139e3861482459b179487a") ("time" . 3457045353) ("depends") ("changes" . "バッファ名指定で検索した後、該当行に飛べないバグを修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "puzzle") ("version" . "004") ("author" . "knenet") ("file" . "puzzle004.tar.gz") ("src" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=puzzle004.tar.gz") ("description" . "15パズル") ("category" "Games") ("md5" . "a6385397c63b29556586977ccc743ae1") ("time" . 3452975728) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "key-chord") ("version" . "004") ("author" . "knenet") ("file" . "key-chord004.tar.gz") ("src" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=key-chord004.tar.gz") ("description" . "Shells") ("category") ("md5" . "32582fd7f27addc842a954b1f088c548") ("time" . 3442394951) ("depends" "２鍵同時押しコマンドが実行できます。") ("changes" . "キーを入力せずに実行した際にエラーになるバグを修正。") ("notice" . "") ("load-after-install" . "~/site-lisp/ni-autoload/skmkn/key-chord.l") ("load-before-uninstall" . "")) (("name" . "aozora-view") ("version" . "001") ("author" . "knenet") ("file" . "aozora-view001.tar.gz") ("src" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=aozora-view001.tar.gz") ("description" . "青空文庫のテキストをちょっと読みやすくします。") ("category" "Miscellaneous") ("md5" . "8f2bff9da005033d3ecc2515e574272a") ("time" . 3441093212) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "~/site-lisp/ni-autoload/skmkn/aozora-view.l") ("load-before-uninstall" . "")) (("name" . "habuki") ("version" . "011") ("author" . "knenet") ("file" . "habuki011.tar.gz") ("src" . "http://www7.atwiki.jp/knenet/?cmd=upload&act=open&page=netinstaller&file=habuki011.tar.gz") ("description" . "漢直「小ノ目」のマイナーモードが実行できます。") ("category" "Editing" "Development" "Documentation") ("md5" . "cd8cb602328798a338196c6189bd0f19") ("time" . 3439977948) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "~/site-lisp/ni-autoload/skmkn/habuki.l") ("load-before-uninstall" . ""))))
(("src" . "http://up.xyzzy.jp/public/sana/") ("name" . "up.xyzzy.jp/public/sana/") ("author" . "") ("url" . "http://up.xyzzy.jp/public/sana/") ("description" . "") ("packages" (("name" . "siki") ("version" . "2007.09.23") ("author" . "SANO Masatoshi") ("file" . "siki2007.09.23f185cc1c0abba6b42e6c95a62143c65c.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Fsiki&file=siki2007.09.23f185cc1c0abba6b42e6c95a62143c65c.tar.gz") ("description" . "General wiki framework for xyzzy with lack featured pseudo howm example.

とんがった人向け汎用wikiフレームワークなつもり。

howmもどき(実装しかけ)を同梱しとります。
予定とかTodoがどうこうという部分はさっぱり実装していないのでよろしく。") ("md5" . "bf0ac8c68a8a534d7d8d850233d5dd0c") ("time" . 3399520539) ("depends") ("category" "Documentation" "Development" "Lisp") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "cl-json") ("version" . "2008.02.07") ("author" . "SANO Masatoshi") ("file" . "cl-json2008.02.074557c8e39be36b38848190c60f5e1c51.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Fcl-json&file=cl-json2008.02.074557c8e39be36b38848190c60f5e1c51.tar.gz") ("description" . "just decode part of cl-json.") ("md5" . "d98b59dfd49771a6de1b66f07cf45532") ("time" . 3411309835) ("depends") ("category" "Lisp" "Development") ("changes" . "2008-2-07(Thu)
First release") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "auto-time-stamp") ("version" . "2007.05.15") ("author" . "Junichiro KITA") ("file" . "auto-time-stamp2007.05.155cb26152422af9111bee1ee311e05ab7.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Fauto-time-stamp&file=auto-time-stamp2007.05.155cb26152422af9111bee1ee311e05ab7.tar.gz") ("description" . "kitajさんのauto-time-stamp.lです。

GNU GPLでのライセンスでのnetinstallerへの再配置の許可を
06のruby会議で頂いたまま放置してました。

そのままでは使いにくいところがあるので
wikiに上っているものと等価な少々の訂正を…") ("md5" . "3c56102f8ed101712346d7f330f3f1f1") ("time" . 3388227253) ("depends") ("category") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "flex-fill") ("version" . "2007.05.15") ("author" . "Junichiro KITA") ("file" . "flex-fill2007.05.158f60f4582dd200e36370b119182daf04.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Fflex-fill&file=flex-fill2007.05.158f60f4582dd200e36370b119182daf04.tar.gz") ("description" . "kitajさんのhelp.lです。

GNU GPLでのライセンスでのnetinstallerへの再配置の許可を
06のruby会議で頂いたまま放置してました。") ("md5" . "49a2ef277de8a0b8da69870f02f2a4e4") ("time" . 3388226032) ("depends") ("category") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ldoc") ("version" . "2007.05.15") ("author" . "Junichiro KITA") ("file" . "ldoc2007.05.1577f58a008b4a65e2b36de265b88b8080.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Fldoc&file=ldoc2007.05.1577f58a008b4a65e2b36de265b88b8080.tar.gz") ("description" . "kitajさんのhelp.lです。

GNU GPLでのライセンスでのnetinstallerへの再配置の許可を
06のruby会議で頂いたまま放置してました。

ref2docにあるymtzさんのパッチを取りこみました。") ("md5" . "5160af033542f598589380c3c2628182") ("time" . 3388225745) ("depends") ("category" "Development" "Documentation") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "niup") ("version" . "2007.05.15") ("author" . "SANO Masatoshi") ("file" . "niup2007.05.15922ca49be66cbd2be17a1a8b73021561.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Fniup&file=niup2007.05.15922ca49be66cbd2be17a1a8b73021561.tar.gz") ("description" . "netinstaller用のファイルを作成・アップロードできます。

netinstaller以外からの
インストールは想定していません。
netinstallerの動作概要を知らない人も想定していません。
起動方法は
M-x niup

です。

最初にSettingからアカウントを取得してください。
あとはdescribe-bindingsと
服部プロダクツの操作の勘でなんとかしてください。
根性は必要かもしれません。
困ったらメールなりwikiの質問箱なりで対応させていただきます。


無事uploadできたファイルは

http://up.xyzzy.jp/public/あかうんとめい/

に公開されます。

全てのアカウントに共有なni用のアドレスは
http://up.xyzzy.jp/public/
です。危険な香りがしますが。

お願い
-まだ実験中です。予定にはない中止、停止に対する覚悟はお願いします。
-何か(特にセキュリティに関しては)フィードバックをお願いします。
-公開してしまったらひっこめることはこのソフトから直にはまだできません。
--上書きはできるので直してなんとかすると良いかもしれません。
-扱いの利便のため自由なライセンスでの公開をお願いします。(すくなくともそのつもりでいてください。") ("md5" . "5c7ca7ac931cb774e479e305491f9c5e") ("time" . 3388227770) ("depends" "Junklibrary" "Netinstaller") ("category" "Lisp" "Development" "Network") ("changes" . "authorの書き換えができるようになった") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "tips open session") ("version" . "2007.08.20") ("author" . "SANO Masatoshi") ("file" . "tips open session2007.08.208c3d604dda8883e6b8c39f0fb1363d18.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Ftips%20open%20session&file=tips%20open%20session2007.08.208c3d604dda8883e6b8c39f0fb1363d18.tar.gz") ("description" . "When you find-file a file that typed as ssn.
this script shadow it from find-file and load-session it.

wikiの
tips/ファイルを開く時にセッションファイルならば展開する
です。多分。
英語の説明はむりやりかいたけど意味とおってるかどうか謎だなぁ。") ("md5" . "a42dea2ac1d146b9354dd2c0e6eeba31") ("time" . 3396599952) ("depends") ("category") ("changes" . "Experimental use of niup.
I will copy from tips on wiki that I wrote and is not modified long.

niupの実験ひきつづき。
今後の変更が少なさそうなものはちょきちょき移しても良かろうかと。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "help") ("version" . "2007.05.15") ("author" . "Junichiro KITA") ("file" . "help2007.05.1597442352f499256ff368f9a4d3e57f22.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Fhelp&file=help2007.05.1597442352f499256ff368f9a4d3e57f22.tar.gz") ("description" . "kitajさんのhelp.lです。

GNU GPLでのライセンスでのnetinstallerへの再配置の許可を
06のruby会議で頂いたまま放置してました。") ("md5" . "1590cdba95674e4d2be5869cd5b6a000") ("time" . 3388226071) ("depends") ("category" "Documentation") ("changes" . "") ("notice" . "有効にするためにはdumpをしなおす必要があります。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "skk-wrap") ("version" . "2007.07.13") ("author" . "SANO Masatoshi") ("file" . "skk-wrap2007.07.13fe73c265652555e7ec801eaf1ef9b7dc.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fsana%2Fskk-wrap&file=skk-wrap2007.07.13fe73c265652555e7ec801eaf1ef9b7dc.tar.gz") ("description" . "これは「高速で効率的な日本語入力環境を提供するシステムSKK」のxyzzy用
実行環境です。") ("md5" . "1f38f0422212c65c16af96ea4437b7c1") ("time" . 3393298607) ("depends" "Emacslisp移植キット") ("category") ("changes" . "7月最初のバージョンでコンパイルできるようにした。") ("notice" . "ddskkのインターフェイスが結構
かわるので新しいバージョンでしかコンパイルできなさそうです。") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://park.geocities.jp/bovecrach/xyzzy/packages.txt") ("name" . "xyzzy's Lisps") ("author" . "bove-crach") ("url" . "http://park.geocities.jp/bovecrach/") ("description" . "none") ("packages" (("name" . "generic-comment-toggle") ("version" . "2008.01.07") ("author" . "bove-crach") ("file" . "generic-comment-toggle2008.01.07.zip") ("src" . "http://park.geocities.jp/bovecrach/xyzzy/generic-comment-toggle2008.01.07.zip") ("description" . "バッファモード毎のコメントアウトorアンコメントを行います。
要は HIEさんのページのNOTE->編集->1 行コメントをトグル を改造しただけです") ("category" "Development" "Editing") ("md5" . "8933fa328feb50e92cb422970000779f") ("time" . 3408629027) ("depends") ("changes" . "packagesとしては初版
・コメントアウト/アンコメントする度に行っていた(set-comment-words)を、最小限になるように。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "indent-to-token+") ("version" . "2008.01.07") ("author" . "bove-crach") ("file" . "indent-to-token-plus2008.01.07.zip") ("src" . "http://park.geocities.jp/bovecrach/xyzzy/indent-to-token-plus2008.01.07.zip") ("description" . "正規表現の token を使用して桁位置を整列させる。
思いつくまま xyzzy の Masahiro Nakano さんが作成された
indent-to-token の改造版です") ("category" "Editing" "Development") ("md5" . "5e7c86899920761ca9f6c4d705fd0c92") ("time" . 3408719834) ("depends") ("changes" . "右揃えに対応するため、処理を見直し") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://up.xyzzy.jp/public/whimsical/") ("name" . "up.xyzzy.jp/public/whimsical/") ("author" . "") ("url" . "http://up.xyzzy.jp/public/whimsical/") ("description" . "") ("packages" (("name" . "update-keywords") ("version" . "2008.12.27") ("author" . "Masahiro Nakano") ("file" . "update-keywords2008.12.277d9f542008a7bb59579f25ff61431b7a.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fupdate-keywords&file=update-keywords2008.12.277d9f542008a7bb59579f25ff61431b7a.tar.gz") ("description" . "■機能
  正規表現キーワードではなく、キーワードファイルによる色指定を、
  lispで動的に追加・更新・指定解除できるようにします。

  また、ファイルの先頭で以下のようにすると、キーワードファイル xxx を
  メジャーモードのキーワードに追加して表示します。
    -*- keyword: xxx; -*- 

■インストール
  ;; ni-autoload を使用している人は不要です。

    (require \"update-keywords\")

") ("md5" . "2304d3505463af4287611ddc9a1f2702") ("time" . 3439374877) ("depends") ("category" "Utilities") ("changes" . " on 2008-12-26
  ・ファイルの先頭でキーワードファイルを指定できるように

 on 2008-07-07
  ・初版作成") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "cfns2") ("version" . "2010.01.02") ("author" . "Masahiro Nakano") ("file" . "cfns22010.01.0261e889bb0ce53e0bb1414856be98f232.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fcfns2&file=cfns22010.01.0261e889bb0ce53e0bb1414856be98f232.tar.gz") ("description" . "[ツール] [TAGSファイルの作成] で生成する c/c++ 用のタグファイル生成
関数 c-maketags よりも c++への対応度を高めた c-maketags2 を提供します。
tagdoc と連携して、ソース中のコメントを表示できるようにします。

merge-tags を導入すると、XTAGSを再生成したときに自動的にタグデータを
ロードします。
") ("md5" . "ec6f0a38139b3f9de277dce978812d0f") ("time" . 3471350388) ("depends") ("category" "Development") ("changes" . "2010-01-02
・throw宣言が有っても抽出できるように修正
・typedef 内の typename を処理できるように修正
・_で始まるコンストラクタ名、タイプ名の取得に失敗するのを修正
・ネストした型宣言のパーズを修正
・friend class宣言があるときのパーズを修正
・ローカル変数名の一覧取得で、コメント/文字列内の{}の出現に対応
・ローカル変数名の一覧取得で、long/shrot int 型があると正しく型名が取れなかったのを修正
・ローカル変数名の一覧取得で、return 文でおかしかったのを修正
・ローカル変数名の一覧取得で、関数定義の外では正しくなかったのを修正
・ローカルな変数名の一覧を取得する関数を追加
・タグジャンプのダイアログ表示に、コメントは表示しないよう修正
・名前空間付きの宣言になるべく対応した

2009-09-27
・\\file, @file が入っているコメントは抽出しないように変更

2009-09-15
・配列変数のタグが出力されないのを修正
・関数宣言一行目の末尾コメントを抽出するように修正
・typedef enum のコメントを抽出するように修正
・コメントの整形処理をごみが入りにくくなるように修正。
・class, struct の出力タグを tagdoc表示のために修正
・インストール方法を修正, ni-autoloadのほうも修正

2009-08-29
・クラス名の抽出で無限ループにはまることがあったのを修正
・クラス名で、テンプレート引数を伴なうときの宣言の対応をましにした。

2009-08-22
・公開") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "merge-tags") ("version" . "2010.02.11") ("author" . "Masahiro Nakano") ("file" . "merge-tags2010.02.119acb3fb4b9601355cc8353a2e6c2dee7.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fmerge-tags&file=merge-tags2010.02.119acb3fb4b9601355cc8353a2e6c2dee7.tar.gz") ("description" . " XTAGS (タグファイル) を差分更新できるようにします。また、タグファイル
 を生成する時に指定したフォルダが、マージ対象なら、生成したタグをマージ
 します。
 
 *merge-tags-directory-alist* はディレクトリ名の組のリストです。
 (pushnew '(\"d:/test\" \"d:/test2\") *merge-tags-directory-alist* :test 'equal)
 でd:/test以下で生成したタグを d:/test2 のタグファイルにまとめます。
 
 デフォルトでは、system-root 以下の XTAGS をすべて、system-rootにまと
 めます。こうすると、 site-lispフォルダで修正があっても、lispフォルダ
 タグを再生成する必要が無くなります。
 
 *make-tags-ignore-paths* に無視するディレクトリにマッチする正規表現のリ
 ストを指定する事ができます。
 
 タグファイルを新規作成したとき、別のディレクトリのタグファイルの内容を
 マージすることができます。ライブラリ等のタグファイルを生成しておき、
 ライブラリを使用するディレクトリへマージすると便利です。
") ("md5" . "39a5157c694005c527b9073eca3cc284") ("time" . 3474850902) ("depends") ("category" "Utilities") ("changes" . "2010-02-11
・ダイアログに「状態を記録しない」を追加。
・*tag-path-filters* 廃止。フィルタは *make-tags-ignore-path-regexp-list* による正規表現のみ。
・ディレクトリを抽出してからファイルを抽出していたのを、直接ファイルを抽出する設定に戻した。

2010-01-02
・差分更新でないときに、同じファイルを2回パーズしていたのを修正

2009-10-11
・タグを更新したファイルを記録する変数を追加
・*merge-tags-copy-directory-alist* を追加。
・その他、細かな修正

2009-10-03
・差分更新時に、XTAGSがないディレクトリがあるとエラーが出ていたのを修正

2009-09-27
・サブディレクトリを処理対象にしていなくても、1つ下のディレクトリまで
  処理していたのを修正 (2009-08-29版のバグ)
・メッセージの表示頻度を変更

2009-08-29
・*tag-path-filters* をディレクトリ名に対してのフィルタに変更し、高速化

2009-08-18
・デバッグ用の出力バッファを一時バッファに設定
・make-tags-file1 で多値が返せていなかったのを修正
・タグを出力するバッファを一時バッファにし忘れていたのを修正
・*make-tags-ignore-paths* を設定していないときの高速化
・いくつか関数名変更

2009-01-10
・ディレクトリ名の比較を equalp でするように修正
・誤って default-directory を変更してしまっていたのを修正
・XTAGS の生成時に、バッファサイズが大きくなると速度が遅くなるので、
  バッファを一定サイズで分割するように変更。
・タグファイルの作成に失敗する場合があるのを修正
・debug用の キーワードシンボルを変更
・差分更新の履歴をディレクトリごとに持つように修正。
・タグファイル生成時にエラーが出るのを修正
・*post-make-tags-hook* を追加
・*make-tags-ignore-paths* が機能しなくなっていたのを修正
・ほぼ作り直し
・差分更新に対応
・深さの指定が 0 以外おかしかったのを修正
・無視するパスのマッチングを、string-looking-at から string-matchp
  に変更
・*make-tags-ignore-paths* を追加。
・ni-autoload でうまくロードできていなかったのを修正

2006/11/21
・公開
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "katex-autoload-dir") ("version" . "2008.01.10") ("author" . "Masahiro Nakano") ("file" . "katex-autoload-dir2008.01.1060c567f639293c16d16a361b6dfe7afb.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fkatex-autoload-dir&file=katex-autoload-dir2008.01.1060c567f639293c16d16a361b6dfe7afb.tar.gz") ("description" . "■機能
  katexロード時、または既にロードされている時は、この lisp がロードさ
  れた時に、katex/autoload/ 以下の .l ファイルと ~/.katex ファイルを
  自動でロードします。

■インストール
 .xyzzy か siteinit.l に下のを書いてください．
  ni-autoload を使用している人は必要ありません。
  (require \"katex-autoload-dir\")

■アンインストール
  ヒストリー変数は使用していません。
  自分で書いた設定とインストールしたファイルを削除してください。
") ("md5" . "0f8d80c430ffb1038e9fae49aa9f355b") ("time" . 3408965979) ("depends" "KaTeX") ("category" "Utilities") ("changes" . "■更新履歴
 on 2008-01-08
  ・ ~/.katex ファイルがないときのメッセージの表示方法を変更

 on 2007-09-23
  ・公開
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "hs-tags") ("version" . "2008.12.27") ("author" . "Masahiro Nakano") ("file" . "hs-tags2008.12.27efb7bfd805659f2f2ee87168a89d0a94.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fhs-tags&file=hs-tags2008.12.27efb7bfd805659f2f2ee87168a89d0a94.tar.gz") ("description" . "■説明
  haskell 言語用のタグシステムです。

     [ツール] > [TAGSファイルを作成]

  でソースディレクトリに .hs があるディレクトリを指定して、XTAGSを生成
  してください。関数名などの上で F4 を押すと定義した部分にジャンプしま
  す。S-F4 で戻ります。

  tagdoc と併用することで、hadoc形式のコメントを メッセージウィンドウ
  に表示できます。

■インストール

  ;; ni-autoload を使用している人は不要です。

    (require \"hs-tags\")

  と、.xyzzy か siteinit.l に書いてください。
") ("md5" . "d0254aacfd02531d996eb6a4de1566c6") ("time" . 3439375327) ("depends" "hs-mode" "tagdoc") ("category" "Editing") ("changes" . "■更新履歴
 on 2008-12-27
  ・公開
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ldoc2") ("version" . "2008.04.29") ("author" . "Masahiro Nakano") ("file" . "ldoc22008.04.299618e22f9f029db514313142ed00db14.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fldoc2&file=ldoc22008.04.299618e22f9f029db514313142ed00db14.tar.gz") ("description" . "lisp-mode/lisp-interaction-mode でカーソル下のシンボルに
対するドキュメントを表示します。") ("md5" . "f7442c43145b8443882b943958fd1946") ("time" . 3418413584) ("depends") ("category" "Editing") ("changes" . " on 2008-04-24
  ・デバッグ用のコードの使用・不使用を *features* で指定するように。

 on 2008-03-31
  ・遅延方法を少し変更し、CPU使用率の低減を図った

 on 2008-01-18
  ・遅延表示機能が働かずにすぐに表示されていたのを修正

 on 2008-1-8
  ・ *ldoc-enable-timer* が defparameter で宣言されていたのを defvarに変更
  ・関数・変数で同名のものがある時、片方をpopup-string で表示するように変更 
      (構造体は未対応)
  ・カーソル移動直後ではなく、ワンテンポ遅れて表示するオプション
    *ldoc-enable-timer* を追加。デフォルト on。
  ・カーソル移動後に表示されるまでの時間指定 *ldoc-timer-wait* を追加
  ・表示後、次に表示するまでの時間指定 *ldoc-timer-continued-wait* を追加

 on 2007-9-1
  ・シンボル上だけでなく、関数の引数位置でも関数ドキュメント表示
  ・上記を有効にするオプション *ldoc-show-current-function-documents* を追加。
       (default t で、有効)
  ・ドキュメントを全て表示するように変更
  ・関数・変数で同名のものがある時、片方をミニバッファ/popup-string で
    表示するように変更 (構造体は未対応)
  ・*ldoc-enable-timer* が non-nil で、ドキュメントを遅延して表示
  ・キーボードマクロ実行中は表示しないように変更
  ・*ldoc-activated-mode-list* を無視していたのを修正
  ・細かなバグ修正

 on 2007/3/3
  ・変数と関数に同名のシンボルが有る場合に対応
  ・上の機能を有効にするオプション *ldoc-show-same-name-documents* を追加
      デフォルトは無効 (nil)
  ・カーソル位置がシンボルの先頭の時にldocが表示されないことがあるのを修正
  ・細かな修正
  ・sort, call-interactively の引数を正しく表示できるように修正

 on 2007/2/26
  ・*buffer-package* を ldoc-buffer-package に変更
    (*buffer-package* は xyzzy で既に使用済みでした)
  ・*buffer-package* も利用して、シンボルを探すように変更
  ・シンボルが見つからない時に、ldoc-buffer-package を
    自動更新する *ldoc-auto-update-package* を追加
  ・defvar-local を使用しないように再び修正

 on 2007/2/21
  ・デバッグ用の表示の削除し忘れを修正

 on 2007/2/20
  ・カーソル位置が移動しなくても表示するコマンドを指定する *ldoc-permitted-commands* を追加。
      デフォルト値として mouse-nop を追加したので、マウスのクリックでドキュメントが表示可

 on 2/20/2007
  ・goal-column を保存していない場合があったのをさらに修正
  ・一部 defvar-local を使用するように変更

 on 2007/2/19
  ・goal-column を保存していない場合があるのを修正
  ・ldoc を表示しないコマンドを指定する *ldoc-inhibited-commands* を追加。
  ・defvar-local を使用しないように変更

 on 2006/11/21
  ・type修正

 on 2006/10/21
  ・netinstaller 対応
  ・関数引数がないときに NIL と表示するのを () に。

 on 2006/05/29
  ・ドキュメントがうまく拾えなくてエラーが出るときに表示をマイルドに

 on 2006/05/10
  ・dabbrev-popup完了時にも表示させる。
    complete.l の popup-completion-list を再定義。
      ※最後にフック *after-popup-completion-hook* を追加しただけ

 on 2006/05/08
  ・単語上だけでなく、単語の終端でもドキュメントを表示するように修正

 on 2005/08/07
  ・package を更新するための関数を追加

 on 2004/10/28
  ・カーソル移動系コマンド後のみ表示するように修正
  ・minibuffer で入力後は表示を抑制

 on 2004/03/26
  ・デフォルトのパッケージ以外にバッファ中で指定された package も検索するように
  ・関数ドキュメントも表示するように変更
  ・細かな修正
") ("notice" . "popup-completion-list を再定義して、フックを追加しています。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "howm-calendar") ("version" . "2010.02.11") ("author" . "Masahiro Nakano") ("file" . "howm-calendar2010.02.11a372e183b682ffed29d0418ac70bbf40.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fhowm-calendar&file=howm-calendar2010.02.11a372e183b682ffed29d0418ac70bbf40.tar.gz") ("description" . "■機能
  howm で登録した予定を、カレンダーでもポップアップ表示します。

■インストール
  howm-init.l に下のを書いてください．
  ni-autoload では設定を行いません。

  (require \\\"howm-calendar\\\")

■アンインストール
  ヒストリー変数は使用していません。
  自分で書いた設定とインストールしたファイルを削除してください。

■使用方法
  C-c , C で、カレンダー付き howm の Todo リストを表示します。

■注意事項
  ed::calendar-print を修正します。
") ("md5" . "e1e7956a74f483b60f1084d61075188f") ("time" . 3474850874) ("depends" "howm-wrap") ("category" "Utilities") ("changes" . "■更新履歴
2010-02-11
・HE-grep を導入しても動作するように修正。

2007-09-16
  ・ パッケージを elib に変更。
  ・ 祝日の場合、数字の色をカレンダー本来の表示色で表示するよう変更
  ・ *calendar-title-string-regexp-list* を追加。
     calendar-title-string の変更に対応?

2007-09-02
  ・ インストール手順を変更
  ・ *post-command-hook* が定義されていないのに対処

2007-09-02
  ・ 上書きする関数をcalender ではなく、ed::calender-print に最修正
  ・ *calender-print-hook* 復活。
  ・ 次の/前のスケジュールへ移動する 
     calendar-next-schedule / calendar-previous-schedule を追加
  ・ howm-menu, calendar からの終了方法を変更
  ・ キー入力で予定をポップアップするように変更
  ・ カレンダーからhowmの予定を検索できるように
  ・ その他、細かい修正

2007-09-01
  ・ 分割方法を指定できるように変更 (*calendar-vertical-split*)
  ・ *calendar-width*,  *calendar-height* で分割時のサイズも指定可
  ・ *calendar-print-hook* を廃止
  ・ 替わりに *calendar-mode-post-hook* を追加
  ・ ed::calendar-print を修正していたのを calendar に変更
  ・ calendar の折り返し表示をなしに変更
  ・ その他、細かい修正

2007-08-26 
  ・ 公開

2007-06-14
  ・ schedule に対応
  ・ 土曜日に予定等がつかなかったのを修正
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "katex-kill-proc") ("version" . "2008.01.10") ("author" . "Masahiro Nakano") ("file" . "katex-kill-proc2008.01.10dfb606d0543240a55d190f80a1080415.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fkatex-kill-proc&file=katex-kill-proc2008.01.10dfb606d0543240a55d190f80a1080415.tar.gz") ("description" . "KaTeX で platex などがファイルをロックして保存できない状態を回避します。
") ("md5" . "1f55a14e233f5db79e93932e95003e79") ("time" . 3408965989) ("depends" "katex-autoload-dir" "KaTeX") ("category" "Utilities") ("changes" . "■更新履歴
 on 2008-1-8
  ・ katex-autoload-dir を使うように

 on 2007-1-9
  ・ netinstaller に対応
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "tagdoc") ("version" . "2010.02.11") ("author" . "Masahiro Nakano") ("file" . "tagdoc2010.02.1142d909a5f7551ca9d815f5cefeb44b80.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Ftagdoc&file=tagdoc2010.02.1142d909a5f7551ca9d815f5cefeb44b80.tar.gz") ("description" . "■ Functionality
 ldoc のようなドキュメントの表示を、タグに書き出しておいた情報を元に行
 います。したがって、XTAGSの書き出しを対応しているものに変更しなければ、
 表示されません。タグシステムは、下位互換性を保っているので、基本的に
 遅くなる以外の副作用はありません。

 利用するためには、使用する各メジャーモードが xyzzy のタグシステムを実
 装している必要があります。

 フルの機能を利用するためには、以下に示す 拡張した XTAGS フォーマット
 でドキュメントも追加してください。

 XTAGS ファイルからではなく、静的なデータからドキュメントを表示したい
 場合は、 add-tagdoc-data を使って設定します。このとき、XTAGS ファイル
 がないディレクトリで静的なデータを追加すると、自動で XTAGS ファイルが
 生成されます。

 merge-tags も導入していると、タグファイル更新時に自動的にドキュメント
 も更新されます。

■ Usage
 ;; ni-autoloadを使用している人は不要です。
 (require \"tagdoc\")
 (turn-on-tagdoc)
") ("md5" . "cf6ddbebd6f96f9a1e6f3a4d63df92c9") ("time" . 3474851512) ("depends" "merge-tags") ("category" "Documentation") ("changes" . "2010-02-11
・*tagdoc-show-same-name-documents* を 数値/nil で指定するようにし、
  表示するドキュメント数を指定するようにした。
・軽微な修正

2010-01-02
・カーソル移動中にエラーが表示されることがあったのを修正
・カーソル移動中に無限ループにはまることがあったのを修正

2009-09-27
・サブディレクトリを処理対象にしていなくても、1つ下のディレクトリまで
  処理していたのを修正
・メッセージの表示頻度を変更

2009-08-29
・grep-dialog のレスポンス改善
・grep-dialog で、tagdocの拡張フォーマットを正しく扱えていなかったのを修正

2009-8-25
・grep-dialog のレスポンス改善
・grep-dialog で、tagdocの拡張フォーマットを正しく扱えていなかったのを修正

2009-08-22
・タグフォーマットにを追加
・ni-autoload時に、tagdoc を有効にするようにした。
・*tagdoc-print-message* を廃止し、*tagdoc-print-message-hash* を追加。
表示するバッファ毎に表示用関数を指定するのではなく、タグファイルの拡
張子毎に指定するようにした。
・タグ表示のデータを一部キャッシュするようにし、レスポンス改善。
・タグテーブル生成時から表示時に表示のための処理を遅延させ、テーブル作
成高速化。
・tagdoc構造体を stagdoc構造体から派生するように変更。
結果として、tagdocテーブル生成を高速化。
・tagdocテーブルの生成時の並行動作をましにした。
・tagdocバッファを再評価すると、検索でヒットしなくなるバグを修正
・XTAGS に埋め込まれた tagdoc で、引数とドキュメントを正規表現を使わ
ずに取得するように変更
・メッセージの表示を一部変更
・デバッグ時の表示を少し改善 (同じメッセージはまとめるように)
・変数 tagdoc-print-message を *tagdoc-print-message* に名前を変更
・*find-entry-filter* を追加。
・tagdoc-table の生成の非同期処理のレスポンスを改善
・構造体 stagdoc を追加。
・それに伴い、データ追加系と表示系の関数を修正。
・typo修正
・デバッグメッセージを自動追従するように変更
・tagdoc-autoload-data が、実行可能なファイルだけをロードしていたの
を修正。

2009-01-07
・テーブルを生成するときに、入力を与えなければ読み込みを加速するように変更

2008-12-27
・公開") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "lpp") ("version" . "2008.05.05") ("author" . "Masahiro Nakano") ("file" . "lpp2008.05.056259615da12b482ac5a966aa7a18edfd.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Flpp&file=lpp2008.05.056259615da12b482ac5a966aa7a18edfd.tar.gz") ("description" . "■機能
  ・C-j や C-x C-e での評価を ファイル中の直近の
    in-package で指定されたパッケージ内で評価するように。
  ・eval-last-sexp で #S(...) や #1= などで始まるS式を、
    #の部分から適切に評価するように。

    (上記、2つの機能は常に有効です。)

  ・マクロ展開や評価時に、結果を整形して出力するコマンド
    pprint-eval-print-last-sexp を用意。

    Shidoさんの pme と比べて、よりきれいに出力できるかもし
    れませんが、その分バグを含んでいる可能性も高いです。

    ※ 循環リストは整形表示しません。

  ・pretty-print-list は、バッファに出力されたリストを整形します。
    pprint-eval-print-last-sexp のように、 lisp の構文情報に基づ
    くのではなく、桁位置や開き括弧、閉じ括弧に基づいて行います。
    pprint-eval-print-last-sexp では整形できない循環リストや、
    lispプログラムでない、複雑なリストを整形するときに利用してく
    ださい。 xml-parser-modoki などの結果を整形するのに利用できます。


■インストール
 .xyzzy か siteini.l に下のを書いてください．
  ni-autoload を使用している人は必要ありません。
  (require \"lpp\")

  また、Shido さんの lispmode.l を導入する事で、
  整形出力が多少早くなると思います。 (推奨)

  キーバインドは各自設定してください。
  ;;例1
  (define-key *lisp-interaction-mode* #\\LFD 'pprint-eval-print-last-sexp)

  ;;例2
  (define-key *lisp-interaction-mode* #\\LFD
	      (x-key-macro 16 'eval-print-last-sexp 'pprint-eval-print-last-sexp))

  ;;例3
  (define-key *lisp-interaction-mode* #\\C-o
	      (x-key-macro 16 'open-line 'pretty-print-list))
") ("md5" . "960261c989bfbff211be38a67f0060ab") ("time" . 3418935396) ("depends") ("category" "Editing") ("changes" . " on 2007-11-11
  ・ pretty-print-list を追加。
     整形処理したいリストの先頭の開き過去の上で実行する。

 on 2007-2-18
  ・*pprint-linebreak-list* を追加。

 on 2007-1-26
  ・文字列中の \\t, \\n を評価しないオプション *pprint-string-no-eval* を追加。デフォルトは off.

 on 2007-1-24
  ・lambda式でおかしかったのを修正

 on 2007-1-24
  ・ドット対の表示がおかしかったのを修正

 on 2007-1-17
  ・cond, case の展開を改善
  ・出力のし方を eval-print-last-sexp に合わせた
  ・eval-last-print-sexp で #1= が先頭にあるときはそれも含めて評価するように修正
  ・循環リストで *print-circle* が t の場合に、無限ループに落ちるので
    その場合は通常通りの出力に修正。
  ・(let (x) ・・・) や (let () ・・・) でおかしかったのを修正。

 on 2006-12-31
  ・空リストの出力がおかしかったのを修正

 on 2006-12-13
  ・defunの展開がおかしかったのを修正
  ・do, do* の展開を改善
  ・時々、空行ができてしまうのを修正
  ・lpp のマクロ定義がおかしかったのを修正

 on 2006-12-08
  ・keyword-package ～ というエラーが出るのを修正

 on 2006-12-08
  ・公開
") ("notice" . "  eval-print-last-sexp eval-region を修正しています。
  
  副作用として、C-j や C-x C-e の実行ごとにパッケージが
  実行前に戻されます。*package*を変更したい時は、
  eval-expression (Esc Esc) で変更してください。
") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "session-ext") ("version" . "2008.01.11") ("author" . "Masahiro Nakano") ("file" . "session-ext2008.01.11928e53d3d91c1ebf414b351817f282e2.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fsession-ext&file=session-ext2008.01.11928e53d3d91c1ebf414b351817f282e2.tar.gz") ("description" . "セッションに含める情報を拡張するために、フックを追加しました。
このファイルをロードしただけでは、オリジナルの動作とほとんど違いありま
せん。基本的にフックを追加する事で、処理を追加できるようにします。

多くの拡張lispでこれらの関数を再定義していて、競合する原因となっていま
す。それを解消するためにいくつかのフックを追加し、拡張lispが再定義する
ことなくフックを追加する事で機能を追加できるようにします。


save-session-info, restore-session-info, load-session,
list-buffer-info の定義を上書きしています。
") ("md5" . "67d228a5113696a7a5476c77f9737285") ("time" . 3408966001) ("depends") ("category" "Utilities" "Lisp") ("changes" . "  on 12/11/2006
   ・restore-session-info, list-buffer-info に対してもフックを追加。
   ・誤ってdebug用のコードが入っていたのを修正

  on 09/08/2006
   ・公開
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ext-lisp-maketags") ("version" . "2008.04.29") ("author" . "Masahiro Nakano") ("file" . "ext-lisp-maketags2008.04.29f76127b45935ad9fa5fc5e10b4f5ba0d.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Fext-lisp-maketags&file=ext-lisp-maketags2008.04.29f76127b45935ad9fa5fc5e10b4f5ba0d.tar.gz") ("description" . "lisp用のmaketagsを上書きします．
オリジナルのlisp用のmaketagsでは、tagを生成してくれない構文がいくつかあるので、
そうした構文でもtagを生成するようにします。

元のコードとの差分は
 ・tag生成過程のエラー補足の追加．
 ・defstructへの対応
 ・defmethod defgeneric si::defun-builtin defsetf define-setf-method
   deftype defpred define-history-variable の追加
 ・defconstの追加
 ・let/progn 等の内側探索
 ・(si:*fset 'xxx yyy) / (setf (symbol-function 'xxx) yyy) の対応
 ・(setq-default xxx yyy) の対応
となっています．
") ("md5" . "5818d5dda94c96ff6a3cf6162def2a05") ("time" . 3418413711) ("depends") ("category" "Utilities") ("changes" . "   on 2008-04-15
    ・ffiの関数に対応 (define-dll-entryなど)
    ・タグファイルの行頭に空白が入ってしまうバグを修正
  
   on 1/8/2008
    ・or の中もチェックするように変更

   on 2/9/2007
    ・setq-default もタグ付けするように (ただし、関数定義内等は対象外)

   on 1/13/2007
    ・define-history-variable に対応

   on 12/08/2006
    ・途中でパーズできないS式が出てきても無視して続けるように。
    ・ni-autoload でうまくロードできなかったのを修正。

   on 11/21/2006
    ・ライセンス条項追加
    ・autoload化
    ・細かな修正

   on 11/21/2006
    ・公開
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "insert-character") ("version" . "2008.12.27") ("author" . "Masahiro Nakano") ("file" . "insert-character2008.12.2726b1268e9438a6e2f5cef342224c4250.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fwhimsical%2Finsert-character&file=insert-character2008.12.2726b1268e9438a6e2f5cef342224c4250.tar.gz") ("description" . "■機能
様々な文字の入力を、キーバインド・リージョン内の置換・abbrev風入力によ
って行います。

$XYZZY/.insert-character.sample を $XYZZY/.insert-character に名前を変
更するなどして、そこで設定してください。

sampleの設定ファイルとデフォルトのキーバインドでは、
  ・C-? a で α (半角) が入力できます。
  ・M-x texify-on したとき、\\alpha と入力すると、α (半角) が入力されます。

■インストール
  $XYZZY/.insert-character.sample を $XYZZY/.insert-character に名前を
  変更してください。

  ni-autoload 使用している人は以下は不要です。
  site-lisp.l か .xyzzy に以下を追加してください。

    (require \"insert-character\")

  必要であれば、ダンプしてxyzzyを立ち上げなおして下さい。
") ("md5" . "06037ae3d76f48ef189dde6a1233ece1") ("time" . 3439375539) ("depends") ("category" "Documentation") ("changes" . " on 2008-12-27
  ・公開
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://womo.nconc.net/misc/packages.l") ("name" . "WOMO") ("author" . "oosawa") ("url" . "http://womo.nconc.net/") ("description" . "") ("packages" (("name" . "hateda-mode") ("version" . "0.3.1") ("author" . "oosawa") ("file" . "hateda-mode.lzh") ("src" . "http://womo.nconc.net/misc/files/hateda-mode.lzh") ("description" . "はてなダイアリー用のメジャーモードとはてダラとの連携ツール") ("category") ("md5" . "8b40c3eaeccaf7db7733fa72389e4c2e") ("time" . 3398539933) ("depends") ("changes" . "グループ機能対応他") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "html-popup-menu") ("version" . "0.0.1") ("author" . "oosawa") ("file" . "html-popup-menu.lzh") ("src" . "http://womo.nconc.net/misc/files/html-popup-menu.lzh") ("description" . "HTML ファイルを修正するときに便利なポップアップメニューです。html+-mode と併用してください。") ("category" "Editing") ("md5" . "ab84333bc645073e95358ad4645eb705") ("time" . 3398475677) ("depends" "html+-mode") ("changes" . "Netinstaller に対応しました。") ("notice" . "html+-mode が必須です。") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://up.xyzzy.jp/public/bulb/") ("name" . "up.xyzzy.jp/public/bulb/") ("author" . "") ("url" . "http://up.xyzzy.jp/public/bulb/") ("description" . "") ("packages" (("name" . "monday") ("version" . "2008.02.02") ("author" . "bulb") ("file" . "monday2008.02.02ec0634341b660c8cdbfc61cd0f7d688f.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fbulb%2Fmonday&file=monday2008.02.02ec0634341b660c8cdbfc61cd0f7d688f.tar.gz") ("description" . "monday.vimを参考にして作ってみました。
キャレット(カーソル)直下の単語をトグルします。
・0 -> 1 -> 2 -> 3 ...
・monday -> tuesday -> wednesday ...
・True -> False -> True ...
・public -> protected ->  private -> public ...
          
\"1st\" \"2nd\" \"3rd\" ... には、未対応です。") ("md5" . "cad77ffeaae46888a40faa11c7e42aff") ("time" . 3410945798) ("depends") ("category" "Editing" "Utilities") ("changes" . "- 2008-02-02 文字がない場所でのエラー処理を追加
             monday-get-current-word無駄処理を削除") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "cscope_bin") ("version" . "2008.02.11") ("author" . "bulb") ("file" . "cscope_bin2008.02.11609943b2cfdfb7c584c09f585751720d.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fbulb%2Fcscope_bin&file=cscope_bin2008.02.11609943b2cfdfb7c584c09f585751720d.tar.gz") ("description" . "Cscope on Win32

http://iamphet.nm.ru/cscope/index.html
からの再配布(BSD License)です。
") ("md5" . "e0322de01f87f2c969d5865a54d6da0f") ("time" . 3411709778) ("depends") ("category" "Development" "Utilities") ("changes" . "初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "gtags_bin") ("version" . "2008.02.11") ("author" . "bulb") ("file" . "gtags_bin2008.02.110c97ee757ed6f9d3572de57f471a2da2.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fbulb%2Fgtags_bin&file=gtags_bin2008.02.110c97ee757ed6f9d3572de57f471a2da2.tar.gz") ("description" . "global for win32

http://www.geocities.com/jadoxa/global/index.html
からの再配布(GPL3)です。

exeファイルは次の場所にインストールされます。

$XYZZYHOME/bin/gtags.exe
$XYZZYHOME/bin/global.exe
$XYZZYHOME/bin/gozilla.exe
$XYZZYHOME/bin/gtags-cscope.exe
$XYZZYHOME/bin/gtags-parser.exe
$XYZZYHOME/bin/htags.exe") ("md5" . "2b3a9c6733d2c45c6f23396618ae1173") ("time" . 3411711912) ("depends") ("category" "Development" "Utilities") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "gtags") ("version" . "2007.12.27") ("author" . "bulb") ("file" . "gtags2007.12.2746b7cd35165a87111eceb41f46fafa93.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fbulb%2Fgtags&file=gtags2007.12.2746b7cd35165a87111eceb41f46fafa93.tar.gz") ("description" . "gtags.elの移植です。GNU GLOBALを使用したタグジャンプを提供します。") ("md5" . "188c234402dc3068146b46eb68032164") ("time" . 3407705039) ("depends" "emacs.l") ("category" "Editing" "Development") ("changes" . "  ・emacs.l依存の解消(NANRIさん提供)
  ・gtags-find-tag-by-event(サポート外)あたりを修正
    バイトコンパイルが通るように修正。
  ・README.txtの添付
") ("notice" . "別途 gtags.exe, global.exe が必要になります。
本家のwin32版をダウンロードしてPATHの通ったフォルダに置いてください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ctags_bin") ("version" . "2008.02.11") ("author" . "bulb") ("file" . "ctags_bin2008.02.11712da158e26d3510d6ff78974d169ce8.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fbulb%2Fctags_bin&file=ctags_bin2008.02.11712da158e26d3510d6ff78974d169ce8.tar.gz") ("description" . "exuberant ctags 日本語対応版

http://hp.vector.co.jp/authors/VA025040/ctags/
からの再配布(GPL2)です。

exeファイルは次の場所にインストールされます。
$XYZZYHOME/bin/ctags.exe
") ("md5" . "ff601a4a29bce8f837db3ac9658a2eb6") ("time" . 3411710841) ("depends") ("category" "Development" "Utilities") ("changes" . "初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "cscope") ("version" . "2008.08.27") ("author" . "bulb") ("file" . "cscope2008.08.27f05f4f1a648358c7620919f7ae3971b9.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fbulb%2Fcscope&file=cscope2008.08.27f05f4f1a648358c7620919f7ae3971b9.tar.gz") ("description" . "タグジャンプ用のフロントエンドを提供します(マイナーモード)。
ctagsやgtagsの代替になるものです。
対応言語：C/C++

※外部コマンド cscope.exe が別途必要になります。
  以下のいづれかの方法で入手して下さい。
1. NetInstaller の cscope_bin を入れる
2. Win32版バイナリ http://iamphet.nm.ru/cscope/index.html
3. cygwin環境で make") ("md5" . "a0f0d945dfefc4579c673f6041afeef4") ("time" . 3428828767) ("depends") ("category" "Development" "Utilities" "BSDL") ("changes" . "2008-08-27
	* cscope-result-mode 時のデザインを少し変更
	* 以下の関数が正しく動作していなかったのを修正
	  - cscope-find-egrep-pattern
	  - cscope-find-this-text-string

2008-08-21
	* いろいろと追加
	* タグジャンプ用のスタックをサポート
	* *cscope-1pane-view* 1paneモード追加
	* *cscope-find-symbol-direct-mode* さくさく行きたい人向け


2008-04-24
	* cscope-rebuild-db が正しく動作していなかったのを修正
	* gtags.el風味なモードを追加

2008-03-18
	* miyamukoさん提供patchの取り込み

2008-03-17
	* リファクタリングなど

2008-03-16
	* symbol と 実行ディレクトリを指定できるように find 系の関数を変更。
	* cscope-find-c-symbol
	* cscope-find-global-definition
	* cscope-find-functions-called
	* cscope-find-functions-calling-this-function
	* cscope-find-this-text-string
	* cscope-find-file
	* cscope-find-files-including

2008-03-14
	* symbol などの強調表示対応
	* jump用の stack を用意
	* cscope-back-tag-jump
	* cscope-push-stack

2008-02-17 *cscope* バッファー上で再検索できていなかったのを修正
	* README.txtを追加
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "highlight") ("version" . "2008.05.28") ("author" . "bulb") ("file" . "highlight2008.05.2837ed74a0dea851db95018d506f8f49e4.tar.gz") ("src" . "http://up.xyzzy.jp/public_backend/index.php?plugin=attach&pcmd=open&refer=home%2Fbulb%2Fhighlight&file=highlight2008.05.2837ed74a0dea851db95018d506f8f49e4.tar.gz") ("description" . "・カーソル(キャレット)直下の単語を色付けします。
・highlight-regexp.el や hi-lock.el に似た機能
") ("md5" . "6d372825db8b574b374b0d76df5edc27") ("time" . 3420968268) ("depends") ("category" "Utilities" "BSDL") ("changes" . "- 2008.05.28
	* delete-text-attributes に変更

- 2008.05.24 リファクタリング
	* highlight-get-current-word を変更
	 skip-syntax-spec-forward, skip-syntax-spec-backward
	 looking-at-backwardの削除

- 2008.05.02 リファクタリング
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://www.geocities.co.jp/megahurtz_dk/packages.txt") ("name" . "Megahurtz") ("author" . "Deecay") ("url" . "http://www.geocities.co.jp/Milano-Cat/2067/") ("description" . "That megahurtz!") ("packages" (("name" . "mercurial") ("version" . "0.2") ("author" . "Deecay") ("file" . "mercurial-20090215.zip") ("src" . "http://www.geocities.co.jp/Milano-Cat/2067/mercurial-20090215.zip") ("description" . "Minor mode for Mercurial VCS") ("category" "Miscellaneous") ("md5" . "b1c56b57d6dd16315856dab0b2281e8c") ("time" . 3443668075) ("depends") ("changes" . "1.1対応") ("notice" . "Please send me patches!") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "eb") ("version" . "0.5") ("author" . "Deecay") ("file" . "ebdict-20090215.zip") ("src" . "http://www.geocities.co.jp/Milano-Cat/2067/ebdict-20090215.zip") ("description" . "EPWING辞書検索") ("category" "Miscellaneous") ("md5" . "17293566480d115e1a1ab337a7c1ce8d") ("time" . 3443666653) ("depends") ("changes" . "Appendixに対応") ("notice" . "www.geocities.jp/megahurtz_dk/eb/index.htmlにイントロダクションとマニュアルがあります｡") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "iswitchb") ("version" . "1.1") ("author" . "Deecay") ("file" . "iswitchb-20070604.zip") ("src" . "http://www.geocities.co.jp/Milano-Cat/2067/iswitchb-20070604.zip") ("description" . "バッファ切り替えをキーボードから") ("category" "Miscellaneous") ("md5" . "c12fa74ef42a85f5086af60f94e3d983") ("time" . 3389883233) ("depends" "elisp") ("changes" . "エラーが出にくくなったかも") ("notice" . "雄猫のがらくた置き場のemacs lisp 移植キットもインストールしてください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "py-mode") ("version" . "0.97") ("author" . "Deecay") ("file" . "py-mode-20070407.zip") ("src" . "http://www.geocities.co.jp/Milano-Cat/2067/py-mode-20070407.zip") ("description" . "Major mode for python") ("category" "Editing") ("md5" . "19dfea6b9a4ec2dd4f2552f470b5ab78") ("time" . 3384928382) ("depends") ("changes" . "逆インデントがおかしかったのを修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "sudoku") ("version" . "0.0.1") ("author" . "Deecay") ("file" . "sudoku.zip") ("src" . "http://www.geocities.co.jp/Milano-Cat/2067/sudoku.zip") ("description" . "xyzzyで数独ゲーム") ("category" "Games") ("md5" . "38f4a98e388362814bf467cfb9b49f11") ("time" . 3357884663) ("depends") ("changes" . "新規公開") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "uniquify") ("version" . "1.0") ("author" . "Deecay") ("file" . "uniquify-20050723.zip") ("src" . "http://www.geocities.co.jp/Milano-Cat/2067/uniquify-20050723.zip") ("description" . "重複バッファ名を見やすく") ("category" "Miscellaneous") ("md5" . "df87ef276498bb1c3e6cf5e1056ac2de") ("time" . 3331040610) ("depends" "elisp") ("changes" . "initial version") ("notice" . "雄猫のがらくた置き場のemacs lisp 移植キットもインストールしてください。") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script&openfile=packages.l") ("name" . "silog") ("author" . "shiro") ("url" . "http://white.s151.xrea.com/wiki/") ("packages" (("name" . "filer+migemo") ("version" . "2006.09.01") ("author" . "shiro") ("file" . "filer+migemo-2006.09.01.zip") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&pcmd=open&file=filer%2Bmigemo-2006.09.01.zip&refer=script%2Ffiler%2Bmigemo") ("description" . "xyzzy付属のファイラー上でMigemoを使った インクリメンタルサーチを可能にするものです。") ("md5" . "73c8e1936be2955d11b7743856279f7d") ("time" . 3366046156) ("depends" "migemo.l") ("category" "Utilities") ("changes" . "- 関数を上書きしないようにした
- {C-s,C-r}中に{C-s,C-r}をした時もちゃんとMigemoで再検索するようにした
- 先頭一致しない時は部分一致検索するようにした
- filer-isearch-migemo中に{C-s,C-r}しても入力文字を持ち越せるようにした") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "approx-search") ("md5" . "06e495aefe17b77988de51a38358b739") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fapprox-search&openfile=approx-search-2007.02.15.zip") ("version" . "2007.02.15") ("author" . "shiro") ("file" . "approx-search-2007.02.15.zip") ("description" . " emacs用の曖昧検索ライブラリ approx-search.el の xyzzy移植版です
 ") ("time" . 3380454344) ("depends") ("category" "Libraries" "Text Processing") ("changes" . "キーボードマクロ実行時にちらつかないようにした") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "describe-bindings-mode") ("md5" . "affafc9fd7ce8bc8cc9bf3e4981ba0c8") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fdescribe-bindings-mode&openfile=describe-bindings-mode-2007.02.22.zip") ("version" . "2007.02.22") ("author" . "shiro") ("file" . "describe-bindings-mode-2007.02.22.zip") ("description" . " キーマップ表示(describe-bindings)に
  * 色付け
  * タグジャンプ
  * qで閉じる
  * 強制的に真ん中から上下2分割での表示
  * 日本語の解説表示
 の機能を付けます。
 
 日本語の解説表示にはinfo-modoki-mode + reference.txtが、
 色付けにはlispのキーワードファイルが必要です。") ("time" . 3381086409) ("depends") ("category" "Utilities") ("changes" . "ミニバッファでも使えるようにした") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "gmark-select") ("md5" . "9a45835f673039f2546d9794a080b659") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fgmark-select&openfile=gmark-select-2007.02.22.zip") ("version" . "2007.02.22") ("author" . "shiro") ("file" . "gmark-select-2007.02.22.zip") ("description" . " 画面を分割してグローバルマークを選び、ジャンプしたり削除したりできます。") ("time" . 3381086398) ("depends") ("category" "Utilities") ("changes" . "gmark-select-search-forwardで次のバッファも探すようにした") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "scope") ("md5" . "84dab8ea8b70907735591dc38dcf2a5d") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fscope&openfile=scope-2007.02.22.zip") ("version" . "2007.02.22") ("author" . "shiro") ("file" . "scope-2007.02.22.zip") ("description" . " 指定された条件に合う場合のみ、グローバルマップやローカルマップより
 優先されるキーバインドの設定をすることができます。
 条件に合わなければローカルマップやグローバルマップで
 設定されたコマンドが実行されます。
 
 あとライブラリ的に。というかac-modeの補佐的に。
 (こっちがメインかも)
 ") ("time" . 3381129650) ("depends") ("category" "Utilities") ("changes" . "いろいろ調整
lisp-modeでのac-modeとの連携追加") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "virtual-file-archive") ("md5" . "56387a8ee4febd24e324d4c46504483c") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fvirtual-file-archive&openfile=virtual-file-archive-2007.03.23.zip") ("version" . "2007.03.23") ("author" . "shiro") ("file" . "virtual-file-archive-2007.03.23.zip") ("description" . " virtual-fileのアーカイブ用プラグイン
 
 ミニバッファで圧縮ファイルの中身を補完し、
 読み込み時に展開し、
 保存時に再圧縮を行います。
 filer-list-archive(ファイラ上でV)で開いたファイルも保存時の圧縮を行います。
 
 complete+ と virtual-file が必要です。
 
 標準関数find-file-in-archiveを上書きしています。") ("time" . 3383606468) ("depends" "complete+" "virtual-file") ("category" "Utilities" "File Systems") ("changes" . "リストを返す関数の仕様を変更") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "virtual-file-ftp") ("md5" . "ad597d75071eee393c7119d51b8af1e1") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fvirtual-file-ftp&openfile=virtual-file-ftp-2007.03.23.zip") ("version" . "2007.03.23") ("author" . "shiro") ("file" . "virtual-file-ftp-2007.03.23.zip") ("description" . " virtual-fileのFTP用プラグイン
 
 ミニバッファでFTPに接続して補完し、
 読み込み時に一時ファイルにダウンロードし、
 保存時に再アップロードを行います。") ("time" . 3383607443) ("depends" "complete+" "virtual-file") ("category" "Utilities" "File Systems") ("changes" . "リストを返す関数の仕様を変更") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "paren") ("md5" . "a7d3ec008679baf596e93fca325eb500") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fparen&openfile=paren-2007.04.12.zip") ("version" . "2007.04.12") ("author" . "shiro") ("file" . "paren-2007.04.12.zip") ("description" . " KITAさん作のparen.lの改造版です
 
 以下変更点
  
  - ハイライトの前後で属性を保存
  - delete-text-attributesのタイミングの変更
  - エスケープされている場合は動作を行わないように
  - 指定されたコマンドの直後では動作を行わないように
  - シンタックスがタグの場合でもハイライト(設定可)
  - 閉じ括弧の反応する位置を1つ前にできるように(設定可)
  - ハイライト中でも元の属性を表示し続ける(設定可)") ("time" . 3385370028) ("depends" nil) ("category" "Utilities") ("changes" . "連続したエスケープの直後の括弧が強調できていなかったのを修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "virtual-file") ("md5" . "e3a05503a31f2a95a1d7dd11c750a0e1") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fvirtual-file&openfile=virtual-file-2007.07.09.zip") ("version" . "2007.07.09") ("author" . "shiro") ("file" . "virtual-file-2007.07.09.zip") ("description" . " 仮想的なファイルの読み込みと保存を行うための仕組みを提供するものです。
 単体では機能しません。
 
 virtual-file-archive.lなどをインストールしてください。
 ") ("time" . 3392896302) ("depends" "complete+" "session-ext") ("category" "Utilities" "File Systems") ("changes" . "時間制限付きmemoize関数を追加") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "virtual-file-pscp") ("md5" . "0681f8010d950656b769c40a246408ef") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fvirtual-file-pscp&openfile=virtual-file-pscp-2007.07.09.zip") ("version" . "2007.07.09") ("author" . "shiro") ("file" . "virtual-file-pscp-2007.07.09.zip") ("description" . " virtual-fileのpscp.exe用プラグイン
 
 pscp.exeを経由して
   ファイルのリストを取得
   ファイルを取得
   ファイルを転送
 することで
   ミニバッファでサーバ上のファイルを補完
   読み込み時に一時ファイルにダウンロードしバッファに読み込み
   保存時に自動で再アップロード
 が可能になります。
 
 virtual-file-ftpと比較すると
   scpなので通信が暗号化される
   鍵が使えるのでパスワードをファイルに直接書かなくて済む
   pagent.exeを使えばSOCKSも使える
   pscp.exeを起動する時間が余計にかかる
   (ftpの方はxyzzy lispだけで完結している)
 等が異なります。") ("time" . 3392896696) ("depends" "complete+" "virtual-file") ("category" "Utilities" "File Systems") ("changes" . "初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "grouping-symbol-mode") ("md5" . "cbc8edeee4f0b5955fcdb83146530aeb") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fgrouping-symbol-mode&openfile=grouping-symbol-mode-2007.07.13.zip") ("version" . "2007.07.13") ("author" . "shiro") ("file" . "grouping-symbol-mode-2007.07.13.zip") ("description" . " 閉じ括弧の入力を支援するマイナーモード
 
 (前置引数を渡すことで,どこに閉じ括弧を挿入するか決める)") ("time" . 3393251132) ("depends" nil) ("category" "Editing") ("changes" . "初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "snippet") ("md5" . "214faf15c6daec0d0a833c7e699eb568") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fsnippet&openfile=snippet-2007.07.15.zip") ("version" . "2007.07.15") ("author" . "shiro") ("file" . "snippet-2007.07.15.zip") ("description" . " Abbrevで展開した後に、
   * 指定した位置にジャンプ
   * 編集した部分を他の場所に反映
 します。
 プログラムやHTMLなどの定型的な文を良く入力する人以外はあまり美味しくないかもしれません。
 
 TextMateで話題になっていたので勢いで実装しました。
 詳細が良く分からないところや、しっかり考えてないところがあるので、
 いろいろと問題があるかもしれません。
 
 ac-modeと一緒に使うことを推奨。
 ") ("time" . 3393473889) ("depends" nil) ("category" "Editing") ("changes" . "10個以上の展開ができなかったのを修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ffap") ("md5" . "72cb0dfbc51752ebc82e70400293a4b0") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fffap&openfile=ffap-2007.10.19.zip") ("version" . "2007.10.19") ("author" . "shiro") ("file" . "ffap-2007.10.19.zip") ("description" . "   emacsにあるffapの説明(http://www.bookshelf.jp/soft/meadow_23.html#SEC226)
   をみて想像で実装したものです。
   コードは参考にしていないのでバグや機能不足があるかもしれません。

   カーソル位置周辺の文字を見てパスやURIを探し、
   パスの場合、デフォルトの値に指定した状態でfind-fileします。
   URIの場合、ブラウザ等で開きます。(設定可)
   カーソル位置周辺から探せなかった場合は、
   以前と変わらぬfind-fileをお楽しみ頂けます。

   要するに (require \"ffap\") や <a href=\"../index.html\">
   等の上でC-x C-fしたときにミニバッファが
   Find file: c:/bin/xyzzy/site-lisp/ffap.l
   や
   Find file: c:/data/web/index.html
   という状態でfind-fileを開始できるようになります。

   カーソル周辺のファイル名の親ディレクトリをアクティブな側、
   またはアクティブでない側のパスにして2画面ファイラを開く機能もあります。") ("time" . 3401731504) ("depends" nil) ("category" "Utilities") ("changes" . "virtual-fileからfind-fileした場合の初期ディレクトリをまともにした") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ac-mode") ("md5" . "b6780b9437452eafe588cb4498b94447") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fac-mode&openfile=ac-mode-2007.12.21.zip") ("version" . "2007.12.21") ("author" . "snj14") ("file" . "ac-mode-2007.12.21.zip") ("description" . " - paren,rv-region,セレクションの有無,直前に実行したコマンド を考慮したインデント
 - snippetの展開
 - (URI|ファイル名|abbrev|lispの関数,変数|バッファ内の関数,変数|Keyword|XTAGS|dabbrev)
   のインクリメンタルな補完
 をC-i(TAB)のみで行えるようにするマイナーモードです。
 snippetの展開には別途snippet.lが必要です。

 インテリジェント補完コマンド ac-mode
 http://taiyaki.org/elisp/ac-mode/
 の説明から想像で実装し、便利そうな機能を追加したものです。
 
 
 また、いくつかの補完には専用のコマンドもあり、
 文字を入力せずに補完することや、
 (complete+が入っていれば)部分一致/スキップマッチも可能です。
 ") ("time" . 3407169979) ("depends" nil) ("category" "Editing") ("changes" . "補完はカーソルが単語の上 or 末尾にあるときのみにした") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "complete+") ("md5" . "05b818a1c9f05b29934d8001ec8e62d1") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fcomplete%2B&openfile=complete%2B-2007.12.21.zip") ("version" . "2007.12.21") ("author" . "snj14") ("file" . "complete+-2007.12.21.zip") ("description" . "   ミニバッファ等で
    - 先頭一致/Migemo/部分一致/スキップマッチングで絞り込み、
      かつ全ての項目に先頭一致する文字列で補完
    - 存在するファイルでないものをファイルのように補完
      実際にファイルを開くにはvirtual-fileやその他もろもろ(virtual-file-*.l)が必要です
    - 大文字・小文字の区別をしたりしなかったり、大文字の時だけ区別したりする
    - ディレクトリのスキップマッチング( c:/d/m/hoge => c:/data/music/hoge )
    - 指定文字で区切りAND検索         ( c:/data/zip;xyz => c:/data/xyzzy.zip )
    - インクリメンタルに補完候補を表示(補完自体は行わない)
    - ↑を有効にしてる場合、補完できるところまでハイライトで表示
    - *Completion*バッファの候補のマッチしてる部分を強調表示
    - cygwin-mountと連携してcygwinのパスを補完
    - ファイル補完時に空白ならドライブも候補に入れる
    - C-i(TAB)やSpaceの直後の新規ファイル作成はRET2回で行なう
   を可能にするものです
   ") ("time" . 3407170008) ("depends" nil) ("category" "Utilities") ("changes" . "補完候補なしのcompleting-read中にエラーが出ていたのを修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "igsearch") ("md5" . "fd7282ca59a098050757241cbca648e1") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Figsearch&openfile=igsearch-2008.01.06.zip") ("version" . "2008.01.06") ("author" . "snj14") ("file" . "igsearch-2008.01.06.zip") ("description" . "   インクリメンタルサーチ中に
    - マッチした候補を反対側のウィンドウに列挙
    - エスケープシーケンスの理解とそのトグル
    - *case-fold-search*の値のトグル
    - Migemo検索,曖昧検索,正規表現検索,通常検索の切り替え
    - 検索語のハイライト
   ができます。
   
   また、ミニバッファで文字入力中に実行すると
    - 履歴の一覧を表示
    - 履歴のインクリメンタルサーチ
    - 履歴の削除
   ができます。
   ") ("time" . 3408584224) ("depends" nil) ("category" "Utilities") ("changes" . "igsearch-minibuffer-end-of-buffer追加
igsearch-minibuffer-beginning-of-buffer追加
正規表現での検索で１文字目に^を入力すると固まったのを修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "lisp-minibuffer-mode") ("md5" . "f28e0f806cf8ae601632b0ec25d96bcf") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Flisp-minibuffer-mode&openfile=lisp-minibuffer-mode-2008.01.06.zip") ("version" . "2008.01.06") ("author" . "snj14") ("file" . "lisp-minibuffer-mode-2008.01.06.zip") ("description" . " eval-expression [ESC ESC] 用のメジャーモードです
 
 以下の特徴があります
 - paren.lの強調が有効になる
 - 専用のキーマップが指定できる
 - ミニバッファの高さが可変になる
 - undoができる
 ") ("time" . 3408585749) ("depends" nil) ("category" "Editing") ("changes" . "ミニバッファのサイズを変更できない時でも可能な大きさで拡大するように修正
lisp-minibuffer-mode-check-size をミニバッファの post-command-hook にhookするように修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "surround") ("md5" . "7bfd4636610f77d80a0f67126816b959") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fsurround&openfile=surround-2008.01.15.zip") ("version" . "2008.01.15") ("author" . "snj14") ("file" . "surround-2008.01.15.zip") ("description" . " 選択操作を便利に。
 選択した後の操作も便利に。") ("time" . 3409394497) ("depends" nil) ("category" "Editing") ("changes" . "surround-delete-horizontal-spaces追加
surround-mode-init-keybindを実行するタイミングの調整") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://www.osamurai.flnet.org/memo/xyzzy/src/packages.l") ("name" . "らいおさむのお屋敷") ("author" . "Osamu Rai") ("url" . "http://www.osamurai.flnet.org/") ("description" . "") ("packages" (("name" . "scratch-plus") ("version" . "0.0.0.2") ("author" . "Osamu Rai") ("file" . "scratch-plus.lzh") ("src" . "http://www.osamurai.flnet.org/memo/xyzzy/scratch-plus.lzh") ("description" . "*scratch* バッファの拡張版（？）") ("category") ("md5" . "4fbe84b1c00aab05b524f0710fa92956") ("time" . 3357034822) ("depends") ("changes" . "・scratch-plus-save-file の際に *scratch* バッファの存在を確認するように修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "css+-mode") ("version" . "0.0.0.3") ("author" . "Osamu Rai") ("file" . "css_plus-mode.lzh") ("src" . "http://www.osamurai.flnet.org/memo/xyzzy/css_plus-mode.lzh") ("description" . "CSS編集用のメジャーモード") ("category") ("md5" . "a9aa7c45ce81b34a73644d83d0fc4db4") ("time" . 3474154466) ("depends") ("changes" . "・498行目の間違いを修正。×*css-popup-completion-list* → ○*css+-popup-completion-list*") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://www.osk.3web.ne.jp/~usitukai/warez/ni/packages.l") ("name" . "ななしの人の部屋") ("author" . "IMAI Takeo <usitukai@osk.3web.ne.jp>") ("url" . "http://www.osk.3web.ne.jp/~usitukai/") ("description" . "xyzzyなもの") ("packages" (("name" . "exbrowserdll") ("version" . "2005.12.06") ("author" . "いまい たけを <usitukai@osk.3web.ne.jp>") ("file" . "exbrowserdll.lzh") ("src" . "http://www.osk.3web.ne.jp/~usitukai/warez/exbrowserdll.lzh") ("description" . "browser.dll拡張版をインストールします") ("category") ("md5" . "4fde4ea2de2e54306e13a22a31e9efa6") ("time" . 3342864639) ("depends") ("changes" . "インストーラのバグを直しました。
インストールされる中身は変わりません。") ("notice" . "何も保証できない程度に危険です。自己責任で使ってください。") ("load-after-install" . "site-lisp/inst/exbrowserdll/inst.l") ("load-before-uninstall" . "site-lisp/inst/exbrowserdll/uninst.l")) (("name" . "darcs-mode") ("version" . "0.3 alpha") ("author" . "いまい たけを <usitukai@osk.3web.ne.jp>") ("file" . "darcs-0.3alpha.zip") ("src" . "http://www.osk.3web.ne.jp/~usitukai/warez/darcs-0.3alpha.zip") ("description" . "バージョン管理ツールdarcsを利用して、編集したいテキストの
バージョン管理ができるようになる簡易モードです。") ("category" "Editing") ("md5" . "7d31ae2c4208a231fb5b89c4573c20b0") ("time" . 3327313683) ("depends") ("changes" . "- 自動initialize & add 
 - 静かにauto-initializeするパラメタ導入 
 - auto-initializeしないのも 
 - addだけしないのも 
 - C-c v c で日本語がでるように
") ("notice" . "作りたてほやほやの上、作者がdarcs初心者のため危険です。
ちなみに、darcs はこちらから取得できます。→ http://www.darcs.net/") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ghci-mode") ("version" . "0.1 alpha") ("author" . "いまい たけを <usitukai@osk.3web.ne.jp>") ("file" . "ghci-0.1alpha.zip") ("src" . "http://www.osk.3web.ne.jp/~usitukai/warez/ghci-0.1alpha.zip") ("description" . "Haskellインタプリタ GHCi を起動して
編集したHaskellコードをロードしたりするモードです。
インデントやキーワードの色づけはしないので、別のモードと
併用してください。") ("category" "Editing") ("md5" . "899bfbcc440aefdcfe762560da5e7dc0") ("time" . 3357988644) ("depends") ("changes" . "初版") ("notice" . "作りたてほやほやですので、使用の際は十分注意してください。") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://xyzzy.s53.xrea.com/reference/archive/ni.l") ("name" . "へなちょこリファレンス") ("author" . "へなちょこリファレンス作成委員会") ("url" . "http://xyzzy.s53.xrea.com/reference") ("packages" (("name" . "keyword file") ("version" . "2007.12.25") ("author" . "へなちょこリファレンス作成委員会") ("file" . "refkwd071225.lzh") ("src" . "http://xyzzy.s53.xrea.com/reference/archive/refkwd071225.lzh") ("description" . "へなちょこキーワード") ("category" "Documentation") ("md5" . "b6ae363f5755628931b56a9b9fbdf06b") ("time" . 3407502456) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "reference.txt") ("version" . "2007.12.25") ("author" . "へなちょこリファレンス作成委員会") ("file" . "reftxt071225.lzh") ("src" . "http://xyzzy.s53.xrea.com/reference/archive/reftxt071225.lzh") ("description" . "へなちょこリファレンスtxt版") ("category" "Documentation") ("md5" . "834d82785f1d1190be290a904f6247de") ("time" . 3407502535) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "reference.chm") ("version" . "2007.12.25") ("author" . "へなちょこリファレンス作成委員会") ("file" . "refchm071225.lzh") ("src" . "http://xyzzy.s53.xrea.com/reference/archive/refchm071225.lzh") ("description" . "へなちょこリファレンスchm版") ("category" "Documentation") ("md5" . "f13c246140e4b7a0510b53f7002d0bac") ("time" . 3407502359) ("depends") ("changes" . "") ("notice" . "lisp,lisp-interactionのF1キーをsetします") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "reference.html") ("version" . "2007.12.25") ("author" . "へなちょこリファレンス作成委員会") ("file" . "refhtml071225.lzh") ("src" . "http://xyzzy.s53.xrea.com/reference/archive/refhtml071225.lzh") ("description" . "へなちょこリファレンスhtml版") ("category" "Documentation") ("md5" . "21f6470a48a246f7c293530d661c6242") ("time" . 3407502617) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "reference.xml") ("version" . "2007.12.25") ("author" . "へなちょこリファレンス作成委員会") ("file" . "reference071225.lzh") ("src" . "http://xyzzy.s53.xrea.com/reference/archive/reference071225.lzh") ("description" . "へなちょこリファレンスxml版") ("category" "Documentation") ("md5" . "abd4cbaf31d3b9217d4b3d339dab5059") ("time" . 3407502232) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xy-reference") ("version" . "2007.07.29") ("file" . "xyref070729.lzh") ("src" . "http://xyzzy.s53.xrea.com/reference/archive/xyref070729.lzh") ("description" . "へなちょこ変換系") ("md5" . "8d86023952e00d0016f3a472582c9264") ("time" . 3394676745) ("depends" "") ("category" "Documentation"))))
(("src" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/packages_tki.l") ("name" . "しょぼしょぼスクリプト") ("author" . "TKI") ("url" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/") ("description" . "ちょっとしたスクリプトを公開!") ("packages" (("name" . "automatic-close-brace") ("version" . "0.40") ("author" . "TKI") ("file" . "automatic-close-brace.zip") ("src" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/mode/automatic-close-brace.zip") ("description" . "括弧を挿入すると対応する括弧も自動的に挿入したりしなかったり。") ("category" "Text Processing" "Utilities" "Editing") ("md5" . "3a9d541ab17fb63547d6cc9cb16659ec") ("time" . 3316045783) ("depends") ("changes" . "対応するパターンを改良。単語とばすときはsexpの関数に変更") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "isearch-deco") ("version" . "0.53") ("author" . "TKI") ("file" . "isearch-deco.zip") ("src" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/mode/isearch-deco.zip") ("description" . "インクリメント検索を拡張し検索後に色が付きます") ("category" "Utilities") ("md5" . "3e3fa51eee3b7708ab4a3f761655874e") ("time" . 3316045740) ("depends" "isearch") ("changes" . "help処理デバグ、grep連携、history中色つけ、検索終了後にも色を残す機能") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "minorviewmode") ("version" . "0.84") ("author" . "TKI") ("file" . "minorviewmode.zip") ("src" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/mode/minorviewmode.zip") ("description" . "上書き禁止のファイルなどの閲覧用のモードです") ("category" "Documentation" "Utilities") ("md5" . "24430b5ebcdd71fa0d16a4846273fa81") ("time" . 3316045762) ("depends" "view-mode") ("changes" . "help表示時のでばぐ") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xyzzy-param") ("version" . "0.1") ("author" . "TKI") ("file" . "xyzzy-param.zip") ("src" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/mode/xyzzy-param.zip") ("description" . "xyzzyの起動時に変数値を読みと終了時に変数を書き込みます。次の起動にも覚えておきたい変数を登録するときに使います。") ("category" "Utilities") ("md5" . "c67559c726943b9a3a428e4fb138826e") ("time" . 3313565951) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xrr") ("version" . "0.7") ("author" . "TKI") ("file" . "xrr.zip") ("src" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/mode/xrr.zip") ("description" . "簡易trrライクなキータイピングトレーナーです") ("category" "Games") ("md5" . "608fb8c786790f7ad3d01b9080190f0b") ("time" . 3313565930) ("depends") ("changes" . "練習テキスト10個以上のファイルにも対応") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "bash-mode") ("version" . "0.2") ("author" . "TKI") ("file" . "bashmode.zip") ("src" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/mode/bashmode.zip") ("description" . "bashスクリプトを書くモードです。shにもいいと思います.") ("category" "Editing") ("md5" . "726f725e4bd982a3bc11f94f062d76f9") ("time" . 3313565882) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "abbrev-comp") ("version" . "1.00") ("author" . "TKI") ("file" . "abbrevcomp.zip") ("src" . "http://www2.ocn.ne.jp/~cheerful/script/xyzzy/mode/abbrevcomp.zip") ("description" . "キー一つで静的補完後失敗したら続けて動的補完します") ("category" "Utilities") ("md5" . "634d9aab37af397ee1edd03e904f8025") ("time" . 3313565838) ("depends" "abbrev.l" "dabbrev.l") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/packages.l") ("name" . "人生捨ててます？") ("author" . "LKPTeam") ("url" . "http://www5d.biglobe.ne.jp/~lostland/ndiary/") ("description" . "not documented.") ("packages" (("name" . "qdbm") ("version" . "0.0.0.1") ("author" . "LKPTeam") ("file" . "qdbm.lzh") ("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/qdbm.lzh") ("description" . "QDBM on xyzzy") ("md5" . "2d13e7a4207d7383d0a444ef644e50f5") ("time" . 3320490601) ("depends") ("category" "Library") ("changes" . "First release") ("notice" . "QDBM(<http://qdbm.sourceforge.net/>)をxyzzyから使うためのパッケージです。
QDBMのWindows用バイナリパッケージが必要です。
その他についてはreadme.txtをご覧下さい。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "svn-mode") ("version" . "0.0.2.0") ("author" . "LKPTeam") ("file" . "svn-mode.lzh") ("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/svn-mode.lzh") ("description" . "svn-mode for xyzzy") ("md5" . "0b57e6b8d8809ca97b269707386db8ab") ("time" . 3329732153) ("depends" "xml-parser-modoki") ("category" "Editing") ("changes" . "show-updatesスイッチを指定したときのバグを修正（したつもり）
svn-diff コマンドでリビジョン表示が文字化けするのを修正（したつもり）
svn blameコマンドでリビジョンを指定する際のコマンドをC-u C-c bからC-u 0 C-c bへ変更
開いているファイルのリポジトリに対してsvn blameコマンドを実行できるように(C-u 1 C-c b)修正
svn mergeコマンドを使えるように（svn merge sourceURL1@[N] sourceURL2@[M] WCPATH形式のみ）

") ("notice" . "めちゃくちゃ適当簡易svn-modeです。
Subversion管理下のファイルをチェックインしたりできます。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "mlx") ("version" . "0.0.0.6") ("author" . "LKPTeam") ("file" . "mlx.lzh") ("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/mlx.lzh") ("description" . "music library on xyzzy") ("md5" . "4391feaf121ad5722ef86e58724972f6") ("time" . 3308894296) ("depends" "winamp" "api") ("category" "Graphics/Sound") ("changes" . "ライセンスにNYSLを採用。COPYING.txtを追加。") ("notice" . "Music library. winamp、media playerとかのmedia libraryのようなもの……かも。
佐野さんの作ったwinamp.lが必須です。
~/.xyzzy か site-lisp/siteinit.l に初期設定が必要です") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "chocoa-mode") ("version" . "0.0.0.1") ("author" . "LKPTeam") ("file" . "chocoa-mode.lzh") ("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/chocoa-mode.lzh") ("description" . "CHOCOA Script mode") ("md5" . "5403358f53fc4be32fed5a0e39539888") ("time" . 3308894223) ("depends") ("category" "Editing") ("changes" . "ライセンスにNYSLを採用。COPYING.txtを追加。") ("notice" . ".xyzzyに初期設定が必要です。chocoa-mode.lをご覧下さい。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "quote-menu") ("version" . "0.0.0.2") ("author" . "LKPTeam") ("file" . "quote-menu.lzh") ("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/quote-menu.lzh") ("description" . "引用つきコピー、貼付メニューの付加") ("md5" . "37b2a6449fa0ab5ef8e51d1ee332984b") ("time" . 3308894311) ("depends") ("category" "Utilities") ("changes" . "ライセンスにNYSLを採用。COPYING.txtを追加。") ("notice" . "quote-menu.lにいろいろ説明が載っていますので、初期設定などはそちらを参照のこと。
アイコンファイルは付属しませんので、ツールバーを拡張する場合は自分でアイコンファイルを作ってください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "libini") ("version" . "0.0.0.1") ("author" . "LKPTeam") ("file" . "libini.lzh") ("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/libini.lzh") ("description" . "iniファイルをいじくるユーティリティ") ("md5" . "b2d3708019286c8dd19c325d383658a4") ("time" . 3308894281) ("depends") ("category" "Libraries") ("changes" . "ライセンスにNYSLを採用。COPYING.txtを追加。") ("notice" . "libini.lだけインストールしても意味がありません。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "chprtformat") ("version" . "0.0.0.2") ("author" . "LKPTeam") ("file" . "chprtformat.lzh") ("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/chprtformat.lzh") ("description" . "印刷様式切り替えユーティリティ") ("md5" . "c03d16cfd48e88d30a6c2a6d4f8ea6c1") ("time" . 3308894264) ("depends" "libini") ("category" "Utilities") ("changes" . "ライセンスにNYSLを採用。COPYING.txtを追加。") ("notice" . "libini.lが必要です
~/.xyzzy あるいは site-lisp/siteinit.l に設定が必要です。詳しくはchprtformat.l を参照して下さい。
導入する前に印刷の設定がxyzzy.iniに含まれているか確認して下さい。
xyzzy.iniの場所はOSに依って違いますが、\"(merge-pathnames \"xyzzy.ini\" (user-config-path))\"で取得できるでしょう。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "scriptMAKI-mode") ("version" . "0.0.0.1") ("author" . "LKPTeam") ("file" . "scriptMAKI-mode.lzh") ("src" . "http://www5d.biglobe.ne.jp/~lostland/xyzzy/scriptMAKI-mode.lzh") ("description" . "script MAKI 用モード") ("md5" . "d95ec688f87ea4ead47905882c272fa1") ("time" . 3308894324) ("depends") ("category" "Editing") ("changes" . "ライセンスにNYSLを採用。COPYING.txtを追加。") ("notice" . "以下のコードを ~/.xyzzy あるいは site-lisp/siteinit.l に追加して下さい。
(require \"scriptMAKI/scriptMAKI-mode\")
(setq *scriptMAKI-mc-path* \"X:/path/to/winamp/sdk/maki/mc.exe\")
(pushnew '(\"\\.m$\" . scriptMAKI-mode) *auto-mode-alist*)") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://chez-sugi.net/xyzzy/packages.l") ("name" . "chez sugi") ("author" . "Shinichi Sugiyama") ("url" . "http://chez-sugi.net/") ("description" . "none") ("packages" (("name" . "xml-mode") ("version" . "2.092") ("author" . "Shinichi Sugiyama") ("file" . "xml-mode-2_092.lzh") ("src" . "http://chez-sugi.net/xyzzy/xml-mode-2_092.lzh") ("description" . "XMLファイルを編集するためのメジャーモード") ("category" "Editing") ("md5" . "d530da4fb429beddf4253d963c645612") ("time" . 3395582482) ("depends") ("changes" . "CDATAが閉じられていないXMLファイル読込時のエラーを修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://raido.sakura.ne.jp/southly/xyzzy/packages.l") ("name" . "Source of Nothingness") ("author" . "NANRI") ("url" . "http://raido.sakura.ne.jp/southly/rn/") ("description" . "") ("packages" (("name" . "hexl") ("version" . "2009-02-24") ("author" . "NANRI") ("file" . "hexl-20090224.zip") ("src" . "http://raido.sakura.ne.jp/southly/xyzzy/site-lisp/hexl-20090224.zip") ("description" . "emacsのhexl-modeの移植です。") ("category" "Miscellaneous") ("md5" . "aee5fe6a855c102fca155d79932f11e7") ("time" . 3444466978) ("depends") ("changes" . "NetInstaller用のファイルを追加した。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "Geometry") ("version" . "2008-02-09") ("author" . "NANRI") ("file" . "geometry-20080209.lzh") ("src" . "http://raido.sakura.ne.jp/southly/xyzzy/site-lisp/geometry-20080209.lzh") ("description" . "xyzzyのサイズを変えたり位置を変えたり") ("category" "Utilities") ("md5" . "6fedc2c0129522479625ee81a0930abd") ("time" . 3411528916) ("depends" "api.l") ("changes" . "siteinit.l で load するとメニューが消える問題に対処") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "bregex.dll") ("version" . "2007-03-14") ("author" . "NANRI") ("file" . "bregex-20070314.lzh") ("src" . "http://raido.sakura.ne.jp/southly/xyzzy/site-lisp/bregex-20070314.lzh") ("description" . "Boost C++ Libraries の Regex を使います") ("category" "Libraries") ("md5" . "df438ab0f256b1a8bb838d6e2452f673") ("time" . 3382869279) ("depends") ("changes" . "あいかわらずテスト版。
スタティックリンクのDLLに差し替え。
アンインストール時にきちんとDLLを開放するようにした。（動作の部分は全く変化ありません）") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/boost/release.l")) (("name" . "lookupref") ("version" . "2005-06-20") ("author" . "NANRI") ("file" . "lookupref-20050620.lzh") ("src" . "http://raido.sakura.ne.jp/southly/xyzzy/site-lisp/lookupref-20050620.lzh") ("description" . "") ("category" "Documentation") ("md5" . "05ab243080e7ba83bef3bba195c307e8") ("time" . 3334489200) ("depends") ("changes" . "") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "Buffer Selection") ("version" . "2006-09-20") ("author" . "NANRI") ("file" . "bs-20060920.lzh") ("src" . "http://raido.sakura.ne.jp/southly/xyzzy/site-lisp/bs-20060920.lzh") ("description" . "list-buffersのちょっとすごい版bs.elを移植しました。") ("category" "Utilities") ("md5" . "88bfe0e47bdf00ad1fec4208ab9f48bb") ("time" . 3367666800) ("depends" "emacs.l") ("changes" . "初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "fortran.l") ("version" . "2005-09-13") ("author" . "") ("file" . "fortran-20050913.lzh") ("src" . "http://raido.sakura.ne.jp/southly/xyzzy/site-lisp/fortran-20050913.lzh") ("description" . "FORTRAN 編集用メジャーモードです。
KAMEI さんによってelispから移植されました。([xyzzy:01109] fortran mode...)
前は須田さんのところにあったんですが、今は NANRI が預かっています。") ("category" "Development") ("md5" . "7a42d8a151ba634df5952349c05edf66") ("time" . 3335526000) ("depends") ("changes" . "") ("notice" . "インデントまわりに無限ループに入るバグがあった気がします。
はまった時は C-g (quit) できりぬけてください。") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://www.geocities.co.jp/Technopolis-Mars/8229/xyzzy/packages.l.txt") ("name" . "Memory Palace") ("author" . "ippei") ("url" . "http://www.geocities.co.jp/Technopolis-Mars/8229/") ("description" . "記憶の宮殿") ("packages" (("name" . "navi") ("version" . "20030502-0.7") ("author" . "ippei") ("file" . "navi-20030502-v07.lzh") ("src" . "http://www.geocities.co.jp/Technopolis-Mars/8229/xyzzy/navi-20030502-v07.lzh") ("description" . "簑系をxyzzyで使う") ("md5" . "783f5d09b1907dd9e236b8e3cdefdfba") ("time" . 3260882288) ("depends") ("changes" . "NetInstaller対応") ("notice" . "F2キーを使っています。注意してください。使い方はソース(navi.l)とWEBを参照してください。")) (("name" . "idea-marathon-v02") ("version" . "20030502-0.2") ("author" . "ippei") ("file" . "idea-marathon-20030502-v02.lzh") ("src" . "http://www.geocities.co.jp/Technopolis-Mars/8229/xyzzy/idea-marathon-20030502-v02.lzh") ("description" . "アイデアマラソンを簑系で管理する。navi.lが必要。") ("md5" . "aa3d0c09b38267a0aec44e4a692c5f35") ("time" . 3260882288) ("depends" "navi.l") ("changes" . "NetInstaller対応") ("notice" . "使い方はソース(navi.l,idea-marathon.l)とWEBを参照してください。"))))
(("src" . "http://xyzzy.s53.xrea.com/ni/ni.l") ("name" . "Masatoshi's xyzzy extend lisps") ("author" . "SANO Masatoshi") ("url" . "http://xyzzy.s53.xrea.com/wiki/") ("description" . "") ("packages" (("version" . "2006.07.15") ("file" . "callback2006.07.15.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/callback2006.07.15.tgz") ("md5" . "6643104a2bfa6349125fa96714255f3a") ("time" . 3361961800) ("name" . "callback") ("description" . "xyzzycli client dll for other application") ("changes" . "新規作成")) (("version" . "2006.07.16") ("file" . "niarc2006.07.16.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/niarc2006.07.16.tgz") ("md5" . "d16705d35062eb00c05cfa9facc7ef2f") ("time" . 3361966665) ("name" . "niarc") ("description" . "support functions for create netinstaller package") ("changes" . "公開") ("changes" . "新規作成")) (("version" . "2006.06.14") ("file" . "listviewdll2006.06.14.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/listviewdll2006.06.14.tgz") ("md5" . "dcd3ceedfd58a865d3b051a68cb9e68f") ("time" . 3359263779) ("name" . "listviewdll") ("description" . "kazu.yさんのlistview.dllをインストールします") ("depends" "") ("category" "") ("notice" . "使い始めるとプロセスがロックするため、アンインストールが出来ません。
削除はxyzzyの起動直後がお勧めです。") ("load-after-install" . "site-lisp/inst/listviewdll/inst.l") ("load-before-uninstall" . "site-lisp/inst/listviewdll/uninst.l")) (("version" . "2006.06.14") ("file" . "treeviewdll2006.06.14.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/treeviewdll2006.06.14.tgz") ("md5" . "bfc62e0f66590eadf9a1be5cadf2c149") ("time" . 3359263779) ("name" . "treeviewdll") ("description" . "kazu.yさんのtreeviewdllをインストールします") ("depends" "") ("category" "") ("notice" . "使い始めるとプロセスがロックするため、アンインストールが出来ません。
削除はxyzzyの起動直後がお勧めです。") ("load-after-install" . "site-lisp/inst/treeviewdll/inst.l") ("load-before-uninstall" . "site-lisp/inst/treeviewdll/uninst.l")) (("version" . "2006.07.15") ("file" . "diff2006.07.15.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/diff2006.07.15.tgz") ("md5" . "9b7308fb9a08c43dfab714a810e3cf7f") ("time" . 3361958429) ("name" . "diff") ("description" . "かくとうさんがmakeしたGNUのdiffをインストールします") ("depends" "") ("category" "") ("notice" . "何も保証できない程度に危険です。自己責任で使ってください。") ("load-after-install" . "site-lisp/inst/diff/inst.l") ("load-before-uninstall" . "site-lisp/inst/diff/uninst.l")) (("version" . "2006.06.15") ("file" . "nise-about2006.06.15.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/nise-about2006.06.15.tgz") ("md5" . "e6709cd4b30c4b3b39874a0e7c80ddb2") ("time" . 3359347221) ("name" . "nise-about") ("description" . "\"について\"を改造します") ("depends" "NetInstaller") ("category" "Miscellaneous")) (("version" . "2006.06.15") ("file" . "winamp2006.06.15.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/winamp2006.06.15.tgz") ("md5" . "03c5f20f9e07b65d37d7fde85be52e6a") ("time" . 3359346813) ("name" . "winamp") ("description" . "") ("depends" "") ("category" "")) (("version" . "2006.06.15") ("file" . "api2006.06.15.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/api2006.06.15.tgz") ("md5" . "c70f02b83f31bde46ef84c3cf4639212") ("time" . 3359347048) ("name" . "api") ("description" . "") ("depends" "") ("category" "")) (("version" . "2006.06.15") ("file" . "gdl2006.06.15.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/gdl2006.06.15.tgz") ("md5" . "02f21355a9a03e525ad0648bdfedd12d") ("time" . 3359346891) ("name" . "gdl") ("description" . "") ("depends" "") ("category" "")) (("version" . "2006.06.14") ("file" . "locale2006.06.14.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/locale2006.06.14.tgz") ("md5" . "897cadad2782699bd54c46a57ca5e409") ("time" . 3359263793) ("name" . "locale") ("description" . "") ("depends" "") ("category" ""))))
(("src" . "http://hie.s64.xrea.com/xyzzy/pub/packages.l") ("name" . "HIE no xyzzy") ("author" . "HIE Masahiro") ("url" . "http://hie.s64.xrea.com/xyzzy/") ("description" . "xyzzy に関する怪しい記述の数々") ("packages" (("name" . "OutlineX") ("version" . "3.06") ("author" . "HIE Masahiro") ("file" . "outlinex_3.06.zip") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/outlinex_3.06.zip") ("description" . "簡易アウトライン。バッファから指定した文字列を含む行を抽出します。") ("category" "Text Processing") ("md5" . "fc7c61106a01cd3af3878fdf6f1d67b6") ("time" . 3480187054) ("depends") ("changes" . "[Version 3.06] 2010-04-14 (水)
・olx-reload の際に，場合によりソースバッファのデータを壊してしまう
  不具合を修正した。(T-T)
・抽出対象がなかった場合に，アウトラインバッファを削除しないようにした。
  (リロード時に抽出対象がないと穴があくため)
・ノードに移動時，必ずソースバッファに移動するように。
・olx-rerun を追加した。昔の olx-reload と同じ。現在の olx-reload との
  違いは，既にアウトラインバッファが存在する場合に，どちらがアクティブ
  になるかだけ。
・その他細かな修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ruby-refe") ("version" . "2.00") ("author" . "HIE Masahiro") ("file" . "ruby-refe_2.00.zip") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/ruby-refe_2.00.zip") ("description" . "ruby-mode から，ReFe を参照します。") ("category" "Documentation") ("md5" . "f2485dc589402273e45380e529e1df51") ("time" . 3479122615) ("depends") ("changes" . "[Version 2.00] 2010-04-01 (木)
・ReFe2 に対応した(はず)。
・ReFe1 非対応にした。
・オプションが指定できるようにした。
・その他いろいろ。") ("notice" . "ReFe2より前のバージョンには非対応。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ese-fortune") ("version" . "1.09.1") ("author" . "HIE Masahiro") ("file" . "ese-fortune_1.09.1.zip") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/ese-fortune_1.09.1.zip") ("description" . "似非 fortune 。起動時にリファレンスとかを表示します。") ("category" "Documentation") ("md5" . "ddc7dcea4b6934c38b34243814f8b0ba") ("time" . 3408686452) ("depends") ("changes" . "[Version 1.09.1] 2008-01-03 (水)
・absent-mode ON のままファイラを開くと，ファイラからフォーカスが外れて
  しまうため，テキトウな対処をした。

[Version 1.09] 2007-12-31 (月)
・ライセンス条項(MITライセンス)を記載。
・reference.txt から reference.dat を必要に応じ自動作成するようにした。
  → 初回実行時と，更新時。
・改行認識文字列既定値(*ese-fortune-br*)をタブ文字に変更した。
・xyzzy Part7 657 さんの提案を取り込み，複数のデータファイルをランダム
  に表示できるようにした(今頃)。m(__)m
・ese-fortune 用のデータファイルでなくても，実行時に変換して見ることも
  できるようにした。
・データフォルダを指定できるようにした。
・info-modoki-mode で引きやすいように，シンタックスを定義した。
・ese-fortune 用バッファを，表示するようにした。
・再実行時に，バッファを作成しなおさないようにした。
・ぼうっと見れるようにした。（ふかえさんのアイディア）
・TKI さんの shakeWindow を読み込んでおくと，ぼうっと見てるときに
  ブルブルするようにした。") ("notice" . "「reference.txt」などのデータファイルが必要です。別途入手ください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "winbatch-mode") ("version" . "1.16") ("author" . "HIE Masahiro") ("file" . "winbatch-mode-1.16.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/winbatch-mode-1.16.lzh") ("description" . "Simple mode for Batch File Enhancer for Windows (WinBatchEh)") ("category" "Development") ("md5" . "948226032360ec168f63b3fd4fcd5ef0") ("time" . 3408022156) ("depends") ("changes" . "[Version 1.16] 2007-12-31 (月)
・ライセンス条項(MITライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ttl-mode") ("version" . "1.08") ("author" . "HIE Masahiro") ("file" . "ttl-mode-1.08.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/ttl-mode-1.08.lzh") ("description" . "Simple mode for Tera Term Language") ("category" "Development") ("md5" . "45b342cfb613fc9aed42dedc05598bac") ("time" . 3408022068) ("depends") ("changes" . "[Version 1.08] 2007-12-31 (月)
・ライセンス条項(MITライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "rv-region") ("version" . "2.04") ("author" . "HIE Masahiro") ("file" . "rv-region-2.04.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/rv-region-2.04.lzh") ("description" . "リージョンを反転表示します。") ("category" "Miscellaneous") ("md5" . "38f59517d8a7e7c52d14419e547e7ec8") ("time" . 3408021975) ("depends") ("changes" . "[Version 2.04] 2007-12-31 (月)
・ライセンス条項(MITライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "info-modoki-mode") ("version" . "2.05") ("author" . "HIE Masahiro") ("file" . "info-modoki-mode-2.05.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/info-modoki-mode-2.05.lzh") ("description" . "reference.txt 参照用モード") ("category" "Documentation") ("md5" . "67fe2c463ed69d9672bf05e059969654") ("time" . 3408021688) ("depends") ("changes" . "[Version 2.05] 2007-12-31 (月)
・MITライセンスにした。") ("notice" . "「reference.txt」，キーワードファイル「lisp」が必要です。
別途入手ください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "filer-extapart") ("version" . "1.01") ("author" . "HIE Masahiro") ("file" . "filer-extapart-1.01.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/filer-extapart-1.01.lzh") ("description" . "ファイラからアーカイブ中のファイルを指定して展開します。
アーカイブの展開には、それ用のアーカイバ DLL
（unlha32.dll, unzip32.dll, tar32.dll ... ）が必要です。
また、ディレクトリの選択には、nonentity さんの、
select_directory.dll を使わせて頂いています。
無くても動作しますが、あったほうが便利と思います。") ("category" "File Systems") ("md5" . "0be336050c4e81f27b11da7fddfaab0b") ("time" . 3408021575) ("depends") ("changes" . "[Version 1.01] 2007-12-31 (月)
・ライセンス条項(MITライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "du-d") ("version" . "1.01") ("author" . "HIE Masahiro") ("file" . "du-d-1.01.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/du-d-1.01.lzh") ("description" . "ディレクトリ毎のファイルサイズを出力します。") ("category" "File Systems") ("md5" . "193f1475fb91a1634c40d04e1f8433ec") ("time" . 3408021414) ("depends") ("changes" . "[Version 1.01] 2007-12-31 (月)
・ライセンス条項(MITライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "clipselect") ("version" . "1.05") ("author" . "HIE Masahiro") ("file" . "clipselect-1.05.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/clipselect-1.05.lzh") ("description" . "クリップボード履歴から選択して貼り付けます。") ("category" "Text Processing") ("md5" . "fa7ee6e7f93e2ea9059c25721ace9a7b") ("time" . 3408021295) ("depends") ("changes" . "[Version 1.05] 2007-12-31 (月)
・ライセンス条項(MITライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "bufmenu") ("version" . "1.05") ("author" . "HIE Masahiro") ("file" . "bufmenu-1.05.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/bufmenu-1.05.lzh") ("description" . "バッファ操作用ポップアップメニューです。") ("category" "Miscellaneous") ("md5" . "9b102f745ba4ad9765bbe2586f93741b") ("time" . 3408021153) ("depends") ("changes" . "[Version 1.05] 2007-12-31 (月)
・ライセンス条項(MITライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "buf-menu-plus") ("version" . "1.02") ("author" . "HIE Masahiro") ("file" . "buf-menu-plus-1.02.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/buf-menu-plus-1.02.lzh") ("description" . "buffer-menu の拡張版(？)") ("category" "Miscellaneous") ("md5" . "abaf9e9fbda98aa36b2a6d6afceaf815") ("time" . 3408021017) ("depends") ("changes" . "[Version 1.02] 2007-12-31 (月)
・MITライセンスにした。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "chcolor") ("version" . "1.02") ("author" . "HIE Masahiro") ("file" . "chcolor-1.02.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/chcolor-1.02.lzh") ("description" . "バッファの表示色を切替える。") ("category" "Miscellaneous") ("md5" . "d6509ee5952680bb4006f38c1fec7e8e") ("time" . 3356606628) ("depends") ("changes" . "[Version 1.02] 2006/05/14 (日)
・Windows XP で色設定の保存ができなくなっていたのを修正した。
  米田さんに感謝。
・ライセンスを適用した。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "CalMemo") ("version" . "2.10") ("author" . "HIE Masahiro") ("file" . "calmemo-2.10.lzh") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/calmemo-2.10.lzh") ("description" . "calendar にメモ書き機能を追加します。") ("category" "Utilities") ("md5" . "0d1d7bae58fb3f880ea3960fb5ac8f13") ("time" . 3338487494) ("depends") ("changes" . "○新機能
・chalow 出力時のエンコーディング等を指定できるようにした。
    *chalow-encoding*, *chalow-eol*
○不具合修正
・lib.l で ed::parse-date-string の定義を上書きしてしまっていたため，
  calmemo-parse-date-string に変更した。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://www5e.biglobe.ne.jp/~fukafuka/xyzzy/packages.l") ("name" . "ふかふか") ("author" . "fukae") ("url" . "http://www5e.biglobe.ne.jp/~fukafuka/") ("description" . "FukaFuka") ("packages" (("name" . "restore") ("version" . "2006.07.27") ("author" . "fukae") ("file" . "restore20060727.lzh") ("src" . "http://www5e.biglobe.ne.jp/~fukafuka/xyzzy/script/restore/restore20060727.lzh") ("description" . "ポイント、色づけ、グローバルマークを保存するバッファを \"表示(V)\" メニューから
指定できるようにします。") ("category" "Utilities") ("md5" . "3978117954e9c41e161a65b222cae71c") ("time" . 3362965810) ("depends") ("changes" . "公開。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "psearch") ("version" . "2006.07.27") ("author" . "fukae") ("file" . "psearch20060727.lzh") ("src" . "http://www5e.biglobe.ne.jp/~fukafuka/xyzzy/script/psearch/psearch20060727.lzh") ("description" . "popup-listを使って検索を行います") ("category" "Text Processing") ("md5" . "1a8e61326e465c2fb5c0824ad82ce1b8") ("time" . 3362964344) ("depends") ("changes" . "isearch 用の設定を変更。
その他、細かい修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "open-backup") ("version" . "2006.07.27") ("author" . "fukae") ("file" . "open-backup20060727.lzh") ("src" . "http://www5e.biglobe.ne.jp/~fukafuka/xyzzy/script/open-backup/open-backup20060727.lzh") ("description" . "バックアップファイルを開きます") ("category" "Utilities") ("md5" . "699549276c48c50c60257bad2dc15903") ("time" . 3362964252) ("depends") ("changes" . "全削除のメッセージを変更。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ee") ("version" . "2006.07.27") ("author" . "fukae") ("file" . "ee20060727.lzh") ("src" . "http://www5e.biglobe.ne.jp/~fukafuka/xyzzy/tips/ee/ee20060727.lzh") ("description" . "英々辞書を使うための lisp です") ("category" "Utilities") ("md5" . "cc10daa4dccf2825fb5e1e97636e31c4") ("time" . 3362964136) ("depends") ("changes" . "ロングマン英々辞典(第3版)対応をやめた。
conjugation に対応。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "autolookup") ("version" . "2006.07.27") ("author" . "fukae") ("file" . "autolookup20060727.lzh") ("src" . "http://www5e.biglobe.ne.jp/~fukafuka/xyzzy/script/autolookup/autolookup20060727.lzh") ("description" . "カーソル下の英単語の訳をステータスバーに表示します") ("category" "Utilities") ("md5" . "c9e8ff69493d274577e5a38cd500e34a") ("time" . 3362964008) ("depends") ("changes" . "細かい修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "changelogmemo") ("version" . "2006.03.08") ("author" . "fukae") ("file" . "changelogmemo20060308.lzh") ("src" . "http://www5e.biglobe.ne.jp/~fukafuka/xyzzy/script/changelogmemo/changelogmemo20060308.lzh") ("description" . "changelog でメモをとります") ("category" "Utilities") ("md5" . "29053e3a65459db4466579db26dc96f3") ("time" . 3350751656) ("depends") ("changes" . "行頭にタブがない chalow 用の書式(* タイトル [カテゴリ]・・[カテゴリ]: 本文)
にした。
C-x C-s でメモを保存するように変えた。
*scratch* バッファをメモバッファとして使うようにした。
検索の種類をふやした。(google, 正規表現, or, カテゴリ, 日付, migemo)
絞込み検索のやり方を変更。
検索画面から直接編集できるようにした。
カテゴリを設定しておかなくても補完できるようにした。
ツールバーでメモをとれるようにした。
複数の CLファイルに対応。
ライセンスを適用。
その他、いろいろ変えた。") ("notice" . "書式を変更したので、CL ファイルを変換しないと使えなくなりました。
お手数ですが、readme.txt を御覧ください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "mathematica") ("version" . "2006.03.08") ("author" . "fukae") ("file" . "mathematica20060308.lzh") ("src" . "http://www5e.biglobe.ne.jp/~fukafuka/xyzzy/script/mathematica/mathematica20060308.lzh") ("description" . "mathematica.el の移植です") ("category" "Editing") ("md5" . "3d6bd282e143062e07ff413d358326af") ("time" . 3350735846) ("depends") ("changes" . "細かい修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://miyamuko.s56.xrea.com/xyzzy/package.l") ("name" . "xyzzyのじかん") ("author" . "miyamuko") ("url" . "http://miyamuko.s56.xrea.com/") ("description" . "どうでもいいスクリプトとか") ("packages" (("name" . "xl-pik") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-pik.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-pik.zip") ("description" . "xl-pik は [Pik] を使って xyzzy から利用する Ruby を切り替えるためのツールです。

Pik を使えば Windows 環境に複数バージョンの Ruby をインストールして、
切り替えて利用することができます。

xl-pik を使うことで Pik によって切り替えた環境変数を xyzzy に反映することができます。
xl-pik で Ruby を切り替えた後は `C-x &` や `C-x |` や `C-x c` など外部コマンドを
実行する処理全てに反映されます。

**注意: xl-pik は xyzzy 0.2.2.235 では利用できません。**
以下のどちらかのバージョンを利用してください。

  * [xyzzy 0.2.2.236 以降]
  * [xyzzy 0.2.3.3 以降]


  [Pik]: https://github.com/vertiginous/pik
  [xyzzy 0.2.2.236 以降]: http://xyzzy-022.github.com
  [xyzzy 0.2.3.3 以降]: https://bitbucket.org/mumurik/xyzzy/wiki/Home") ("category" "Utilities" "Development") ("md5" . "5f0b41aa6f947b4d0177dda1a2a51e09") ("time" . 3542098464) ("depends" "ansify") ("changes" . "### 2012-03-30 / 1.0.0

xl-pik 1.0.0 released!

  * 初版") ("notice") ("load-after-install") ("load-before-uninstall")) (("name" . "xl-open-uri") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-open-uri.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-open-uri.zip") ("description" . "xl-open-uri は Ruby の [open-uri] とほぼ同様の機能を xyzzy Lisp に実装したライブラリです。
HTTP や FTP に簡単にアクセスするための機能を提供します。

デフォルトでサポートしている URL スキームは http, https, ftp, data です。
また、URL スキームを追加するための API も公開しています。

Ruby の open-uri では HTTP GET および FTP のダウンロードしか対応していませんが、
xl-open-uri では任意の HTTP メソッドの送信が可能です。
また FTP のアップロードにも対応しています。

  [open-uri]: http://doc.ruby-lang.org/ja/1.9.3/library/open=2duri.html
") ("category" "Network" "Libraries" "Development") ("md5" . "3243520bd298368c9bd6afe7c55a12e5") ("time" . 3537946975) ("depends" "http-client" "xl-winhttp" "xl-alexandria" "ansi-loop" "ansify" "setf-values") ("changes" . "初版リリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "http-client") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "http-client.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/http-client.zip") ("description" . "http-client は [xl-winhttp] を利用した HTTP クライアント・ライブラリです。
Proxy、Basic/Digest 認証、SSL、Cookie、非同期通信などをサポートしています。

[xml-http-request] と比較したメリット・デメリットはそれぞれ以下のとおりです。

  * メリット
    * ストリーミングに対応している (Transfer-Encoding: chunked)
    * Content-Type の charset が不明な場合でも文字化けしない
    * バイナリ・データの送受信に対応している
    * ファイル・ダウンロードに対応している
    * ファイル・アップロードに対応している (multipart/form-data)
    * IE とセッションが分離されているので、IE のキャッシュやクッキーの影響を受けない

  * デメリット
    * IE とは別にプロキシを WinHTTP で設定しておく必要がある
    * IE とセッションが分離されているので、自前でログイン処理などを実装する必要がある
    * クッキーは xyzzy を再起動するとすべて消える
    * 認証情報は毎回指定する必要がある
      - 自動的に認証ダイアログがでない
      - 認証情報のキャッシュは行わない
    * 圧縮転送に対応していない (Content-Encoding: gzip)
    * 受信処理を xyzzy Lisp で行うため若干遅い

  [xl-winhttp]: http://miyamuko.s56.xrea.com/xyzzy/xl-winhttp/intro.htm
  [xml-http-request]: http://miyamuko.s56.xrea.com/xyzzy/xml-http-request/intro.htm
") ("category" "Network" "Libraries" "Development") ("md5" . "6b6fc035942729dc948c514bd07a61a9") ("time" . 3537688464) ("depends" "xl-winhttp" "xl-alexandria" "ansi-loop" "ansify" "setf-values") ("changes" . "初版リリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xl-winhttp") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-winhttp.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-winhttp.zip") ("description" . "xl-winhttp は [Windows HTTP Services](http://msdn.microsoft.com/en-us/library/windows/desktop/aa384273.aspx)
を利用した HTTP 通信を行うためのライブラリです。

[xml-http-request](http://miyamuko.s56.xrea.com/xyzzy/xml-http-request/intro.htm)
と比べて低レベルなライブラリですが、xml-http-request では取得出来なかった以下のようなデータも取得可能です。

  * チャンク形式のエンコーディング (Transfer-Encoding: chunked)
  * バイナリファイルの取得
  * 文字エンコーディングを自動的に変換しないため、charset などが不適切でも文字化けしません

Proxy や Basic/Digest 認証、SSL、非同期通信などは xml-http-request と同様に対応しています。
") ("category" "Network" "Libraries" "Development") ("md5" . "7c848750ad0af9cea30c00a8b3d3b40d") ("time" . 3537688440) ("depends" "xl-alexandria" "ansi-loop" "ansify" "setf-values") ("changes" . "初版リリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xml-http-request") ("version" . "1.3.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xml-http-request.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xml-http-request.zip") ("description" . "xml-http-request - 非同期 HTTP 通信ライブラリ
http://miyamuko.s56.xrea.com/xyzzy/xml-http-request/intro.htm") ("category" "Network" "Libraries" "Development") ("md5" . "3ac01d65997774382b8b406d46fdfa40") ("time" . 3536910309) ("depends") ("changes" . "### 2012-01-30 / 1.3.2

xml-http-request 1.3.2 リリース!

#### 新規機能

  * なし

#### 非互換を含む変更点

  * なし

#### バグ修正

  * xhr-(get|post)-async で :key に xhr-response-text とか指定してると
    :onabort の起動時にこける問題を修正
    (Reported by @youz)

#### その他

  * なし
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ansi-loop") ("version" . "1.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "ansi-loop.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/ansi-loop.zip") ("description" . "ansi-loop は Macintosh Common Lisp ( http://code.google.com/p/mcl/ ) の
loop マクロ (loop.lisp と extended-loop.lisp) を xyzzy に移植したものです。

xyzzy 付属の cmu_loop.l は少しバグっているので、Common Lisp のライブラリを移植する場合などに
不都合が生じる場合がありますが、ansi-loop を使えば解決するかもしれません。
") ("category" "Libraries" "Development") ("md5" . "18ba7e43161985bdfb10182faec57d9d") ("time" . 3536910292) ("depends" "ansify") ("changes" . "### 2012-01-30 / 1.0.1

ansi-loop 1.0.1 リリース!

#### 新規機能

  * なし

#### 非互換を含む変更点

  * なし

#### バグ修正

  * ed:lisp-indent-hook を設定

  * destructuring-bind など一部 import し忘れていたのを修正

  * print-unreadable-object が未定義で loop-universe の
    print-function が動いていなかったのを修正

#### その他

  * ansify に依存するようになりましたのでインストールしてください。
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xl-alexandria") ("version" . "0.0.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-alexandria.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-alexandria.zip") ("description" . "xl-alexandria は Common Lisp の Alexandria ( http://common-lisp.net/project/alexandria/ ) を
を xyzzy に移植したものです。

Alexandria は巨大なユーティリティ集です。
実践 Common Lisp や OnLisp に載っていたり、自分で書いたことがあるような
関数・マクロが大量に詰まっています。
") ("category" "Libraries" "Lisp") ("md5" . "d7df943941f93f6869638346753451f0") ("time" . 3535185958) ("depends" "setf-values" "ansi-loop" "ansify") ("changes" . "xl-alexandria 0.0.2 リリース!

  * parse-body が interactive 式も取り出せるようになりました (by @bowbow99)。

    (ansify:destructuring-bind (defun name lambda-list &rest body)
        '(defun foobar-region (start end)
          \"foobar region\"
          (interactive \"*r\")
          (delete-region start end)
          (insert \"foobar\"))
      (alexandria:parse-body body :documentation t :interactive t))
    ;=> ((delete-region start end) (insert \"foobar\"))
    ;   nil
    ;   \"foobar region\"
    ;   (interactive \"*r\")

  * symbolicate が動作していなかったのを修正

    (alexandria:symbolicate \"prefix-\" :foo)
    ;=> prefix-foo

  * upstream の変更を取り込み (3eacfac87b2...77b219a8361)
    https://github.com/miyamuko/xl-alexandria/compare/3eacfac87b27654f7ca9eeaf1ce40344b8136b03...77b219a8361b9549aeb8941afc945fa2e3c84eb9
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xl-interpol") ("version" . "1.0.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-interpol.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-interpol.zip") ("description" . "xl-interpol は CL-INTERPOL ( http://weitz.de/cl-interpol/ ) を xyzzy に移植したものです。

xl-interpol は以下の機能を提供しています。

* 変数や式を文字列に埋め込める
* 正規表現リテラル
* ユニコード文字 (\\N{HIRAGANA LETTER A})
") ("category" "Text Processing" "Libraries") ("md5" . "a7f7b0806cb120c08279bcfbc095d69d") ("time" . 3526258386) ("depends" "xl-ppcre" "ansi-loop") ("changes" . "=== 2011/09/29

* 1.0.2 リリース!
  * xl-interpol 独自部分のライセンスが MIT になっていたので BSD で統一
  * ansi-loop を使って cl-interpol オリジナルのコードに戻した
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xl-ppcre") ("version" . "1.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-ppcre.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-ppcre.zip") ("description" . "xl-ppcre は CL-PPCRE ( http://weitz.de/cl-ppcre/ ) を xyzzy に移植したものです。

xl-ppcre は以下の機能を提供しています。

* Perl 互換の正規表現が使えます (一部制限があります)
* シングルラインモード、マルチラインモード、拡張正規表現
* cl-ppcre 互換の API

xl-ppcre は以下の機能は提供していません。

* 肯定先読み、否定先読み、埋め込みコードなどは処理できません
  * xl-ppcre は Perl 互換の正規表現を xyzzy 用に変換するのみで、
    正規表現エンジンは xyzzy 組み込みのものを利用しているためです
* 正規表現リテラル (リーダーマクロ)はありません
* replace-string や replace-dialog で Perl 互換の正規表現の利用はできません
* cl-ppcre の parse tree 形式での指定はできません
* ユニコードプロパティは利用できません
") ("category" "Text Processing" "Libraries") ("md5" . "4a97ae56b7e1c32129a4ace660a88980") ("time" . 3525502199) ("depends") ("changes" . "=== 2011/09/20

* 1.0.1 リリース!
  * register-groups-bind, do-register-groups のインデントスタイルを
    multiple-value-bind のようにした
  * \"xl-\" を付けなくても (require \"ppcre\") でロードできるようにした
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "power-usage") ("version" . "1.3.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "power-usage.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/power-usage.zip") ("description" . "power-usage - 電力使用状況をモードラインに表示") ("category" "Utilities") ("md5" . "f1bc90c9886ee02348c5174c52056cab") ("time" . 3522139484) ("depends" "xml-http-request" "json") ("changes" . "=== 2011/08/12

* 1.3.2 リリース!
  - 新規機能
    - *power-usage-graph-colors* に文字色と背景色を別々に指定できるようにした (#13)

        (setf *power-usage-graph-colors*
          '((:foreground 2  :background 7 :usage 89)  ; 89% 以下の色
            (:foreground 3  :background 7 :usage 94)  ; 90% ～  94% の色
            (:foreground 5  :background 7 :usage 96)  ; 95% ～  96% の色
            (:foreground 1  :background 7 :usage 100) ; 97% 以上の色
            (:foreground 15 :background 7 :free t)    ; 電力未使用領域の色
            ))

  - バグ修正
    - グラフの自動更新を有効にするとバッファがちらつく問題を修正 (#8)
    - バッファを縦に分割しているときにするとグラフ表示すると変になる問題を修正 (#9)
    - 初回実行時と更新時でグラフの長さが変わる場合がある問題を修正 (#10)
    - ミニバッファにカーソルがある状態で更新するとエラーになる問題を修正 (#11)

=== 2011/08/07

* 1.3.1 リリース!
  - 新規機能
    - *power-usage-enable-status-message* に non-nil を設定すると
      前回取得時から値が変わっている場合にはステータスバーに
      電力使用状況の詳細情報を表示するようにした (#7)
  - バグ修正
    - グラフ表示していると Mark がセットされたり、kill-ring にゴミが yank されたり
      していたのを修正 (#6)

=== 2011/08/06

* 1.3.0 リリース!
  - 新規機能
    - 電力各社の状況を一覧でグラフ表示機能 (#5)

") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "grep-a-lot") ("version" . "1.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "grep-a-lot.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/grep-a-lot.zip") ("description" . "grep-a-lot は grep バッファの名前を自動的に変更して、
grep バッファを複数保存できるようにします。

grep バッファのバッファ名には以下のように検索キーワードが含まれます。

  *grep:<foo>*
  *ggrep:<tiger AND bunny>*
") ("category" "Editing" "Utilities") ("md5" . "e2bb7ca126796a828ea292cfa3607f99") ("time" . 3521605470) ("depends") ("changes" . "* 1.1.0 リリース!
  - outline-tree2 との親和性を高めた (#2)
    - outline-tree2 でグループ化されるようにバッファ名を変更
      - 変更前: *grep*<キーワード>
      - 変更後: *grep:<キーワード>*
    - バッファ名変更後に outline-tree2 のノード名も更新するようにした
  - fggrep で検索文字列が取得できていなかったのを修正
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "guidgen") ("version" . "1.2.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "guidgen.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/guidgen.zip") ("description" . "guidgen - GUID を生成するライブラリとツール
http://miyamuko.s56.xrea.com/xyzzy/guidgen/
") ("category" "Libraries" "Development") ("md5" . "9643bbd116fad2d0d7154912d41f2e15") ("time" . 3521605457) ("depends") ("changes" . "* 1.2.0 リリース!
  - 新規機能
    - DEFINE_GUID などで GUID を生成するときに
      大文字で生成するときはコード部分の 16 進数も大文字にするようにした
    - 小文字で GUID を生成する機能を追加
      - guidgen-toggle-use-downcase
      - guidgen-use-downcase-p

") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "vuvuzela") ("version" . "0.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "vuvuzela.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/vuvuzela.zip") ("description" . "xyzzy からブブゼラをブーブブブブブー") ("category") ("md5" . "7f8ec09732113ed864f01f1fe6988a40") ("time" . 3486613633) ("depends" "sound" "api") ("changes" . "初版リリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/xyzzy_times/vuvuzela.l")) (("name" . "cairo") ("version" . "1.8.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "cairo.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/cairo.zip") ("description" . "xycairo - cairo を利用した 2D グラフィックライブラリ
http://miyamuko.s56.xrea.com/xyzzy/cairo/intro.htm") ("category" "Libraries" "Graphics/Sound" "Development") ("md5" . "6e0a5af8f46eeaddce4fc12c4fb23bf3") ("time" . 3455523475) ("depends") ("changes" . "xl-cairo 1.8.0 リリース!

: 新規機能

    * 添付している cairo を 1.8.8 に更新。
    * cairo 1.8 で追加された関数を定義
      * cairo-scaled-font-get-scale-matrix
      * cairo-scaled-font-text-to-glyphs
      * cairo-show-text-glyphs
      * cairo-surface-get-fallback-resolution
      * cairo-surface-has-show-text-glyphs
      * cairo-toy-font-face-create
      * cairo-toy-font-face-get-family
      * cairo-toy-font-face-get-slant
      * cairo-toy-font-face-get-weight
      * ※ユーザフォントはサポートしていません
    * cairo 1.8 で追加された error-status に対応する例外クラスを定義

: 非互換を含む変更点

    * なし

: バグ修正

    * 名前を xycairo から xl-cairo にした。

    * cairo 1.6 で追加された error-status に対応する例外クラスを忘れていたのを修正

: その他

    * なし
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "hatena-haiku-mode") ("version" . "0.3.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "hatena-haiku-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/hatena-haiku-mode.zip") ("description" . "hatena-haiku-mode は はてなハイク (http://h.hatena.ne.jp) を
xyzzy 上で閲覧・投稿するための専用ブラウザです。

以下のことができます。

  * 最近のエントリの表示
  * ユーザエントリの表示
  * キーワードエントリの表示
  * キーワード一覧の表示
  * キーワードの検索
  * ホットキーワードの表示
  * 新規投稿
  * 返信
  * ブラウザの履歴みたいに戻る・進む
  * 更新
  * はてなスター
  * ホットキーワード
  * エントリの削除
  * 投稿元のクライアントの変更 (デフォルトは hatena-haiku-mode)

http://miyamuko.s56.xrea.com/xyzzy/hatena-haiku-mode/intro.htm") ("category" "Network") ("md5" . "14d5ad4a88b77ef1aae92399d9b7dab6") ("time" . 3448278733) ("depends" "xml-http-request" "hatena-star" "json") ("changes" . "hatena-haiku-mode 0.3.2 リリース!

: 新規機能

    * recent ページで投稿バッファを開くときはカーソル下のキーワードを
      デフォルトで表示するようにした

: 非互換を含む変更点

    * なし

: バグ修正

    * keyword が id:foo の場合、タイトルが取れなかったのを修正

    * id:xxx 始まるキーワード（だけどはてな ID ではない）ページが
      が正しく表示できていなかった問題を修正

    * from がない場合に from nil と表示してしまう問題を修正

    * 1 ページ目を 2 回ロードしていたのを修正

: その他

    * なし
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "tiny-segmenter") ("version" . "1.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "tiny-segmenter.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/tiny-segmenter.zip") ("description" . "tiny-segmenter は TinySegmenter (Javascript だけで実装されたコンパクトな分かち書きソフトウェア)
を xyzzy lisp に移植したものです。

http://chasen.org/~taku/software/TinySegmenter

上記 URL によれば以下のような特徴があります。

  * 日本語の新聞記事であれば文字単位で 95% 程度の精度で分かち書きが行える
  * 分かち書きの単位は MeCab + ipadic と互換
  * 辞書を使っていない

http://miyamuko.s56.xrea.com/xyzzy/tiny-segmenter/intro.htm") ("category" "Development" "Libraries" "Text Processing") ("md5" . "223924f2ead0402983933f9ea337e137") ("time" . 3425448698) ("depends") ("changes" . "tiny-segmenter 1.1.0 リリース!

: 新規機能

    * (make-segmenter): 分かち書き処理を行うオブジェクトを作成する
    * (segmenter-segment-all): segmenter の処理をすすめる
    * (segmenter-segment-partial): ditto
    * (segmenter-segment-next): ditto
    * (segment): buffer, stream に対応

: 非互換を含む変更点

    * なし

: バグ修正

    * なし

: その他

    * なし
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "json") ("version" . "0.1.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "json.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/json.zip") ("description" . "json - 安全で高速な JSON パーサ
http://miyamuko.s56.xrea.com/xyzzy/json/intro.htm

json は xyzzy Lisp のみで実装した JSON パーサです。
json-syck より高速でかつ外部ライブラリを利用していないので安全です。
") ("category" "Development" "Libraries") ("md5" . "1fa971cd431488f846b08f6805962f36") ("time" . 3424844545) ("depends") ("changes" . "json 0.1.2 リリース!

: 新規機能

    * なし

: 非互換を含む変更点

    * なし

: バグ修正

    * なし

: その他

    * ライセンスファイルを同梱
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "hatena-star") ("version" . "1.1.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "hatena-star.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/hatena-star.zip") ("description" . "hatena-star - はてなスター API

はてなスター API を xyzzy から実行するためのライブラリです。
http://miyamuko.s56.xrea.com/xyzzy/hatena-star/intro.htm
") ("category" "Network" "Libraries") ("md5" . "d0ec8d0c10300873734ec8591475f08a") ("time" . 3424844579) ("depends" "xml-http-request" "json") ("changes" . "hatena-star 1.1.1 リリース!

: 新規機能

    * なし

: 非互換を含む変更点

    * なし

: バグ修正

    * なし

: その他

    * ライセンスファイルを同梱
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "cygwin-mount") ("version" . "1.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "cygwin-mount.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/cygwin-mount.zip") ("description" . "cygwin-mount - Cygwin のパスを指定してファイルを開く
http://miyamuko.s56.xrea.com/xyzzy/cygwin-mount/intro.htm") ("category" "Utilities" "File Systems") ("md5" . "f94a47130167ea4edd58ef4d9da6c48f") ("time" . 3424845911) ("depends") ("changes" . "cygwin-mount 1.1.0 リリース!

: 新規機能

    * (cygmount-point-info): path 引数で mount 情報を取得するパスを指定できるようにした

: 非互換を含む変更点

    * なし

: バグ修正

    * なし

: その他

    * ライセンスファイルを同梱
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "word-tools") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "word-tools.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/word-tools.zip") ("description" . "word-tools - Microsoft Word の機能を xyzzy から利用する
http://miyamuko.s56.xrea.com/xyzzy/word-tools/intro.htm
") ("category" "Utilities") ("md5" . "98c7efc5b4b94b7119ab24fe7b33b61e") ("time" . 3424845780) ("depends") ("changes" . "word-tools 1.0.0 リリース!

: 新規機能

    * なし

: 非互換を含む変更点

    * メニューのアクセスキーを W から D にした。

: バグ修正

    * Word がインストールされていない場合のエラーメッセージを
      分かりやすくした。

: その他

    * ライセンスを修正 BSD から MIT/X に変更
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "json-syck") ("version" . "obsolete") ("author" . "MIYAMUKO Katsuyuki") ("file" . "json-syck.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/json-syck.zip") ("description" . "json-syck - syck を利用した危険で遅い JSON パーサ
http://miyamuko.s56.xrea.com/xyzzy/json-syck/intro.htm

json-syck は obsolete なパッケージです。代わりに json を使ってください。") ("category" "Development" "Libraries") ("md5" . "0f2fe063aacfa602c14e62cd521a2578") ("time" . 3424844529) ("depends" "yaml-syck") ("changes" . "json-syck 0.1.1 リリース!

: 新規機能

    * なし

: 非互換を含む変更点

    * なし

: バグ修正

    * なし

: その他

    * ライセンスファイルを同梱
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xtal-mode") ("version" . "0.0.5") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xtal-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xtal-mode.zip") ("description" . "xtal-mode は Xtal 言語を編集するためのメジャーモードです。
http://miyamuko.s56.xrea.com/xyzzy/xtal-mode/intro.htm") ("category" "Editing" "Development") ("md5" . "572de4ee38d8a887922d054de8673c78") ("time" . 3424844237) ("depends") ("changes" . "xtal-mode 0.0.5 リリース!

: 新規機能

    * なし

: 非互換を含む変更点

    * なし

: バグ修正

    * なし

: その他

    * ライセンスファイルを同梱
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "yaml-syck") ("version" . "0.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "yaml-syck.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/yaml-syck.zip") ("description" . "yaml-syck - syck を使ったそこそこ高速な YAML 1.0 パーサ
http://miyamuko.s56.xrea.com/xyzzy/yaml-syck/intro.htm") ("category" "Libraries" "Development") ("md5" . "776d5fffc534767c0b365f12d609ac87") ("time" . 3411031177) ("depends") ("changes" . "yaml-syck 0.1.0 リリース!

: 新規機能

    * なし

: 非互換を含む変更点

    * なし

: バグ修正

    * クラッシュしにくくしたつもり。
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "popup-dododo") ("version" . "0.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "popup-dododo.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/popup-dododo.zip") ("description" . "ジョジョ風 効果音(?) を表示する
http://miyamuko.s56.xrea.com/xyzzy/popup-dododo/intro.htm") ("category" "Graphics/Sound") ("md5" . "5dcafb9b34d7f27b361f86ce51a275de") ("time" . 3389264080) ("depends" "api" "cairo" "layered-window") ("changes" . "初期リリース") ("notice" . " デスクトップ ドドド に付属の DesktopDoDoDo フォントをインストールしてください。
http://massacre.s59.xrea.com/game/dtddd/download.htm") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "layered-window") ("version" . "1.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "layered-window.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/layered-window.zip") ("description" . "ウィンドウを半透明にする。") ("category" "Libraries" "Graphics/Sound") ("md5" . "7e62a74c5d2be9c0238afbfc769f8e17") ("time" . 3389778578) ("depends" "api") ("changes" . "layered-window 1.0.1 リリース!

: 新規機能

    * なし

: 非互換を含む変更点

    * layered-window-version を layered-window.api パッケージに移動しました。

    * パッケージ名の変更

    * ファイル構成を変更

: バグ修正

    * シンボル名が衝突する可能性をなくした。
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "drive-info") ("version" . "1.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "drive-info.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/drive-info.zip") ("description" . "論理ドライブの情報を取得するライブラリ
http://miyamuko.s56.xrea.com/xyzzy/drive-info/") ("category" "Libraries" "Development") ("md5" . "3d68ac7aaf1be69a0180ab5984b8544c") ("time" . 3389778569) ("depends") ("changes" . "drive-info 1.1.0 リリース!

: 新規機能

    * 以下の関数を追加。
      * drive-info.api:drive-info-version
      * drive-info.api:drive-info-api-version

: 非互換を含む変更点

    * *drive-info-version* を export するのをやめました。

    * パッケージ名の変更

      * drive-info → drive-info.api
      * drive-info-ffi → drive-info.ffi

    * ファイル構成を変更

: バグ修正

    * drive-info を require したあとに api を require すると
      エラーが出ていたのを修正。

: その他

    * editor パッケージに依存しないようにした。
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "rimo.tv.xyzzy") ("version" . "0.1.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "rimo.tv.xyzzy.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/rimo.tv.xyzzy.zip") ("description" . "Rimo (http://rimo.tv) を xyzzy 上に表示する
http://miyamuko.s56.xrea.com/xyzzy/rimo-tv-xyzzy/") ("category" "Utilities") ("md5" . "424b077101b29cf887c20c88b0e9afac") ("time" . 3380738124) ("depends") ("changes" . "初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "livedoor-reader-notifier") ("version" . "0.2") ("author" . "miyamuko") ("file" . "livedoor-reader-notifier.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/livedoor-reader-notifier.zip") ("description" . "xyzzy のメニューに livedoor Reader の未読数を表示します。
http://miyamuko.s56.xrea.com/xyzzy/livedoor-reader-notifier.html") ("category" "Utilities") ("md5" . "7325ce66365d417960050fcae4a28800") ("time" . 3359289454) ("depends" "xml-http-request") ("changes" . "* ed::livedoor-reader-notifier-set-interval を追加。

* xyzzy 起動中に *livedoor-reader-notifier-update-interval* を
  変更した場合でも変更が反映されるようにした。

* 最後に更新した時間を If-Modified-Since で送信するようにした。
  たぶん意味は無い。

* メニューの文字列の typo 修正 ... orz
  livedoore => livedoor
http://d.hatena.ne.jp/miyamuko/20060614") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xdoc2txt") ("version" . "0.8") ("author" . "miyamuko") ("file" . "xdoc2txt-0.8.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xdoc2txt-0.8.zip") ("description" . "xdoc2txt を利用して Word, Excel, PDF などを xyzzy で開く。
http://miyamuko.s56.xrea.com/xyzzy/xdoc2txt.html") ("category" "Utilities") ("md5" . "48198c9d378dbbb11d781e9bb3c0edc6") ("time" . 3351176130) ("depends" "encap") ("changes" . "- xdoc2txt 実行時に作成する一時ファイルを削除するようにした。
  (Thanks xyzzy wiki / patch11 の OMA さん)
- *xdoc2txt-hook* で view-mode にした場合など、read-only でエラーになる問題を修正。
- *grep* バッファの場合でも、*xdoc2txt-hook* は実行するようにした。
http://d.hatena.ne.jp/miyamuko/20060312") ("notice" . "encap の最新版をインストールしてください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "sound") ("version" . "0.1.1") ("author" . "miyamuko") ("file" . "sound.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/sound.zip") ("description" . "wav ファイルを再生するライブラリ") ("category" "Libraries" "Graphics/Sound") ("md5" . "5df090d0d94cb8836b5830743678b3af") ("time" . 3343142905) ("depends" "api") ("changes" . "初版作成") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "natural-compare") ("version" . "0.1") ("author" . "miyamuko") ("file" . "natural-compare.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/natural-compare.zip") ("description" . "自然順ソートライブラリ") ("category" "Libraries" "Development") ("md5" . "cfa6cd9c5021c306da82195f2f3cbb31") ("time" . 3329929528) ("depends") ("changes" . "初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "java-scrapbook") ("version" . "0.3") ("author" . "miyamuko") ("file" . "java-scrapbook.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/java-scrapbook.zip") ("description" . "Java のコード片を実行する。") ("category" "Development") ("md5" . "c52a75f0272e624d746b86dac1dd215c") ("time" . 3304083785) ("depends") ("changes" . "* classpath を指定していなかった場合実行できないバグを修正
* cilpboard の java コードを実行できるようにした。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "rabbit-mode") ("version" . "0.3") ("author" . "miyamuko") ("file" . "rabbit-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/rabbit-mode.zip") ("description" . "プレゼンツール rabbit のフロントエンド") ("category" "Documentation" "Utilities") ("md5" . "1e34a70d54c8105ded4864bf47314284") ("time" . 3302763016) ("depends") ("changes" . "プレビュー機能の強化
スライド単位での編集") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xyzzytail") ("version" . "0.1") ("author" . "miyamuko") ("file" . "xyzzytail.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xyzzytail.zip") ("description" . "コマンドラインから tail-f する。") ("category" "Utilities") ("md5" . "18ea1e53e8b81bcfb5582911dffa8210") ("time" . 3301058739) ("depends") ("changes" . "初期リリース") ("notice" . "") ("load-after-install" . "site-lisp/xyzzytail/install.l") ("load-before-uninstall" . "")) (("name" . "xyzzydiff") ("version" . "0.1") ("author" . "miyamuko") ("file" . "xyzzydiff.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xyzzydiff.zip") ("description" . "コマンドラインから diff する。") ("category" "Development") ("md5" . "d764dbbac7381fd43321e23d7104cfc0") ("time" . 3301058729) ("depends") ("changes" . "初期リリース") ("notice" . "") ("load-after-install" . "site-lisp/xyzzydiff/install.l") ("load-before-uninstall" . "")) (("name" . "windzoom") ("version" . "0.1") ("author" . "miyamuko") ("file" . "windzoom.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/windzoom.zip") ("description" . "Window の分割をアニメーションする。") ("category" "Graphics/Sound") ("md5" . "959f6d03ac75500410df117b401d0bc7") ("time" . 3301057738) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "properties-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "properties-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/properties-mode.zip") ("description" . "Java の properties ファイルを読み書きする。") ("category" "Development") ("md5" . "65d21a67d5299d956e71c25e0e0c9852") ("time" . 3301057729) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "nsis-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "nsis-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/nsis-mode.zip") ("description" . "NSIS スクリプトを読み書きする。") ("category" "Development") ("md5" . "2cbf8c8cc44a5ea63fb05935060489b3") ("time" . 3301057724) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "mof-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "mof-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/mof-mode.zip") ("description" . "MOF ファイルを読み書きする。") ("category" "Development") ("md5" . "8d3ab910d25da882127531ca441a6769") ("time" . 3301057720) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "luna") ("version" . "0.1") ("author" . "miyamuko") ("file" . "luna.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/luna.zip") ("description" . "Windows XP スタイルで xyzzy を表示する。") ("category" "Graphics/Sound") ("md5" . "b3f171cddc449bb46c7e48e7ae3540e8") ("time" . 3301057714) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "is-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "is-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/is-mode.zip") ("description" . "InstallScript を読み書きする。") ("category" "Development") ("md5" . "e6b9dbc1f022eeede2c33448c0b26e03") ("time" . 3301057703) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ci-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "ci-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/ci-mode.zip") ("description" . "しぃ(*ﾟーﾟ)言語を読み書きしる。") ("category" "Development") ("md5" . "8aa2143b3212385613c6cc73b68932bf") ("time" . 3301057699) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "bnf-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "bnf-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/bnf-mode.zip") ("description" . "BNF ファイルを読み書きする。") ("category" "Development") ("md5" . "419fa57880d47d50a0274691a1a0cd51") ("time" . 3301057694) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "banner") ("version" . "0.1") ("author" . "miyamuko") ("file" . "banner.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/banner.zip") ("description" . "unix の banner コマンドみたいなもの。") ("category" "Text Processing") ("md5" . "aeb1c107b48bd23ad6d71bdf64005bd0") ("time" . 3301057690) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "bdf フォントが必要です") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/packages.txt") ("name" . "kia's website") ("author" . "kia") ("url" . "http://www.geocities.jp/kiaswebsite/") ("description" . "") ("packages" (("name" . "skk") ("version" . "2006-09-17") ("author" . "Masahiko Sato") ("file" . "skk-20060917.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/skk-20060917.lzh") ("description" . "Simple Kana to Kanji conversion program") ("category") ("md5" . "c518f86e6e7ffbf63e67fa7f36b537a1") ("time" . 3367395654) ("depends") ("changes" . "annotation付きの辞書へ対応しました。
elispコードの変換実行に対応しました。
(defpackage \"skk\")をしてその中にskkを入れるようにしました。
skk-sticky.lを同梱しました。") ("notice" . "使用するパッケージを`skk'に変更しました。各変数や関数の所属するパッケー
ジが変わっていますので、以前の版からアップグレードする場合には ~/.xyzzy
ファイルや~/.skkファイルの設定を修正する必要があります。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "markdown-mode") ("version" . "2006-08-08") ("author" . "kia") ("file" . "markdown-20060808.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/markdown-20060808.lzh") ("description" . "Markdownの記法を少しサポートするマイナーモード") ("category") ("md5" . "803b324799aeabd0444686775254e01b") ("time" . 3364028272) ("depends") ("changes" . "ordered listでタブ文字が使われたときのバグ修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "refer-for") ("version" . "2006-07-02") ("author" . "kia") ("file" . "refer-for-20060702.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/refer-for-20060702.lzh") ("description" . "MSXMLを使ってreference.xmlを参照します。") ("category") ("md5" . "1d4d7e2faa22113f396308a013dda0fa") ("time" . 3360785682) ("depends" "reference.xml") ("changes" . "etc-pathがsiteinit.lで参照できないことに対処しました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "funsig") ("version" . "2006-06-10") ("author" . "kia") ("file" . "funsig-20060610.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/funsig-20060610.lzh") ("description" . "lispモードで、カーソル位置付近の関数呼び出しのシグネチャを表示します。") ("category") ("md5" . "34c28ddccc5652f3df80a10b9886be7d") ("time" . 3358929220) ("depends") ("changes" . "シグネチャリストファイルの扱いを変更しました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "jscript-mode") ("version" . "2006-01-14") ("author" . "kia") ("file" . "jscript-mode-20060114.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/jscript-mode-20060114.lzh") ("description" . "中途半端にJScriptの編集ができたり、
中途半端にJavaScriptの編集ができたりするモードです。") ("category") ("md5" . "2dabfe15432470c1d9c17d80297c416c") ("time" . 3346232526) ("depends") ("changes" . "パス名にスペースが含まれているとjscript-mode-executeが失敗するのを修正し
ました。またjscript-mode-executeの実行の際、ヒストリを探索して初期値に使
うようにしました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "instant") ("version" . "1.4") ("author" . "kia") ("file" . "instant-1.4.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/instant-1.4.lzh") ("description" . "インスタントモード。メジャーモードの作成支援をします。") ("category") ("md5" . "24a97bb57de0306eb703bb6772218f51") ("time" . 3339402132) ("depends") ("changes" . "フックが全く動作していなかったのを修正しました。(Thanks to 佐野さん)") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "template-insert") ("version" . "0.9") ("author" . "kia") ("file" . "template-insert-0.9.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/template-insert-0.9.lzh") ("description" . "新しく作成するファイル名に応じたテンプレートをインサートします。") ("category") ("md5" . "545f8d19679d816063ba81978645be7e") ("time" . 3336621990) ("depends") ("changes" . "テンプレートが複数ある場合に選択できるようにしました。
`template-insert'パッケージにニックネーム`ti'を設定しました。
置換するキーワードを少し追加しました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "comment") ("version" . "2005-09-10") ("author" . "Noah S. Friedman") ("file" . "comment-20050910.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/comment-20050910.lzh") ("description" . "comment out regions of buffers (Emacs版の移植です)") ("category") ("md5" . "8563d39effb32203a8408b251d07ef80") ("time" . 3335319706) ("depends") ("changes" . "行末の空白の扱いを変更しました") ("notice" . "ni-autoloadではキーバインドしませんので、適当なキーに割り当ててください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "encap") ("version" . "2005-03-10") ("author" . "kia") ("file" . "encap.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/encap.lzh") ("description" . "指定した関数の機能を置きかえる手段を提供します。") ("category") ("md5" . "8683c6eb532c74f623e77e9721f33a76") ("time" . 3319452324) ("depends") ("changes" . "editorパッケージに入れました。encapに依存しているプログラムが動かなくな
ることがあるかもしれません。encapの読み込みのタイミングや`encapsulate'、
`basic-definition'などのシンボルの参照状況を確認してみてください。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "translate") ("version" . "2005-02-26") ("author" . "kia") ("file" . "translate.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/translate.lzh") ("description" . "xyzzy上からInternetExplorerを駆って
Exciteのテキスト翻訳を使い、リージョン部分を翻訳します。") ("category") ("md5" . "7d339dded514c9b24de6854bcb25f052") ("time" . 3318412534) ("depends") ("changes" . "一部動かなくなっていたのを動くようにしました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "kamegame") ("version" . "2004-06-17") ("author" . "kia") ("file" . "kamegame.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/kamegame.lzh") ("description" . "いわゆる「さめがめ」型のゲームです。") ("category") ("md5" . "c0fb8e71d878741ff78f06bf49c779e6") ("time" . 3296465368) ("depends") ("changes" . "色付きモード（`c'で切り替え）を追加した。ハイスコアを記録するように
した(`h'で表示)。ハイスコアはXyzzyの起動ごとにリセットする。（
2004-06-17版 いまさら random state を初期化して使うようにした。）") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "find-library") ("version" . "2004-05-29") ("author" . "kia") ("file" . "find-library.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/find-library.lzh") ("description" . "Lispライブラリのファイル名を入力すると、ロードパスの中から該当するフ
ァイルを開きます。またライブラリに限らず、特定のフォルダからファイル
を開くためのショートカットコマンドをユーザ定義できます。") ("category") ("md5" . "83dbd422505ac94fe252d9c6f857620e") ("time" . 3294773942) ("depends") ("changes" . "補完時に大文字小文字を区別するように修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "remember") ("version" . "2004-04-22") ("author" . "John Wiegley") ("file" . "remember.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/remember.lzh") ("description" . "a mode for quickly jotting down things to remember
すばやくメモをとるモード (Emacs版の移植です)") ("category") ("md5" . "bedac87c3668fffeb3d82f50bdb47039") ("time" . 3291628934) ("depends") ("changes" . "xyzzyに移植") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "mcalc") ("version" . "2004-02-05") ("author" . "Joakim Hove") ("file" . "mcalc.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/mcalc.lzh") ("description" . "ミニバッファで動作するRPNベースの「電卓」(Emacs版の移植です)") ("category") ("md5" . "e94c02fbfdf65d69f42012f080793a56") ("time" . 3284973810) ("depends") ("changes" . "xyzzyに移植した。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "box-up") ("version" . "2004-01-29,1") ("author" . "kia") ("file" . "box-up.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/box-up.lzh") ("description" . "リージョンを表に変換します。") ("category") ("md5" . "086260c783c828abc9a647261c5ddfa4") ("time" . 3284366350) ("depends") ("changes" . "no-linesを選択した場合に左右に入っていたスペースを入れないようにした。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ndmacro") ("version" . "2003-08-12") ("author" . "kia") ("file" . "ndmacro.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/ndmacro.lzh") ("description" . "連番機能付きDynamic Macro") ("category") ("md5" . "23a1efaaa2161b786914786583318ab1") ("time" . 3269657680) ("depends") ("changes" . "キー割り当て時の不具合を修正するためにバイトコンパイルしなおしたものです。") ("notice" . "ni-autoload用のファイルはありません。~/.xyzzyなどでの設定が必須です。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "kakko-ex") ("version" . "2003-06-08") ("author" . "kia") ("file" . "kakko-ex.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/kakko-ex.lzh") ("description" . "Lispプログラムの括弧入力をほんのちょっとだけ支援するマイナーモード。
機能は二つ。パラグラフを基準とした括弧入力補助と括弧チェックです。") ("md5" . "374cc2ddacdeb42ad492f906ac64704c") ("time" . 3264043898) ("depends") ("category") ("changes" . "ni-autoload用のファイルを追加しました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "auto-time-stamp-bottom") ("version" . "2003-06-08") ("author" . "kia") ("file" . "auto-time-stamp-bottom.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/auto-time-stamp-bottom.lzh") ("description" . "ファイルの最後のあたりに自動でタイムスタンプを入れます。ファイル名に
応じて書式を変えることができます。きたさん作のauto-time-stamp.l
(http://go.to/kitaj) が必要です。") ("md5" . "1f4ce501447721b29233757599004821") ("time" . 3264041454) ("depends") ("category") ("changes" . "ni-autoload用のファイルを追加しました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "apache-mode") ("version" . "2003-06-08") ("author" . "kia") ("file" . "apache-mode.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/apache-mode.lzh") ("description" . "Apache HTTP Server用の設定ファイル httpd.conf や .htaccess を
編集できるかもしれないモードです。") ("md5" . "bea1cca029a6fabf0ca4e9522b5e0d0f") ("time" . 3264040814) ("depends") ("category") ("changes" . "ni-autoload用のファイルを追加しました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://ohkubo.s53.xrea.com/xyzzy/packages.l") ("name" . "雑記帖") ("author" . "OHKUBO Hiroshi") ("url" . "http://ohkubo.s53.xrea.com/") ("description" . "つれづれなるままに") ("packages" (("name" . "outline-tree2") ("version" . "2012.04.03") ("author" . "OHKUBO Hiroshi") ("file" . "outline-tree2-20120403.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/outline-tree2-20120403.zip") ("description" . "TreeView.dll を用いて、バッファリストのツリー表示、バッファ内のア
ウトライン表示を行います。") ("category" "Utilities") ("md5" . "8356b5553a732fc922c4350648e2b28c") ("time" . 3542369813) ("depends" "treeview" "buf2html") ("changes" . "【2012.04.03】
・Markdown 対応
・RDフォーマット解析更新
・Java用アウトライン作成正規表現修正
・HTML見出し解析改善
・ctags 解析改善
・ctags kind 出力フルネーム化
・ChangeLog フォーマット解析更新
・XSV解析の区切り文字に compiled-regexp を指定可能に

【2009.04.03】
・HTML出力設定のダイアログ化
・アウトライン分類の変更
・LISP 用アウトライン作成関数修正
・タグ解析で空要素タグを考慮
・CSV, TSV 解析追加
・ctags 対応
・GNU GLOBAL(gtags) 対応
・FreeMind 対応
・その他

【2006.10.25】
・「アウトラインツリー設定」のプロパティシートのタイトルに、
  outline-tree のバージョン番号を表示するように。
・outline-tree 起動時に、バッファの編集状態を反映するように。
・バッファノード削除時のタイトルバー、バッファの再描画を廃止。

【2006.10.21】
・バッファ編集時、バッファノード名に \"* \" を追加するように。
・バッファノード選択時、タイトルバー、バッファバーを更新するように。
・「カーソル追従」時、カーソル移動先バッファが非表示バッファであっても、
  ファイルに関連づいているバッファの場合は追従するように。
・「アウトラインタイプ説明」メニューに「一覧」を追加。
・「アウトラインタイプ説明」での説明出力の順番を変更。
・「カテゴリを閉じる」を追加。
  - *outline-tree-delete-category-buffers-except-regexp-list* 追加。
  - outline-tree-delete-category-buffers 追加。
  - outline-tree-menu-gen 更新。
・メニューバーのメニューで「アウトラインタイプ選択」
  「アウトラインタイプ説明」が動作しない現象への対処。
・アウトラインタイプを明示的に選択していない場合でのメニューの表示の高速化。
・outline-tree-create-outline-lisp で lisp のアウトラインを作成すると、
  その後で、シンボルの衝突が起こる問題を修正。(thanks. XyzzyWiki)
・outline-tree-create-outline-lisp で lisp のアウトライン作成時に
  「'(defmacro ...)」というようなリストが存在してもエラーが発生しない
  ように更新。(thanks. XyzzyWiki)
・表示バッファ、非表示バッファのカテゴリノード名に任意の文字列を設定しても
  outline-tree 起動時に「非表示バッファのカテゴリノード」が
  「表示バッファのカテゴリノード」よりも上にくるように対応。
・*outline-tree-visible-buffer-category-node-name* のデフォルト値を
  \"=== 表示バッファ ===\" に変更。
・*outline-tree-invisible-buffer-category-node-name* のデフォルト値を
  \"=== 非表示バッファ ===\" に変更。
・outline-tree 起動時に、選択バッファに対するノードを確実に選択するために、
  outline-tree-create の中で outline-tree-select-node するように。
・「ライン・ボタンをルートから表示」をデフォルト非設定に。
   - *outline-tree-style-linesatroot* の初期値を nil に変更。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/outline-tree2.l")) (("name" . "multiple-replace") ("version" . "2008.02.10") ("author" . "OHKUBO Hiroshi") ("file" . "multiple-replace-20080210.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/multiple-replace-20080210.zip") ("description" . "複数文字列の置換を行います。") ("category" "Text Processing") ("md5" . "6454b0ea1ba4fa06aacd7549afa698e6") ("time" . 3411610877) ("depends") ("changes" . "・ライセンス条項(修正BSDライセンス)を記載。
・docstring の追加。
・multiple-replace-dialog の設定を外部ファイルに保存可能に。
  *multiple-replace-setting-file-directory* フォルダ
  (初期値 \"~/.multiple-replace\") が存在する場合は、設定のファイル
  への保存、ファイルから読み込みを行う。
  初期状態では、無名の設定(現在の設定)についても、ファイルへ保存
  する。無名設定についてはファイル保存/読込をしない場合は、
  *multiple-replace-setting-file-current-setting-p* を nil にする。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/multiple-replace.l")) (("name" . "treeview") ("version" . "2006.11.03") ("author" . "OHKUBO Hiroshi") ("file" . "treeview-20061103.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/treeview-20061103.zip") ("description" . "TreeView.dll を操作するライブラリ") ("category" "Libraries") ("md5" . "5fd5513a0b3a371d4c11cedf7454ccee") ("time" . 3371492676) ("depends" "treeview.dll(ver.1.03)" "win-window" "color") ("changes" . "・treeview-get-up-item 関数を修正。
  連鎖して treeview-scan-treeview, treeview-isearch-forward,
  treeview-isearch-backward などでの逆検索が正常動作に。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/treeview.l")) (("name" . "csv-mode") ("version" . "0.0.3.0") ("author" . "OHKUBO Hiroshi") ("file" . "csv-0.0.3.0.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/csv-0.0.3.0.zip") ("description" . "Comma Separated Value file editing mode for xyzzy") ("category" "Editing") ("md5" . "16db1748ecd2916c0455a1209c92052c") ("time" . 3370418224) ("depends") ("changes" . "・xyzzy 0.2.2.234 対応
・ライセンス条項(修正BSDライセンス)を記載。

・C-c C-x での「行と列の入換」(csv-change-row-column) 追加。
・C-c C-w での「現在行内容のウィンドウ表示」で表示したウィンドウで
  編集できるように。
・罫線囲み表示時のモード csv-box-mode 作成。

・整数ソートの際、\",\" が含まれてもよいように変更。
・通貨記号 \\ $ が含まれていてもマッチするように *csv-number-regexp* を更新。
・csv-edit-dialog 更新。
  - next-line-add-newlines の考慮をやめ、必要ならば常に新規行を
    追加するように。
  - 一行編集することに、undo 境界を設定するように。
・csv-max-column-number 関数で、全行を調べた際の値のキャッシュを
  持つように更新。
・値が数の場合、各種変換関数で右寄せするように、関数を更新。
  csv-adjust-column, csv-convert-to-box, csv-convert-to-html
・メニュー周りのコードを修正。

・全行が同じ列数でないと csv-convert-to-box がエラーを返していたのを修正。
・csv-join-string-list の str-list に nil が渡された場合、エラーが
  発生するのを修正。
・ナローイング時に正常動作するように、各種関数更新。
・defvar-local で定義する変数のシンボル名を *xxx* から xxx に変更。
・*csv-mode-local-map* を csv-mode-local-map に変更。
・その他、各種関数名、関数定義、変数名、変数定義変更
・コメント、DOCSTRING 追加、修正。") ("notice" . "") ("load-after-install" . "site-lisp/ni-autoload/misc_notes/csv-mode.l") ("load-before-uninstall" . "")) (("name" . "diff-detail") ("version" . "2006.03.30") ("author" . "OHKUBO Hiroshi") ("file" . "diff-detail-20060330.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/diff-detail-20060330.zip") ("description" . "diff の更新行を、正規表現または関数で指定したトークン単位で
再度比較します。") ("category" "Text Processing") ("md5" . "e4f5567b907458d68ea03aa9d5b043a6") ("time" . 3352719833) ("depends" "diff") ("changes" . "・diff-detail-change-grain-default 追加。
・比較ファイルに違いがない場合、diff-detail がエラーとなるのを修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "buf2html") ("version" . "0.0.0.15") ("author" . "OHKUBO Hiroshi") ("file" . "buf2html-0.0.0.15.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/buf2html-0.0.0.15.zip") ("description" . "なるべくバッファの表示を再現するような HTML を生成します。") ("category" "Formatting" "Utilities") ("md5" . "a5d266176cd85d48cb185a6ff6c8c78b") ("time" . 3347498982) ("depends") ("changes" . "・*buf2html-post-convert-buffer-hook* 追加。
・*buf2html-encoding*, *buf2html-eol-code* を追加。
・その他。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "color") ("version" . "2005.10.06") ("author" . "OHKUBO Hiroshi") ("file" . "color-20051006.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/color-20051006.zip") ("description" . "COLOR-NAME と RGB値 の対応リスト、操作関数を提供します。") ("category" "Libraries") ("md5" . "48424d119b6a6f0f4be88231387220f9") ("time" . 3343223908) ("depends") ("changes" . "・公開") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "commdlg") ("version" . "2005.10.31") ("author" . "OHKUBO Hiroshi") ("file" . "commdlg-20051031.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/commdlg-20051031.zip") ("description" . "コモンダイアログを使用するためのライブラリ") ("category" "Libraries") ("md5" . "7b310949b2616b5054ce836ded0bf16f") ("time" . 3339757772) ("depends") ("changes" . "win-user::choose-font-dialog 関数追加。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "insert-directory-tree") ("version" . "2005.10.19") ("author" . "OHKUBO Hiroshi") ("file" . "insert-directory-tree-20051019.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/insert-directory-tree-20051019.zip") ("description" . "ディレクトリツリーを出力します。") ("category" "Utilities") ("md5" . "d2cfa52052d33c825fa47993c950fe88") ("time" . 3338642628) ("depends") ("changes" . "・NANRI さんの拡張を取り込み。
  *insert-directory-tree-leaf-function* に、file を引数にと
  り文字列を返す関数を指定することで情報を付加出力する。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "2ch-dialog") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "2ch-dialog-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/2ch-dialog-20051008.zip") ("description" . "2ch-mode に主に AA 用のダイアログの機能を追加します。") ("category" "Network") ("md5" . "9c461956e1600a4919a378368c657d1e") ("time" . 3337744630) ("depends" "2ch-mode") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "win-window") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "win-window-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/win-window-20051008.zip") ("description" . "Windows の Window を操作します。") ("category" "Libraries") ("md5" . "4bd7fc79df079917368f6e52cf2989f5") ("time" . 3337740003) ("depends") ("changes" . "・GetWindowRect, IsZoomed の戻り値の型を int -> BOOL に変更
・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "function-bar-label") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "function-bar-label-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/function-bar-label-20051008.zip") ("description" . "builtin の set-function-bar-label を拡張し、
get-function-bar-label での label 取得を可能にします。

function-bar-label 変更のタイミングでの既存設定の保存が可能と
なります。") ("category" "Libraries") ("md5" . "9cbac64eb51761b6899c1c92fb4b55d5") ("time" . 3337739891) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "設定はファイル内コメントを参照しマニュアルで行ってください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "keep-window-line") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "keep-window-line-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/keep-window-line-20051008.zip") ("description" . "ウィンドウ行を固定するマイナーモード") ("category" "Miscellaneous") ("md5" . "35d03e19151bb730cc6c981c542959cb") ("time" . 3337739785) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "box-fixation-mode") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "box-fixation-mode-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/box-fixation-mode-20051008.zip") ("description" . "罫線内編集を行うためのマイナー/メジャーモードです。

罫線モード (box-drawings-mode) で記述した罫線や、CSVモードで
変換した罫線の位置を固定しつつ編集を行う場合に使用します。

罫線間の範囲を超過する入力を行った場合、超過分を次行に入力します。
罫線が閉じており次行に入力できない場合は、罫線の継続行を追加した
上で超過分を入力します。") ("category" "Editing") ("md5" . "d08c9111c8750b0e063902d5d5e2386d") ("time" . 3337739637) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/box-fixation-mode.l")) (("name" . "manued-mode") ("version" . "0.0.2.0") ("author" . "OHKUBO Hiroshi") ("file" . "manued-0.0.2.0.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/manued-0.0.2.0.zip") ("description" . "Manued ファイル編集用マイナー/メジャーモード

  □提供する機能
  ・校正部分のハイライト化
  ・校正用文書の生成
  ・校正記号の入った文書から校正前の文書を抽出
  ・校正記号の入った文書から校正後の文書を抽出
  ・校正位置のサーチ機能
  ・校正記号入力補助
  ・校正部分編集補助
  ・真鵺道シンボルの再定義") ("category" "Editing") ("md5" . "e997930c0ee21fbe6dd2c8e6cc9ec2ac") ("time" . 3337739494) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ini-mode") ("version" . "0.0.0.4") ("author" . "OHKUBO Hiroshi") ("file" . "ini-0.0.0.4.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/ini-0.0.0.4.zip") ("description" . "INIファイル編集モード") ("category" "Editing") ("md5" . "38b9a00b55b2610507e85e947efab79d") ("time" . 3337739353) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "bat-mode") ("version" . "0.0.0.4") ("author" . "OHKUBO Hiroshi") ("file" . "bat-0.0.0.4.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/bat-0.0.0.4.zip") ("description" . "バッチファイル編集モード") ("category" "Editing") ("md5" . "d50999698bc298bbaf6c4ba6107f42e5") ("time" . 3337739210) ("depends") ("changes" . "・HIE さんに 2002/10/17 に教えていただいていた typo の修正漏れを修正。
・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "mayu-mode") ("version" . "0.0.0.6") ("author" . "OHKUBO Hiroshi") ("file" . "mayu-0.0.0.6.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/mayu-0.0.0.6.zip") ("description" . "「窓使いの憂鬱」設定ファイル編集モード") ("category" "Editing") ("md5" . "1cd21dd230cdb16b0d85740e037465d5") ("time" . 3337739053) ("depends") ("changes" . "・「窓使いの憂鬱」ver. 3.30 付属の mayu-mode.el のキーワードに準拠。
・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "rx") ("version" . "2005.06.08") ("author" . "Gerd Moellmann") ("file" . "rx-20050608.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/rx-20050608.zip") ("description" . "sexp notation for regular expressions (Emacs版の移植)") ("category" "Libraries") ("md5" . "4984d8b8a86c185a48ae47d0859793d0") ("time" . 3327147721) ("depends") ("changes" . "xyzzyに移植") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "sort-line") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "sort-line-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/sort-line-20051008.zip") ("description" . "任意のカラム以降をキーとして、バッファ全体／選択範囲の行のソートを
行います。") ("category" "Text Processing") ("md5" . "0d336221d03200da7f33b1140ee57d61") ("time" . 3337733132) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/sort-line.l")) (("name" . "ggrep") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "ggrep-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/ggrep-20051008.zip") ("description" . "Grep 類似の行指向検索を行います。

  □検索方法
  ・複数検索パターン指定 AND/OR 検索
  ・一致/不一致検索
  ・バッファ/ファイル単位絞込み検索
      - 前回マッチしたバッファ/ファイルが再検索の対象
  ・行単位絞込み検索
      - 前回マッチした行が再検索の対象
      - 検索パターンが複数行に渡ってマッチする場合でも絞込み検索可能
  ・エンコード指定検索 (ファイル)
  ・シンタックス指定検索 (バッファ)

  □検索対象
  ・カレントバッファ指定検索
  ・全表示バッファ指定検索
  ・複数ディレクトリ指定検索
  ・複数ファイル指定検索
  ・正規表現での複数バッファ指定検索

  □出力方法
  ・バッファ/ファイル名、行番号なしの出力
  ・バッファ/ファイル名のみの出力
  ・フルパス名での出力

  □検索設定の保存
  ・検索条件設定の保存、読込、削除(ダイアログ使用時)

  □提供コマンド
  ┏━━━━━━━┯━━━━┯━━━━━━━━━┯━━━━━━━━┓
  ┃コマンド名    │パターン│対象              │対象(C-u)       ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │説明                                          ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃ggrep         │正規表現│バッファリスト    │カレントバッファ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │AND/OR 検索                                   ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃fggrep        │文字列  │バッファリスト    │カレントバッファ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │AND/OR 検索                                   ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃ggrep-and     │正規表現│バッファリスト    │カレントバッファ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │AND 検索                                      ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃fggrep-and    │文字列  │バッファリスト    │カレントバッファ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │AND 検索                                      ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃ggrep-or      │正規表現│バッファリスト    │カレントバッファ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │OR 検索                                       ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃fggrep-or     │文字列  │バッファリスト    │カレントバッファ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │OR 検索                                       ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃ggrep-narrow  │正規表現│grep 結果バッファ │                ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │絞込み検索(バッファからは行番号情報のみ取得)  ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃fggrep-narrow │文字列  │grep 結果バッファ │                ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │絞込み検索(バッファからは行番号情報のみ取得)  ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃xggrep        │正規表現│ディレクトリ      │                ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │複数ディレクトリ指定検索                      ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃zggrep        │正規表現│ファイル          │                ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │複数ファイル指定検索                          ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃ggrep-contents│正規表現│カレントバッファ  │指定バッファ    ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │絞込み検索(指定バッファ内コンテンツのみで検索)┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃ggrep-buffer  │正規表現│カレントバッファ  │指定バッファ    ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │ggrep / ggrep-narrow / ggrep-contents         ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃ggrep-detail  │        │                  │                ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │minibuffer から全てを指定して検索             ┃
  ┣━━━━━━━┿━━━━┯━━━━━━━━━┯━━━━━━━━┫
  ┃ggrep-dialog  │        │                  │                ┃
  ┃              ├────┴─────────┴────────┨
  ┃              │dialog から全てを指定して検索                 ┃
  ┗━━━━━━━┷━━━━━━━━━━━━━━━━━━━━━━━┛") ("category" "Editing") ("md5" . "f517f13b81b096319bdddf1f3e2d9299") ("time" . 3337730879) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/ggrep.l")) (("name" . "pickup-pattern") ("version" . "0.0.0.6") ("author" . "OHKUBO Hiroshi") ("file" . "pickup-pattern-0.0.0.6.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/pickup-pattern-0.0.0.6.zip") ("description" . "検索文字列/指定したパターンを強調表示します。") ("category" "Miscellaneous") ("md5" . "fe836a3057e7341cdf8e0c02775fae54") ("time" . 3337730127) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/pickup-pattern.l")) (("name" . "clickable-uri") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "clickable-uri-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/clickable-uri-20051008.zip") ("description" . "左ダブルクリックによる WEB ブラウザ、メーラー等の起動を可能にします。
URI (Uniform Resource Identifier) 強調表示も行います。") ("category" "Miscellaneous") ("md5" . "6459dda4f7e91ffde0bac8b6f14a3138") ("time" . 3337729390) ("depends") ("changes" . "・file: の場合そのまま shell-execute に渡すように変更。
・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "popup-mode-memo") ("version" . "0.0.0.3") ("author" . "OHKUBO Hiroshi") ("file" . "popup-mode-memo-0.0.0.3.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/popup-mode-memo-0.0.0.3.zip") ("description" . "モード毎のキーバインディングや自分で設定したメモをポップアップ表示します。") ("category" "Miscellaneous") ("md5" . "5dfb74399c46976315743465608bf5a8") ("time" . 3337728825) ("depends") ("changes" . "・関数名変更。
   join-string-list を popup-mode-memo-join-string-list に。
・変数名変更。
   popup-mode-memo-list を *popup-mode-memo-list* に。
・NetInstaller 対応。
・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "chini") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "chini-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/chini-20051008.zip") ("description" . "xyzzy.ini を直接操作し設定を変更します。

  ・印刷設定の保存/読込(切替)
  ・ファイラ設定の保存/読込(切替)
  ・バッファセレクタ設定の保存/読込(切替)
  ・Misc設定の保存/読込(切替)

  ・フォント設定の保存/読込(切替)
  ・色設定の保存/読込(切替)") ("category" "Utilities") ("md5" . "01f8fa117de42cfab038d981d202bb67") ("time" . 3337725698) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/chini.l")) (("name" . "toggle-gates") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "toggle-gates-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/toggle-gates-20051008.zip") ("description" . "標準キーバインドと Windows キーバインドを切り替えます。") ("category" "Miscellaneous") ("md5" . "38035c890b99f7b18ddc0b969e97283a") ("time" . 3337725155) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/toggle-gates.l")) (("name" . "explorer") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "explorer-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/explorer-20051008.zip") ("description" . "explorer を起動します。") ("category" "Utilities") ("md5" . "f62c602f3bb76ad8155704a99d826009") ("time" . 3337724650) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/explorer.l")) (("name" . "topmost") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "topmost-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/topmost-20051008.zip") ("description" . "xyzzy の最前面表示の設定・解除を可能にします。") ("category" "Miscellaneous") ("md5" . "e24a9e1b3051ccbcf6c2925503cb7138") ("time" . 3337724143) ("depends") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/topmost.l")) (("name" . "browserex") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "browserex-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/browserex-20051008.zip") ("description" . "browser.dll 使用のためのサンプル") ("category" "Network") ("md5" . "ac742bf5fe22fd08f07f52374faedfe3") ("time" . 3337724053) ("depends" "browser.dll" "win-window") ("changes" . "・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/browserex.l")) (("name" . "re-builder") ("version" . "2005.06.08") ("author" . "Detlev Zundel") ("file" . "re-builder-20050608.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/re-builder-20050608.zip") ("description" . "building Regexps with visual feedback
正規表現の作成・確認を行う (Emacs版の移植)") ("category" "Text Processing") ("md5" . "b950865e054e87ff9843cad32d2aa9a0") ("time" . 3327147922) ("depends" "lisp-re" "sregex" "rx") ("changes" . "・rx.el の rx.l への移植に伴い、`rx' syntax へ対応。
・大文字小文字の区別切り替え時に :smart も考慮するように。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "sregex") ("version" . "2005.05.20") ("author" . "Bob Glickstein") ("file" . "sregex-20050520.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/sregex-20050520.zip") ("description" . "symbolic regular expressions (Emacs版の移植)") ("category" "Libraries") ("md5" . "c32f63fe30141de739f2802249c90554") ("time" . 3325508740) ("depends") ("changes" . "xyzzyに移植") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "lisp-re") ("version" . "2005.05.19") ("author" . "Detlev Zundel") ("file" . "lisp-re-20050519.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/lisp-re-20050519.zip") ("description" . "Transform REs written in a Lisp like notation to strings
Lisp風表記で記述した正規表現を文字列に変換 (Emacs版の移植)") ("category" "Libraries") ("md5" . "cae98ace0340ce5377841231d8f1cc1b") ("time" . 3325424514) ("depends") ("changes" . "xyzzyに移植") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))))
(("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/packages.l") ("name" . "Junk Scripts") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("url" . "http://www7a.biglobe.ne.jp/~hat/") ("description" . "Junk な Scripts.") ("packages" (("name" . "outputz") ("version" . "0.0.0.1") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "outputz-0.0.0.1.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?outputz-0.0.0.1.lzh") ("description" . "Outputz <http://outputz.com/> にAPI経由でxyzzyで書いた文字数を送信します") ("category" "Network") ("md5" . "574f3eccf3c709977281af35d3be1004") ("time" . 3465010172) ("depends" "xml-http-request") ("changes" . "初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "blog-mode") ("version" . "0.0.0.5") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "blog-0.0.0.5.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?blog-0.0.0.5.lzh") ("description" . "へなちょこブログ読み書きモード") ("category" "Network") ("md5" . "1d14f46730ec77cdd435e6948abb349f") ("time" . 3451484836) ("depends" "xml-rpc-modoki" "atom-modoki") ("changes" . "・はてなダイアリーのテストサポート。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "atom-modoki") ("version" . "0.0.0.4") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "atomm-0.0.0.4.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?atomm-0.0.0.4.lzh") ("description" . "Atom を利用するためのライブラリ、になるかもしれないもの。") ("category" "Libraries") ("md5" . "ffb15fe3fbfd49b648b1be8e048d9ab4") ("time" . 3451484746) ("depends" "xml-parser-modoki" "junk-library") ("changes" . "・はてなダイアリー対応に併せて一部拡張。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "hatena-bookmark") ("version" . "0.0.0.3") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "hatena-bookmark-0.0.0.3.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?hatena-bookmark-0.0.0.3.lzh") ("description" . "はてなブックマークをAtomAPIを利用して参照、投稿、編集、削除を行います。") ("category" "Network") ("md5" . "ebb7da60f3bc4d7a408195f37310b5dd") ("time" . 3451260602) ("depends" "atom-modoki") ("changes" . "・77 Arashiさんのパッチを元に修正。(__)") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xml-parser-modoki") ("version" . "0.0.1.0") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "xmlpm-0.0.1.0.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?xmlpm-0.0.1.0.lzh") ("description" . "XML Parser もどき") ("category" "Libraries") ("md5" . "dfd4b2c0908e734f554dac1c83bd5ccc") ("time" . 3451260551) ("depends") ("changes" . "・xmlpm-write-xmlのデフォルトを*encoding-utf8*から*encoding-utf8n*に変更") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "twitter-mode") ("version" . "0.0.0.5-alpha") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "twitter-0.0.0.5-alpha.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?twitter-0.0.0.5-alpha.lzh") ("description" . "twitterクライアントのようなもの") ("category" "Network") ("md5" . "2d77514ad55f247bc545b241a24e9568") ("time" . 3446804184) ("depends" "junk-library" "xml-parser-modoki" "json") ("changes" . "・Twitter Searchをテスト追加。
・ついでにTrendsも。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "junk-library") ("version" . "0.0.0.6") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "junk-0.0.0.6.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?junk-0.0.0.6.lzh") ("description" . "JunkScriptsで配布している拡張の共通ライブラリ的なもの。") ("category" "Libraries") ("md5" . "9c05615cc805b54b84a11bf69e99c9cd") ("time" . 3411492809) ("depends") ("changes" . "・http.lのtypoを修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "KaMailV3") ("version" . "0.0.1.4beta7") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "kamail3-0.0.1.4beta7.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?kamail3-0.0.1.4beta7.lzh") ("description" . "Hyper Estraierを利用する検索ベースのメールリーダー") ("category" "Network") ("md5" . "0c2c35abb1ff40c27aa7b62b1f06eff9") ("time" . 3411492706) ("depends" "junk-library" "exbrowserdll" "browserex" "xml-rpc-modoki") ("changes" . "・送信エラー時に送信バッファがクリアされない不具合を修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "KaMailG") ("version" . "0.0.0.1-alpha") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "kamailg-0.0.0.1-alpha.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?kamailg-0.0.0.1-alpha.lzh") ("description" . "IMAPでGmailを利用してみるテスト") ("category" "Network") ("md5" . "587a8cd066e34eaec2d748f6aa7be5d4") ("time" . 3407377864) ("depends" "junk-library") ("changes" . "・初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "NetInstaller") ("version" . "0.0.1.1-5") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "ni-0.0.1.1-5.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?ni-0.0.1.1-5.lzh") ("description" . "xyzzy用へなちょこインストーラ (beta version)") ("category" "Administration") ("md5" . "4284375661a5d22c1a1b88925ab24298") ("time" . 3404995603) ("depends") ("changes" . "・[ソフトウェア板] xyzzyの使い方が分からぬやし 励ましあえ その11 の137を修正。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "php-mode") ("version" . "0.0.1.6") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "php-mode-0.0.1.6.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?php-mode-0.0.1.6.lzh") ("description" . "PHP書き用モード") ("category" "Development") ("md5" . "acea0aff04c8e0ed80a54a6cc356dbc6") ("time" . 3382789744) ("depends") ("changes" . "キーワードファイルにPHP5のキーワードを適当に追加。
php-xdebug.l を追加。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "2ch-mode") ("version" . "0.0.1.4-4") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "2ch-0.0.1.4-4.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?2ch-0.0.1.4-4.lzh") ("description" . "へなちょこ２ちゃんねるブラウザ") ("category" "Network") ("md5" . "640917125f8e4c634507d1272d40b701") ("time" . 3372251306) ("depends" "www-mode") ("changes" . "・\"xyzzy Part13\"の912を取り込み。(__)") ("notice" . "dolib関連を使う場合には、2ch-dolib をインストールしてください。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "rss-mode") ("version" . "0.0.3.0beta1") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "rss-0.0.3.0beta1.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?rss-0.0.3.0beta1.lzh") ("description" . "へなちょこRSS読みモード") ("category" "Network") ("md5" . "e977b52b4deb585b6d7c9f2e1c6c038d") ("time" . 3366158139) ("depends" "xml-parser-modoki" "junk-library" "browser.dll" "browserex") ("changes" . "・キャッシュをn件まで保存するオプション。（config.l参照）
・Hyper Estraierで検索するオプション。（config.l参照）
・データが取得できない場合にもバッファを設定するようにした。
・ローカルファイル参照時にファイルを *rss-directory* にコピーするようにした。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "hecmd") ("version" . "0.0.0.1") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "hecmd-0.0.0.1.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?hecmd-0.0.0.1.lzh") ("description" . "HyperEstraierのコマンドを操作するためのライブラリ的なものです。") ("category" "Libraries") ("md5" . "af01c17f0ce4db464517bbbb430d133a") ("time" . 3366030646) ("depends") ("changes" . "・初版") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xml-rpc-modoki") ("version" . "0.0.0.5") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "xmlrpcm-0.0.0.5.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?xmlrpcm-0.0.0.5.lzh") ("description" . "XML-RPCを利用するためのライブラリ的なもの。") ("category" "Libraries") ("md5" . "eff504952c715a923200cebec82beece") ("time" . 3350744130) ("depends" "junk-library" "xml-parser-modoki") ("changes" . "・POPFile XML-RPC Interfaceを実装。（一部未テスト）") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "hatena-keyword-autolink") ("version" . "0.0.0.3") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "hatena-keyword-autolink-0.0.0.3.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?hatena-keyword-autolink-0.0.0.3.lzh") ("description" . "はてなキーワードを自動的にリンクに変換とか。") ("category" "Text Processing") ("md5" . "f2f0a5ef7f8d3c6bf3a835b42b09f3c5") ("time" . 3349005283) ("depends" "xml-rpc-modoki") ("changes" . "「はてなダイアリーキーワード連想語API」を実装。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "www-mode") ("version" . "0.0.1.6") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "www-0.0.1.6.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?www-0.0.1.6.lzh") ("description" . "へなちょこWWWブラウザ") ("category" "Network") ("md5" . "0dd624d17823a41b6a1690925cc9ac3c") ("time" . 3344173298) ("depends") ("changes" . "・ページにformが複数ある時に何かとおかしくなっていたのをある程度修正。
・multipart/form-dataにへなちょこ対応。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "migemo") ("version" . "0.0.0.7") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "migemo-0.0.0.7.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?migemo-0.0.0.7.lzh") ("description" . "へなちょこMigemoインクリメンタルサーチマクロ") ("category" "Text Processing") ("md5" . "56d1ed351bf53348889cbb537784175c") ("time" . 3342092835) ("depends") ("changes" . "xyzzy Wikiの質問箱10(NANRIさん、ななし２さん)を取り込み。(__)") ("notice" . "migemo.dllが必要です。") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "sl") ("version" . "0.0.0.1-2") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "sl-0.0.0.1-2.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?sl-0.0.0.1-2.lzh") ("description" . "SLを走らせる。") ("category" "Miscellaneous") ("md5" . "5122becf38adc0e6397e5b549d93c9a5") ("time" . 3341988236) ("depends") ("changes" . "ni-autoload用ファイルを追加。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "2ch-dolib") ("version" . "0.0.1.4") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "2ch-dolib-0.0.1.4.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?2ch-dolib-0.0.1.4.lzh") ("description" . "2ch-mode の dolib 関連.") ("category" "Network") ("md5" . "5166522fdaf5ae7383982edd5862e488") ("time" . 3341946861) ("depends" "2ch-mode") ("changes" . "別配布初版。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "KaMail") ("version" . "0.0.2.8") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "kamail-0.0.2.8.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?kamail-0.0.2.8.lzh") ("description" . "へなちょこメール＆ニュース環境") ("category" "Network") ("md5" . "e8958e9c894b57e4347b621077ff6229") ("time" . 3341918820) ("depends") ("changes" . "・ライセンスを適用とか。
・諸般の事情からLDAP、PGPサポートをとりあえず外した。
・その他もろもろ。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ruby-mode") ("version" . "0.0.2.2") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "ruby-mode-0.0.2.2.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?ruby-mode-0.0.2.2.lzh") ("description" . "Ruby書き用モード") ("category" "Development") ("md5" . "bb7feabbee1064e7efa10efcfa2c77bb") ("time" . 3341918636) ("depends") ("changes" . "ライセンスを適用とか。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "perl-misc") ("version" . "0.0.0.4") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "perl-misc-0.0.0.4.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?perl-misc-0.0.0.4.lzh") ("description" . "perl用マクロとか
- debug
- help
- list-function
- ...") ("category" "Development") ("md5" . "d6565acdc3990993ca3c8bff73d24037") ("time" . 3341918601) ("depends") ("changes" . "ライセンスを適用とか。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ftpdown") ("version" . "0.0.0.2") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "ftpdown-0.0.0.2.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?ftpdown-0.0.0.2.lzh") ("description" . "へなちょこFTP自動更新ダウンロードマクロ") ("category" "Network") ("md5" . "c520d4cd0f6059500ef7692dbbdbf2a9") ("time" . 3341842874) ("depends" "cftp") ("changes" . "ライセンスを適用とか。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "cftp") ("version" . "0.0.1.7") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "cftp-0.0.1.7.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?cftp-0.0.1.7.lzh") ("description" . "へなちょこNcFTP風 FTP Client") ("category" "Network") ("md5" . "a146110d40ca70f70bbcec016902a5c5") ("time" . 3341842137) ("depends") ("changes" . "・ライセンスを適用とか。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ftpupdate") ("version" . "0.0.0.5") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "ftpupdate-0.0.0.5.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?ftpupdate-0.0.0.5.lzh") ("description" . "へなちょこFTP自動更新アップロードマクロ") ("category" "Network") ("md5" . "39aaf3765df44e7c8d2ca9764f67984f") ("time" . 3341841306) ("depends") ("changes" . "ライセンスを適用とか。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "gnugo") ("version" . "0.0.0.5") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "gnugo-0.0.0.5.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?gnugo-0.0.0.5.lzh") ("description" . "Gnu GO で遊ぶためのインターフェース。別途 gnugo.exe が必要。") ("category" "Games") ("md5" . "06c6be93389a17d0d4336fc2dfe78006") ("time" . 3341835671) ("depends") ("changes" . "GPLを適用。") ("notice" . "別途 gnugo.exe が必要。") ("load-after-install" . "") ("load-before-uninstall" . ""))))

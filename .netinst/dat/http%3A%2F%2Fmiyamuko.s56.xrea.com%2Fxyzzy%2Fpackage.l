("name" . "xyzzyのじかん")
("author" . "miyamuko")
("url" . "http://miyamuko.s56.xrea.com/")
("description" . "どうでもいいスクリプトとか")
("packages" (("name" . "xl-pik") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-pik.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-pik.zip") ("description" . "xl-pik は [Pik] を使って xyzzy から利用する Ruby を切り替えるためのツールです。

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
スライド単位での編集") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xyzzytail") ("version" . "0.1") ("author" . "miyamuko") ("file" . "xyzzytail.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xyzzytail.zip") ("description" . "コマンドラインから tail-f する。") ("category" "Utilities") ("md5" . "18ea1e53e8b81bcfb5582911dffa8210") ("time" . 3301058739) ("depends") ("changes" . "初期リリース") ("notice" . "") ("load-after-install" . "site-lisp/xyzzytail/install.l") ("load-before-uninstall" . "")) (("name" . "xyzzydiff") ("version" . "0.1") ("author" . "miyamuko") ("file" . "xyzzydiff.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xyzzydiff.zip") ("description" . "コマンドラインから diff する。") ("category" "Development") ("md5" . "d764dbbac7381fd43321e23d7104cfc0") ("time" . 3301058729) ("depends") ("changes" . "初期リリース") ("notice" . "") ("load-after-install" . "site-lisp/xyzzydiff/install.l") ("load-before-uninstall" . "")) (("name" . "windzoom") ("version" . "0.1") ("author" . "miyamuko") ("file" . "windzoom.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/windzoom.zip") ("description" . "Window の分割をアニメーションする。") ("category" "Graphics/Sound") ("md5" . "959f6d03ac75500410df117b401d0bc7") ("time" . 3301057738) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "properties-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "properties-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/properties-mode.zip") ("description" . "Java の properties ファイルを読み書きする。") ("category" "Development") ("md5" . "65d21a67d5299d956e71c25e0e0c9852") ("time" . 3301057729) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "nsis-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "nsis-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/nsis-mode.zip") ("description" . "NSIS スクリプトを読み書きする。") ("category" "Development") ("md5" . "2cbf8c8cc44a5ea63fb05935060489b3") ("time" . 3301057724) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "mof-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "mof-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/mof-mode.zip") ("description" . "MOF ファイルを読み書きする。") ("category" "Development") ("md5" . "8d3ab910d25da882127531ca441a6769") ("time" . 3301057720) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "luna") ("version" . "0.1") ("author" . "miyamuko") ("file" . "luna.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/luna.zip") ("description" . "Windows XP スタイルで xyzzy を表示する。") ("category" "Graphics/Sound") ("md5" . "b3f171cddc449bb46c7e48e7ae3540e8") ("time" . 3301057714) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "is-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "is-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/is-mode.zip") ("description" . "InstallScript を読み書きする。") ("category" "Development") ("md5" . "e6b9dbc1f022eeede2c33448c0b26e03") ("time" . 3301057703) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ci-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "ci-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/ci-mode.zip") ("description" . "しぃ(*ﾟーﾟ)言語を読み書きしる。") ("category" "Development") ("md5" . "8aa2143b3212385613c6cc73b68932bf") ("time" . 3301057699) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "bnf-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "bnf-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/bnf-mode.zip") ("description" . "BNF ファイルを読み書きする。") ("category" "Development") ("md5" . "419fa57880d47d50a0274691a1a0cd51") ("time" . 3301057694) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "banner") ("version" . "0.1") ("author" . "miyamuko") ("file" . "banner.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/banner.zip") ("description" . "unix の banner コマンドみたいなもの。") ("category" "Text Processing") ("md5" . "aeb1c107b48bd23ad6d71bdf64005bd0") ("time" . 3301057690) ("depends") ("changes" . "仕切りなおしリリース") ("notice" . "bdf フォントが必要です") ("load-after-install" . "") ("load-before-uninstall" . "")))

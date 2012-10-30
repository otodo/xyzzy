("name" . "雑記帖")
("author" . "OHKUBO Hiroshi")
("url" . "http://ohkubo.s53.xrea.com/")
("description" . "つれづれなるままに")
("packages" (("name" . "outline-tree2") ("version" . "2012.04.03") ("author" . "OHKUBO Hiroshi") ("file" . "outline-tree2-20120403.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/outline-tree2-20120403.zip") ("description" . "TreeView.dll を用いて、バッファリストのツリー表示、バッファ内のア
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
Lisp風表記で記述した正規表現を文字列に変換 (Emacs版の移植)") ("category" "Libraries") ("md5" . "cae98ace0340ce5377841231d8f1cc1b") ("time" . 3325424514) ("depends") ("changes" . "xyzzyに移植") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")))

(("site" . "雑記帖") ("name" . "treeview") ("version" . "2006.11.03") ("author" . "OHKUBO Hiroshi") ("file" . "treeview-20061103.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/treeview-20061103.zip") ("description" . "TreeView.dll を操作するライブラリ") ("category" "Libraries") ("md5" . "5fd5513a0b3a371d4c11cedf7454ccee") ("time" . 3371492676) ("depends" "treeview.dll(ver.1.03)" "win-window" "color") ("changes" . "・treeview-get-up-item 関数を修正。
  連鎖して treeview-scan-treeview, treeview-isearch-forward,
  treeview-isearch-backward などでの逆検索が正常動作に。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/treeview.l"))
(("site" . "雑記帖") ("name" . "outline-tree2") ("version" . "2012.04.03") ("author" . "OHKUBO Hiroshi") ("file" . "outline-tree2-20120403.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/outline-tree2-20120403.zip") ("description" . "TreeView.dll を用いて、バッファリストのツリー表示、バッファ内のア
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
   - *outline-tree-style-linesatroot* の初期値を nil に変更。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/misc_notes/outline-tree2.l"))
(("site" . "雑記帖") ("name" . "buf2html") ("version" . "0.0.0.15") ("author" . "OHKUBO Hiroshi") ("file" . "buf2html-0.0.0.15.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/buf2html-0.0.0.15.zip") ("description" . "なるべくバッファの表示を再現するような HTML を生成します。") ("category" "Formatting" "Utilities") ("md5" . "a5d266176cd85d48cb185a6ff6c8c78b") ("time" . 3347498982) ("depends") ("changes" . "・*buf2html-post-convert-buffer-hook* 追加。
・*buf2html-encoding*, *buf2html-eol-code* を追加。
・その他。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "雑記帖") ("name" . "win-window") ("version" . "2005.10.08") ("author" . "OHKUBO Hiroshi") ("file" . "win-window-20051008.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/win-window-20051008.zip") ("description" . "Windows の Window を操作します。") ("category" "Libraries") ("md5" . "4bd7fc79df079917368f6e52cf2989f5") ("time" . 3337740003) ("depends") ("changes" . "・GetWindowRect, IsZoomed の戻り値の型を int -> BOOL に変更
・メールアドレスを変更。
・ライセンス条項(修正BSDライセンス)を記載。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "雑記帖") ("name" . "color") ("version" . "2005.10.06") ("author" . "OHKUBO Hiroshi") ("file" . "color-20051006.zip") ("src" . "http://ohkubo.s53.xrea.com/xyzzy/color-20051006.zip") ("description" . "COLOR-NAME と RGB値 の対応リスト、操作関数を提供します。") ("category" "Libraries") ("md5" . "48424d119b6a6f0f4be88231387220f9") ("time" . 3343223908) ("depends") ("changes" . "・公開") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "Masatoshi's xyzzy extend lisps") ("author" . "SANO Masatoshi") ("version" . "2006.06.14") ("file" . "treeviewdll2006.06.14.tgz") ("src" . "http://xyzzy.s53.xrea.com/ni/treeviewdll2006.06.14.tgz") ("md5" . "bfc62e0f66590eadf9a1be5cadf2c149") ("time" . 3359263779) ("name" . "treeviewdll") ("description" . "kazu.yさんのtreeviewdllをインストールします") ("depends" "") ("category" "") ("notice" . "使い始めるとプロセスがロックするため、アンインストールが出来ません。
削除はxyzzyの起動直後がお勧めです。") ("load-after-install" . "site-lisp/inst/treeviewdll/inst.l") ("load-before-uninstall" . "site-lisp/inst/treeviewdll/uninst.l"))
(("site" . "Rubyもの") ("author" . "雪見酒") ("name" . "ruby-mode for xyzzy") ("version" . "100704") ("file" . "http://homepage3.nifty.com/Yukimi_Sake/ruby/xyzzy/ruby-mode100704.zip") ("src" . "http://homepage3.nifty.com/Yukimi_Sake/ruby/xyzzy/ruby-mode100704.zip") ("description" . "Ruby用のメジャーモード") ("md5" . "6fe41cac34ad6b6fac2d422a3abeec76") ("time" . 3487243663) ("depends" "") ("category" "Development" "major-mode") ("changes" . "いろいろ") ("notice" . "ruby-hilite.l は上書きされますのでバックアップしてください"))
(("site" . "kia's website") ("name" . "comment") ("version" . "2005-09-10") ("author" . "Noah S. Friedman") ("file" . "comment-20050910.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/comment-20050910.lzh") ("description" . "comment out regions of buffers (Emacs版の移植です)") ("category") ("md5" . "8563d39effb32203a8408b251d07ef80") ("time" . 3335319706) ("depends") ("changes" . "行末の空白の扱いを変更しました") ("notice" . "ni-autoloadではキーバインドしませんので、適当なキーに割り当ててください。") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "Junk Scripts") ("name" . "ruby-mode") ("version" . "0.0.2.2") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "ruby-mode-0.0.2.2.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?ruby-mode-0.0.2.2.lzh") ("description" . "Ruby書き用モード") ("category" "Development") ("md5" . "bb7feabbee1064e7efa10efcfa2c77bb") ("time" . 3341918636) ("depends") ("changes" . "ライセンスを適用とか。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "HIE no xyzzy") ("name" . "ruby-refe") ("version" . "2.00") ("author" . "HIE Masahiro") ("file" . "ruby-refe_2.00.zip") ("src" . "http://hie.s64.xrea.com/xyzzy/pub/ruby-refe_2.00.zip") ("description" . "ruby-mode から，ReFe を参照します。") ("category" "Documentation") ("md5" . "f2485dc589402273e45380e529e1df51") ("time" . 3479122615) ("depends") ("changes" . "[Version 2.00] 2010-04-01 (木)
・ReFe2 に対応した(はず)。
・ReFe1 非対応にした。
・オプションが指定できるようにした。
・その他いろいろ。") ("notice" . "ReFe2より前のバージョンには非対応。") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "silog") ("name" . "paren") ("md5" . "a7d3ec008679baf596e93fca325eb500") ("src" . "http://white.s151.xrea.com/wiki/index.php?plugin=attach&refer=script%2Fparen&openfile=paren-2007.04.12.zip") ("version" . "2007.04.12") ("author" . "shiro") ("file" . "paren-2007.04.12.zip") ("description" . " KITAさん作のparen.lの改造版です
 
 以下変更点
  
  - ハイライトの前後で属性を保存
  - delete-text-attributesのタイミングの変更
  - エスケープされている場合は動作を行わないように
  - 指定されたコマンドの直後では動作を行わないように
  - シンタックスがタグの場合でもハイライト(設定可)
  - 閉じ括弧の反応する位置を1つ前にできるように(設定可)
  - ハイライト中でも元の属性を表示し続ける(設定可)") ("time" . 3385370028) ("depends" nil) ("category" "Utilities") ("changes" . "連続したエスケープの直後の括弧が強調できていなかったのを修正") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "Junk Scripts") ("name" . "perl-misc") ("version" . "0.0.0.4") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "perl-misc-0.0.0.4.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?perl-misc-0.0.0.4.lzh") ("description" . "perl用マクロとか
- debug
- help
- list-function
- ...") ("category" "Development") ("md5" . "d6565acdc3990993ca3c8bff73d24037") ("time" . 3341918601) ("depends") ("changes" . "ライセンスを適用とか。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "xyzzy's Lisps") ("name" . "generic-comment-toggle") ("version" . "2008.01.07") ("author" . "bove-crach") ("file" . "generic-comment-toggle2008.01.07.zip") ("src" . "http://park.geocities.jp/bovecrach/xyzzy/generic-comment-toggle2008.01.07.zip") ("description" . "バッファモード毎のコメントアウトorアンコメントを行います。
要は HIEさんのページのNOTE->編集->1 行コメントをトグル を改造しただけです") ("category" "Development" "Editing") ("md5" . "8933fa328feb50e92cb422970000779f") ("time" . 3408629027) ("depends") ("changes" . "packagesとしては初版
・コメントアウト/アンコメントする度に行っていた(set-comment-words)を、最小限になるように。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "Junk Scripts") ("name" . "migemo") ("version" . "0.0.0.7") ("author" . "Masashi Hattori <hat@kme.biglobe.ne.jp>") ("file" . "migemo-0.0.0.7.lzh") ("src" . "http://www7a.biglobe.ne.jp/~hat/xyzzy/download.cgi?migemo-0.0.0.7.lzh") ("description" . "へなちょこMigemoインクリメンタルサーチマクロ") ("category" "Text Processing") ("md5" . "56d1ed351bf53348889cbb537784175c") ("time" . 3342092835) ("depends") ("changes" . "xyzzy Wikiの質問箱10(NANRIさん、ななし２さん)を取り込み。(__)") ("notice" . "migemo.dllが必要です。") ("load-after-install" . "") ("load-before-uninstall" . ""))
(("site" . "kia's website") ("name" . "template-insert") ("version" . "0.9") ("author" . "kia") ("file" . "template-insert-0.9.lzh") ("src" . "http://www.geocities.jp/kiaswebsite/xyzzy/template-insert-0.9.lzh") ("description" . "新しく作成するファイル名に応じたテンプレートをインサートします。") ("category") ("md5" . "545f8d19679d816063ba81978645be7e") ("time" . 3336621990) ("depends") ("changes" . "テンプレートが複数ある場合に選択できるようにしました。
`template-insert'パッケージにニックネーム`ti'を設定しました。
置換するキーワードを少し追加しました。") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . ""))

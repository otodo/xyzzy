("name" . "ななしの人の部屋")
("author" . "IMAI Takeo <usitukai@osk.3web.ne.jp>")
("url" . "http://www.osk.3web.ne.jp/~usitukai/")
("description" . "xyzzyなもの")
("packages"
 (("name" . "exbrowserdll")
  ("version" . "2005.12.06")
  ("author" . "いまい たけを <usitukai@osk.3web.ne.jp>")
  ("file" . "exbrowserdll.lzh")
  ("src" . "http://www.osk.3web.ne.jp/~usitukai/warez/exbrowserdll.lzh")
  ("description" . "browser.dll拡張版をインストールします")
  ("category")
  ("md5" . "4fde4ea2de2e54306e13a22a31e9efa6")
  ("time" . 3342864639)
  ("depends")
  ("changes" . "インストーラのバグを直しました。
インストールされる中身は変わりません。")
  ("notice" . "何も保証できない程度に危険です。自己責任で使ってください。")
  ("load-after-install" . "site-lisp/inst/exbrowserdll/inst.l")
  ("load-before-uninstall" . "site-lisp/inst/exbrowserdll/uninst.l"))

 (("name" . "darcs-mode")
  ("version" . "0.3 alpha")
  ("author" . "いまい たけを <usitukai@osk.3web.ne.jp>")
  ("file" . "darcs-0.3alpha.zip")
  ("src" . "http://www.osk.3web.ne.jp/~usitukai/warez/darcs-0.3alpha.zip")
  ("description" . "バージョン管理ツールdarcsを利用して、編集したいテキストの
バージョン管理ができるようになる簡易モードです。")
  ("category" "Editing")
  ("md5" . "7d31ae2c4208a231fb5b89c4573c20b0")
  ("time" . 3327313683)
  ("depends")
  ("changes" . "- 自動initialize & add 
 - 静かにauto-initializeするパラメタ導入 
 - auto-initializeしないのも 
 - addだけしないのも 
 - C-c v c で日本語がでるように
")
  ("notice" . "作りたてほやほやの上、作者がdarcs初心者のため危険です。
ちなみに、darcs はこちらから取得できます。→ http://www.darcs.net/")
  ("load-after-install" . "")
  ("load-before-uninstall" . ""))

 (("name" . "ghci-mode")
  ("version" . "0.1 alpha")
  ("author" . "いまい たけを <usitukai@osk.3web.ne.jp>")
  ("file" . "ghci-0.1alpha.zip")
  ("src" . "http://www.osk.3web.ne.jp/~usitukai/warez/ghci-0.1alpha.zip")
  ("description" . "Haskellインタプリタ GHCi を起動して
編集したHaskellコードをロードしたりするモードです。
インデントやキーワードの色づけはしないので、別のモードと
併用してください。")
  ("category" "Editing")
  ("md5" . "899bfbcc440aefdcfe762560da5e7dc0")
  ("time" . 3357988644)
  ("depends")
  ("changes" . "初版")
  ("notice" . "作りたてほやほやですので、使用の際は十分注意してください。")
  ("load-after-install" . "")
  ("load-before-uninstall" . ""))
)

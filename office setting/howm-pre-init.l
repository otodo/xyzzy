(in-package "elisp-lib")

;; howm ロード前の初期化。

; メモ溜ディレクトリ。
(setq howm-directory "C:/xyzzy/howm/")
; キーワードファイルのファイル名。
(setq howm-keyword-file "C:/xyzzy/howm/.howm-keys")

; メニューファイルも無視する。
(setq howm-excluded-file-regexp
      "\\(^\\|/\\)\\([.]\\|\\(menu\\(_edit\\)?\\|0+-0+-0+\\).howm\\)\\|[~#]$\\|\\.bak$\\|/CVS/")


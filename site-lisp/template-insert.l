;; template-insert.l --- テンプレートの挿入
;; -*- mode:lisp; package:template-insert -*-
;;
;; $Id: template-insert.l 204 2005-09-25 07:25:07Z kia $
;;
;; 開いたファイルがまだ作成されていない新しいファイルであったとき、そのファ
;; イル名や設定された編集モードに応じて、予め用意しておいたテンプレートのテ
;; キストをバッファに挿入します。またテンプレートを挿入する際テンプレートに
;; 記述したキーワードを指示された文字列に置換します。
;;
;;
;; インストール
;; ============
;;
;; xyzzyをインストールしたディレクトリにあるsite-lispフォルダに
;; template-insert.lをコピーします。
;;
;; ~/.xyzzyでtemplate-insert.lをロードするように設定します。次のように記述
;; してください。
;;
;;     (require "template-insert")
;;     (use-package "template-insert")
;;
;; 次にテンプレートとなるファイルを置いておくディレクトリを設定します。デフ
;; ォルトは ~/templates/ ですので、変更が必要なときだけ次のように設定してく
;; ださい。
;;
;;     (setq *template-insert-directory* "~/insert/")
;;
;; Xyzzyを再起動してください。
;;
;;
;; 使い方
;; ======
;;
;; 基本の使い方
;; ------------
;;
;; 最も簡単な使い方は、*template-insert-directory*に設定したディレクトリに
;; テンプレートとなるファイルを入れておくだけです。テンプレートファイルの名
;; 前にはファイルの形式に応じた拡張子を付けてください。
;;
;; find-fileコマンドやメニューの「ファイル → 開く」で、まだ作成されていな
;; いファイル名を指定すると、template-insertは*template-insert-directory*の
;; 中から同じ拡張子を持つテンプレートファイルを探し、新しく開いたバッファに
;; 挿入するかどうかをユーザに確認するプロンプトを出します。
;;
;; また、同じ拡張子を持つテンプレートファイルが複数見つかったときは、どのフ
;; ァイルをバッファに挿入するのかをユーザに確認するプロンプトが出ますから、
;; その都度指示してください。
;;
;; テンプレートファイルとテキストの細かい制御
;; ------------------------------------------
;;
;; 「基本の使い方」の動作にまかせずに、挿入するテンプレートファイルを選択し
;; たり、テンプレートファイルに使わずにテキストをバッファに挿入したいような
;; ときは、*template-insert-alist*変数を使います。
;;
;; *template-insert-alist*変数には新しく開くファイル名やその編集モードとテ
;; ンプレートとの関係を設定します。
;;
;;     (setq *template-insert-alist* '((html+-mode . "newfile.html")))
;;
;; *template-insert-alist*変数はいくつかのペアからなるリストで、各ペアはキ
;; ー部分（ドットの左側）とデータ部分（ドットの右側）からなります。
;;
;;     '((キー . データ) (キー . データ) ...)
;;
;; 「キー」はファイル名を表す文字列(正規表現)か、あるいはバッファの編集モー
;; ドをあらわすシンボルです。また「データ」はファイル名を表す文字列か、ある
;; いは任意の文字列を返す関数です。
;;
;; 新しくファイルを開くと、template-insertは*template-insert-alist*変数に設
;; 定したペアの「キー」を順に調べます。
;;
;; 「キー」が文字列のときはその文字列をファイル名を表わす正規表現とみなし、
;; 新しく開いたファイル名と比較します。
;;
;; 「キー」がシンボルの時は新しく開いたバッファの編集モードと比較します。
;;
;; それらの「キー」の比較が真(非nil)だったとき、その「キー」に対応する「デ
;; ータ」をもとにテンプレートの挿入が行われます。
;;
;; テンプレートの挿入は「データ」が文字列なのか関数なのかによって動作が変わ
;; ります。
;;
;; 「データ」が文字列であれば、その文字列をファイル名とみなし、
;; *template-insert-directory*変数に設定されたディレクトリにある(はずの)同
;; 名のファイルの内容を新しく開いたバッファに挿入します。
;;
;; また「データ」が関数であれば、その関数を実行し、実行結果の文字列を新しく
;; 開いたバッファに挿入します。関数の実行結果が文字列以外であればバッファに
;; は何も挿入しません。
;;
;; 次にいくつか設定例を示します。
;;
;;     ディレクトリによる切り替え
;;     (setq *template-insert-alist*
;;           (append '(("/website1/.*\\.html?" . "template1.html")
;;                     ("/website2/.*\\.html?" . "template2.html"))
;;                   *template-insert-alist*))
;;
;;     ファイルを使わず文字列を挿入
;;     (push `(ruby-mode . ,#'(lambda () "#!/usr/local/bin/ruby\n\n"))
;;           *template-insert-alist*)
;;
;;     テンプレートを読みこむついでに文字コードなんかも変えといてみる
;;     (push `(html+-mode . ,#'(lambda ()
;;                               (set-buffer-fileio-encoding (read-char-encoding "Encoding: "))
;;                               (ti::insert-template-type '("*.html" "*.htm"))))
;;           *template-insert-alist*)
;;
;; *template-insert-alist*変数の設定は、先に「基本の使い方」に述べた、同じ
;; 拡張子によるファイルの挿入に優先します。即ち、*template-insert-alist*変
;; 数に該当する設定が無ければ、拡張子を調べてファイル挿入を試み、それもダメ
;; なら何もしません。
;;
;; キーワードの置換
;; ----------------
;;
;; テンプレートの挿入が行われたときは、テンプレートに記述されたキーワードの
;; 置換も実行します。キーワードは`@'で両端を挟まれた、英数字とアンダースコア
;; からなる文字列です（@ABC@、@123@、@XYZ_999@など）。以下に定義済みのキー
;; ワードを示します。
;;
;;     @FILENAME@     --- ファイルのパス名
;;     @_FILENAME@     --- ファイルのパス名。ディレクトリの区切りはバックスラッシュ
;;     @BASEFILENAME@ --- ディレクトリを除いたファイル名のうち拡張子以外の部分
;;     @EXTENSION@    --- ファイルの拡張子。
;;     @DIRECTORY@    --- ファイルのディレクトリ
;;     @_DIRECTORY@    --- ファイルのディレクトリ。ディレクトリの区切りはバックスラッシュ
;;     @DATETIME@     --- 日時(ex. 2003-03-30 01:53:34+09:00)
;;     @DATE@         --- 日付(ex. 2003-03-30)
;;     @USERNAME@     --- 環境変数 USERNAME の値
;;     @AUTHOR@       --- @USERNAME@に同じ
;;     @POINT@        --- キーワード置換が行われたあとのカーソル位置
;;     @DOT@          --- @POINT@に同じ
;;     @@             --- @
;;     @ASK_～@       --- @ASK_で始まる場合にはプロンプトを出し、入力された文字列に置換します。
;;                        (ex. @ASK_Please_input_your_ID@)
;;     @～@           --- 上記いずれにも一致しなければ「～」部分に名前が一致する環境変数の値
;;
;; これらの定義済みキーワードの中で、@POINT@や@DOT@は空文字列と置き換えられ
;; ます。
;;
;; キーワードと紛らわしいテキストの中で`@'そのものを表示するときは"@@"のよ
;; うに`@'を二つ重ねて書いてください。
;;
;; これらのキーワードは*template-insert-variables-alist*という変数に定義し
;; てあります。ほかに置換したいものがあるときは
;; *template-insert-variables-alist*変数に追加してください。すでに定義済み
;; のものでも*template-insert-variables-alist*変数の先頭に同じキーワードを
;; 追加していくことで変更することができます。
;;
;; *template-insert-alist*変数と同様に、*template-insert-variables-alist*変
;; 数はいくつかのペアからなるリストで、各ペアは「キー」部分（ドットの左側）
;; と「データ」部分（ドットの右側）からなります。
;;
;;     '((キー . データ) (キー . データ) ...)
;;
;; 「キー」はキーワードを表す文字列です。`@'で両端を挟まれた文字列でなけれ
;; ばなりません。大文字小文字は区別します。「データ」は文字列か、あるいは任
;; 意の文字列を返す関数です。
;;
;; 次にキーワードを追加する例をいくつか示します。
;;
;;     (push '("@EMAIL@" . "meshinsha@yahoo.co.jp") *template-insert-variables-alist*)
;;
;;     (push `("@CHARSET@" . ,#'(lambda ()
;;                                 (let ((enc (buffer-fileio-encoding)))
;;                                   (cond
;;                                    ((eq enc *encoding-sjis*) "Shift_JIS")
;;                                    ((eq enc *encoding-euc-jp*) "EUC-JP")
;;                                    ((eq enc *encoding-jis*) "iso-2022-jp")
;;                                    (t "Shift_JIS")))))
;;           *template-insert-variables-alist*)
;;
;;
;; 注意
;; ====
;;
;; このスクリプトを使用したことで発生した損害に対する責任は負いかねます。こ
;; のスクリプトを使用する前には、必ずファイルのバックアップを取るなど、原状
;; を回復する手段を確保した上で各自の責任において使用してください。
;;
;;
;; アドレス
;; ========
;;
;; kia <meshinsha@yahoo.co.jp>
;; http://www.geocities.jp/kiaswebsite/

(provide "template-insert")
(defpackage "template-insert" (:use "lisp" "editor") (:nicknames "ti"))
(in-package "template-insert")
(shadow '(insert-template
          insert-template-type
          template-insert
          *template-insert-directory*
          *template-insert-alist*
          *template-insert-variables-alist*
          *popup-template-files*
          choose-template-file
          expand-variables
          get-directory-name
          get-backslashed-directory-name
          get-user-name
;          get-template-name
          get-template-names
          lookup
          set-initial-cursor-position
          yn
          *initial-cursor-position*
          *variable-beginning*
          *variable-end*
          *variable-string*
          *variable-name*
          RE-VARIABLE))
(export '(template-insert
          *template-insert-directory*
          *template-insert-alist*
          *template-insert-variables-alist*))

(defconstant RE-VARIABLE (compile-regexp "@\\([A-Za-z0-9_]*\\)@"))

(defvar *template-insert-directory* "~/templates/")

(defvar *template-insert-alist* nil)

(defvar *popup-template-files* nil)

(defun get-directory-name ()
  (directory-namestring (get-buffer-file-name)))

(defun get-backslashed-directory-name ()
  (map-slash-to-backslash (get-directory-name)))

(defun get-user-name ()
  (or (si:getenv "USERNAME") ""))

(defun set-initial-cursor-position ()
  (setq *initial-cursor-position* *variable-beginning*)
  "")

(defvar *template-insert-variables-alist*
  `(("@FILENAME@"     . ,#'get-buffer-file-name)
    ("@_FILENAME@"    . ,#'(lambda ()
                             (map-slash-to-backslash (get-buffer-file-name))))
    ("@BASEFILENAME@" . ,#'(lambda ()
                             (pathname-name (get-buffer-file-name))))
    ("@EXTENSION@"    . ,#'(lambda ()
                             (pathname-type (get-buffer-file-name))))
    ("@DIRECTORY@"    . ,#'get-directory-name)
    ("@DIR@"          . ,#'get-directory-name)
    ("@_DIRECTORY@"   . ,#'get-backslashed-directory-name)
    ("@_DIR@"         . ,#'get-backslashed-directory-name)
    ("@DATETIME@"     . ,#'(lambda ()
                             (format-date-string "%Y-%m-%d %H:%M:%S%#Z")))
    ("@DATE@"         . ,#'(lambda ()
                             (format-date-string "%Y-%m-%d")))
    ("@USERNAME@"     . ,#'get-user-name)
    ("@AUTHOR@"       . ,#'get-user-name)
    ("@POINT@"        . ,#'set-initial-cursor-position)
    ("@DOT@"          . ,#'set-initial-cursor-position)
    ("@@"             . "@")
    ("@ASK_\\(.+\\)@"  . ,#'(lambda ()
                              (read-string (format nil "~A: " (substitute-string (match-string 1) "_" " ")))))
    ("@\\(.+\\)@"     . ,#'(lambda ()
                             (let ((env (si:getenv *variable-name*)))
                               (if env
                                   env
                                 *variable-string*))))))


(defvar *initial-cursor-position* nil)
(defvar *variable-beginning* nil)
(defvar *variable-end* nil)
(defvar *variable-string* nil)
(defvar *variable-name* nil)

(defun choose-template-file (lst)
  (if *popup-template-files*
      (let (fn)
        (popup-list lst #'(lambda (x) (setq fn x)))
        (while (not fn)
          (sit-for .3))
        fn)
    (completing-read "どのファイル? " lst :must-match t)))

(defun expand-variables ()
  (setq *initial-cursor-position* nil)
  (goto-char 0)
  (while (scan-buffer RE-VARIABLE :tail t :no-dup nil)
    (let ((*variable-beginning* (match-beginning 0))
          (*variable-end* (match-end 0))
          (*variable-string* (match-string 0))
          (*variable-name* (match-string 1)))
      (flet ((get-replacement ()
               (let ((rep (cdr (assoc-if #'(lambda (x)
                                             (string-match x *variable-string*))
                                         *template-insert-variables-alist*))))
                 (cond ((stringp rep) rep)
                       ((functionp rep) (funcall rep))))))
        (let ((repstr (get-replacement)))
          (when repstr
            (delete-region *variable-beginning* *variable-end*)
            (insert repstr))))))
  (goto-char (or *initial-cursor-position* 0)))

;; (defun get-template-name (wild)
;;   (car (get-template-names wild)))

(defun get-template-names (wild)
  (directory *template-insert-directory* :file-only t :wild wild :recursive t))

(defun insert-template (fname)
  (insert-file-contents (merge-pathnames fname *template-insert-directory*))
  t)

(defun insert-template-type (wild)
  (let ((lst (get-template-names wild)))
    (when lst
      (insert-template
       (if (= (length lst) 1)
           (car lst)
         (choose-template-file lst))))))

(defun lookup (fname mode)
  (assoc-if #'(lambda (x)
                (cond ((symbolp x) (eq x mode))
                      ((stringp x) (string-match x fname)) ))
            *template-insert-alist*))

(defun template-insert ()
  (let* ((buf (selected-buffer))
         (fname (get-buffer-file-name buf)))
    (when (and fname (not (file-exist-p fname)))
      (let ((pair (lookup fname (buffer-local-value buf 'buffer-mode))))
        (if pair
            (let ((act-or-fname (cdr pair)))
              (when (yn (string (car pair)))
                (if (functionp act-or-fname)
                    (progn
                      (let ((s (funcall act-or-fname)))
                        (and (stringp s) (insert s)))
                      (expand-variables))
                  (progn
                    (insert-template act-or-fname)
                    (expand-variables)))))
          (let* ((type (pathname-type fname))
                 (wild (format nil "*.~A" type)))
            (when (and (get-template-names wild) (yn wild))
              (insert-template-type wild)
              (expand-variables))))))))

(defun yn (s)
  (y-or-n-p "テンプレートを挿入しますか？ (~A)" s))

(add-hook '*find-file-hooks* 'template-insert)

;;; template-insert.lはここまで

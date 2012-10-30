
#|
Memo取りサポートツール

TKI
http://www2.ocn.ne.jp/~cheerful/script/

------------------------------
■Memo目的

・簡単に使えること
・すぐ書き始められること
・準備カスタマイズに時間がかからない
・整理に時間がかからないこと
・整理はしない
・最低限のルール
・ファイル名に日付(作った日)をつける
・ファイル名にタグとしてラベルを付けるのも可
・ファイルの中は特にフォーマットを指定しない
・フォルダ分けも基本しない
・操作覚えることはなるべくしなくても最低限のことはできること
・検索機能により見つける
・とりあえず、誰でも検索できる
・基本 日付＋ラベル で検索
・特定のツールに(xyzzyも含めて)閉じない,依存しない

------------------------------
■lisp概要

○概要
Memo取ることをサポートする機能を提供する

○目的
メモデータはすぐ、すべて取り、整理コストを極力減らし、検索で楽に見つけること
(価値を上げるために、リンク機能も付けたいかも)

○利点と目標
・このツールがなくてもデータは利用可能
・ファイル名を考えたり、設定する手間を省ける。
・最低限の制約でメモが保存でき、検索できる。

○機能概要
・Memoファイルを新規作成
・開いたとき最後にジャンプ？
(・保存、ファイルを開く機能は xyzzyの標準機能を利用)
(・検索機能は xyzzyの標準機能や windowsのツールを活用)

・calendar.lから、同日のメモを開く
・xyzzyの開いているバッファにある今日の日付のメモにjump
・memo ディレクトリにあるファイルを インクリメンタルフィルターサーチして開く
・メモファイルにラベル名をつけるリネーム機能
;20100810.txt → 20100810_[INPUT].txt

○サブ機能
・close memo(& save)

・保存時
1行目をlabelに設定する。

・xyzzy終了時
memoの場合、質問しないで保存する

・パスリンクの扱い(local , http)
<path> <url> をダブルクリックで開く
以下を参照
xyzzyでfind-file *memo-click-xyzzy-path* "\\.\\\(l\\\|txt\\\|dat\\\|log\\\)$"
windowsに任せる  *memo-click-out-path* "^\\\(http:\\\|mailto\\\)" or これら以外


・リンク先の内容を表示する

・Calendarにmemoの気配を表示させる

------------------------------
○メモ使い方＆フォーマット

file名
20100809.txt
20100809_ラベル.txt
20100809_コメント.txt

- 日付が前にしているのは、日付によるソートで時間順に並べられる
- ラベルはファイルの検索によりフィルタリングする
- ファイル名を毎回考えたりする手間を削減

fileの中
フリーフォマット

direcotory
指定配下全部


検索方法
このツールに限らず何でも、
explorer(win+f)でも 市販の検索ツールでも , memo.lでも,calendarのクリックから

●インストール


○依存関係
colormakerの append-text-attribute を使用している。



●

○使い方の参考
・ラベルに種類を記載 個人で決めておく
(memo | draft | TODO)_(カテゴリ)_(URL,bookmark)とか

・ルールサンプル
<>はパスにする
例：<path> <URL>

1行目はタイトル
[]はタグにする



フォーマットは自分で使いながら考えていくと良いと思います。


・compile-regexp-keyword-list の改善
(setq regexp-keyword-list
      (compile-regexp-keyword-list
       '(
         ;文字列
         ("\\s\".*\\s\"" t (:color 10 2) t)
         ;コメント
         ("\\s<[^\"\"]*\\s>" t (:color 6 1) t)
         ;テキスト見出し
         ("^[ \t]*[●◆■▲▼]" t (:color 2 4 :line :bold) t)
         ("^[ \t]*[○◎◇□△▽].*\n" t (:color 1 7 :underline :bold) t)
         ("^[ \t]*[・].*\n" t (:keyword 10) t)
         ;アイテマイズ見出し sub
         ("^[ \t]*[0-9]\\\{1,5\\\}[ .．　\t][^0-9\n]+\n" t (:color 3 7 :underline :bold) t)
         ("^[ \t]*(?[a-zA-Z]\\\{1,2\\\}-?[0-9]\\\{,5\\\})?[ .．　\t][^a-zA-Z0-9\n]+\n" t (:color 4 7 :underline :bold) t)
         ;アイテマイズ見出し sub
         ("^\\\([ \t　]*[|>#:｜＃＞※]\\\)\\\{4\\\}[ \t　]?" t (:color 4 7 :line ) t)
         ("^\\\([ \t　]*[|>#:｜＃＞※]\\\)\\\{3\\\}[ \t　]?" t (:color 3 7 :line ) t)
         ("^\\\([ \t　]*[|>#:｜＃＞※]\\\)\\\{2\\\}[ \t　]?" t (:color 2 7 :line ) t)
         ("^[ \t　]*[|>#:｜＃＞※][ \t　]?" t (:color 1 7 :line ) t)
         )))

・構造的な セレクション移動キーバインディング

;MSのOffice likeに selection範囲毎を上下に移動
;http://blue.ribbon.to/~aotororo/prog/200310.html#d08_t4   めざなでさん
;; 行セレクションを上下に移動
(defun transpose-selection-down (&optional (n 1))
  "行セレクションを n 行下に移動"
  (interactive "*p")
  (let ((pre-selection-type (get-selection-type))
        (column (current-column)))
    (unless pre-selection-type
      (goto-bol)
      (start-selection 1 t)
      (or (forward-line 1)
          (progn (goto-eol) (insert #\LFD))))
    (selection-start-end (beg end)
      (when (and (goto-char end) (bolp)
                 (goto-char beg) (bolp))
        (insert (prog1
                    (buffer-substring beg end)
                  (delete-region beg end)
                  (forward-line n)
                  (and (minusp (1- (get-window-line)))
                       (recenter 1))
                  (when pre-selection-type
                    (start-selection pre-selection-type t))))
        (unless pre-selection-type
          (forward-line -1)
          (goto-column column))))))
(defun transpose-selection-up (&optional (n 1))
  "行セレクションを n 行上に移動"
  (interactive "*p")
  (transpose-selection-down (- n)))
(global-set-key #\S-M-Down 'transpose-selection-down)
(global-set-key #\S-M-Up 'transpose-selection-up)

;M-S-左右で シフト、アンシフト(オフィスや秀丸風)
(global-set-key #\M-S-Left 'unshift-selection)
(global-set-key #\M-S-Right 'shift-selection)

○TODO


○sub TODO
・メモコピー機能
クリップボードからのリアルタイム流し込みコピー
リージョン/セレクションコピー

・ルートメモ

・キーワード推測

・トータルメニュー、ヘルプシステム

・memo用に text-modeの改善

・検索機能に ファイル本文の1行目を含めるかどうか(表示、と 検索対象)


・ファイル名フォーマット不正通知 201000901とか


・ちょっと使いづらい TODOを改善
・複数のメモディレクトリの切り替え
  (串刺し検索はしない)

・memo-modeに使いやすい機能を載せる
(memo-modeにしなくても memoは取れるようにする)

・連携機能
Outlook , iTouch , iPod , 携帯
google カレンダー, twitter
remember Milk , Evernote

・メモバッファ内リスト表示
詳細表示も



○NOT  TODO
・暗号化
・Tex , Info コンバータ


○ 参考
man(roff形式 行頭.がコマンド行)
EBt http://www001.upp.so-net.ne.jp/tokada/SL-C700/ebt_index.html
howm http://howm.sourceforge.jp/index-j.html (home wiki memo?)
紙 Copi http://www.kamilabo.jp/
RD http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=RD


ChangeLog(1ファイルのみ、 TABで本文)
横着プログラミング 第1回: Unixのメモ技術
http://0xcc.net/unimag/1/

Windowsユーザーのための電子メモ術
http://blogger.main.jp/changelog/yayadoc/memolit.html

デジタル・スクラップブック SVG Cats 2
http://www.sage-p.com/svgcats2.htm

超メモ術
http://communication21.biz/memo/index.html

-----
Evernote http://www.evernote.com/about/intl/jp/
Remember The milk http://www.rememberthemilk.com/?hl=ja

BHL  (blow) http://lumiere.ens.fr/~guerry/bhl/manuals/bhl.html
converter


wiki
|#




(provide "memo")
(in-package "editor")

(export '(*memo-directory* *memo-file-ext*
          *memo-file* *memo-file-pattern*
          *memo-insert-date-format* *memo-click-xyzzy-path* *memo-click-out-path*

          make-memo jump-memo calendar-mouse-memo-press rename-memo
          memo-search memo-list-up memo-list-up-ask
          close-memo-buffers before-close-memo-task
          click-path-tag path-link-popup
          memo-put-sign-in-calendar memo-calendar calendar-mouse-memo-popup
          ))


;--------------------------------------------------------------------------------
;settings
;--------------------------------------------------------------------------------
(defvar *memo-directory* "C:\\data\\document\\memo\\") ;最後の \まで必要 /でも可
(defvar *memo-file-ext* ".txt")

(defvar *memo-file* "%Y%m%d");半固定
(defvar *memo-file-pattern* "2[01][0-9][0-9][01][0-9][0-3][0-9]")
(defvar *memo-file-pattern-date* "\\\(2[01][0-9][0-9]\\\)\\\([01][0-9]\\\)\\\([0-3][0-9]\\\)")

(defvar *memo-insert-date-format* "%Y/%m/%d %H:%M")
(defvar *memo-write-last-name* "")

(global-set-key '(#\C-c #\C-m #\m) 'make-memo)
(global-set-key '(#\C-c #\C-m #\j) 'jump-memo)
(global-set-key '(#\C-c #\C-m #\r) 'rename-memo)
(global-set-key '(#\C-c #\C-m #\s) 'memo-search)
(require "calendar")
(define-key ed::*calendar-mode-map* #\LBtnDown 'calendar-mouse-memo-press)
(define-key ed::*calendar-mode-map* #\MouseMove 'calendar-mouse-memo-popup)

(add-hook '*before-save-buffer-hook* 'before-close-memo-task)
(add-hook '*kill-xyzzy-hook* #'(lambda () (close-memo-buffers nil)))

(defvar *memo-click-xyzzy-path* "\\.\\\(l\\\|txt\\\|dat\\\|log\\\)$")
(defvar *memo-click-out-path* "^\\\(http\\\|mailto\\\|ttp\\\|ftp\\\)")


(defvar *memo-poplink-path* nil)
(defvar *memo-poplink-contentes* nil)
(defvar *memo-poplink-line* nil)
;(global-set-key #\LBtnDown 'click-path-tag);nil
(define-key *text-mode-map* #\LBtnDown 'click-path-tag)
(define-key *text-mode-map* #\MouseMove 'path-link-popup)


;--------------------------------------------------------------------------------
;各呼び出しメイン関数 functions
;--------------------------------------------------------------------------------

;-------------------------------
; メイン関数 ライブラリ
;-------------------------------
;memo作成        :make-memo
;memoバッファ移動: jump-memo
;calendarから開く: calendar-mouse-memo-press
;rename          : rename-memo
;ifilter-memo検索: memo-search
;-------------------------------
;
;close-memo-buffers
;
;-------------------------------
;
;click-path-tag
;path-link-popup
;-------------------------------
;
;before-close-memo-task
;
;-------------------------------

;今日のメモ作成
;;既にfileがあれば開く、無ければ作成
(defun make-memo ()
  (interactive)
  (let ((buf)(fn)(fnp))
    (setq fn (get-memo-file-name-today)
          fnp (concat *memo-directory* fn))

    ;memo file open
    (if (file-exist-p fnp)
        ;既存ファイルがある
      (progn
        (find-file fnp)  ; or make new
        (goto-char(point-max))
        (insert "\n" (format-date-string *memo-insert-date-format* (get-universal-time)) "\n")
        )
      ;既存ファイルがない
      (progn
        (setq buf(create-new-buffer "memo"))
        (switch-to-buffer buf)
        ;(msgbox "~A\n~A" fnp fn)

        ;日付の挿入
        (goto-char (point-min))
        (insert (format-date-string *memo-insert-date-format* (get-universal-time)) "\n")

        (ignore-errors
         (sit-for .5)
         (emacs-write-file fnp))
        ))))

;xyzzyのバッファで開いていたら移動
;;ファイルが無ければ、calendarを表示
(defun jump-memo()
  (interactive)
  (let ((buf)(fn))
    (setq fn (get-memo-file-name-today)
          fnp (concat *memo-directory* fn))
    ;memo file open
    (if (file-exist-p fnp)
        ;既存ファイルがある
      (progn(find-file fnp))
      ;既存ファイルがない
      (progn
        ; calendar
        (calendar)))))

;calendarのマウスクリックでその日付のファイルを開く
(defun calendar-mouse-memo-press ()
  (interactive)
  (let ((year)(month)(day)(fp))
    (multiple-value-setq (year month day fp) (get-ymd-from-calendar))
    (popup-string (format nil "[~A/~A/~A]" year month day) fp)

    (find-file-memo-date year month day)

    ;popupするので開いたファイルの最後尾に移動できない。
    ;(goto-char(point-max))

    ))
;TODO:LBtnDownマウスの挙動がなんか変
;   save-excursion と mouse-left-press を組み合わせてなんとかいった

(defun calendar-mouse-memo-popup()
  (interactive)
  (let ((year)(month)(day)(fp)(targetmemo))
    (multiple-value-setq (year month day fp) (get-ymd-from-calendar))
    (if  (and (not year)(not day))
        (return-from calendar-mouse-memo-popup))

    (setq targetmemo (get-target-memo-list year month day))
    (popup-string (format nil "memo list:\n~A" targetmemo) fp)
    ))

(defun memo-list-up-ask ()
  (interactive)
  (let ((tags))
    (setq tags (read-string "type(file contents top): "
                            :default "file"
                            :history (list "file" "contents" "top")))
    (if (= 0 (length  tags)) (return-from memo-list-up-ask))
   (memo-list-up (cond ((equal "contents" tags) 'contents)
                       ((equal "top" tags) 'top)
                       (t nil)
                       ))
   ))

(defun memo-list-up(&optional (type 'file))
  (interactive)
  ;type 'file 'contents 'top
  (let ((memo-l (get-memo-file-list))
        (target-l nil)
        (tags)(tag-l)
        (tag-list nil))

    (setq memo-tag-list nil)
    (setq tag-list (get-memo-tag-list))
    (setf (get 'tag-list 'ed::minibuffer-history-variable) 'memo-tag-list)
    
    (setq tags (read-string "tags: "
                            :default (car tag-list)
                            :history tag-list
                            ))
    (if (= 0 (length  tags)) (return-from memo-list-up))
    (setq tag-l (split-string tags " "))

    (dolist (item memo-l)
      (block item-loop
        (dolist (tag tag-l)
          (if (and 
               (string-match  ".txt$" item)
               (string-match  tag item))
              (progn
                (push item target-l)
                (return-from item-loop))))))

    (unless target-l (return-from memo-list-up))

    (setq target-l (sort target-l #'string-lessp))

    (find-memo-buffer "*memo listup*" :erase-p t)
   (let ((line)(contents))
      (dolist (file target-l)
        (insert "<" file ">\n")
        (cond ((eq type 'contents)
             (insert-file-contents file))
            ((eq type 'top)
             ;ファイル読み込み
            (setq contents "")
            (with-open-file (stream  file)
                (while (and (setq line (read-line stream nil nil nil))
                            (or (not line)(> 300 (length contents))))
                 (setq contents (concat contents line "\n"))))
             (insert contents "\n...\n")))
        (goto-char (point-max))
        (insert "\n----------------------------------------\n")))
    ;(toggle-read-only t)
    (message "~A item~:P ~[~;was~:;were~] listed up." (length target-l)(length target-l))
    (sit-for .7)))

;Memo検索
;;label と 中身をインクリメンタルサーチ
(defun memo-search ()
  (interactive)
  (let ((memo-l)(qf t)(targetmemo)
        ;初期キーワードは今日の日付
        (search-word (format-date-string *memo-file* (get-universal-time)))
        (sc)(i 9)(index 0)(firstflag t)(keymsg ""))
    (setq memo-l (get-memo-file-list))

    ;minibuffer 表示
    (clear-minibuffer-message)
    (minibuffer-prompt (get-search-prompt))

    (while qf
      (setq targetmemo nil
            i 0)
      (dolist (mitem  memo-l)
        (if (or (string-match search-word mitem)
                (= 0 (length search-word)))
            (if (< i index)(setq i (+ 1 i))
              (push mitem targetmemo))))
      (setq targetmemo (reverse targetmemo))

      (setq keymsg
            (if (= 0 (length search-word)) "(☆Please Input Keyword☆)" search-word))

      (if (or(not firstflag) (not (= 0 (length targetmemo))))
          (progn
            (popup-string (format nil "【インクリメンタルフィルター】Enterで一番上(~A)が選択される\nfilter type:[~A]\n----~{\n~A~}" index keymsg targetmemo)(point))
            (setq sc (read-char *keyboard*))
            (cond((char= sc #\RET)(find-file-memo (car targetmemo))(search-memo-finish))
                 ;C-aとかでキーワードクリア
                 ((char= sc #\C-a)
                  (setq search-word ""))
                 ;C-dとかで日付キーワード挿入
                 ((char= sc #\C-d)
                  (setq search-word
                        (format nil "~A~A" search-word (format-date-string *memo-file* (get-universal-time)))))
                 ((or(char= sc #\C-g)
                     (char= sc #\ESC)) (search-memo-finish))
                 ((or(char= sc #\C-h)
                     (char= sc #\DEL))
                  (if (< 0 (length search-word))
                      (setq search-word (substring search-word 0 (- (length search-word) 1)))))
                 ((or (char= sc #\TAB)
                      (char= sc #\Down)
                      (char= sc #\C-n))
                  (setq index (+ 1 index)))
                 ((or (char= sc #\Up)
                      (char= sc #\C-p))
                  (setq index (max 0 (- index 1))))
                 (t
                  (setq search-word(format nil "~A~A" search-word sc)))
                 )

            ;popup-string clear
            (refresh-screen))
        (progn
          (setq firstflag nil
                search-word ""))
        ))))

;TODO: BODY部の表示？ 、カーソル対応？
;TODO: bufferで表示させる？

;rename memo
;対象今開いているメモファイル(current buffer)のみ
;20100810.txt → 20100810_[INPUT].txt
;対応フォーマットはこれだけ
(defun rename-memo (&optional buffer new-label)
  (interactive)
  (let ((fn)(fnpath)(label)(fn-after)(label-after)(mn-str))
    (setq fnpath (get-buffer-file-name buffer))
    (setq fn (file-namestring fnpath))

    ;memoディレクトリでなければ終了
    (if (not (under-memo-directory-filep (get-file-buffer fnpath)))
        (progn (message "non match memo directory")(quit)))

    ;ファイルからラベル文字列を取得
    (multiple-value-setq (label mn-str)(get-memo-label fn))

    ;ラベル変換後
    (setq label-after
     (if (and new-label (> (length new-label) 1)) new-label
      (read-string "label? : " :default (concat label))))

   ;(msgbox "~A ~A  ~A ~A"  label mn-str label-after new-label)

    ;rename
    (when (string/= label label-after)
      (setq fn-after
            (concat (substring fn 0 (length mn-str)) "_" label-after *memo-file-ext*))
      (let* ((id 1))
        (while (file-exist-p (concat *memo-directory* fn-after))
          (setq fn-after (concat (substring fn 0 (length mn-str))
                                 "_" label-after "_" (format nil "~A" id) *memo-file-ext*)
                id (+ 1 id))
          ))
      (when (and (string/= label label-after)(string/= fn fn-after))
        ;       (msgbox "saveしますよん~A" *memo-write-last-name*)
        (emacs-write-file
         (setq *memo-write-last-name* (concat *memo-directory* fn-after)))
        ;       (msgbox "saveしました~A" *memo-write-last-name*)
        (delete-file fnpath)
        ;       (msgbox "前のファイル消しました~A" fnpath)
        )
      (setq *memo-write-last-name* ""))))

;開いているメモバッファをすべて保存
; 条件バッファーに結びついたパスがメモディレクトリ配下
(defun close-memo-buffers (&optional (killflag t))
  (interactive)
  (let ((first-buf (or (selected-buffer)(other-buffer))))
    ;バッファーリスト取得
    (dolist (one-buf (buffer-list))
      ;メモディレクトリ配下
      (if (under-memo-directory-filep one-buf)
          ;保存 &close
        (progn(set-buffer one-buf)(save-buffer)(if killflag (kill-buffer one-buf)))))
    (if (bufferp first-buf) (switch-to-buffer first-buf))))

;ファイル保存時に1行目をラベルとして活用する。
; ただし、ファイル名のラベルが無いときのみ
(defun before-close-memo-task ()
  (let ((buf-path)(buffer (or (selected-buffer)(other-buffer)))(filename-label))
    ;メモディレクトリ配下
    (when (under-memo-directory-filep buffer)
      ;パス名を取得
      (setq buf-path (get-buffer-file-name buffer)
            filename-label (get-memo-label buf-path))

     ;(msgbox "file name label:[~A] ~A " filename-label (length filename-label))

      ;ファイル名のラベルがない
      (if (and ;(= 0 (length *memo-write-last-name*))
               (or filename-label (= 0 (length filename-label)))
               ;(string/= buf-path *memo-write-last-name*)
               )
          (let ((nowp (point)) (fp(point-min))(ep)(line)(label))
            ;ファイルの1行目からlabelを取得
            (set-buffer buffer)
            (save-excursion
              (goto-line 1)
              (goto-eol)
              (forward-char)
              (setq ep (point)
                    line (buffer-substring fp ep))
              (setq res (string-match  "^\\\(?:2?[01]?[0-9][0-9][-/][0-9][0-9][-/][0-9][0-9]\\\)? *\\\(?:[0-9:]\\\{4,8\\\}\\\)? *\\\([^-0-9:/ \n][^\n]*\\\)?[ 　]*\n?" line))
              (setq label (match-string 1)
                    ;label2 (match-string 2)
                    ;label3 (match-string 3)
                    )
              ;(msgbox "l:~A l2:~A l3:~A" label label2 label3)
             ;(msgbox "l:[~A]" label)
              )
            (unless label (setq label ""));これがなければ、保存時にラベルを聞いてくる
            (setq label (substitute-string label "[\\/:\*<>\|\" ]" "_")) ; \"

            ;1行目にラベル用データあり
            (if res
                (progn (setq *memo-write-last-name* buf-path)
                  (rename-memo buffer label)
                  ;(if (file-exist-p buf-path)(delete-file buf-path))
                  (setq *memo-write-last-name* "")
                  ))))))
  nil)


;path リンク先へ飛ぶ
(defun click-path-tag ()
  (interactive)
  (let ((flag t)(sub-flag nil))
    (cond
     ((= 1 *last-mouse-click-count*)
      (path-link-popup))
     ((= 2 *last-mouse-click-count*)
      (let ((path (get-current-tag-word)))
        (if path
            (progn
              ;ファイルとして検索
              (cond ((string-match *memo-click-xyzzy-path* path)
                     (find-file-click path (selected-buffer)))
                    ((string-match *memo-click-out-path* path)
                     (shell-execute (substitute-string path "^ttp" "http") t))
                    ((file-exist-p path) (shell-execute path t))
                    ;TODO:キーワードとしてgrep する
                    (t (setq sub-flag t))
                    )
              (setq flag sub-flag ))))))

    (if flag (mouse-left-press))))

;TODO:カレンダーから移動するとき *Calendar* バッファが (goto-char(point-max))みたいになっているのはなぜ？


;path リンク先のファイルを popup表示
(defun path-link-popup ()
  (interactive)
  ;パス取得
  (let ((path (get-file-path-support(get-current-tag-word) (selected-buffer)))(contents nil))
    ;パスの妥当性確認
    (if (and path
             (string-match *memo-click-xyzzy-path* path)
             (ignore-errors (file-exist-p path)))
        (if (string= path *memo-poplink-path*) (popup-string *memo-poplink-contentes* (point))
          ;ファイル読み込み
          (progn
            (setq contents (format nil "file:~A\n------\n" path))
            (with-open-file (stream  path)
              (let ((line nil))
                (while (and (setq line (read-line stream nil nil nil))
                            (or (not line)(> 300 (length contents))))
                  (setq contents (concat contents line "\n")))))
            ;ファイルポップアップ
            (popup-string contents (point))
            (setq *memo-poplink-path* path
                  *memo-poplink-contentes* contents
                  *memo-poplink-line*(current-line-number))))))
  ;   (setq *memo-poplink-path* nil)
  (continue-pre-selection)
  )


;カレンダーに メモのある日をマークする
;(背景 1~4)
;1:1つ
;2:2～4
;3:5～9
;4:10～
(defun memo-put-sign-in-calendar ()
  (interactive)
  (let
      ((buf (find-buffer "*Calendar*"))
       (flist)
       (date-list))
    ;Calendarバファに移動
    (unless buf (calendar)(setq buf (find-buffer "*Calendar*")))
    (set-buffer buf)

    (save-window-excursion
      (save-excursion

        ;memoの日付リストを取得

        ;カレンダーに set-text
        (setq flist (get-memo-file-list))
        (let ((year)(month)(day)(week)(id)(first-week)(buf-day)(day-point)(text-list)
              (tstp)(tendp)(ttag)(lastday)(lastnum)(col))
          (setq flist (stable-sort flist 'string-lessp)
                lastnum 1
                lastday "")
          ;(msgbox "list:~{\n~A~}" flist)
          (dolist (item flist)
            ; 年月を検索
            (when
                (string-match (concat  *memo-file-pattern-date*  "_?\\\([^0-9_][^.]*\\\)?" *memo-file-ext* "$") item)
              (setq year (ignore-errors (parse-integer (match-string 1)))
                    month (ignore-errors (parse-integer (match-string 2)))
                    day (ignore-errors (parse-integer (match-string 3))))
              ;  日にちを検索
              (setq first-week (get-weekday year month 1 ))
              (setq id (+ day first-week -1 +1 (if (= first-week 6) -7 0)))

              (goto-char (point-min))
              (if (scan-buffer (format nil "~A年~A月" year month))
                  (progn (setq col (current-column))
                    (forward-line (+ 1(ceiling (/ (+ id 1)7))))
                    (goto-column (+ col(* 3 (-(mod id 7) 0))))
                    (setq buf-day (buffer-substring (point)(+ 3 (point)))
                          day-point (point))
                    ;attributeを検索
                    ;nothing

                    ;set
                    (if (equal lastday (format nil "~A~A~A" year month day))
                        (setq lastnum (+ 1 lastnum))
                      (setq lastday(format nil "~A~A~A" year month day)
                            lastnum 1))
                    (setq col (cond ((= lastnum 1) '(:background 1))
                                    ((< lastnum 5) '(:background 2))
                                    ((< lastnum 10) '(:background 3 :bold t))
                                    (t '(:background 4 :bold t))))
                    (apply 'append-text-attribute day-point (+ 3 day-point) 'calendar col)
                    (if (not (= day (parse-integer (string-trim " \n" buf-day)))) (msgbox "error: pick day is wrong ~A(<- ~A) \n item:~A" buf-day day item))
                    ;(msgbox "day:~A (~A)" buf-day (buffer-substring (point) (+ 21 3 3 (point))) )
                    ))
              )))))))


;カレンダーを表示させて メモの気配も残す
(defun memo-calendar ()
  (interactive)
  (calendar)
  (memo-put-sign-in-calendar))




;--------------------------------------------------------------------------------
;サブルーチン
;--------------------------------------------------------------------------------

;日付からメモファイルを開く
(defun find-file-memo-date (year month day)
  ;memoを開く
  (let((targetmemo nil))

    (setq targetmemo (get-target-memo-list year month day))

    ;該当日のファイルメモを開く
    ;;複数あればpopup
    (cond ((= 0 (length targetmemo))
           (message "~A/~A/~A:no memo" year month day) ) ; or make memo
          ((= 1 (length targetmemo))
           (find-file-memo (car targetmemo)))
          (t (popup-list targetmemo #'find-file-memo)(refresh-screen)))))

;メモファイルを開く
(defun find-file-memo (fn)
  (interactive)
  (let ((sb))
    ;とりあえず
    ;    (if (setq sb (find-buffer "*Calendar*"))
    ;        (kill-buffer sb))

    ;ファイルを開く
    (open-file-buffer fn)))
;TODO:popupリストだと windowは再描画されるが、bufferタブやxyzzyタイトルが書き変わらない

(defun open-file-buffer (fn)
  "ファイルを開いてバッファに移動"
  (let (buf)
    (find-file fn)
    (setq buf (get-file-buffer fn))
    (if buf
        (set-buffer buf))))

;TODO : <path>をトリムしたり、\n削除したり |
;  ⇒実装済み

(defun find-file-click (filename buffer)
  (let ((path (get-file-path-support filename buffer)))
    (if path (open-file-buffer path))))

(defun get-file-path-support (filename &optional buffer)
  (when filename
    (if buffer nil (setq buffer (selected-buffer)))

    (or (and(file-exist-p filename) filename)
        (and (get-buffer-file-name buffer)
             (file-exist-p (concat (directory-namestring (get-buffer-file-name buffer)) filename))
             (concat (directory-namestring (get-buffer-file-name buffer)) filename))
        (and(file-exist-p (concat (merge-pathnames "~/")  filename))
            (concat (merge-pathnames "~/")  filename))
        (and(file-exist-p (concat(default-directory) filename))
            (concat (default-directory)  filename)))))

; メモファイル名を作成して返す
; @return string:メモファイル(今日の日付変換)
(defun get-memo-file-name-today()
  (format-date-string (concat *memo-file* *memo-file-ext*) (get-universal-time)))

;メモディレクトリ配下のフルパスリストを返す
(defun get-memo-file-list ()
  (directory *memo-directory* :recursive t :file-only t :absolute t))
;TODO: #,~を対象外にする



;
(defun get-memo-tag-list (&optional memo-list)
 (let ((tag-list nil))
    (unless memo-list 
      (setq memo-list (directory *memo-directory* :recursive t :file-only t :absolute t)))

   (dolist (item memo-list)
     (setq item (substitute-string item (substitute-string *memo-directory* "\\\\" "/")""))
     (if (string-match (concat *memo-file-ext* "$") item)
      (progn
        (if (string-match (concat "[0-9/]\\{4,10\\}_?\\(.*\\)" *memo-file-ext* "$")item)
         (progn
          ;(msgbox (match-string 1))
          (setq tag-list (append tag-list (split-string (match-string 1) " _")))))
       )))
   (setq tag-list (sort (remove-duplicates tag-list :test 'equal) 'string-lessp))
   tag-list))


;メモディレクトリ配下かどうか
(defun under-memo-directory-filep (buffer)
  (let ((fn (get-buffer-file-name buffer)))
    (if (and buffer fn)
        (string-match (map-backslash-to-slash *memo-directory*) fn)
      nil)))

;ファイル名からラベル部分を抜き出す。
(defun get-memo-label (filename)
  (let ((label)(mn-str))
    (string-match (concat "\\\(" *memo-file-pattern*  "+\\\)" "_?\\\([^\\\.]*\\\)?" *memo-file-ext*) filename)
    ;(string-match (concat "\\\(" *memo-file-pattern*  "\\\)" "_?\\\([^0-9_][^.]*\\\)?" *memo-file-ext*) filename)
    (setq  mn-str (match-string 1)
           label (match-string 2))
    (if (not mn-str) (msgbox "error (get label from file):\ndate:~A\nlabel:~A\ninput file name:[~A]" mn-str label filename))
    (values label mn-str)))

;カレント (point)から  <path>範囲の文字列を返却
(defun get-current-tag-word ()
  (let ((np (point))(fp)(ep)(path nil))
    (save-excursion
      (scan-buffer "[]>}\"(]" :right-bound (+ 200 np) :regexp t)
      (setq ep (point))
      (backward-char)
      (scan-buffer "[[<{\"(]" :left-bound (- np 200) :reverse t :regexp t)
      (setq fp (+ 1(point)))
      (when (and (< fp np)(< np ep)(< (- ep fp) 255))
        (setq path (buffer-substring fp ep))
        (setq path(substitute-string path "\\\(\n[ 　]*[|>#:｜＃＞@]\\\)+" ""))
        (setq path(substitute-string path "^\\\([ 　]*[|>#:｜＃＞@]\\\)+" ""))
        (setq path(substitute-string path "\n\n*" ""))))
    path))

(defun get-search-prompt()
  (concat
   "memo file search(see popup-string) usage:"
   "【Enter:決定】【C-g:キャンセル】"
   (nth (random 3) (list "【C-a:クリア】【BS:1文字削除】"
                         (format nil "【C-d:~A】" (format-date-string *memo-file* (get-universal-time)))
                         "【Down/TAB/C-n:対象を一つ下に】【Up/C-p:対象を一つ上に】"
                         ))))

(defun search-memo-finish()
  (refresh-screen)
  (sit-for .3)
  (quit))


(defun get-weekday (year month day)
  (nth 6 (multiple-value-list (decode-universal-time (encode-universal-time 0 0 0 day month year)))))

(defun get-target-memo-list (year month day)
  ;memoを開く
  (let
      ((memos (get-memo-file-list))
       (keystr(format-date-string *memo-file* (encode-universal-time 0 0 0 day month year)))
       (targetmemo nil))

    ;日付filter
    (dolist (mitem  memos)
      (if (string-match (concat keystr ".*[^#~]$" ) mitem)
          (push mitem targetmemo)))
    targetmemo))


(defun find-memo-buffer(&optional (name "*memo*") &key erase-p max min)
  (let ((memo-buffer)(nb (selected-buffer)))

    (setq memo-buffer (get-buffer-create name))
    (set-window  (display-buffer memo-buffer t))
    (switch-to-buffer memo-buffer)
    (setq need-not-save t)
    (toggle-read-only nil)
    (if erase-p (erase-buffer memo-buffer))
    (if min (goto-char (point-min)))
    (if max (goto-char (point-max)))))

(defun get-ymd-from-calendar()
  (let ((fp)(ep)(day)(month)(year)(col)(cold)(lastc (goal-column))(last-p (point)))
    (goto-last-mouse-point)
    (save-excursion
      ;(goto-line *last-mouse-line*)
      ;(goto-column *last-mouse-column*)
      ;day を取得
      (if (scan-buffer "[ \n]" :reverse t :regexp t) (setq fp(+ 1(point))))
      (goto-char (+ 1 (point)))
      (if (scan-buffer "[ \n]" :reverse nil :regexp t) (setq ep(point))))
    (ignore-errors
     (setq day (parse-integer(buffer-substring fp ep)))
     )
    (unless day
      ;goto-last-mouse-point の影響を戻す。(他ウィンドウなど)
      (goto-char last-p)
      (set-goal-column lastc)

      (mouse-left-press)(return-from get-ymd-from-calendar))

    ;lookup year年month月
    (let (ym)

      ;現在位置
      (save-excursion
        (goto-char (- (point) 1))
        (setq cold (current-column))

        ;左端検索
        (if (> day 7)
            (scan-buffer "\\\(   \\\)\\\|\\\(\n \\\)" :reverse t :regexp t)
          (scan-buffer "\\\([0-9\n]   \\\)\\\|\\\(\n \\\)" :reverse t :regexp t))
        (goto-char (+ 3 (point)))
        (setq col (current-column))

        ;上端検索
        (goto-line (- (current-line-number) (ceiling(/ day  7))))
        (goto-column col)

        (while (and (/= 1 (current-line-number))(/= 0 (current-column)))
          (backward-line)
          (goto-column col)
          )
        (when (/= 1 (current-line-number))
          (forward-line)
          )

        (goto-column cold)

        ;文字列を取得して 年月に分解
        (if (scan-buffer " 2" :reverse t :regexp t) (setq fp(+ 1(point))))
        (goto-char (+ 1 (point)))
        (if (scan-buffer "[ \n]" :reverse nil :regexp t) (setq ep(point)))
        (setq ym (buffer-substring fp ep))

        (string-match "\\\(2[01][0-9][0-9]\\\)年\\\([01]?[0-9]\\\)月" ym)
        (ignore-errors
         (setq year (parse-integer(match-string 1))
               month (parse-integer(match-string 2)))))

      (values year month day fp)
      )))



(defun memo-tool-bar ()
  (create-tool-bar
   'memo-tool-bar
   (merge-pathnames "memotoolbar.bmp" (etc-path))
   '(("" 0 make-memo)
     ("" 4 jump-memo)
     ("" 2 memo-search)
     ("" 5 rename-memo)
     :sep
     ("" 1 memo-calendar)
     ("" 3 memo-put-sign-in-calendar)
     )))
(define-command-bar 'memo-tool-bar "memo(&M)")



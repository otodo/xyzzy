;;; -*- Mode: Lisp; Package: EDITOR -*-
;;;
;;; Last updated: <2004/12/21 22:05:47 +0900>
;;;
;;; my-bookmark.l
#|
■about
須田さんの bookmark.l を参考にさせて頂いて、テキストにしおりをはさんで
好きな時にその位置にジャンプできるようにするために作りました。
グローバルマークと似たようなものですが、テキストを閉じた後も挟んだ
しおりがクリアされないようになっています。

2004-12-19 (日) 10:52:26
須田さんに掲載の許可を頂きました。改めて須田さんに感謝です。m(__)m

■インストール方法
1.my-bookmark.lをコピーして ~/site-lispに my-bookmark.l という名前で保存する。
2.必要に応じてバイトコンパイルする。
3..xyzzy または siteinit.l に以下の記述を追加する。
(require "my-bookmark")
4.siteinit.l に記述した場合は xyzzy を再ダンプする。
5.以前のものを使用していた場合には、C-c b c で以前のリストを削除して下さい
（※2004-10-02 (土) 12:08:02 以降、しおりのリストの形式は変更していないので
それ以降のものを使用されている場合は 5.の手順は不要です）。

■アンインストール方法
1.M-x my-bookmark-uninstall する。
2.~/site-lispにある my-bookmark.l（バイトコンパイルした場合は my-bookmark.lc も）を削除する。
3.~/bookmarklist などのしおりを保存するためのファイルを削除する。
4.siteinit.l や .xyzzy からmy-bookmark.l に関する記述を削除する。
5.siteinit.l に記述していた場合は xyzzy を再ダンプする。

■使い方
・C-c b m（またはS-F2）でジャンプモード、C-c b d で削除モードでメニューを表示する。
・メニューの一番下の「削除モードにする(&D)」か「ジャンプモードにする(&J)」を選択すると
それぞれのモードに切り替わる（今のモードはステータスバーに表示されます）。
・C-c b a またはメニュー（ジャンプモード）の「しおりをはさむ(A)」を選択すると、現在のバッファの
ファイル名・行番号（論理行）・行頭から行末までの文字列を取得してメニューに追加する（セレクション
がある場合はセレクションの文字列をメニューに追加する。長すぎる場合には左側から指定したバイト数
（*bookmark-filename-length*、*bookmark-string-length* で指定）まで表示する）。
・ジャンプモードの時、メニューからしおりを選択すると該当ファイルの該当ポイントにジャンプする。
・削除モードの時、メニューからしおりを選択すると該当するしおりを削除する。
・C-c b e またはメニューの「編集する(E)」から編集画面を開いて不要な行を削除した後、C-g で、編集終了。
・C-c b p で更新日時順に前にしおりを挟んだ位置（C-c b n で後に挟んだ位置）にジャンプする。
・C-c b s でしおりを保存するファイルの一覧を表示して、それを切り替えることが出来ます（~/.xyzzy などに
例えば以下のような設定が必要。この設定をして一覧からファイルを選択すれば該当ファイルは自動生成されます。
また、この設定をしなくてもデフォルトで~/bookmarklistというファイルにしおりが保存されます）。

;; しおりを保存するファイルのリスト
(setq *bookmark-list-file-list*
      '(("bookmarklist(&b)" . "~/bookmarklist")
	("foo(&f)". "~/foo")
	("bar(&b)" . "~/bar")
	("lisp(&l)" . "~/lispbm")
	))
|#

(provide "my-bookmark")

(in-package "editor")

(export '(bookmark-add-new-bookmark
	  bookmark-clear-all
	  my-bookmark-menu
	  bookmark-edit-bookmark-list
	  bookmark-jump-to-previous-bookmark
	  bookmark-jump-to-next-bookmark
	  bookmark-select-list-file
	  my-bookmark-uninstall
	  *bookmark-menu-item-length*
	  *bookmark-max*
	  *bookmark-filename-length*
	  *bookmark-string-length*
	  *bookmark-list-file*
	  *bookmark-list-file-list*))

;;; カスタマイズできる変数
(defvar *bookmark-menu-item-length* 16)	 	 ;; 引き出しに入れる個数
(defvar *bookmark-max* 400)	 	 	 ;; bookmark をいくつまで認めるか
(defvar *bookmark-filename-length* 24)	  	 ;; メニューに表示するファイル名の長さ（バイト数）
(defvar *bookmark-string-length* 36)	 	 ;; メニューに表示する文字列の長さ（バイト数）

(defvar *bookmark-list* nil)
(define-history-variable *bookmark-list-file* "~/bookmarklist")	 ;; しおりを保存するファイル
(defvar *bookmark-list-file-list* nil)

;;; ジャンプ
(defun bookmark-jump-to-bookmark (key &optional n)
  (setq *bookmark-list* (nsubst nil t *bookmark-list*))
  (let ((fn-or-bn (car key))
	(pt (cdr key)) predt tmplist pos key1)
    (cond ((find-buffer fn-or-bn)
	   (switch-to-buffer fn-or-bn))
	  ((and (string-match "[:/]" fn-or-bn)
		(file-exist-p fn-or-bn))
	   (find-file fn-or-bn))
	  (t
	   (setq predt (if n
			   #'string<
			 #'string>))
	   (setq tmplist (copy-alist *bookmark-list*))
	   (setq tmplist (sort tmplist predt :key #'cadar))
	   (setq pos (position
		      (rassoc key tmplist :test #'equal) tmplist))
	   (or
	    (setq key1 (cdr (nth (1+ pos) tmplist)))
	    (< (1- pos) 0)
	    (setq key1 (cdr (nth (1- pos) tmplist))))
	   (when key1
	     (setf (cddar (rassoc key1 *bookmark-list* :test #'equal)) t))
	   (bookmark-clear-this-bookmark key "jp")
	   (plain-error "しおりを削除しました")
	   (return-from bookmark-jump-to-bookmark)))
    (when (pre-selection-p) (stop-selection))
    (goto-char pt)
    (mapc #'(lambda (l) (when (equal key (cdr l))
			  (setf (caaar l) (current-line-number))
			  (setf (cddar l) t))) *bookmark-list*)
    (bookmark-data-write-to-file *bookmark-list*)))

;;; リストの操作

;; utility

(defun bookmark-data-read-from-file ()  ;NetInstaller を参考にしました
  (with-open-file (s
		   *bookmark-list-file*
		   :direction :input
		   :if-does-not-exist :create)
    (setq *bookmark-list* (read s nil))
    ))

(defun bookmark-data-write-to-file (data)
  (with-open-file (s
		   *bookmark-list-file*
		   :direction :output
		   :if-exists :overwrite
		   :if-does-not-exist :create)
    (format s "~S" data))
  t)

(defun bookmark-get-string-from-line ()
  (let ((str (string-trim '(#\SPC #\TAB #\　)
			  (if (pre-selection-p)
			      (buffer-substring (selection-point) (selection-mark))
			    (buffer-substring
			     (save-excursion (goto-bol) (point))
			     (save-excursion (goto-eol) (point)))))))
    (setq str (substitute-string str "[ \t　\n]+" " "))
    (setq str (bookmark-shorten-str str *bookmark-string-length*))
    str))

(defun bookmark-shorten-str (str lgt)
  (let ((convstr (convert-encoding-to-internal
		  *encoding-binary* str)))
    (unless (<= (length convstr) lgt)
      (setq str (convert-encoding-to-internal
		 *encoding-sjis*
		 (subseq convstr 0 (1+ lgt))))
      (setq str (subseq str 0 (1- (length str)))))
    str))

;; 追加
(defun bookmark-add-new-bookmark (mn)
  (interactive)
  (unless mn (bookmark-data-read-from-file))
  (let* ((fn (get-buffer-file-name))
	 (fn-or-bn (if fn fn (buffer-name (selected-buffer))))
	 (bookmark (acons
		    (cons (current-line-number) (bookmark-get-string-from-line))
		    (cons (format-date-string "%y/%m/%d %H:%M:%S") t)
		    (cons fn-or-bn (point)))))
    (bookmark-clear-this-bookmark (cdr bookmark) "ad")
    (setq *bookmark-list* (nsubst nil t *bookmark-list*))
    (push bookmark *bookmark-list*)
    (let ((exceed (- (length *bookmark-list*) *bookmark-max*)))
      (when (> exceed 0)
	(setq *bookmark-list* (nbutlast *bookmark-list* exceed))))
    (bookmark-data-write-to-file *bookmark-list*)
    (message "しおりを挟みました")))

;; 削除
(defun bookmark-clear-this-bookmark (key cs)
  (let ((dl (rassoc key *bookmark-list* :test #'equal)))
    (setq *bookmark-list* (delete dl *bookmark-list* :test #'equal)))
  (cond ((string= cs "mn")
	 (bookmark-data-write-to-file *bookmark-list*)
	 (my-bookmark-menu t nil))
	((string= cs "jp")
	 (bookmark-data-write-to-file *bookmark-list*)))
  t)

(defun bookmark-clear-all ()
  (interactive)
  (setq *bookmark-list* nil)
  (bookmark-data-write-to-file *bookmark-list*)
  (message "すべて削除しました")
  t)

;; ソート
(defun bookmark-sort-bookmark-list-by-filename (predp predf dmode)
  (setq *bookmark-list* (sort *bookmark-list* predp :key #'cddr))
  (setq *bookmark-list* (sort *bookmark-list* predf :key #'cadr))
  (bookmark-data-write-to-file *bookmark-list*)
  (my-bookmark-menu dmode nil))

(defun bookmark-sort-bookmark-list-by-time (predt dmode)
  (setq *bookmark-list* (sort *bookmark-list* predt :key #'cadar))
  (bookmark-data-write-to-file *bookmark-list*)
  (my-bookmark-menu dmode nil))

;;; 編集
(defvar *bookmark-edit-mode-keymap* nil)
(unless *bookmark-edit-mode-keymap*
  (setq *bookmark-edit-mode-keymap* (copy-keymap *lisp-mode-map*))
  (define-key *bookmark-edit-mode-keymap* #\C-g 'bookmark-save-bmlist))

(defun bookmark-edit-bookmark-list ()
  (interactive)
  (bookmark-data-read-from-file)
  (message "#\C-g で保存終了")
  (let ((buffer (get-buffer-create "*bookmark-edit*")))
    (set-buffer buffer)
    (erase-buffer buffer)
    (set-buffer-fold-width nil)
    (setq buffer-read-only nil)
    (setq need-not-save t)
    (setq kept-undo-information nil)
    (setq auto-save nil)
    (use-keymap *bookmark-edit-mode-keymap*)
    (insert "(\n")
    (with-output-to-buffer (buffer (point-max))
      (mapcar #'(lambda (x)
		  (format t "~S~%" x)) (reverse *bookmark-list*)))
    (goto-char (point-max))
    (insert ")")
    (set-buffer-modified-p nil)
    (setq kept-undo-information 1000)))

(defun bookmark-save-bmlist ()
  (interactive)
  (message "変更を保存しました")
  (set-buffer (find-buffer "*bookmark-edit*"))
  (goto-char (point-min))
  (replace-buffer "$" "" :regexp t)
  (goto-char (point-min))
  (setq *bookmark-list*
	(with-input-from-selected-buffer (read)))
  (bookmark-data-write-to-file (reverse *bookmark-list*))
  (delete-buffer (selected-buffer)))

;;; メニュ
(defun my-bookmark-menu (dmode btn)
  (interactive)
  (continue-pre-selection)
  (let ((exis (bookmark-data-read-from-file))
	(menu (create-popup-menu))
	(l (reverse *bookmark-list*)) minit sinit)
    (if exis
	(unless (< 1 (length *bookmark-list*)) (setq sinit :disable))
      (progn (setq minit :disable)
	(setq sinit :disable)
	(setq dmode nil)))
    (dotimes (i (floor (length l) *bookmark-menu-item-length*))
      (let ((popup (create-popup-menu)))
	(add-popup-menu menu popup (format nil " Bookmark-~d" i))
	(dotimes (i *bookmark-menu-item-length*)
	  (let* ((key (cdar l))
		 (fn-or-bn (cadar l))
		 (lnum (caaaar l))
		 (str (cdaaar l))
		 (jflg (cddaar l))
		 (fbn (file-namestring fn-or-bn)) menu-item)
	    (setq fbn (bookmark-shorten-str fbn *bookmark-filename-length*))
	    (setq menu-item (concat fbn " \t｜" (format nil "~A" lnum) "｜" str))
	    (add-menu-item popup nil (format nil "~A&~D: ~a"
					     (if (>= i 10)
						 (truncate i 10)
					       " ")
					     (rem i 10)
					     menu-item)
			   #'(lambda ()
			       (interactive)
			       (if dmode
				   (bookmark-clear-this-bookmark key "mn")
				 (bookmark-jump-to-bookmark key)))
			   #'(lambda ()
			       (when jflg :check)))
	    (pop l)))))
    (let ((c 0))
      (dolist (b l)
	(let* ((key (cdr b))
	       (fn-or-bn (cadr b))
	       (lnum (caaar b))
	       (str (cdaar b))
	       (jflg (cddar b))
	       (fbn (file-namestring fn-or-bn)) menu-item)
	  (setq fbn (bookmark-shorten-str fbn *bookmark-filename-length*))
	  (setq menu-item (concat fbn " \t｜" (format nil "~A" lnum) "｜" str))
	  (add-menu-item menu nil (format nil "~A&~D: ~a"
					  (if (>= c 10)
					      (truncate c 10)
					    " ")
					  (rem c 10)
					  menu-item)
			 #'(lambda ()
			     (interactive)
			     (if dmode
				 (bookmark-clear-this-bookmark key "mn")
			       (bookmark-jump-to-bookmark key)))
			 #'(lambda ()
			     (when jflg :check))))
	(setq c (1+ c))))
    (add-menu-separator menu)
    (if dmode
	(add-menu-item menu nil "削除モードです")
      (add-menu-item menu nil "しおりをはさむ(&A)"
		     #'(lambda () (interactive) (bookmark-add-new-bookmark t))))
    (let ((smenu (create-popup-menu))
	  (tmenu (create-popup-menu))
	  (orderu  "昇順(&U)")
	  (orderd  "降順(&D)"))
      (add-popup-menu menu smenu (format nil "フルパス名でソート(&F)"))
      (add-menu-item smenu nil orderu
		     #'(lambda () (interactive)
			 (bookmark-sort-bookmark-list-by-filename #'> #'string-greaterp dmode))
		     #'(lambda () sinit))
      (add-menu-item smenu nil orderd
		     #'(lambda () (interactive)
			 (bookmark-sort-bookmark-list-by-filename #'< #'string-lessp dmode))
		     #'(lambda () sinit))
      (add-popup-menu menu tmenu (format nil "更新日時でソート(&T)"))
      (add-menu-item tmenu nil orderu
		     #'(lambda () (interactive)
			 (bookmark-sort-bookmark-list-by-time #'string> dmode))
		     #'(lambda () sinit))
      (add-menu-item tmenu nil orderd
		     #'(lambda () (interactive)
			 (bookmark-sort-bookmark-list-by-time #'string< dmode))
		     #'(lambda () sinit)))
    (add-menu-item menu nil "編集する(&E)" 'bookmark-edit-bookmark-list)
    (add-menu-item menu nil "すべて削除(&C)" 'bookmark-clear-all
		   #'(lambda () minit))
    (if dmode
	(progn (message "削除モード")
	  (add-menu-item menu nil "ジャンプモードにする(&J)"
			 #'(lambda () (interactive) (my-bookmark-menu nil nil))))
      (progn (message "ジャンプモード")
	(add-menu-item menu nil "削除モードにする(&D)"
		       #'(lambda () (interactive) (my-bookmark-menu t nil))
		       #'(lambda () minit))))
    (track-popup-menu menu btn)))

;;; しおりを挟んだ位置に戻る
(defun bookmark-jump-to-previous-bookmark (&optional n)
  (interactive)
  (let ((exis (bookmark-data-read-from-file))
	predt tmplist key fn-or-bn pt pos)
    (unless exis
      (plain-error "しおりがありません。")
      (return-from bookmark-jump-to-previous-bookmark))
    (setq predt (if n
		    #'string<
		  #'string>))
    (setq tmplist (copy-alist *bookmark-list*))
    (setq tmplist (sort tmplist predt :key #'cadar))
    (mapc #'(lambda (l)
	      (when (cddar l)
		(setq key (cdr l))
		(setq fn-or-bn (cadr l))
		(setq pt (cddr l))
		(when (or (and (equal fn-or-bn (get-buffer-file-name))
			       (= pt (point)))
			  (and (equal fn-or-bn (get-buffer-file-name))
			       (eobp)
			       (> pt (point)))
			  (and (equal fn-or-bn (buffer-name (selected-buffer)))
			       (= pt (point)))
			  (and (equal fn-or-bn (buffer-name (selected-buffer)))
			       (eobp)
			       (> pt (point)))
			  (progn
			    (bookmark-jump-to-bookmark key n)
			    nil))
		  (unless
		      (and
		       (setq pos (position l tmplist))
		       (setq key (cdr (nth (1+ pos) tmplist)))
		       (bookmark-jump-to-bookmark key n))
		    (plain-error "ないよん。")))
		(return-from bookmark-jump-to-previous-bookmark))) tmplist)
    (setq key (cdar (if n (reverse tmplist) tmplist)))
    (bookmark-jump-to-bookmark key n)))

(defun bookmark-jump-to-next-bookmark ()
  (interactive)
  (bookmark-jump-to-previous-bookmark t))

;;; しおりを保存するファイルの切り替え
(defun bookmark-menu-selected-file (file)
  (setq *bookmark-list-file* file)
  (my-bookmark-menu nil :button2))

(defun bookmark-select-list-file ()
  (interactive)
  (if *bookmark-list-file-list*
      (let ((menu (create-popup-menu)))
	(mapcar #'(lambda (l)
		    (let ((menu-item (car l))
			  (file (cdr l)))
		      (add-menu-item menu nil menu-item
				     #'(lambda ()
					 (interactive)
					 (bookmark-menu-selected-file file))
				     #'(lambda ()
					 (when (equal file *bookmark-list-file*)
					   :check))))) *bookmark-list-file-list*)
	(track-popup-menu menu :button2))
    (plain-error "しおりを保存するファイルのリストが設定されていません。")))

;;; ツールバー
(defun my-bookmark-tool-bar ()
  (create-tool-bar 'my-bookmark-tool-bar
		   (merge-pathnames "toolbar.bmp" (etc-path))
		   '(("しおり"	11 (lambda () (interactive)
				     (my-bookmark-menu nil :button2))))))

(define-command-bar 'my-bookmark-tool-bar "しおり(&S)")

;;; アンインストール
(defun my-bookmark-uninstall ()
  (interactive)
  (unregister-history-variable '*bookmark-list-file*)
  (delete-command-bar 'my-bookmark-tool-bar))

;;; キーバインディング
(global-set-key '(#\C-c #\b #\a) #'(lambda () (interactive) (bookmark-add-new-bookmark nil)))
(global-set-key '(#\C-c #\b #\c) 'bookmark-clear-all)
(global-set-key '(#\C-c #\b #\m) #'(lambda () (interactive) (my-bookmark-menu nil :button2)))
(global-set-key '(#\C-c #\b #\d) #'(lambda () (interactive) (my-bookmark-menu t :button2)))
(global-set-key '(#\C-c #\b #\e) 'bookmark-edit-bookmark-list)
(global-set-key '(#\C-c #\b #\p) 'bookmark-jump-to-previous-bookmark)
(global-set-key '(#\C-c #\b #\n) 'bookmark-jump-to-next-bookmark)
(global-set-key '(#\C-c #\b #\s) 'bookmark-select-list-file)
(global-set-key '(#\S-F2) #'(lambda () (interactive) (my-bookmark-menu nil :button2)))

;;;
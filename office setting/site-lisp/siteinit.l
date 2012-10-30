;折り返しも1行とみなす設定
(global-set-key #\M-g 'goto-virtual-line)
;M-aに「selection-whole-buffer」という関数（機能）を割り当てる
(global-set-key #\M-a 'selection-whole-buffer)
;バックアップ先
(require "backup")
(setq *backup-directory* "C:/xyzzy/backup/")
(setq *hierarchic-backup-directory* t)
;howm 設定
(pushnew (merge-pathnames "site-lisp/howm/" (si:system-root))
                 *load-path* :test #'string-equal)
	(require "howm-wrap")
;インクリメントリサーチ
(require "isearch")
;マウスのホイールスクロール時キャレット位置を保存
(defvar *mouse-wheel-scroll-origin* nil)
(defun mouse-wheel-scroll-back-to-origin ()
(goto-char *mouse-wheel-scroll-origin*)
(setq *mouse-wheel-scroll-origin* nil)
(delete-hook '*pre-command-hook* 'mouse-wheel-scroll-back-to-origin))
(defun mouse-wheel-scroll-keeping-position (window n lines)
(unless lines
(setq lines (window-lines window)))
(with-selected-window
(set-window window)
(let* ((pos (or *mouse-wheel-scroll-origin*
(point))))
(scroll-window (* n lines))
(if (and (pos-visible-in-window-p pos)
(save-excursion
(forward-line (1+ *scroll-margin*))
(pos-visible-in-window-p (point)))
(save-excursion
(backward-line (1+ *scroll-margin*))
(pos-visible-in-window-p (point))))
(goto-char pos)
(unless *mouse-wheel-scroll-origin*
(setq *mouse-wheel-scroll-origin* pos)
(add-hook '*pre-command-hook* 'mouse-wheel-scroll-back-to-origin))))))
(setq mouse-wheel-handler #'mouse-wheel-scroll-keeping-position)
;bookmark
(require "my-bookmark")

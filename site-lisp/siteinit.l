;;grep dialog
(global-set-key '(#\C-c #\g) 'grep-dialog)

;;calendar
(global-set-key '(#\C-c #\C-a) 'calendar)

;;C-a
(global-set-key  '(#\C-a) 'selection-whole-buffer)

;;netinstaller
(require "ni/setup")
  ;; �����ݒ�𗘗p����
  (ni-autoload)

;�����C���f���g
(global-set-key #\RET 'newline-and-indent)

;kill all buffer
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key '(#\M-k) 'close-all-buffers)

;ttray
(require "ttray")
(global-set-key '(#\C-x #\C-z) 'ttray-hide-xyzzy)

;comment-toglle
(require "generic-comment-toggle")

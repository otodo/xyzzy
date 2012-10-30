(in-package "elisp-lib")

;; ���W���[���[�h���w��B
(pushnew '("\\.howm$" . text-mode) *auto-mode-alist* :test #'equal)

;; ���j���[�͓��{��B
(setq howm-menu-lang 'ja)

;; howm-list-grep �͏�ɑ召��������ʂ���B
;; �R�����g�A�E�g�����܂܂��ƁA*case-fold-search*
;; �i�����_�C�A���O�̑啶������������ʂ���`�F�b�N��ԁj�Ɉˑ�����B
;(setq default-case-fold-search t)

;; �E�B���h�E���c�ɕ�������B
;(setq howm-view-split-horizontally t)

;; �F�̐ݒ�B
;; �c�[��>���ʐݒ�>�\���F           '(�����F �w�i�F �����i�����w��j)
;;                                                  :underline
;;                                                  :strike-out
;;                                                  :bold
;; �����̃^�C�g���B=
(setq *howm-mode-title-face*        '( 4 nil :bold :underline))
;; goto �����N�B>>> �ق��ق�
(setq *howm-mode-ref-face*          '( 6   ))
;; come-from �����N�B<<< �ӂ��ӂ�
(setq *howm-mode-keyword-face*      '( 7  4))
;; Wiki �������N�B[[�ւ�ւ�]]
(setq *howm-mode-wiki-face*         '(14 nil :underline))
;; �o�������B[2002-10-20]- 
(setq *howm-reminder-normal-face*   '( 4   ))
;; todo�B[2002-10-20]+
(setq *howm-reminder-todo-face*     '( 3   ))
;; �Y�؁B[2002-10-20]!
(setq *howm-reminder-deadline-face* '( 1   ))
;; �\��B[2002-10-20]@
(setq *howm-reminder-schedule-face* '(14   ))
;; �ρB[2002-10-20].
(setq *howm-reminder-done-face*     '(15   ))
;; �����̓��t�B
(setq *howm-reminder-today-face*    '( 8  3))
;; �����̓��t�B
(setq *howm-reminder-tomorrow-face* '( 8  9))
;; ������ȂǁB
(setq *howm-view-hilit-face*        '( 1   ))
;; action-lock�B{ }���B
(setq *action-lock-face*            '( 8 nil :underline))
;; ���j���[�̃V���[�g�J�b�g�L�[�Bc[�V�K]
;;                               ^
(setq *howm-menu-key-face*          '( 3   ))

;; �T�}���ƃR���e���c�͍s�ԍ��Ȃ��ɂ���B
(defun howm-no-line-number ()
  (set-local-window-flags (selected-buffer) *window-flag-line-number* nil))
(add-hook 'howm-view-summary-mode-hook 'howm-no-line-number)
(add-hook 'howm-view-contents-mode-hook 'howm-no-line-number)

;; [roma] �����͂��������A�C���N�������g�T�[�`�͂���Ȑl�́A
;; ����L���ɁB
;(global-set-key #\C-s 'ed::search-forward)
;(global-set-key #\C-r 'ed::search-backward)

;; howm-menu-mode �̃L�[�J�X�^�}�C�Y���������ꍇ�ȉ���L���ɁB
;(defun howm-menu-key-customize ()
;  (when (eq major-mode 'howm-menu-mode)
;    ; �����ɃL�[��`�������B
;    (define-key howm-menu-mode-map #\TAB 'func)
;    ))
;(add-hook 'action-lock-mode-on-hook 'howm-menu-key-customize)

;todo schedule�̕\������
(setq howm-menu-schedule-days 22)
(setq howm-menu-todo-num 50)

;RET �Ńt�@�C�����J����, �ꗗ�o�b�t�@������
;C-u RET �Ȃ�c��
(setq howm-view-summary-persistent nil)

;; �L�[���[�h�T�[�`
(defun howm-list-grep-fixed ()
  (interactive)
  (howm-list-grep t))

;; �T�}�����[�h�Ńt�@�C�����e�̍Ō�̈�s������Ȃ����̏C���B

(defun howm-view-paragraph-region (&optional include-following-blank-p)
  (let ((b (save-excursion
             (end-of-line)
             (re-search-backward howm-view-title-regexp
                                 nil 'to-limit)
             (line-beginning-position)))
        (e (save-excursion

             (end-of-line)
             (let ((found (re-search-forward howm-view-title-regexp
                                             nil 'to-limit)))
               (if include-following-blank-p
                   (if found (match-beginning 0) (point-max))
                 (progn

                   (if found
                       (forward-line -1)
                     (goto-char (point-max)))
;                   (end-of-line)
                   (while (and (looking-at "^$")
                               (= (forward-line -1) 0)) ;; successful

                     nil) ;; dummy
                   (end-of-line)
                   (point)))))))
    (list b e)))

;; ��������
;;  �{ ���j���[����̃��}�C���_�͒��ڊJ��

;; �ȉ��̎O�̓��[�U�[�ݒ��
(defvar howm-history-file "~/howm/.howm-history"

  "*Search history is recorded to that file.")

(defvar howm-history-limit 50
  "*Limit number of recorded search history, or nil for no limit.
Set 0 to inhibit recording.")

(defvar howm-history-unique t
  "*If non-nil, duplicated entries are removed from search history.")


(defvar howm-history-format "> %s | %s")
(defvar howm-history-remove-format "| %s$")

(defvar howm-menu-list-format "> %s | %s"

  "Format to show schedule/todo/recent/random list in `howm-menu-mode'.")

(defvar howm-menu-list-regexp "^\\(>\\)\\([^|\r\n]*|\\) +\\(.*\\)$"
  "Regexp to find and parse schedule/todo/recent/random list in `howm-menu-mode'.")

(defvar howm-menu-list-regexp-key-pos 3
  "Position of target string for action-lock on schedule/todo/recent/random list
in `howm-menu-mode'. This target is searched when action-lock is invoked.")

(defvar howm-menu-list-regexp-action-pos 1
  "Position of action-lock hilight on schedule/todo/recent/random list
in `howm-menu-mode'.")

(defvar howm-menu-list-regexp-face-pos 2
  "Position to apply `howm-menu-list-face' on schedule/todo/recent/random list
in `howm-menu-mode'.")

(defun howm-menu-action-lock-rules ()
  (let ((d action-lock-default-rules)
        (j (list (howm-action-lock-search "^\\(>\\)[^0-9\r\n]*[0-9]+ +\\(.*\\)$"

                                          2 1 nil t)))
        (m (mapcar (lambda (pair)
                     (let* ((h (car pair))
                            (r (if (listp h) (car h) h))
                            (n (if (listp h) (second h) nil))
                            (arg (if n
                                     `(match-string-no-properties ,n)
                                    nil))
                            (functab (cdr pair))
                            (c (howm-menu-action functab arg)))
                       (list r c)))
                   (howm-menu-command-table)))
        ;; for history action

        (l (howm-menu-list-rules)))
    (append m d j l)))

(defun howm-menu-list-rules ()
  (list (howm-action-lock-search howm-menu-list-regexp
                                 howm-menu-list-regexp-key-pos
                                 howm-menu-list-regexp-action-pos
                                 nil)))

(defun howm-write-history (message)
  (when (and howm-history-file
             (or (null howm-history-limit) (> howm-history-limit 0)))
    (howm-write-log message howm-history-format howm-history-file
                    howm-history-limit
                    (and howm-history-unique howm-history-remove-format))))

(defun howm-write-log (message fmt file &optional limit remove-fmt)
  "Write MESSAGE with format FMT to the top of FILE.
FORMAT must have two %s; the formar is time and the latter is message.
When LIMIT is non-nil, only that number of recent messages are recorded.
When REMOVE-FMT is non-nil, it is used to generate regular expression
to remove matched lines. REMOVE-FMT must have one %s."

  (save-excursion
    (with-current-buffer (find-file-noselect file)
      (goto-char (point-min))
      (when remove-fmt
        (save-excursion
          (flush-lines (format remove-fmt (regexp-quote message)))
          ))
      (insert (format fmt
                      (format-time-string howm-dtime-format (current-time))
                      message)
              "\n")
      (when limit
        ;; Since I don't understand `selective-display' in goto-line,

        ;; I avoid it.
        (goto-char (point-min))
        (when (= (forward-line limit) 1) ;; buffer lines > LIMIT

          (delete-region (point) (point-max))))
      (save-buffer))))

;; adding (howm-write-history arg)
(defun howm-view-filter-by-contents (str)
  (interactive "sSearch in result (grep): ")
  (let* ((orig (howm-view-name))
         (name (if (string= orig "")
                   str
                 (format "%s&%s" orig str)))
         (file-list (howm-view-file-list)))
    (howm-write-history str)
    (howm-view-search str file-list name)))

(defun howm-list-grep (&optional completion-p)
  (interactive "P")
  (let* ((regexp (if completion-p
                     (howm-completing-read-keyword)
                   (read-from-minibuffer "Search all (grep): "))))
    (when completion-p
      (howm-write-history regexp))
    (howm-search regexp completion-p)))

(defun howm-keyword-search (keyword &optional create-p open-unique-p)

;   (interactive "sKeyword: ")
  (let* ((wconf (current-window-configuration))
         ;(aliases (if (howm-support-aliases-p)
         ;             (howm-keyword-aliases keyword)
         ;           keyword))
         (menu-p (and howm-menu-keyword-regexp
                      (string-match howm-menu-keyword-regexp keyword)))
         ;(comefrom-regexp (if menu-p

         ;                     nil
         ;                   (howm-make-keyword-regexp2 aliases)))
;;          (all-p (not menu-p))
         (found (let ((*howm-view-force-case-fold-search* howm-keyword-case-fold-search))  ;; dirty!
                  (howm-call-view-search keyword t)))
;;          (found (howm-view-search keyword (howm-directory all-p)
;;                                   nil nil t))
         (matched (and found (howm-list-normalize keyword)))
         (keyword-matched (member 'keyword matched))
         (title (howm-make-keyword-string keyword)))
    (when (and menu-p keyword-matched)
        ;; dirty. peeking howm-view.el

      (let* ((item (car howm-view-item-list))
             (fname (howm-view-item-filename item))
             (place (howm-view-item-place item)))
        (howm-view-kill-buffer)
        (set-window-configuration wconf)
        (howm-menu-open fname place
                        (howm-menu-name keyword))))
    (when (and create-p
               (not keyword-matched)

;;                (y-or-n-p (format "No match. Create [%s]? " title))
               )
      (howm-view-kill-buffer)
      (howm-create-file-with-title title)
      (message "New keyword."))
    ;; open unique
    (when (and open-unique-p (howm-single-element-p (howm-view-item-list)))
      (howm-keyword-search-open-unique wconf))
    ;;;history

    (when (not menu-p)
      (howm-write-history keyword))))

;; helper needed for howm-write-log
(defun flush-lines (regexp)
  "Delete lines containing matches for REGEXP.
If a match is split across lines, all the lines it lies in are deleted.
Applies to lines after point."
  (interactive "sFlush lines (containing match for regexp): ")
  (save-excursion

    (while (and (not (eobp))
        (re-search-forward regexp nil t))
      (delete-region (save-excursion (goto-char (match-beginning 0))
                     (beginning-of-line)
                     (point))
             (progn (forward-line 1) (point))))))

(defmacro with-current-buffer (buffer &rest body)
  `(save-window-excursion

     (ignore-errors
     (progn
       (set-buffer ,buffer)
       ,@body))))

(defun find-file-noselect (filename &optional nowarn rawfile)
  (unless (get-file-buffer filename)
    (editor::find-file-internal filename nowarn))
  (get-file-buffer filename))

(defun howm-action-lock-search (regexp pos &optional hilit-pos create-p open-unique-p)
  (howm-action-lock-general 'howm-keyword-search regexp pos hilit-pos create-p open-unique-p))

(defun howm-single-element-p (a)
  (and a (null (cdr a))))

(defun howm-keyword-search-open-unique (wconf)
  "Open unique match."

  ;; dirty. peeking howm-view.el
  (howm-view-summary-open)
  (let ((b (current-buffer)))
    (set-window-configuration wconf)
    (switch-to-buffer b)))

(defun howm-history ()
  (interactive)
  (howm-menu-open howm-history-file))
;; TODO�ɗj����\��
;; �{ ���j���[�Łu�ς݁v�͕\�����Ȃ�
(setq howm-menu-todo-show-day-of-week t)

(setq howm-menu-todo-priority -66666)

(defun howm-menu-insert-item (item &optional day-of-week-str)
  (let* ((p (howm-todo-parse item))
         (late (floor (car p)))
         (dow (fourth p))
         (dow-str (or day-of-week-str
                      (cond (howm-menu-todo-show-day-of-week
                             (howm-day-of-week-string dow))
                            (t "  "))))
         (h (format "> %s%3s " dow-str late))
         )
    (insert h (howm-view-item-summary item) "\n")))

(defun howm-day-of-week-string (&optional day-of-week)
  ;; 0 = Sunday

  (let ((dow (or day-of-week (nth 6 (decode-time)))))
    (substring (howm-day-of-week) dow (1+ dow))))

(defun howm-menu-todo ()
  (message "scanning todo...")
  (delete-region (match-beginning 0) (match-end 0))
  (mapc (lambda (item) (howm-menu-insert-item item)) ;;removed arg

        (howm-todo-menu howm-menu-todo-num howm-menu-todo-priority))  ;; do not display done
  (message "...done")
  )

(defun howm-reminder-summarizer (regexp &optional show-day-of-week)
  `(lambda (file line content)
     (let ((s (howm-reminder-omit-before ,regexp content)))

;;                 (string-match ,regexp content)
;;                 (substring content (match-beginning 0)))))
       ,(if show-day-of-week
            '(format "%s %s"
                     (howm-day-of-week-string (nth 4
                                                   (howm-todo-parse-string s)))
                     s)
          's))))

(defun howm-reminder-omit-before (regexp str)
  (string-match regexp str)
  (substring str (match-beginning 0)))

(defun howm-list-reminder (types name)
  (let* (
         (r (howm-reminder-regexp types))
         (rg (howm-reminder-regexp-grep types))
         (summarizer (howm-reminder-summarizer r t)) ;;day-of-week

         )
    (howm-view-search rg howm-directory name summarizer)
    (howm-list-exclude)
;;     (let ((howm-view-excluded-file-regexp howm-excluded-file-regexp)) ;; dirty!
;;       (howm-view-search rg (howm-directory) name summarizer))
    (howm-reminder-add-font-lock)
    (howm-mode-add-font-lock)
    ))

(defun howm-todo-menu (n limit-priority)
  (let* ((cutted (remove-if (lambda (item)
                                      (< (howm-todo-priority item)
                                         limit-priority))
                                    (howm-reminder-search howm-todo-types)))
         (sorted (howm-view-sort-items #'howm-todo-priority #'> cutted)))
    (if (null sorted) nil

      (remove-if #'null (if (< (length sorted) n)
                            sorted
                          (subseq sorted 0 n))))))
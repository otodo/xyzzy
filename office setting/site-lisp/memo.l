
#|
Memo���T�|�[�g�c�[��

TKI
http://www2.ocn.ne.jp/~cheerful/script/

------------------------------
��Memo�ړI

�E�ȒP�Ɏg���邱��
�E���������n�߂��邱��
�E�����J�X�^�}�C�Y�Ɏ��Ԃ�������Ȃ�
�E�����Ɏ��Ԃ�������Ȃ�����
�E�����͂��Ȃ�
�E�Œ���̃��[��
�E�t�@�C�����ɓ��t(�������)������
�E�t�@�C�����Ƀ^�O�Ƃ��ă��x����t����̂���
�E�t�@�C���̒��͓��Ƀt�H�[�}�b�g���w�肵�Ȃ�
�E�t�H���_��������{���Ȃ�
�E����o���邱�Ƃ͂Ȃ�ׂ����Ȃ��Ă��Œ���̂��Ƃ͂ł��邱��
�E�����@�\�ɂ�茩����
�E�Ƃ肠�����A�N�ł������ł���
�E��{ ���t�{���x�� �Ō���
�E����̃c�[����(xyzzy���܂߂�)���Ȃ�,�ˑ����Ȃ�

------------------------------
��lisp�T�v

���T�v
Memo��邱�Ƃ��T�|�[�g����@�\��񋟂���

���ړI
�����f�[�^�͂����A���ׂĎ��A�����R�X�g���ɗ͌��炵�A�����Ŋy�Ɍ����邱��
(���l���グ�邽�߂ɁA�����N�@�\���t����������)

�����_�ƖڕW
�E���̃c�[�����Ȃ��Ă��f�[�^�͗��p�\
�E�t�@�C�������l������A�ݒ肷���Ԃ��Ȃ���B
�E�Œ���̐���Ń������ۑ��ł��A�����ł���B

���@�\�T�v
�EMemo�t�@�C����V�K�쐬
�E�J�����Ƃ��Ō�ɃW�����v�H
(�E�ۑ��A�t�@�C�����J���@�\�� xyzzy�̕W���@�\�𗘗p)
(�E�����@�\�� xyzzy�̕W���@�\�� windows�̃c�[�������p)

�Ecalendar.l����A�����̃������J��
�Exyzzy�̊J���Ă���o�b�t�@�ɂ��鍡���̓��t�̃�����jump
�Ememo �f�B���N�g���ɂ���t�@�C���� �C���N�������^���t�B���^�[�T�[�`���ĊJ��
�E�����t�@�C���Ƀ��x���������郊�l�[���@�\
;20100810.txt �� 20100810_[INPUT].txt

���T�u�@�\
�Eclose memo(& save)

�E�ۑ���
1�s�ڂ�label�ɐݒ肷��B

�Exyzzy�I����
memo�̏ꍇ�A���₵�Ȃ��ŕۑ�����

�E�p�X�����N�̈���(local , http)
<path> <url> ���_�u���N���b�N�ŊJ��
�ȉ����Q��
xyzzy��find-file *memo-click-xyzzy-path* "\\.\\\(l\\\|txt\\\|dat\\\|log\\\)$"
windows�ɔC����  *memo-click-out-path* "^\\\(http:\\\|mailto\\\)" or �����ȊO


�E�����N��̓��e��\������

�ECalendar��memo�̋C�z��\��������

------------------------------
�������g�������t�H�[�}�b�g

file��
20100809.txt
20100809_���x��.txt
20100809_�R�����g.txt

- ���t���O�ɂ��Ă���̂́A���t�ɂ��\�[�g�Ŏ��ԏ��ɕ��ׂ���
- ���x���̓t�@�C���̌����ɂ��t�B���^�����O����
- �t�@�C�����𖈉�l�����肷���Ԃ��팸

file�̒�
�t���[�t�H�}�b�g

direcotory
�w��z���S��


�������@
���̃c�[���Ɍ��炸���ł��A
explorer(win+f)�ł� �s�̂̌����c�[���ł� , memo.l�ł�,calendar�̃N���b�N����

���C���X�g�[��


���ˑ��֌W
colormaker�� append-text-attribute ���g�p���Ă���B



��

���g�����̎Q�l
�E���x���Ɏ�ނ��L�� �l�Ō��߂Ă���
(memo | draft | TODO)_(�J�e�S��)_(URL,bookmark)�Ƃ�

�E���[���T���v��
<>�̓p�X�ɂ���
��F<path> <URL>

1�s�ڂ̓^�C�g��
[]�̓^�O�ɂ���



�t�H�[�}�b�g�͎����Ŏg���Ȃ���l���Ă����Ɨǂ��Ǝv���܂��B


�Ecompile-regexp-keyword-list �̉��P
(setq regexp-keyword-list
      (compile-regexp-keyword-list
       '(
         ;������
         ("\\s\".*\\s\"" t (:color 10 2) t)
         ;�R�����g
         ("\\s<[^\"\"]*\\s>" t (:color 6 1) t)
         ;�e�L�X�g���o��
         ("^[ \t]*[����������]" t (:color 2 4 :line :bold) t)
         ("^[ \t]*[������������].*\n" t (:color 1 7 :underline :bold) t)
         ("^[ \t]*[�E].*\n" t (:keyword 10) t)
         ;�A�C�e�}�C�Y���o�� sub
         ("^[ \t]*[0-9]\\\{1,5\\\}[ .�D�@\t][^0-9\n]+\n" t (:color 3 7 :underline :bold) t)
         ("^[ \t]*(?[a-zA-Z]\\\{1,2\\\}-?[0-9]\\\{,5\\\})?[ .�D�@\t][^a-zA-Z0-9\n]+\n" t (:color 4 7 :underline :bold) t)
         ;�A�C�e�}�C�Y���o�� sub
         ("^\\\([ \t�@]*[|>#:�b������]\\\)\\\{4\\\}[ \t�@]?" t (:color 4 7 :line ) t)
         ("^\\\([ \t�@]*[|>#:�b������]\\\)\\\{3\\\}[ \t�@]?" t (:color 3 7 :line ) t)
         ("^\\\([ \t�@]*[|>#:�b������]\\\)\\\{2\\\}[ \t�@]?" t (:color 2 7 :line ) t)
         ("^[ \t�@]*[|>#:�b������][ \t�@]?" t (:color 1 7 :line ) t)
         )))

�E�\���I�� �Z���N�V�����ړ��L�[�o�C���f�B���O

;MS��Office like�� selection�͈͖����㉺�Ɉړ�
;http://blue.ribbon.to/~aotororo/prog/200310.html#d08_t4   �߂��Ȃł���
;; �s�Z���N�V�������㉺�Ɉړ�
(defun transpose-selection-down (&optional (n 1))
  "�s�Z���N�V������ n �s���Ɉړ�"
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
  "�s�Z���N�V������ n �s��Ɉړ�"
  (interactive "*p")
  (transpose-selection-down (- n)))
(global-set-key #\S-M-Down 'transpose-selection-down)
(global-set-key #\S-M-Up 'transpose-selection-up)

;M-S-���E�� �V�t�g�A�A���V�t�g(�I�t�B�X��G�ە�)
(global-set-key #\M-S-Left 'unshift-selection)
(global-set-key #\M-S-Right 'shift-selection)

��TODO


��sub TODO
�E�����R�s�[�@�\
�N���b�v�{�[�h����̃��A���^�C���������݃R�s�[
���[�W����/�Z���N�V�����R�s�[

�E���[�g����

�E�L�[���[�h����

�E�g�[�^�����j���[�A�w���v�V�X�e��

�Ememo�p�� text-mode�̉��P

�E�����@�\�� �t�@�C���{����1�s�ڂ��܂߂邩�ǂ���(�\���A�� �����Ώ�)


�E�t�@�C�����t�H�[�}�b�g�s���ʒm 201000901�Ƃ�


�E������Ǝg���Â炢 TODO�����P
�E�����̃����f�B���N�g���̐؂�ւ�
  (���h�������͂��Ȃ�)

�Ememo-mode�Ɏg���₷���@�\���ڂ���
(memo-mode�ɂ��Ȃ��Ă� memo�͎���悤�ɂ���)

�E�A�g�@�\
Outlook , iTouch , iPod , �g��
google �J�����_�[, twitter
remember Milk , Evernote

�E�����o�b�t�@�����X�g�\��
�ڍו\����



��NOT  TODO
�E�Í���
�ETex , Info �R���o�[�^


�� �Q�l
man(roff�`�� �s��.���R�}���h�s)
EBt http://www001.upp.so-net.ne.jp/tokada/SL-C700/ebt_index.html
howm http://howm.sourceforge.jp/index-j.html (home wiki memo?)
�� Copi http://www.kamilabo.jp/
RD http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=RD


ChangeLog(1�t�@�C���̂݁A TAB�Ŗ{��)
�����v���O���~���O ��1��: Unix�̃����Z�p
http://0xcc.net/unimag/1/

Windows���[�U�[�̂��߂̓d�q�����p
http://blogger.main.jp/changelog/yayadoc/memolit.html

�f�W�^���E�X�N���b�v�u�b�N SVG Cats 2
http://www.sage-p.com/svgcats2.htm

�������p
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
(defvar *memo-directory* "C:\\data\\document\\memo\\") ;�Ō�� \�܂ŕK�v /�ł���
(defvar *memo-file-ext* ".txt")

(defvar *memo-file* "%Y%m%d");���Œ�
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
;�e�Ăяo�����C���֐� functions
;--------------------------------------------------------------------------------

;-------------------------------
; ���C���֐� ���C�u����
;-------------------------------
;memo�쐬        :make-memo
;memo�o�b�t�@�ړ�: jump-memo
;calendar����J��: calendar-mouse-memo-press
;rename          : rename-memo
;ifilter-memo����: memo-search
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

;�����̃����쐬
;;����file������ΊJ���A������΍쐬
(defun make-memo ()
  (interactive)
  (let ((buf)(fn)(fnp))
    (setq fn (get-memo-file-name-today)
          fnp (concat *memo-directory* fn))

    ;memo file open
    (if (file-exist-p fnp)
        ;�����t�@�C��������
      (progn
        (find-file fnp)  ; or make new
        (goto-char(point-max))
        (insert "\n" (format-date-string *memo-insert-date-format* (get-universal-time)) "\n")
        )
      ;�����t�@�C�����Ȃ�
      (progn
        (setq buf(create-new-buffer "memo"))
        (switch-to-buffer buf)
        ;(msgbox "~A\n~A" fnp fn)

        ;���t�̑}��
        (goto-char (point-min))
        (insert (format-date-string *memo-insert-date-format* (get-universal-time)) "\n")

        (ignore-errors
         (sit-for .5)
         (emacs-write-file fnp))
        ))))

;xyzzy�̃o�b�t�@�ŊJ���Ă�����ړ�
;;�t�@�C����������΁Acalendar��\��
(defun jump-memo()
  (interactive)
  (let ((buf)(fn))
    (setq fn (get-memo-file-name-today)
          fnp (concat *memo-directory* fn))
    ;memo file open
    (if (file-exist-p fnp)
        ;�����t�@�C��������
      (progn(find-file fnp))
      ;�����t�@�C�����Ȃ�
      (progn
        ; calendar
        (calendar)))))

;calendar�̃}�E�X�N���b�N�ł��̓��t�̃t�@�C�����J��
(defun calendar-mouse-memo-press ()
  (interactive)
  (let ((year)(month)(day)(fp))
    (multiple-value-setq (year month day fp) (get-ymd-from-calendar))
    (popup-string (format nil "[~A/~A/~A]" year month day) fp)

    (find-file-memo-date year month day)

    ;popup����̂ŊJ�����t�@�C���̍Ō���Ɉړ��ł��Ȃ��B
    ;(goto-char(point-max))

    ))
;TODO:LBtnDown�}�E�X�̋������Ȃ񂩕�
;   save-excursion �� mouse-left-press ��g�ݍ��킹�ĂȂ�Ƃ�������

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
             ;�t�@�C���ǂݍ���
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

;Memo����
;;label �� ���g���C���N�������^���T�[�`
(defun memo-search ()
  (interactive)
  (let ((memo-l)(qf t)(targetmemo)
        ;�����L�[���[�h�͍����̓��t
        (search-word (format-date-string *memo-file* (get-universal-time)))
        (sc)(i 9)(index 0)(firstflag t)(keymsg ""))
    (setq memo-l (get-memo-file-list))

    ;minibuffer �\��
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
            (if (= 0 (length search-word)) "(��Please Input Keyword��)" search-word))

      (if (or(not firstflag) (not (= 0 (length targetmemo))))
          (progn
            (popup-string (format nil "�y�C���N�������^���t�B���^�[�zEnter�ň�ԏ�(~A)���I�������\nfilter type:[~A]\n----~{\n~A~}" index keymsg targetmemo)(point))
            (setq sc (read-char *keyboard*))
            (cond((char= sc #\RET)(find-file-memo (car targetmemo))(search-memo-finish))
                 ;C-a�Ƃ��ŃL�[���[�h�N���A
                 ((char= sc #\C-a)
                  (setq search-word ""))
                 ;C-d�Ƃ��œ��t�L�[���[�h�}��
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

;TODO: BODY���̕\���H �A�J�[�\���Ή��H
;TODO: buffer�ŕ\��������H

;rename memo
;�Ώۍ��J���Ă��郁���t�@�C��(current buffer)�̂�
;20100810.txt �� 20100810_[INPUT].txt
;�Ή��t�H�[�}�b�g�͂��ꂾ��
(defun rename-memo (&optional buffer new-label)
  (interactive)
  (let ((fn)(fnpath)(label)(fn-after)(label-after)(mn-str))
    (setq fnpath (get-buffer-file-name buffer))
    (setq fn (file-namestring fnpath))

    ;memo�f�B���N�g���łȂ���ΏI��
    (if (not (under-memo-directory-filep (get-file-buffer fnpath)))
        (progn (message "non match memo directory")(quit)))

    ;�t�@�C�����烉�x����������擾
    (multiple-value-setq (label mn-str)(get-memo-label fn))

    ;���x���ϊ���
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
        ;       (msgbox "save���܂����~A" *memo-write-last-name*)
        (emacs-write-file
         (setq *memo-write-last-name* (concat *memo-directory* fn-after)))
        ;       (msgbox "save���܂���~A" *memo-write-last-name*)
        (delete-file fnpath)
        ;       (msgbox "�O�̃t�@�C�������܂���~A" fnpath)
        )
      (setq *memo-write-last-name* ""))))

;�J���Ă��郁���o�b�t�@�����ׂĕۑ�
; �����o�b�t�@�[�Ɍ��т����p�X�������f�B���N�g���z��
(defun close-memo-buffers (&optional (killflag t))
  (interactive)
  (let ((first-buf (or (selected-buffer)(other-buffer))))
    ;�o�b�t�@�[���X�g�擾
    (dolist (one-buf (buffer-list))
      ;�����f�B���N�g���z��
      (if (under-memo-directory-filep one-buf)
          ;�ۑ� &close
        (progn(set-buffer one-buf)(save-buffer)(if killflag (kill-buffer one-buf)))))
    (if (bufferp first-buf) (switch-to-buffer first-buf))))

;�t�@�C���ۑ�����1�s�ڂ����x���Ƃ��Ċ��p����B
; �������A�t�@�C�����̃��x���������Ƃ��̂�
(defun before-close-memo-task ()
  (let ((buf-path)(buffer (or (selected-buffer)(other-buffer)))(filename-label))
    ;�����f�B���N�g���z��
    (when (under-memo-directory-filep buffer)
      ;�p�X�����擾
      (setq buf-path (get-buffer-file-name buffer)
            filename-label (get-memo-label buf-path))

     ;(msgbox "file name label:[~A] ~A " filename-label (length filename-label))

      ;�t�@�C�����̃��x�����Ȃ�
      (if (and ;(= 0 (length *memo-write-last-name*))
               (or filename-label (= 0 (length filename-label)))
               ;(string/= buf-path *memo-write-last-name*)
               )
          (let ((nowp (point)) (fp(point-min))(ep)(line)(label))
            ;�t�@�C����1�s�ڂ���label���擾
            (set-buffer buffer)
            (save-excursion
              (goto-line 1)
              (goto-eol)
              (forward-char)
              (setq ep (point)
                    line (buffer-substring fp ep))
              (setq res (string-match  "^\\\(?:2?[01]?[0-9][0-9][-/][0-9][0-9][-/][0-9][0-9]\\\)? *\\\(?:[0-9:]\\\{4,8\\\}\\\)? *\\\([^-0-9:/ \n][^\n]*\\\)?[ �@]*\n?" line))
              (setq label (match-string 1)
                    ;label2 (match-string 2)
                    ;label3 (match-string 3)
                    )
              ;(msgbox "l:~A l2:~A l3:~A" label label2 label3)
             ;(msgbox "l:[~A]" label)
              )
            (unless label (setq label ""));���ꂪ�Ȃ���΁A�ۑ����Ƀ��x���𕷂��Ă���
            (setq label (substitute-string label "[\\/:\*<>\|\" ]" "_")) ; \"

            ;1�s�ڂɃ��x���p�f�[�^����
            (if res
                (progn (setq *memo-write-last-name* buf-path)
                  (rename-memo buffer label)
                  ;(if (file-exist-p buf-path)(delete-file buf-path))
                  (setq *memo-write-last-name* "")
                  ))))))
  nil)


;path �����N��֔��
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
              ;�t�@�C���Ƃ��Č���
              (cond ((string-match *memo-click-xyzzy-path* path)
                     (find-file-click path (selected-buffer)))
                    ((string-match *memo-click-out-path* path)
                     (shell-execute (substitute-string path "^ttp" "http") t))
                    ((file-exist-p path) (shell-execute path t))
                    ;TODO:�L�[���[�h�Ƃ���grep ����
                    (t (setq sub-flag t))
                    )
              (setq flag sub-flag ))))))

    (if flag (mouse-left-press))))

;TODO:�J�����_�[����ړ�����Ƃ� *Calendar* �o�b�t�@�� (goto-char(point-max))�݂����ɂȂ��Ă���̂͂Ȃ��H


;path �����N��̃t�@�C���� popup�\��
(defun path-link-popup ()
  (interactive)
  ;�p�X�擾
  (let ((path (get-file-path-support(get-current-tag-word) (selected-buffer)))(contents nil))
    ;�p�X�̑Ó����m�F
    (if (and path
             (string-match *memo-click-xyzzy-path* path)
             (ignore-errors (file-exist-p path)))
        (if (string= path *memo-poplink-path*) (popup-string *memo-poplink-contentes* (point))
          ;�t�@�C���ǂݍ���
          (progn
            (setq contents (format nil "file:~A\n------\n" path))
            (with-open-file (stream  path)
              (let ((line nil))
                (while (and (setq line (read-line stream nil nil nil))
                            (or (not line)(> 300 (length contents))))
                  (setq contents (concat contents line "\n")))))
            ;�t�@�C���|�b�v�A�b�v
            (popup-string contents (point))
            (setq *memo-poplink-path* path
                  *memo-poplink-contentes* contents
                  *memo-poplink-line*(current-line-number))))))
  ;   (setq *memo-poplink-path* nil)
  (continue-pre-selection)
  )


;�J�����_�[�� �����̂�������}�[�N����
;(�w�i 1~4)
;1:1��
;2:2�`4
;3:5�`9
;4:10�`
(defun memo-put-sign-in-calendar ()
  (interactive)
  (let
      ((buf (find-buffer "*Calendar*"))
       (flist)
       (date-list))
    ;Calendar�o�t�@�Ɉړ�
    (unless buf (calendar)(setq buf (find-buffer "*Calendar*")))
    (set-buffer buf)

    (save-window-excursion
      (save-excursion

        ;memo�̓��t���X�g���擾

        ;�J�����_�[�� set-text
        (setq flist (get-memo-file-list))
        (let ((year)(month)(day)(week)(id)(first-week)(buf-day)(day-point)(text-list)
              (tstp)(tendp)(ttag)(lastday)(lastnum)(col))
          (setq flist (stable-sort flist 'string-lessp)
                lastnum 1
                lastday "")
          ;(msgbox "list:~{\n~A~}" flist)
          (dolist (item flist)
            ; �N��������
            (when
                (string-match (concat  *memo-file-pattern-date*  "_?\\\([^0-9_][^.]*\\\)?" *memo-file-ext* "$") item)
              (setq year (ignore-errors (parse-integer (match-string 1)))
                    month (ignore-errors (parse-integer (match-string 2)))
                    day (ignore-errors (parse-integer (match-string 3))))
              ;  ���ɂ�������
              (setq first-week (get-weekday year month 1 ))
              (setq id (+ day first-week -1 +1 (if (= first-week 6) -7 0)))

              (goto-char (point-min))
              (if (scan-buffer (format nil "~A�N~A��" year month))
                  (progn (setq col (current-column))
                    (forward-line (+ 1(ceiling (/ (+ id 1)7))))
                    (goto-column (+ col(* 3 (-(mod id 7) 0))))
                    (setq buf-day (buffer-substring (point)(+ 3 (point)))
                          day-point (point))
                    ;attribute������
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


;�J�����_�[��\�������� �����̋C�z���c��
(defun memo-calendar ()
  (interactive)
  (calendar)
  (memo-put-sign-in-calendar))




;--------------------------------------------------------------------------------
;�T�u���[�`��
;--------------------------------------------------------------------------------

;���t���烁���t�@�C�����J��
(defun find-file-memo-date (year month day)
  ;memo���J��
  (let((targetmemo nil))

    (setq targetmemo (get-target-memo-list year month day))

    ;�Y�����̃t�@�C���������J��
    ;;���������popup
    (cond ((= 0 (length targetmemo))
           (message "~A/~A/~A:no memo" year month day) ) ; or make memo
          ((= 1 (length targetmemo))
           (find-file-memo (car targetmemo)))
          (t (popup-list targetmemo #'find-file-memo)(refresh-screen)))))

;�����t�@�C�����J��
(defun find-file-memo (fn)
  (interactive)
  (let ((sb))
    ;�Ƃ肠����
    ;    (if (setq sb (find-buffer "*Calendar*"))
    ;        (kill-buffer sb))

    ;�t�@�C�����J��
    (open-file-buffer fn)))
;TODO:popup���X�g���� window�͍ĕ`�悳��邪�Abuffer�^�u��xyzzy�^�C�g���������ς��Ȃ�

(defun open-file-buffer (fn)
  "�t�@�C�����J���ăo�b�t�@�Ɉړ�"
  (let (buf)
    (find-file fn)
    (setq buf (get-file-buffer fn))
    (if buf
        (set-buffer buf))))

;TODO : <path>���g����������A\n�폜������ |
;  �ˎ����ς�

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

; �����t�@�C�������쐬���ĕԂ�
; @return string:�����t�@�C��(�����̓��t�ϊ�)
(defun get-memo-file-name-today()
  (format-date-string (concat *memo-file* *memo-file-ext*) (get-universal-time)))

;�����f�B���N�g���z���̃t���p�X���X�g��Ԃ�
(defun get-memo-file-list ()
  (directory *memo-directory* :recursive t :file-only t :absolute t))
;TODO: #,~��ΏۊO�ɂ���



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


;�����f�B���N�g���z�����ǂ���
(defun under-memo-directory-filep (buffer)
  (let ((fn (get-buffer-file-name buffer)))
    (if (and buffer fn)
        (string-match (map-backslash-to-slash *memo-directory*) fn)
      nil)))

;�t�@�C�������烉�x�������𔲂��o���B
(defun get-memo-label (filename)
  (let ((label)(mn-str))
    (string-match (concat "\\\(" *memo-file-pattern*  "+\\\)" "_?\\\([^\\\.]*\\\)?" *memo-file-ext*) filename)
    ;(string-match (concat "\\\(" *memo-file-pattern*  "\\\)" "_?\\\([^0-9_][^.]*\\\)?" *memo-file-ext*) filename)
    (setq  mn-str (match-string 1)
           label (match-string 2))
    (if (not mn-str) (msgbox "error (get label from file):\ndate:~A\nlabel:~A\ninput file name:[~A]" mn-str label filename))
    (values label mn-str)))

;�J�����g (point)����  <path>�͈͂̕������ԋp
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
        (setq path(substitute-string path "\\\(\n[ �@]*[|>#:�b����@]\\\)+" ""))
        (setq path(substitute-string path "^\\\([ �@]*[|>#:�b����@]\\\)+" ""))
        (setq path(substitute-string path "\n\n*" ""))))
    path))

(defun get-search-prompt()
  (concat
   "memo file search(see popup-string) usage:"
   "�yEnter:����z�yC-g:�L�����Z���z"
   (nth (random 3) (list "�yC-a:�N���A�z�yBS:1�����폜�z"
                         (format nil "�yC-d:~A�z" (format-date-string *memo-file* (get-universal-time)))
                         "�yDown/TAB/C-n:�Ώۂ�����Ɂz�yUp/C-p:�Ώۂ����Ɂz"
                         ))))

(defun search-memo-finish()
  (refresh-screen)
  (sit-for .3)
  (quit))


(defun get-weekday (year month day)
  (nth 6 (multiple-value-list (decode-universal-time (encode-universal-time 0 0 0 day month year)))))

(defun get-target-memo-list (year month day)
  ;memo���J��
  (let
      ((memos (get-memo-file-list))
       (keystr(format-date-string *memo-file* (encode-universal-time 0 0 0 day month year)))
       (targetmemo nil))

    ;���tfilter
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
      ;day ���擾
      (if (scan-buffer "[ \n]" :reverse t :regexp t) (setq fp(+ 1(point))))
      (goto-char (+ 1 (point)))
      (if (scan-buffer "[ \n]" :reverse nil :regexp t) (setq ep(point))))
    (ignore-errors
     (setq day (parse-integer(buffer-substring fp ep)))
     )
    (unless day
      ;goto-last-mouse-point �̉e����߂��B(���E�B���h�E�Ȃ�)
      (goto-char last-p)
      (set-goal-column lastc)

      (mouse-left-press)(return-from get-ymd-from-calendar))

    ;lookup year�Nmonth��
    (let (ym)

      ;���݈ʒu
      (save-excursion
        (goto-char (- (point) 1))
        (setq cold (current-column))

        ;���[����
        (if (> day 7)
            (scan-buffer "\\\(   \\\)\\\|\\\(\n \\\)" :reverse t :regexp t)
          (scan-buffer "\\\([0-9\n]   \\\)\\\|\\\(\n \\\)" :reverse t :regexp t))
        (goto-char (+ 3 (point)))
        (setq col (current-column))

        ;��[����
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

        ;��������擾���� �N���ɕ���
        (if (scan-buffer " 2" :reverse t :regexp t) (setq fp(+ 1(point))))
        (goto-char (+ 1 (point)))
        (if (scan-buffer "[ \n]" :reverse nil :regexp t) (setq ep(point)))
        (setq ym (buffer-substring fp ep))

        (string-match "\\\(2[01][0-9][0-9]\\\)�N\\\([01]?[0-9]\\\)��" ym)
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


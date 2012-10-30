;; extmail.l
;;
;; Copyright (c) 2004 kazu.y <samba@pal.tok2.com>
;;
;; ■ 概要
;;  カレントバッファの内容を普段利用しているメーラ(要MAPI対応*)を用いて送信します。
;;  返信/転送はできません。
;;  *Outlook Express, Mozilla Thunderbirdで動作することを確認
;;
;; ■ 使い方
;;  1. .xyzzyやsiteinit.lに以下のコードを追加します。
;;     (require "extmail")
;;
;;  2. カレントバッファで送信したいメールの内容を編集します。
;;
;;  3. M-x extmail:send-bufferでメールを送信できます。
;;
;;  また、バッファの先頭に(空行や空白を入れずに)
;;    to: apple@apple.net, orange@orange.com
;;    cc: grape@grape.org
;;    bcc: pine@pine.biz
;;    subject: happy birthday!
;;  等と記述すると、それぞれ送信するメールのTO、CC, BCC, SUBJECTに反映されます。
;;  抑制するには1行目を空行にしてください。
;;
;;  ※ あて先はあわせて16人まで指定できます。
;;
;; ■ 履歴
;;  2004/01/05 ver.1公開
;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "wip/winapi")
  (require "foreign"))

(provide "extmail")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package "extmail")
    (defpackage "extmail"
      (:use "lisp" "editor"))))

(in-package "extmail")

(export '(send-buffer))
(export '(*default-subject*))


(c:*define MAPI_LOGON_UI  #x00000001)
(c:*define MAPI_DIALOG    #x00000008)

(c:*define MAPI_ORIG      0)
(c:*define MAPI_TO        1)
(c:*define MAPI_CC        2)
(c:*define MAPI_BCC       3)

(c:*define-c-struct MapiRecipDesc
  (winapi:ULONG ulReserved)
  (winapi:ULONG ulRecipClass)
  (winapi:LPSTR lpszName)
  (winapi:LPSTR lpszAddress)
  (winapi:ULONG ulEIDSize)
  (winapi:LPVOID lpEntryID))

(c:*define-c-struct MapiFileDesc
  (winapi:ULONG ulReserved)
  (winapi:ULONG flFlags)
  (winapi:ULONG nPosition)
  (winapi:LPSTR lpszPathName)
  (winapi:LPSTR lpszFileName)
  (winapi:LPVOID lpFileType))

(c:*define-c-struct MapiRecipDesc
  (winapi:ULONG ulReserved)
  (winapi:ULONG ulRecipClass)
  (winapi:LPSTR lpszName)
  (winapi:LPSTR lpszAddress)
  (winapi:ULONG ulEIDSize)
  (winapi:LPVOID lpEntryID))

(c:*define-c-struct MapiMessage
  (winapi:ULONG ulReserved)
  (winapi:LPSTR lpszSubject)
  (winapi:LPSTR lpszNoteText)
  (winapi:LPSTR lpszMessageType)
  (winapi:LPSTR lpszDateReceived)
  (winapi:LPSTR lpszConversationID)
  (winapi:ULONG flFlags)
  (c:void*      lpOriginator)
  (winapi:ULONG nRecipCount)
  (c:void*      lpRecips)
  (winapi:ULONG nFileCount)
  (c:void*      lpFiles))

(c:define-dll-entry winapi:ULONG mapi32-dll-mapi-send-mail
  (winapi:UINT winapi:ULONG (MapiMessage *) winapi:ULONG winapi:ULONG) "mapi32.dll" "MAPISendMail")


(defvar *default-subject* "(no title)")

(c:*define-c-struct Recipients
  (MapiRecipDesc r0)
  (MapiRecipDesc r1)
  (MapiRecipDesc r2)
  (MapiRecipDesc r3)
  (MapiRecipDesc r4)
  (MapiRecipDesc r5)
  (MapiRecipDesc r6)
  (MapiRecipDesc r7)
  (MapiRecipDesc r8)
  (MapiRecipDesc r9)
  (MapiRecipDesc r10)
  (MapiRecipDesc r11)
  (MapiRecipDesc r12)
  (MapiRecipDesc r13)
  (MapiRecipDesc r14)
  (MapiRecipDesc r15))

(defvar max-recips    16)
(defvar num-of-recips 0)


(defun initialize ()
  (setf num-of-recips 0))

(defun add-recipient (recips addr type)
  (if (> num-of-recips max-recips) (return-from add-recipient nil))
  (let ((desc (make-MapiRecipDesc)))
    (si:clear-chunk desc)
    (setf (MapiRecipDesc-ulRecipClass desc) type)
    (setf (MapiRecipDesc-lpszAddress  desc) (si:make-string-chunk addr))
    ; 汚い...(T-T)
    (cond ((= num-of-recips 0) (setf (Recipients-r0 recips) desc))
          ((= num-of-recips 1) (setf (Recipients-r1 recips) desc))
          ((= num-of-recips 2) (setf (Recipients-r2 recips) desc))
          ((= num-of-recips 3) (setf (Recipients-r3 recips) desc))
          ((= num-of-recips 4) (setf (Recipients-r4 recips) desc))
          ((= num-of-recips 5) (setf (Recipients-r5 recips) desc))
          ((= num-of-recips 6) (setf (Recipients-r6 recips) desc))
          ((= num-of-recips 7) (setf (Recipients-r7 recips) desc))
          ((= num-of-recips 8) (setf (Recipients-r8 recips) desc))
          ((= num-of-recips 9) (setf (Recipients-r9 recips) desc))
          ((= num-of-recips 10) (setf (Recipients-r10 recips) desc))
          ((= num-of-recips 11) (setf (Recipients-r11 recips) desc))
          ((= num-of-recips 12) (setf (Recipients-r12 recips) desc))
          ((= num-of-recips 13) (setf (Recipients-r13 recips) desc))
          ((= num-of-recips 14) (setf (Recipients-r14 recips) desc))
          ((= num-of-recips 15) (setf (Recipients-r15 recips) desc)))
    (incf num-of-recips)
    recips))

(defun add-recipients-recursivly (recips addrs type)
  (if (null addrs) (return-from add-recipients-recursivly t))
  (setf recips (add-recipient recips (car addrs) type))
  (add-recipients-recursivly recips (cdr addrs) type))

(defun make-recipients-from-addr (to-addrs cc-addrs bcc-addrs)
  (let ((recips (make-Recipients)))
    (add-recipients-recursivly recips to-addrs  MAPI_TO)
    (add-recipients-recursivly recips cc-addrs  MAPI_CC)
    (add-recipients-recursivly recips bcc-addrs MAPI_BCC)
    recips))

(defun send-mail-impl (to-addrs cc-addrs bcc-addrs subject message)
  (initialize)
  (let ((mapi-msg (make-MapiMessage)))
    (si:clear-chunk mapi-msg)
    (setf (MapiMessage-lpszSubject  mapi-msg)
          (si:make-string-chunk (or subject *default-subject*)))
    (setf (MapiMessage-lpszNoteText mapi-msg)
          (si:make-string-chunk (or message "")))
    (setf (MapiMessage-lpRecips     mapi-msg)
          (make-recipients-from-addr to-addrs cc-addrs bcc-addrs))
    (setf (MapiMessage-nRecipCount  mapi-msg)
          num-of-recips)
    (mapi32-dll-mapi-send-mail 0 0 mapi-msg (logior MAPI_LOGON_UI MAPI_DIALOG) 0)))


(defun read-body ()
    (buffer-substring (point)
                      (and (forward-page) (point))))

(defun read-recip-header ()
  (let ((recip-list nil))
    (and (looking-at "[ \t\r\n]*\\([^ \t\r\n,]+\\)")
         (setf recip-list (cons (match-string 1) recip-list))
         (goto-char (match-end 0))
         (while (looking-at "[ \t\r\n,]*,[ \t\r\n,]*\\([^ \t\r\n,]+\\)")
           (setf recip-list (cons (match-string 1) recip-list))
           (goto-char (match-end 0))))
    recip-list))

(defun send-buffer ()
  "バッファの内容を外部メールで送信します"
  (interactive)
  (long-operation
    (save-excursion
      (goto-char 0)
      (let ((to-addrs  nil)
            (cc-addrs  nil)
            (bcc-addrs nil)
            (subject   nil)
            (body      nil))
        (loop
          (cond ((looking-at "^to[ \t]*:" t) (progn
                                               (goto-char (match-end 0))
                                               (setf to-addrs  (read-recip-header))))
                ((looking-at "^cc[ \t]*:" t) (progn
                                               (goto-char (match-end 0))
                                               (setf cc-addrs  (read-recip-header))))
                ((looking-at "^bcc[ \t]*:" t) (progn
                                                (goto-char (match-end 0))
                                                (setf bcc-addrs (read-recip-header))))
                ((looking-at "^subject[ \t]*:\\(.*\\)$" t) (progn
                                                             (goto-char (match-end 0))
                                                             (setf subject (match-string 1))))
                (t (progn
                     (if (looking-at "^$") (forward-line))
                     (setf body (read-body)) (return t))))
          (forward-line))
        ; thunderbirdのための処理
        (and (null to-addrs) (null cc-addrs) (null bcc-addrs) (setf to-addrs '("")))
        (send-mail-impl to-addrs cc-addrs bcc-addrs subject body)))))

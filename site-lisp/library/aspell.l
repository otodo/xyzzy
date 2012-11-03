;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;                          aspell.l                            
;;;                    use aspell from xyzzy
;;;                      by T.Shido                              
;;;
;;;         version 0.0.5      March    22, 2006   Supporting user defined key bind   
;;;         version 0.0.4.2    March    22, 2006   Debug (denying invalid user input)
;;;         version 0.0.4.1    March    22, 2006   Debug (kill process and buffers remained when aborted)
;;;         version 0.0.4      December 26, 2005   Debug
;;;         version 0.0.3      November 08, 2005   Debug
;;;         version 0.0.2      November 04, 2005   accepting other Europian languages               
;;;         version 0.0.1      June     17, 2004   English only             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide "aspell")
(in-package "editor")
(export '(*aspell-command* *aspell-option* *aspell-file-type-option*
          *aspell-spelling-error-attributes* *aspell-max-choices* *aspell-language*
          *aspell-assigned-characters* aspell))
          

(defvar *aspell-command* "C:/Aspell/bin/aspell -a")
(defvar *aspell-option* "fast") ;four speed options: ultra, fast,  normal, bad-spellers
(defvar *aspell-language* "en")
(defvar *aspell-file-type-option* '(("html" . "-H") ("tex" . "-t")))
(defvar *aspell-spelling-error-attributes* '(:foreground 1 :underline t))
(defvar *aspell-max-choices* 30)
                                    ; character  function  for all or not
(defvar *aspell-assigned-characters* '((#\SPC   "Ignore"      nil)  
                                       (#\i     "Ignore all"   t )
                                       (#\r     "Replace"     nil)
                                       (#\R     "Replace all"  t )
                                       (#\a     "Add"          t )
                                       (#\u     "Add lower"    t )
                                       (#\x     "EXit"        nil)
                                       (#\!     "Abort"       nil)))
    
(defvar-local *aspell-hash* (make-hash-table :test #'eq))
(defvar-local *aspell-undo-count* nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; macros

;;; anaphoric macros the result of predicate can be referred as 'it'
(defmacro aif (pred then-form &optional else-form)
  `(let ((it ,pred)) (if it ,then-form ,else-form)))

;;;
(defmacro aand (&rest args)
  (cond ((null args) t)
        ((null (cdr args)) (car args))
        (t `(aif ,(car args) (aand ,@(cdr args))))))

;;;
(defmacro acond (&rest clauses)
  (if (null clauses)
      nil
    (let ((cl1 (car clauses))
          (sym (gensym)))
      `(let ((,sym ,(car cl1)))
         (if ,sym
             (let ((it ,sym)) ,@(cdr cl1))
           (acond ,@(cdr clauses)))))))


;;;
(defmacro in (op val &rest ls)
  (let ((gval (gensym)))
    `(let ((,gval ,val))
       (or
        ,@(mapcar #'(lambda (obj)
                      `(,op ,gval ,obj))
                  ls)))))

;;; calling an external command  with temporary files
(defmacro call-with-temp-files (tempfiles cmd er before after)
  (let ((val (gensym)))
    `(unwind-protect
         (let ,(delete nil
                       (mapcar #'(lambda (x) (and x `(,x (make-temp-file-name))))
                               tempfiles))
           ,@before
           (unless
               (zerop
                (call-process ,cmd
                              :input     ,(first  tempfiles)
                              :output    ,(second tempfiles)
                              :error     ,(third  tempfiles)
                              :show       :hide
                              :environ    (and (not (si:getenv "HOME"))
                                               (list (cons "HOME" (user-homedir-pathname))))
                              :wait t))
             ,er)
           (let ((,val ,(if after `(progn ,@after))))
             ,@(delete nil
                       (mapcar #'(lambda(x)
                                   (and x `(and ,x (delete-file ,x :in-does-not-exist :skip))))
                               tempfiles))
             ,val)))))

;;; seaching attributed words
(defmacro aspell-symbol-search (vl sy ky &body body)
  `(multiple-value-bind ,vl
     (find-text-attribute ,sy
                          :key ,ky
                          :test #'eq
                          :start (point))
     (when ,(car vl)
       ,@body)))

;;; case for string
(defmacro case-string (str &body ls)
  (let ((gstr (gensym)))
    `(let ((,gstr ,str))
       (cond
        ,@(mapcar #'(lambda (x)
                      `(,(if (atom (car x))
                              `(string= ,gstr ,(car x))
                            `(or ,@(mapcar #'(lambda (y) `(string= ,y ,gstr)) (car x))))
                        ,(second x)))
                  ls)))))

;;;
(defmacro aspell-code-selection (&rest ls)
  `(case-string *aspell-language*
                (("en" "fr" "de" "da" "es" "it" "nl" "no" "sv") ,(first ls))
                (("cs" "pl" "pt" "ro" "sk") ,(second ls))
                ("ru" ,(third ls))
                ("el" ,(fourth ls))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; functions

;;; return the assigned character for the function from the *aspell-assigned-characters*
(defun aspell-achar (str)
  (dolist (ls *aspell-assigned-characters*)
    (and (string= (second ls) str)
         (return-from aspell-achar (first ls)))))


;;; clear all marks   
(defun aspell-clear-marks ()
  (delete-text-attributes 'aspell
                          :key #'(lambda (x) (and (consp x) (car x)))
                          :test #'eq))

;;; returns number of iso8859-N
(defun aspell-iso8859-n ()
  (aspell-code-selection 1 2 5 7))

;;;
(defun aspell-coding ()
  (aspell-code-selection
   *encoding-iso-8859-1*
   *encoding-iso-8859-2*
   *encoding-iso-8859-5*
   *encoding-iso-8859-7*))

;;;
(defun aspell-truncate-list (ls n)
  (let ((len (length ls)))
    (if (< n len)
        (subseq ls 0 n)
      ls)))

;;; write file with a specified character encoding
(defun aspell-write-file (fname coding)
  (write-region (point-min) (point-max) fname nil coding))

;;; making an assc list '(miss-spell alter-1 alter-2 alter-3 ...) from the line of aspell output
(defun aspell-registrate-misspell (str)
  (let ((ls0 (split-string str #\: nil " ")))
    (cons (second (split-string (car ls0) #\SPC))
          (aspell-truncate-list
           (split-string (second ls0) #\, nil " ")
           *aspell-max-choices*))))

;;; making an assoc list from aspell output
(defun aspell-create-alist (fname coding)
  (let ((buff (find-file-internal fname nil coding))
        (aalist nil))
    (set-buffer buff)
    (goto-char (point-min))
    (while (forward-line)
      (if (char= (following-char) #\&)
          (push (aspell-registrate-misspell (buffer-substring (point) (progn (goto-eol) (point)))) aalist)))
    (delete-buffer buff)
    (message "Seaching text done.")
    (nreverse aalist)))
    
;;; making a hash table of alternatives from the alist
(defun aspell-create-hash (aalist)
  (clrhash *aspell-hash*)
  (dolist (ls aalist)
    (setf (gethash (intern (car ls)) *aspell-hash*) (cdr ls))))

;;; check if string between p0 p1 is a word.
(defun aspell-word-p (p0 p1)
  (and
   p0 p1
   (progn
     (goto-char p0)
     (not (word-char-p (preceding-char))))
   (progn
     (goto-char p1)
     (not (word-char-p (following-char))))))

;;; marking up the text using the alist
(defun aspell-mark-text (aalist)
  (goto-char (point-min))
  (dolist (ls aalist)
    (let ((w (car ls)))
      (while
        (scan-buffer w
                     :tail t
                     :left-bound t
                     :right-bound t
                     :regexp nil)
        (let ((p0 (match-beginning 0))
              (p1 (match-end 0)))
          (when (aspell-word-p p0 p1)
            (apply #'set-text-attribute
                   p0
                   p1
                   (cons 'aspell (intern w))
                   *aspell-spelling-error-attributes*)
            (return)))))))
       
;;; checking the original text 
(defun aspell-check-text (op coding)
    (call-with-temp-files
     (fin fout nil)
     (concat *aspell-command* op)
     (error "cannot spawn aspell")
     ((aspell-write-file fin coding))   
     ((aspell-create-alist fout coding))))

;;; to show the first item of elementary lists in *aspell-assigned-characters*
(defun aspell-sf (ls0)
  (substring (format nil "~S" (first ls0)) 2))

;;; showing list with n columns
(defun aspell-with-column (form ls0 f1 f2 n m)     
  (let ((i 1))
    (dolist (x ls0)
      (format t form (if f1 (funcall f1 x) i) m (if f2 (funcall f2 x) x))
      (and (zerop (rem i n)) (terpri))
      (incf i))
    (or (= (rem i n) 1) (terpri))))

;;; showing correction choices for spelling errors	      
(defun aspell-show-choices (ls0 coding)
  (let* ((maxl (max 10 (apply #'max
                              (append
                               (mapcar #'length ls0)
                               (mapcar #'(lambda (x) (length (second x)))
                                       *aspell-assigned-characters*)))))
         (w (+ maxl 7))
         (n (min 8 (max 1 (truncate (window-columns) w))))
         (h (+ 3 (ceiling (/ (length ls0) n)) (ceiling (/ (length *aspell-assigned-characters*) n))))
         (tbuff (selected-buffer)))
    (with-output-to-temp-buffer ("*aspell choices*" 10)
                                (set-buffer-fileio-encoding coding "*aspell choices*")
                                (refresh-screen)
                                (if ls0
                                    (aspell-with-column "~3D: ~@VA  " ls0 nil nil n maxl)
                                  (format t "No suggestion.~%"))
                                (format t "---------------------------------~%")
                                (aspell-with-column "~3A: ~@VA  "
                                                    *aspell-assigned-characters* 'aspell-sf 'second n maxl)
                                (format t " (Number): Replace all, by N-th item.~%")
                                (format t "/(Number): Replace this word only, by N-th item.~%"))
    (enlarge-window (- h (window-height)) nil)
    (refresh-screen)
    (pop-to-buffer tbuff)))

;;; it read a character from the minibuffer
;;; and returns two values ((integer or character), (all or not))
(defun aspell-users-choice (nmax &optional (p "? ") (n0 0) (all t))
  (minibuffer-prompt p)
  (let ((c (read-char *keyboard*)))
    (acond
     ((digit-char-p c)
      (let ((n1 (+ it (* 10 n0))))
        (if (< (* 10 n1) nmax)
            (aspell-users-choice nmax (format nil "~A~C" p c) n1 all)
          (values n1 all))))
     ((assoc c *aspell-assigned-characters*)
      (if (string= p "? ")
          (values c (third it))
        (aspell-users-choice nmax "? " 0 t)))
     ((and (< 0 n0) (in char= c #\LFD #\RET))
      (values n0 all))
     ((and (string= p "? ") (char= c #\/))
      (aspell-users-choice nmax "? /" 0 nil))
     (t (aspell-users-choice nmax "? " 0 t)))))


;;; replace all	
(defun aspell-replace (s0 w0)
  (aspell-symbol-search
   (p1 p2 r) ;parms
   s0        ;symbol
   #'(lambda (x) (and (consp x) (eq (car x) 'aspell) (cdr x))) ;key
 ;;body
   (goto-char p1)
   (incf *aspell-undo-count*)
   (undo-boundary)
   (delete-region p1 p2)
   (insert w0)
   (aspell-replace s0 w0)))

;;; making downcased symbol 
(defun aspell-symbol-downcase (sy0)
  (intern (string-downcase (symbol-name sy0))))

;;; clear the attribute of the selected word
(defun aspell-unmark-symbol (sy0)
  (delete-text-attributes sy0
                          :key #'(lambda (x)
                                   (and (consp x)
                                        (eq (car x) 'aspell)
                                        (cdr x)))
                          :test #'eq))

;;; do something for all the rest
(defun aspell-all (c s w)
  (save-excursion
    (and w (char= c (aspell-achar "Replace all")) (aspell-replace s w))
    (aspell-unmark-symbol s)
    (and (char= c (aspell-achar "Add lower")) (aspell-unmark-symbol (aspell-symbol-downcase s)))
    (cond
     ((in char= c (aspell-achar "Replace all") (aspell-achar "Ignore all")) (remhash s *aspell-hash*))
     ((char= c (aspell-achar "Add")) (setf (gethash  s *aspell-hash*) #\*))
     ((char= c (aspell-achar "Add lower")) (setf (gethash  s *aspell-hash*) #\&)))))

;;;checking one word 
(defun aspell-check-word (word coding buff proc)
  (save-excursion
    (set-buffer buff)
    (set-buffer-modified-p nil)
    (process-send-string proc (concat word "\n"))
    (while (not (buffer-modified-p))
      (sleep-for 0.01))
    (goto-char (point-max))
    (forward-line -2)
    (char= (following-char) #\*)))

;;; typing a new word to replace old one
(defun aspell-input-new-word (coding buff proc)
  (let ((w0 (read-string "Enter new word: ")))
    (if (= 0 (length w0))
        nil                         ; if no word, return nil
      (if (or
           (aspell-check-word w0 coding buff proc)
           (y-or-n-p (format nil "~A is not in the dictionary, use anyway? (y/n)" w0)))
          w0
        (aspell-input-new-word coding buff proc)))))

(defun aspell-correct-text (coding aop)
  (let* ((buff (create-new-buffer "*aspell one word*")) 
         (proc (make-process (concat *aspell-command* aop)
                                :output buff
                                :incode (aspell-coding)
                                :outcode (aspell-coding))))
    (aspell-correct-text-iter coding buff proc)
    (kill-process proc)
    (while (eq (process-status proc) :run) (sleep-for 0.01))
    (delete-buffer buff)
    (aand (find-buffer "*aspell choices*") (delete-buffer it))))

;;;making correction for spelling errors
(defun aspell-correct-text-iter (coding buff proc)
  (aspell-symbol-search
   (p1 p2 r) ;parms
   'aspell   ;symbol
   #'(lambda (x) (and (consp x) (car x))) ;key
   ;;body
   (goto-char p1)
   (and (pos-not-visible-in-window-p p1) (recenter))
   (set-text-attribute p1 p2 r :bold t :underline t :foreground 1 :background 6) ;current word
   (let ((sy0 (cdr r)))
     (multiple-value-bind (als0 f)
       (gethash sy0 *aspell-hash*)
       (declare (ignore f))
       (aspell-show-choices als0 coding)
       (multiple-value-bind (choice all)
         (aspell-users-choice (length als0))
         (when (eql choice (aspell-achar "Abort"))
           (dotimes (i *aspell-undo-count*) (undo))
           (message "Spell checking aborted.")
           (kill-process  proc)
           (while (eq (process-status proc) :run) (sleep-for 0.01))
           (delete-buffer "*aspell one word*")
           (delete-buffer "*aspell choices*")
           (throw 'abort nil))
         (and (eql choice (aspell-achar "EXit")) (return-from aspell-correct-text-iter nil))
         (let ((w1 (if (and (numberp choice) (< 0 choice))
                       (nth (1- choice) als0)
                     (and (in char= choice (aspell-achar "Replace all") (aspell-achar "Replace"))
                          (aspell-input-new-word coding buff proc)))))
           (if all
               (aspell-all (if (and (numberp choice) (< 0 choice))
                               (aspell-achar "Replace all") choice) sy0 w1)
             (progn
               (delete-text-attributes r :test #'eq)
               (when w1
                 (incf *aspell-undo-count*)
                 (undo-boundary)
                 (delete-region p1 p2)
                 (insert w1))))))))
   (aspell-correct-text-iter coding buff proc)))

;;; updating dictionary     
(defun aspell-update-dictionary (coding)
  (call-with-temp-files
   (fout nil nil)
   (format nil "~A --lang=~A --encoding=iso8859-~A" *aspell-command* *aspell-language* (aspell-iso8859-n))
   (warn "Add to private dictionary failed.")
   ((aspell-write-hash fout coding))       
   nil))

;;; making an input file for updating the user dictionary
(defun aspell-write-hash (fout coding)
  (let ((buff (create-new-buffer "*aspell hash*")))
    (set-buffer buff)
    (maphash #'(lambda(k v)
                 (and (characterp v)
                      (insert (format nil "~A~A~%" v k))))
             *aspell-hash*)
    (insert (format nil "#~%"))     ; '#' should be added at the end to save new words
    (aspell-write-file fout coding)
    (delete-buffer buff)))

;;; spell check for selected region
(defun aspell-region (p1 p2)
  (aspell-clear-marks)
  (setq *aspell-undo-count* 0)
  (save-window-excursion
    (save-restriction
      (narrow-to-region p1 p2)
        (let* ((sbuff (selected-buffer))
               (coding (aspell-coding))
               (pr (and (file-visited-p sbuff)
                        (assoc
                         (pathname-type (get-buffer-file-name sbuff))
                         *aspell-file-type-option*
                         :test #'equalp)))
               (aop (format nil " ~A ~A --lang=~A --encoding=iso8859-~A "
                            (if pr (cdr pr) "") *aspell-option*  *aspell-language* (aspell-iso8859-n))))
          (delete-other-windows)
          (catch 'abort
            (long-operation
             (let ((aalist (aspell-check-text aop coding)))
               (aspell-create-hash aalist)
               (aspell-mark-text aalist)))
            (goto-char (point-min))
            (aspell-correct-text coding aop)       ; throw 'abort from here if demanded
            (aspell-update-dictionary coding))
          (setq  *aspell-undo-count* nil)
          (aspell-clear-marks))))
  (message "Aspell done."))

;;; the main function, to be exported.
(defun aspell ()
  (interactive)
  (if (pre-selection-p)
      (let ((p1 (selection-mark))
            (p2 (selection-point)))
        (stop-selection)
        (or (= p1 p2)
            (aspell-region (min p1 p2) (max p1 p2))))
    (aspell-region (point-min) (point-max))))

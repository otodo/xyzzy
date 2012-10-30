(defun ni::add-site-from-wiki ()
  (interactive)
;  (let ((s (ni::http-get-url "http://xyzzy.s53.xrea.com/wiki/index.php?cmd=source&page=NetInstaller%2F%C7%DB%C9%DB%A5%D1%A5%C3%A5%B1%A1%BC%A5%B8%B0%EC%CD%F7")))
  (let ((s (ni::http-get-url "http://xyzzy.s53.xrea.com/wiki/index.php?cmd=read&page=tips%2F%A5%CD%A5%C3%A5%C8%A5%A4%A5%F3%A5%B9%A5%C8%A1%BC%A5%E9%A4%CEsite%A4%F2%CC%B5%CD%FD%A4%E4%A4%EA%BA%C7%BF%B7%A4%CB")))
    (ni::load-site-data)
    (mapcar
     (lambda (x) (ignore-errors (ni::site-add x)))
     (set-difference
      (remove-if
       'null 
       (mapcar (lambda (i)
		 (and (string-match "^:[^|]+|\\(http:.*\\)$" i)
		      (apply #'concat
			     (mapcar (lambda (x)
				       (let ((tmp (split-string x #\;)))
					 (if (equal (car tmp) "amp")
					     (apply #'concat "&" (cdr tmp))
					   (car tmp))))
				     (split-string (match-string 1) #\&)))))
	       (let (out)
		 (while
		     (handler-case
			 (progn
			   (push (read-line s) out)
			   t)
			 (quit (c)
			   (return-from ni::add-site-from-wiki))
			 (error (c)
			   nil)))
		 (nreverse out))))
      (mapcar (lambda (x) (cdr (assoc "src" x :test 'equal))) ni::*site-data*)
      :test 'equal))) t)
 ;;ここがキーバインド
(define-key ni::*site-map* #\N 'ni::add-site-from-wiki)

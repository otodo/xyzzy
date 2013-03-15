(or (when
        (file-exist-p (merge-pathnames "treeview.dll" (si:system-root)))
      (not (yes-or-no-p "è„èëÇ´ÇµÇ‹Ç∑ÅH")))
    (prog1
	nil
      (ni::http-get-to-file "http://www003.upp.so-net.ne.jp/rex/archive/TreeView030915.lzh" (merge-pathnames "site-lisp/inst/archive/TreeView030915.lzh" (si:system-root)))
      (not (extract-archive (merge-pathnames "site-lisp/inst/archive/TreeView030915.lzh" (si:system-root)) (merge-pathnames "site-lisp" (si:system-root)) "TreeView.l"))
      (not (extract-archive (merge-pathnames "site-lisp/inst/archive/TreeView030915.lzh" (si:system-root)) (si:system-root) "TreeView.dll")))
    )

(ni::add-installed-files
 '("site-lisp/TreeView.l"
   "TreeView.dll")
 )

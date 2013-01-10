(load-library "ruby-mode")
(pushnew '("\\.rb$" . ruby-mode) *auto-mode-alist* :test 'equal)

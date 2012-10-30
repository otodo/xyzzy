;;; my-ttray.l: 俺的 ttray

(provide "my-ttray")

; winapi
(in-package "winapi")

(*define-dll-entry HANDLE LoadImage (HINSTANCE LPCSTR UINT int int UINT) "user32" "LoadImageA")

(*define IMAGE_ICON       1)
(*define LR_DEFAULTCOLOR  #x0000)
(*define LR_LOADFROMFILE  #x0010)
(*define SM_CXSMICON      49)
(*define SM_CYSMICON      50)


; win-user
(in-package "win-user")

; setup routine
; 元あるヤツを書き換えてます
(defun ttray-setup ()
  ; icon
  (unless (or *ttray-icon-show*
              *ttray-icon-hide*)
    (flet ((loadicon (i)
             (LoadImage (GetModuleHandle 0)
                        (MAKEINTRESOURCE i)
                        IMAGE_ICON
                        (GetSystemMetrics SM_CXSMICON)
                        (GetSystemMetrics SM_CYSMICON)
                        LR_DEFAULTCOLOR)))
      (unless *ttray-icon-show*
        (setq *ttray-icon-show* (loadicon IDI_FILER)))
      (unless *ttray-icon-hide*
        (setq *ttray-icon-hide* (loadicon IDI_XYZZY)))))
  ; window
  (setq *ttray-wc* (make-WNDCLASS))
  (setf (WNDCLASS-style *ttray-wc*) 0)
  (setf (WNDCLASS-lpfnWndProc *ttray-wc*) #'ttray-wndproc)
  (setf (WNDCLASS-cbClsExtra *ttray-wc*) 0)
  (setf (WNDCLASS-cbWndExtra *ttray-wc*) 0)
  (setf (WNDCLASS-hInstance *ttray-wc*) (GetModuleHandle 0))
  (setf (WNDCLASS-hIcon *ttray-wc*) (LoadIcon 0 (MAKEINTRESOURCE IDI_APPLICATION)))
  (setf (WNDCLASS-hCursor *ttray-wc*) (LoadCursor 0 (MAKEINTRESOURCE IDC_ARROW)))
  (setf (WNDCLASS-hbrBackground *ttray-wc*) (+ 1 COLOR_WINDOW))
  (setf (WNDCLASS-lpszMenuName *ttray-wc*) 0)
  (setf (WNDCLASS-lpszClassName *ttray-wc*) (si:make-string-chunk *ttray-class*))
  (RegisterClass *ttray-wc*)
  (setq *ttray-hwnd*
        (CreateWindow (si:make-string-chunk *ttray-class*)
                      (si:make-string-chunk "XyzzyTTrayWindow")
                      0
                      CW_USEDEFAULT CW_USEDEFAULT
                      CW_USEDEFAULT CW_USEDEFAULT
                      0 0 (GetModuleHandle 0) 0))
  (UpdateWindow *ttray-hwnd*)
  (let ((msg (make-MSG))
        (break-loop nil))
    (declare (special break-loop)))
  ; popup menu
  (ttray-build-popup-menu)
  ; icon
  (setq *ttray-icon* (make-NOTIFYICONDATA))
  (setf (NOTIFYICONDATA-cbSize *ttray-icon*)
        (si:chunk-size *ttray-icon*))
  (setf (NOTIFYICONDATA-hWnd *ttray-icon*)
        *ttray-hwnd*)
  (setf (NOTIFYICONDATA-uID *ttray-icon*) 0)
  (setf (NOTIFYICONDATA-uFlags *ttray-icon*)
        (logior NIF_ICON
                NIF_MESSAGE
                NIF_TIP))
  (setf (NOTIFYICONDATA-uCallbackMessage *ttray-icon*) WM_TTRAY_NOTIFY)
  (setf (NOTIFYICONDATA-hIcon *ttray-icon*) *ttray-icon-show*)
  (si:pack-string *ttray-icon*
                  (c-struct-offset-of NOTIFYICONDATA winapi::szTip)
                  *ttray-tip* 64)
  (Shell_NotifyIcon NIM_ADD *ttray-icon*))

; hide xyzzy
; 元あるヤツを書き換えてます
(defun ttray-hide-xyzzy ()
  (if (and *ttray-status*
           (ed::run-hook-with-args-while-success '*ttray-hide-hook*))
      (let ((hwnd (ed::get-window-handle)))
        (setq *ttray-status* nil)
        (if (zerop (IsIconic hwnd))
            (ShowWindow hwnd SW_MINIMIZE))
        (ShowWindow hwnd SW_HIDE)
        (ttray-change-icon :tip *ttray-tip* :icon-hide *ttray-icon-hide*))))


; user
(in-package "user")

(flet ((loadicon (ico)
         (setq ico
               (map-slash-to-backslash (merge-pathnames ico
                                                        (si:system-root))))
         (win-user::LoadImage 0
                              (si:make-string-chunk ico)
                              win-user::IMAGE_ICON
                              (win-user::GetSystemMetrics win-user::SM_CXSMICON)
                              (win-user::GetSystemMetrics win-user::SM_CYSMICON)
                              win-user::LR_LOADFROMFILE)))
  (defun ttray-set-icon-show (ico)
    "ttray: xyzzy 表示時の通知領域に表示するアイコンファイルを設定する"
    (setq win-user::*ttray-icon-show* (loadicon ico)))
  (defun ttray-set-icon-hide (ico)
    "ttray: xyzzy 非表示時の通知領域に表示するアイコンファイルを設定する"
    (setq win-user::*ttray-icon-hide* (loadicon ico))))

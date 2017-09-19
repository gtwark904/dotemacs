;; Throw temp files into the system $TEMPDIR
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; TODO: Make this platform independent 
;; Load some more "private" settings
(org-babel-load-file "~/../../Nextcloud/org/.private.org")

;; TODO: Make this platform independent 
;; Set default directory
(cd (concat "c:/Users/" user-login-name "/"))
(setq inhibit-startup-message t)        ; We must disable the startup message
					; for this to work as desired.




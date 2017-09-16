;; Throw temp files into the system $TEMPDIR
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; TODO: Make this platform independent 
;; Load some more "private" settings
(org-babel-load-file "~/../../Nextcloud/org/.private.org")

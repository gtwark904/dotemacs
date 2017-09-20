;;; init.el --- The first thing GNU Emacs runs

;; Do NOT run garbage collection during startup!
;; We do this by setting the value insanely high. 
;; NOTE: This is reverted at the end of the file.
(setq gc-cons-threshold 999999999)
(message "gc-cons-threshold temporarily set to %S"
	 gc-cons-threshold)

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

;; Revert garbage colletion behaviour back to a more normal, modern value
(run-with-idle-timer 5 nil (lambda ()
			     (setq gc-cons-threshold 200000)
			     (message "gc-cons-threshold restored to %S"
				      gc-cons-threshold)))

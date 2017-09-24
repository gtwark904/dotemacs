;;; init.el --- The first thing GNU Emacs runs

;; Do NOT run garbage collection during startup!
;; We do this by setting the value insanely high. 
;; NOTE: This is reverted at the end of the file.
(setq gc-cons-threshold 999999999)
(message "gc-cons-threshold temporarily set to %S"
	 gc-cons-threshold)

;; Ignore default REGEXP checks at startup
;; NOTE: This drastically improves `emacs-init-time'
(let ((file-name-handler-alist nil)) 

  ;; TODO: Make this platform independent 
  ;; Set up package.el for use with MELPA
  (require 'package)
  (setq package-enable-at-startup nil)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize)

  ;; Bootstrap use-package
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  ;; Reduce load time
  (eval-when-compile
    (require 'use-package))
  (require 'diminish) ; used to hide modeline strings
  (require 'bind-key) ; simplifies how you set keybindings
  ;; Install packages automatically if not already present on the system
  (setq use-package-always-ensure t)

  ;; TODO: Make this less absolute
  ;; Load the rest of my configuration
  (org-babel-load-file "~/.emacs.d/geoff.org")
  
  ;; TODO: Make this platform independent 
  ;; Load some more "private" settings
  (org-babel-load-file "~/../../Nextcloud/org/.private.org")
  
  ;; Revert garbage colletion behaviour back to a more normal, modern value
  (run-with-idle-timer 5 nil (lambda ()
			       (setq gc-cons-threshold 200000)
			       (message "gc-cons-threshold restored to %S"
					gc-cons-threshold))))

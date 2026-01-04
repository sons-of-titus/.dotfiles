;;; init.el --- Main Entry Point


;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t
      use-package-always-defer t)

;; macOS specific settings
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta
	    mac-command-modifier 'super))

;; Enable mouse support in terminal and GUI
(xterm-mouse-mode 1)

;; Enable mouse wheel scrolling
(mouse-wheel-mode 1)

;; Make mouse clicks work for selecting text
(setq mouse-drag-copy-region t)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

;; Better scrolling behavior
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; Enable pixel-precise scrolling (Emacs 29+)
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode 1))

;; Enable context menu on right-click (Emacs 28+)
(when (fboundp 'context-menu-mode)
  (context-menu-mode 1))

;; Add modules directory to load path
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

;; Load modules
(require 'core)
(require 'ui)
(require 'editing)
(require 'completion)
(require 'programming)
(require 'languages)
(require 'keybindings)

;; Custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Reset GC threshold after startup
(add-hook 'emacs-startup-hook
	      (lambda ()
	        (setq gc-cons-threshold (* 16 1024 1024)
		          gc-cons-percentage 0.1)))

(provide 'init)
;;; init.el ends here

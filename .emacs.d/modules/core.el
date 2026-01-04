
;;; modules/core.el --- Core settings

;; Basic settings
(setq-default
 ;; Performance
 read-process-output-max (* 1024 1024)

 ;; Files
 auto-save-default nil
 make-backup-files nil
 create-lockfiles nil

 ;; Editing
 indent-tabs-mode nil
 tab-width 4
 fill-column 100
 sentence-end-double-space nil

 ;; Scrolling
 scroll-margin 3
 scroll-conservatively 101
 scroll-preserve-screen-position t

 ;; Misc
 ring-bell-function 'ignore
 use-short-answers t
 confirm-kill-emacs 'y-or-n-p)

;; UTF-8 everywhere
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

;; Enable useful features
(global-auto-revert-mode 1)
(delete-selection-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(recentf-mode 1)

;; Electric pair mode
(electric-pair-mode 1)

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Better defaults
(setq recentf-max-saved-items 100
      save-place-file (expand-file-name "places" user-emacs-directory)
      savehist-file (expand-file-name "history" user-emacs-directory))

(provide 'core)

;;; core.el ends here

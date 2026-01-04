;;; early-init.el --- Early Initialization

;; Disable package.el in favor of straight.

(setq package-enable-at-startup nil)


;; Increase garbage collection threshold during startup to speed things up
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)


;; Prevent the specific GUI elements from appearing at all
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Ignore X resources
(advice-add #'x-apply-session-resources :override #'ignore)

;; Resizing the Emacs frame can be expensive during startup
(setq frame-inhibit-implied-resize t)

;;; early-init.el ends here

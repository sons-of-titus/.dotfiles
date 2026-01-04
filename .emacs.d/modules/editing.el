;;; modules/editing.el --- Editing experience

;; Which-key
(use-package which-key
  :demand t
  :config
  (setq which-key-idle-delay 0.5
        which-key-popup-type 'side-window
        which-key-side-window-location 'bottom)
  (which-key-mode 1))

;; Multiple cursors
(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(defun copy-to-clipboard ()
  (interactive)
  (if (region-active-p)
      (progn
        (shell-command-on-region (region-beginning) (region-end) "pbcopy")
        (message "Copied to clipboard"))
    (message "No region active")))

(global-set-key (kbd "M-W") 'copy-to-clipboard)

;; Expand region
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; Move lines
(use-package move-text
  :config
  (move-text-default-bindings))

;; Smartparens
(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config))

;; Better undo
(use-package undo-tree
  :config
  (setq undo-tree-history-directory-alist
        `(("." . ,(expand-file-name "undo-tree-hist" user-emacs-directory))))
  (global-undo-tree-mode 1))

;; Aggressive indent
(use-package aggressive-indent
  :hook ((emacs-lisp-mode . aggressive-indent-mode)
         (lisp-mode . aggressive-indent-mode)))

(provide 'editing)

;;; editing,el ends here

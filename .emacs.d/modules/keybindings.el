;;; modules/keybindings.el --- Custom keybindings

;;; Code:

;; Global bindings
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-c e") 'eshell)
(global-set-key (kbd "C-c t") 'ansi-term)

;; Window management (using C-c w prefix to avoid conflicts)
(global-set-key (kbd "C-c w h") 'windmove-left)
(global-set-key (kbd "C-c w j") 'windmove-down)
(global-set-key (kbd "C-c w k") 'windmove-up)
(global-set-key (kbd "C-c w l") 'windmove-right)

;; Buffer management
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-c C-k") 'kill-buffer-and-window)

;; Quick config access
(defun find-config ()
  "Open init.el."
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

(global-set-key (kbd "C-c i") 'find-config)

;; Comment/uncomment
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)

;; Easier window splitting
(global-set-key (kbd "C-c v") 'split-window-right)
(global-set-key (kbd "C-c h") 'split-window-below)

(provide 'keybindings)
;;; keybindings.el ends here

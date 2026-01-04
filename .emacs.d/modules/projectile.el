;;; projectile-config.el --- Projectile configuration -*- lexical-binding: t -*-

;;; Commentary:
;; Configuration for Projectile

;;; Code:

;; Projectile is already installed, just configure it
(require 'projectile)

;; Enable Projectile globally
(projectile-mode +1)

;; Keybinding prefix
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Performance settings
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)
(setq projectile-mode-line-prefix " Proj")

(provide 'projectile-config)
;;; projectile-config.el ends here

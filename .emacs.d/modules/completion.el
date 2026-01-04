;;; modules/completion.el --- Completion framework -*- lexical-binding: t -*-
;;; Commentary:
;; Modern completion with vertico and friends
;;; Code:

;; Vertico - vertical completion UI
(use-package vertico
  :demand t
  :config
  (setq vertico-cycle t
        vertico-resize t)
  (vertico-mode 1))

;; Orderless - flexible matching
(use-package orderless
  :demand t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia - rich annotations
(use-package marginalia
  :demand t
  :config
  (marginalia-mode 1))

;; Consult - enhanced commands
(use-package consult
  :bind (("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x r b" . consult-bookmark)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ("C-c s" . consult-ripgrep)
         ;; Projectile integration
         ("C-c p f" . consult-projectile-find-file)
         ("C-c p s" . consult-projectile-ripgrep)
         ("C-c p b" . consult-projectile-buffer))
  :config
  ;; Projectile-specific consult commands
  (defun consult-projectile-find-file ()
    "Find file in current project using consult."
    (interactive)
    (if (projectile-project-p)
        (consult--read
         (projectile-project-files (projectile-acquire-root))
         :prompt "Project file: "
         :sort t
         :require-match t
         :category 'file
         :state (consult--file-preview)
         :history 'file-name-history
         :lookup (lambda (selected &rest _)
                   (if selected
                       (expand-file-name selected (projectile-acquire-root))
                     nil)))
      (consult-find)))

  (defun consult-projectile-ripgrep ()
    "Search in current project using ripgrep."
    (interactive)
    (if (projectile-project-p)
        (consult-ripgrep (projectile-acquire-root))
      (consult-ripgrep)))

  (defun consult-projectile-buffer ()
    "Switch to project buffer using consult."
    (interactive)
    (if (projectile-project-p)
        (consult-buffer '((consult--source-projectile-buffer)))
      (consult-buffer)))

  ;; Add projectile buffers source for consult-buffer
  (defvar consult--source-projectile-buffer
    `(:name "Project Buffer"
      :narrow ?p
      :hidden t
      :category buffer
      :face consult-buffer
      :history buffer-name-history
      :state ,#'consult--buffer-state
      :items ,(lambda ()
                (when (projectile-project-p)
                  (mapcar #'buffer-name
                          (projectile-project-buffers))))))

  ;; Optionally integrate project buffers into default consult-buffer
  (add-to-list 'consult-buffer-sources 'consult--source-projectile-buffer t))

;; Embark - contextual actions
(use-package embark
  :bind (("C-." . embark-act)
         ("M-." . embark-dwim)
         ("C-h B" . embark-bindings)))

(use-package embark-consult
  :after (embark consult))

;; Company - in-buffer completion
(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.1
        company-selection-wrap-around t
        company-tooltip-align-annotations t
        company-frontends '(company-pseudo-tooltip-frontend
                           company-echo-metadata-frontend))
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("TAB" . company-complete-selection)
              ("<tab>" . company-complete-selection)
              ("RET" . nil)  ;; Don't override RET
              ("<return>" . nil))  ;; Don't override Return
         (:map company-search-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)))

(provide 'completion)
;;; completion.el ends here


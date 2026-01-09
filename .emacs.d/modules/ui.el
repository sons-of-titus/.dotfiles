;;; modules/ui.el --- UI/Appearance

;;; Code:

;; Disable startup screen
(setq inhibit-startup-screen t
      initial-scratch-message nil)

;; Kill startup buffers on startup
(defun my/kill-startup-buffers ()
  "Kill scratch and messages buffers on startup."
  (when (get-buffer "*scratch*")
    (kill-buffer "*scratch*"))
  (when (get-buffer "*straight-process*")
    (kill-buffer "*straight-process*")))

(add-hook 'emacs-startup-hook #'my/kill-startup-buffers)

;; Frame title
(setq frame-title-format '("%b – Emacs"))

;; Clean UI - remove clutter
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)  ; Disable bell

;; Smooth scrolling
(setq scroll-margin 3
      scroll-conservatively 101
      scroll-preserve-screen-position t
      auto-window-vscroll nil
      fast-but-imprecise-scrolling t
      scroll-step 1)

;; Better line wrapping
(global-visual-line-mode 1)

;; Line numbers - optimized
(setq-default display-line-numbers-width 3
              display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

;; Show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0
      show-paren-style 'mixed)

;; Highlight current line
(global-hl-line-mode 1)

;; Better tabs with centaur-tabs
(use-package centaur-tabs
  :demand t
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "bar"
        centaur-tabs-height 32
        centaur-tabs-set-icons t
        centaur-tabs-set-modified-marker t
        centaur-tabs-modified-marker "●"
        centaur-tabs-close-button "×"
        centaur-tabs-set-bar 'under
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-cycle-scope 'tabs)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  ("C-c t g" . centaur-tabs-counsel-switch-group))

(setq x-underline-at-descent-line t)

;; Theme
(use-package doom-themes
  :demand t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; Modeline
(use-package doom-modeline
  :demand t
  :config
  (setq doom-modeline-height 30
        doom-modeline-bar-width 4
        doom-modeline-buffer-file-name-style 'truncate-with-project
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-minor-modes nil
        doom-modeline-buffer-encoding nil
        doom-modeline-vcs-max-length 20
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t)
  :hook (after-init . doom-modeline-mode))

;; Icons
(use-package nerd-icons
  :demand t)

(use-package all-the-icons
  :if (display-graphic-p))

;; Dired with nerd-icons
(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

;; Ibuffer with nerd-icons
(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

;; Completion UI with nerd-icons
(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

;; Better file navigation with dirvish (modern dired replacement)
(use-package dirvish
  :init
  (dirvish-override-dired-mode)
  :custom
  (dirvish-quick-access-entries
   '(("h" "~/" "Home")
     ("d" "~/Downloads/" "Downloads")
     ("p" "~/Projects/" "Projects")
     ("c" "~/.config/" "Config")))
  :config
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index))
        dirvish-attributes
        '(nerd-icons file-time file-size collapse subtree-state vc-state git-msg)
        delete-by-moving-to-trash t
        dired-listing-switches "-al --group-directories-first"
        dired-mouse-drag-files t)
  :bind
  (("C-c f" . dirvish-fd)
   :map dirvish-mode-map
   ("a"   . dirvish-quick-access)
   ("f"   . dirvish-file-info-menu)
   ("y"   . dirvish-yank-menu)
   ("N"   . dirvish-narrow)
   ("^"   . dirvish-history-last)
   ("h"   . dirvish-history-jump)
   ("s"   . dirvish-quicksort)
   ("v"   . dirvish-vc-menu)
   ("TAB" . dirvish-subtree-toggle)
   ("M-f" . dirvish-history-go-forward)
   ("M-b" . dirvish-history-go-backward)
   ("M-l" . dirvish-ls-switches-menu)
   ("M-m" . dirvish-mark-menu)
   ("M-t" . dirvish-layout-toggle)
   ("M-s" . dirvish-setup-menu)
   ("M-e" . dirvish-emerge-menu)
   ("M-j" . dirvish-fd-jump)))

;; Dashboard - better startup screen
(use-package dashboard
  :demand t
  :config
  (setq dashboard-startup-banner 'logo
        dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-items '((recents  . 8)
                          (projects . 8)
                          (bookmarks . 5))
        dashboard-set-navigator t
        dashboard-set-init-info t
        dashboard-projects-backend 'project-el
        dashboard-icon-type 'nerd-icons
        dashboard-display-icons-p t
        dashboard-set-footer nil)
  (dashboard-setup-startup-hook))

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Highlight TODO keywords
(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("HACK"   . "#FF8C00")
          ("NOTE"   . "#1E90FF")
          ("DEPRECATED" . "#8B008B")
          ("BUG"    . "#FF1493")
          ("XXX"    . "#FF4500"))))

;; Indent guides
(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-responsive 'top
        highlight-indent-guides-auto-enabled nil
        highlight-indent-guides-auto-character-face-perc 20))

;; Better window dividers
(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(window-divider-mode 1)

;; Ligatures support
(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode 
                          '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                            ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                            "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                            "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                            "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                            "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                            "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                            "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                            ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                            "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                            "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                            "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                            "\\\\" "://"))
  (global-ligature-mode t))

;; Dimmer - dim inactive windows
(use-package dimmer
  :config
  (setq dimmer-fraction 0.25
        dimmer-adjustment-mode :foreground
        dimmer-use-colorspace :rgb)
  (dimmer-mode t))

;; Which-key - show available keybindings
(use-package which-key
  :demand t
  :config
  (setq which-key-idle-delay 0.5
        which-key-popup-type 'side-window
        which-key-side-window-location 'bottom
        which-key-side-window-max-height 0.25
        which-key-sort-order 'which-key-key-order-alpha
        which-key-allow-imprecise-window-fit nil)
  (which-key-mode 1))

;; Beacon - highlight cursor on window switch
(use-package beacon
  :config
  (setq beacon-blink-when-window-scrolls t
        beacon-blink-when-window-changes t
        beacon-blink-when-point-moves-vertically 10
        beacon-blink-delay 0.3
        beacon-blink-duration 0.3)
  (beacon-mode 1))

;; Better help buffers
(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key)
  ([remap describe-command] . helpful-command))

;; Improve window selection
(use-package ace-window
  :bind ("M-o" . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-scope 'frame
        aw-background t))

;; Better buffer switching
(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x 5 b" . consult-buffer-other-frame)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g i" . consult-imenu)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s r" . consult-ripgrep)
         ("M-s f" . consult-find))
  :config
  (setq consult-narrow-key "<"
        consult-preview-key 'any))

;; Vertico for better completion
(use-package vertico
  :init
  (vertico-mode)
  :config
  (setq vertico-cycle t
        vertico-resize t
        vertico-count 15))

;; Orderless for flexible matching
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Marginalia for rich annotations
(use-package marginalia
  :init
  (marginalia-mode)
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle)))

;; Embark for contextual actions
(use-package embark
  :bind
  (("C-." . embark-act)
   ("M-." . embark-dwim)
   ("C-h B" . embark-bindings))
  :config
  (setq embark-quit-after-action nil))

(use-package embark-consult
  :after (embark consult))

;; Font configuration for daemon mode
(defun my/setup-fonts ()
  "Setup fonts - works with daemon mode."
  (when (display-graphic-p)
    (set-face-attribute 'default nil
                        :family "Monaco Nerd Font"
                        :height 120)
    (set-face-attribute 'fixed-pitch nil
                        :family "Monaco Nerd Font"
                        :height 120)
    (set-face-attribute 'variable-pitch nil
                        :family "Monaco Nerd Font"
                        :height 120)))

;; Apply fonts correctly for both daemon and normal mode
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (my/setup-fonts))))
  (my/setup-fonts))

;; Also set default-frame-alist for new frames
(add-to-list 'default-frame-alist '(font . "Monaco Nerd Font-12"))

;; Better window management
(setq split-width-threshold 160
      split-height-threshold nil
      window-combination-resize t)

;; Enable transparency (optional - comment out if not desired)
;; (set-frame-parameter nil 'alpha-background 95)
;; (add-to-list 'default-frame-alist '(alpha-background . 95))

(provide 'ui)
;;; ui.el ends here

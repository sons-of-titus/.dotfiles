;; [[file:config.org::*Leader Keys][Leader Keys:1]]
(setq doom-localleader-key ","
      doom-localleader-alt-key "M-,")
;; Leader Keys:1 ends here

;; [[file:config.org::*Fonts][Fonts:1]]
;; Cross-platform font configuration with fallbacks
(setq doom-font (font-spec :family (cond
                                     ((find-font (font-spec :family "Monaco Nerd Font")) "Monaco Nerd Font")
                                     ((find-font (font-spec :family "JetBrains Mono")) "JetBrains Mono")
                                     ((find-font (font-spec :family "Consolas")) "Consolas")
                                     (t "Monospace"))
                           :size (if (eq system-type 'darwin) 15 14))
      doom-variable-pitch-font (font-spec :family (cond
                                                    ((find-font (font-spec :family "FiraCode Nerd Font")) "FiraCode Nerd Font")
                                                    ((find-font (font-spec :family "Fira Sans")) "Fira Sans")
                                                    (t "Sans Serif"))
                                          :size (if (eq system-type 'darwin) 15 14))
      doom-big-font (font-spec :family (cond
                                         ((find-font (font-spec :family "JetBrains Mono Nerd Font")) "JetBrains Mono Nerd Font")
                                         ((find-font (font-spec :family "JetBrains Mono")) "JetBrains Mono")
                                         (t "Monospace"))
                               :size (if (eq system-type 'darwin) 20 18)))
;; Fonts:1 ends here

;; [[file:config.org::*Theme and Display][Theme and Display:1]]
;; Gruvbox - Warm, retro theme with earthy tones
;; Alternatives: doom-gruvbox-light (light version)
(setq doom-theme 'doom-one)

;; Relative line numbers for efficient vim motions
(setq display-line-numbers-type 'relative)

;; Premium UI settings
(setq
 ;; Window and frame settings
 frame-title-format '("" "%b — Doom Emacs")
 icon-title-format frame-title-format
 ;; Better line spacing for readability
 line-spacing 0.12
 ;; NOTE: Cursor settings are in the Premium Cursor section
 ;; Smooth scrolling behavior
 mouse-wheel-scroll-amount '(2 ((shift) . 5) ((control) . nil))
 mouse-wheel-progressive-speed nil
 scroll-margin 0  ;; Must be 0 for ultra-scroll
 ;; Better fringe indicators
 indicate-buffer-boundaries 'left
 indicate-empty-lines t
 ;; Window sizing
 window-resize-pixelwise t
 frame-resize-pixelwise t)

;; Transparency (works on macOS and Linux with compositing)
;; Set to 98 for subtle effect, lower for more transparent
(when (display-graphic-p)
  (set-frame-parameter nil 'alpha-background 98)
  (add-to-list 'default-frame-alist '(alpha-background . 98)))

;; Enable pixel-perfect smooth scrolling (Emacs 29+)
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode 1))

;; Highlight current line with better visibility
(after! hl-line
  (setq hl-line-sticky-flag nil
        global-hl-line-sticky-flag nil))

;; Premium modeline configuration
(after! doom-modeline
  (setq doom-modeline-height 32
        doom-modeline-time nil
        doom-modeline-display-default-persp-name nil))

;; Solaire mode - visually distinguish real buffers from popups/sidebars
(after! solaire-mode
  (solaire-global-mode +1))

;; Better window dividers - subtle and clean
(after! frame
  (setq window-divider-default-right-width 2
        window-divider-default-bottom-width 2
        window-divider-default-places t)
  (window-divider-mode 1))

;; Indent guides with subtle styling
(after! highlight-indent-guides
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-character ?│
        highlight-indent-guides-responsive 'top))

;; Better treemacs styling
(after! treemacs
  (setq treemacs-width 35
        treemacs-position 'left
        treemacs-indentation 1))
;; Theme and Display:1 ends here

;; [[file:config.org::*Org Directory][Org Directory:1]]
(setq org-directory "~/org/")
;; Org Directory:1 ends here

;; [[file:config.org::*Environment Variables][Environment Variables:1]]
(setenv "PAGER" "less")
;; Environment Variables:1 ends here

;; [[file:config.org::*PATH from Shell][PATH from Shell:1]]
;; Only load PATH when a programming mode is activated (saves startup time)
;; PATH from Shell:1 ends here

;; [[file:config.org::*Dashboard Configuration][Dashboard Configuration:1]]
(setq fancy-splash-image (concat doom-private-dir "emacs.svg"))
;; Dashboard Configuration:1 ends here

;; [[file:config.org::*Spell Checking][Spell Checking:1]]
;; Cross-platform spell checking configuration
(after! spell
  ;; Use aspell if available (more portable), else hunspell
  (setq ispell-program-name (cond
                              ((executable-find "aspell") "aspell")
                              ((executable-find "hunspell") "hunspell")
                              (t "ispell")))
  (when (string= ispell-program-name "hunspell")
    (setq ispell-dictionary "en_US"
          ispell-local-dictionary "en_US"
          ispell-local-dictionary-alist
          '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))))
  (when (string= ispell-program-name "aspell")
    (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))
;; Spell Checking:1 ends here

;; [[file:config.org::*Search Behavior][Search Behavior:1]]
(after! evil
  ;; Use smart case search (case-insensitive unless uppercase)
  (setq evil-search-module 'evil-search
        evil-ex-search-case 'smart
        evil-ex-substitute-global nil
        evil-ex-substitute-case 'smart
        ;; Better visual feedback
        evil-ex-visual-char-range t
        ;; Incremental search highlighting
        evil-ex-search-highlight-all t
        ;; Better undo behavior
        evil-want-fine-undo t
        ;; Keep visual selection after indent
        evil-indent-convert-tabs nil
        ;; Better word boundaries
        evil-symbol-word-search t))
;; Search Behavior:1 ends here

;; [[file:config.org::*Visual Line Navigation][Visual Line Navigation:1]]
(after! evil
  (setq evil-respect-visual-line-mode t))
;; Visual Line Navigation:1 ends here

;; [[file:config.org::*Visual Block Editing][Visual Block Editing:1]]
(after! evil
  (setq evil-visual-block-fill-column nil))
;; Visual Block Editing:1 ends here

;; [[file:config.org::*Evil Escape][Evil Escape:1]]
(after! evil-escape
  (setq evil-escape-key-sequence "jk"
        evil-escape-delay 0.2))
;; Evil Escape:1 ends here

;; [[file:config.org::*Insert Mode Navigation][Insert Mode Navigation:1]]
;; Keep Evil defaults for C-a, C-e, RET, C-z
;; Only add useful insert mode utilities
(map! :i "C-w" #'evil-delete-backward-word
      :i "C-u" #'evil-delete-back-to-indentation)
;; Insert Mode Navigation:1 ends here

;; [[file:config.org::*Code Navigation][Code Navigation:1]]
;; gd is Doom's default for definitions, gx opens URLs (preserved)
;; Using gD for xref definitions (uppercase), gr for references
(map! :n "gD" #'xref-find-definitions
      :n "gr" #'xref-find-references)
;; Code Navigation:1 ends here

;; [[file:config.org::*Move Lines and Regions][Move Lines and Regions:1]]
;; Use drag-stuff package instead of custom functions (~60 lines saved)
(use-package! drag-stuff
  :defer t
  :init
  (map! :n "M-j" #'drag-stuff-down
        :n "M-k" #'drag-stuff-up
        :n "M-<down>" #'drag-stuff-down
        :n "M-<up>" #'drag-stuff-up
        :v "M-j" #'drag-stuff-down
        :v "M-k" #'drag-stuff-up
        :v "M-<down>" #'drag-stuff-down
        :v "M-<up>" #'drag-stuff-up)
  :config
  (drag-stuff-global-mode 1)
  (with-eval-after-load 'evil
    (drag-stuff-define-keys)))
;; Move Lines and Regions:1 ends here

;; [[file:config.org::*Error Navigation][Error Navigation:1]]
;; Using flymake (eglot uses flymake, not flycheck)
(map! :n "]e" #'flymake-goto-next-error
      :n "[e" #'flymake-goto-prev-error
      :n "]d" #'flymake-show-buffer-diagnostics
      :n "[d" #'flymake-show-project-diagnostics)
;; Error Navigation:1 ends here

;; [[file:config.org::*Macro Execution][Macro Execution:1]]
(map! :n "Q" #'evil-execute-macro)
;; Macro Execution:1 ends here

;; [[file:config.org::*Code Evaluation][Code Evaluation:1]]
(map! :leader
      :desc "Eval buffer"    "e b" #'eval-buffer
      :desc "Eval region"     "e r" #'eval-region
      :desc "Eval last sexp"  "e l" #'eval-last-sexp)
;; Code Evaluation:1 ends here

;; [[file:config.org::*LSP Integration][LSP Integration:1]]
;; Using eglot as configured in init.el (+eglot flag)
(after! eglot
  (setq eglot-autoshutdown t
        eglot-confirm-server-initiated-edits nil
        eglot-extend-to-xref t)
  ;; Rename binding
  (map! :n "gR" #'eglot-rename)

  ;; Consolidated Server Configuration
  ;; --------------------------------
  ;; Go - gopls
  (add-to-list 'eglot-server-programs
               '(go-mode . ("gopls" :initializationOptions
                            (:hints (:parameterNames t
                                     :constantValues t
                                     :compositeLiteralTypes t
                                     :compositeLiteralFields t
                                     :functionTypeParameters t
                                     :rangeVariableTypes t
                                     :assignVariableTypes t)
                             :usePlaceholders t
                             :staticcheck t
                             :vulncheck "Imports"
                             :gofumpt t
                             :analyses (:nilness t
                                        :unusedparams t
                                        :unusedwrite t
                                        :useany t)))))

  ;; Fix for file-notify-error: "no file descriptor left"
  (setq file-notify-method 'kqueue)  ;; Use kqueue on macOS for better performance/limits

  ;; Zig - zls
  (add-to-list 'eglot-server-programs
               '(zig-mode . ("zls" :initializationOptions
                             (:enable_snippets t
                              :enable_ast_check_diagnostics t
                              :enable_autofix t
                              :enable_import_embedfile_argument_completions t
                              :enable_semantic_tokens t
                              :enable_inlay_hints t
                              :inlay_hints_show_parameter_names t
                              :inlay_hints_show_variable_type_hints t
                              :operator_completions t
                              :warn_style t
                              :include_at_in_builtins t))))

  ;; Python - pyright
  (add-to-list 'eglot-server-programs
               '(python-mode . ("pyright-langserver" "--stdio"
                                :initializationOptions
                                (:python (:analysis (:autoImportCompletions t
                                                     :diagnosticMode "workspace"
                                                     :typeCheckingMode "basic"
                                                     :useLibraryCodeForTypes t))))))

  ;; Rust - rust-analyzer
  (add-to-list 'eglot-server-programs
               '(rustic-mode . ("rust-analyzer" :initializationOptions
                                (:checkOnSave (:command "clippy")
                                 :cargo (:allFeatures t)
                                 :procMacro (:enable t)
                                 :inlayHints (:parameterHints (:enable t)
                                              :typeHints (:enable t)
                                              :chainingHints (:enable t))))))

  ;; C/C++ - clangd
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode) . ("clangd"
                                      "--background-index"
                                      "--clang-tidy"
                                      "--completion-style=detailed"
                                      "--header-insertion=iwyu"
                                      "--suggest-missing-includes")))

  ;; Angular - ngserver
  (add-to-list 'eglot-server-programs
               '((ng2-html-mode ng2-ts-mode) . ("ngserver" "--stdio" "--tsProbeLocations" "" "--ngProbeLocations" ""))))
;; LSP Integration:1 ends here

;; [[file:config.org::*DAP (Debug Adapter Protocol) Configuration][DAP (Debug Adapter Protocol) Configuration:1]]
(after! dap-mode
  ;; Enable all UI features
  (setq dap-auto-configure-features '(sessions locals breakpoints expressions controls tooltip)
        dap-ui-controls-mode t
        dap-ui-show-many-frames t
        dap-ui-buttons-mode t
        dap-breakpoints-file (expand-file-name "dap-breakpoints" doom-cache-dir)
        ;; Inline variable values in source buffer
        dap-auto-show-output t
        dap-output-window-min-height 10
        dap-output-window-max-height 20
        ;; Tooltip on hover
        dap-tooltip-echo-area nil)

  ;; Auto-load debug adapter modules
  (require 'dap-python nil t)
  (require 'dap-node nil t)
  (require 'dap-go nil t)
  (require 'dap-lldb nil t)
  (require 'dap-gdb-lldb nil t)

  ;; Better faces for breakpoints
  (custom-set-faces!
    '(dap-ui-pending-breakpoint-face :foreground "#d19a66" :weight bold)
    '(dap-ui-verified-breakpoint-face :foreground "#e06c75" :weight bold)))
;; DAP (Debug Adapter Protocol) Configuration:1 ends here

;; [[file:config.org::*LLDB Configuration][LLDB Configuration:1]]
(after! dap-lldb
  ;; Cross-platform LLDB executable detection
  (setq dap-lldb-debug-program
        (list (or (executable-find "lldb-vscode")
                  (executable-find "lldb-dap")
                  (when (eq system-type 'windows-nt) "C:/Program Files/LLVM/bin/lldb-vscode.exe")
                  "lldb-vscode")))
  
  ;; Common LLDB debug configurations
  (dap-register-debug-template
   "LLDB: Attach"
   (list :type "lldb"
         :request "attach"
         :name "LLDB::Attach"
         :program nil
         :pid "${command:pickProcess}"))
  
  (dap-register-debug-template
   "LLDB: Launch"
   (list :type "lldb"
         :request "launch"
         :name "LLDB::Launch"
         :program "${workspaceFolder}/${command:pickFile}"
         :args ""
         :cwd "${workspaceFolder}"))
  
  (dap-register-debug-template
   "LLDB: Launch (C/C++)"
   (list :type "lldb"
         :request "launch"
         :name "LLDB::Launch (C/C++)"
         :program "${workspaceFolder}/build/${fileBasenameNoExtension}"
         :args ""
         :cwd "${workspaceFolder}"
         :stopOnEntry nil))
  
  (dap-register-debug-template
   "LLDB: Launch (Rust)"
   (list :type "lldb"
         :request "launch"
         :name "LLDB::Launch (Rust)"
         :program "${workspaceFolder}/target/debug/${fileBasenameNoExtension}"
         :args ""
         :cwd "${workspaceFolder}"
         :stopOnEntry nil)))
;; LLDB Configuration:1 ends here

;; [[file:config.org::*DLV (Delve) Configuration for Go][DLV (Delve) Configuration for Go:1]]
(after! dap-go
  ;; Set DLV path (usually in PATH if installed via go install)
  ;; On Linux/macOS: ~/go/bin/dlv or /usr/local/bin/dlv
  ;; Can be customized if needed:
  ;; (setq dap-go-dlv-command-name "dlv")
  
  ;; Common DLV debug configurations
  (dap-register-debug-template
   "Delve: Attach"
   (list :type "go"
         :request "attach"
         :name "Delve::Attach"
         :mode "local"
         :processId "${command:pickProcess}"))
  
  (dap-register-debug-template
   "Delve: Launch (Current File)"
   (list :type "go"
         :request "launch"
         :name "Delve::Launch"
         :mode "debug"
         :program "${fileDirname}"
         :args ""
         :env nil
         :showLog t))
  
  (dap-register-debug-template
   "Delve: Launch (Package)"
   (list :type "go"
         :request "launch"
         :name "Delve::Launch (Package)"
         :mode "debug"
         :program "${workspaceFolder}"
         :args ""
         :env nil
         :showLog t))
  
  (dap-register-debug-template
   "Delve: Test (Current File)"
   (list :type "go"
         :request "launch"
         :name "Delve::Test"
         :mode "test"
         :program "${fileDirname}"
         :args ""
         :env nil
         :showLog t))
  
  (dap-register-debug-template
   "Delve: Test (Package)"
   (list :type "go"
         :request "launch"
         :name "Delve::Test (Package)"
         :mode "test"
         :program "${workspaceFolder}"
         :args ""
         :env nil
         :showLog t)))
;; DLV (Delve) Configuration for Go:1 ends here

;; [[file:config.org::*Python Debug Templates][Python Debug Templates:1]]
(after! dap-python
  (setq dap-python-debugger 'debugpy)
  (dap-register-debug-template
   "Python: Current File"
   (list :type "python"
         :request "launch"
         :name "Python::Current File"
         :program nil
         :args ""
         :cwd "${workspaceFolder}"))
  (dap-register-debug-template
   "Python: Pytest"
   (list :type "python"
         :request "launch"
         :name "Python::Pytest"
         :module "pytest"
         :args "${file}"
         :cwd "${workspaceFolder}"))
  (dap-register-debug-template
   "Python: Attach (Remote)"
   (list :type "python"
         :request "attach"
         :name "Python::Attach"
         :connect (list :host "localhost" :port 5678)
         :pathMappings (vector (list :localRoot "${workspaceFolder}"
                                     :remoteRoot ".")))))
;; Python Debug Templates:1 ends here

;; [[file:config.org::*Node.js Debug Templates][Node.js Debug Templates:1]]
(after! dap-node
  (dap-register-debug-template
   "Node: Current File"
   (list :type "node"
         :request "launch"
         :name "Node::Current File"
         :program "${file}"
         :cwd "${workspaceFolder}"))
  (dap-register-debug-template
   "Node: Attach"
   (list :type "node"
         :request "attach"
         :name "Node::Attach"
         :port 9229
         :restart t
         :sourceMaps t))
  (dap-register-debug-template
   "Node: Jest Current File"
   (list :type "node"
         :request "launch"
         :name "Node::Jest"
         :program "${workspaceFolder}/node_modules/.bin/jest"
         :args "--runInBand ${file}"
         :cwd "${workspaceFolder}"
         :console "integratedTerminal")))
;; Node.js Debug Templates:1 ends here

;; [[file:config.org::*VTerm Keybindings][VTerm Keybindings:1]]
(after! vterm
  (setq vterm-max-scrollback 10000)
  (map! :map vterm-mode-map
        :i "C-w" #'vterm-send-C-w
        :i "C-u" #'vterm-send-C-u
        :i "C-y" #'vterm-send-C-y))
;; VTerm Keybindings:1 ends here

;; [[file:config.org::*Better Indentation][Better Indentation:1]]
(setq-default tab-width 2
              indent-tabs-mode nil
              fill-column 80)
;; Better Indentation:1 ends here

;; [[file:config.org::*Aggressive Indent][Aggressive Indent:1]]
(use-package! aggressive-indent
  :config
  ;; Enable globally for programming modes
  (global-aggressive-indent-mode 1)

  ;; Exclude modes where it causes issues
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'python-mode)  ;; Python is whitespace-sensitive
  (add-to-list 'aggressive-indent-excluded-modes 'makefile-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'makefile-gmake-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'yaml-mode)
  (add-to-list 'aggressive-indent-excluded-modes 'snippet-mode)

  ;; Don't indent if it would change the line
  (setq aggressive-indent-dont-indent-if
        '((and (derived-mode-p 'c++-mode)
               (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                                   (thing-at-point 'line)))))))
;; Aggressive Indent:1 ends here

;; [[file:config.org::*Recent Files][Recent Files:1]]
(after! recentf
  (setq recentf-max-saved-items 100
        recentf-exclude '("/tmp/" "/var/tmp/" ".*\\.git/.*" ".*\\.cache/.*")))
;; Recent Files:1 ends here

;; [[file:config.org::*Better Scrolling][Better Scrolling:1]]
;; scroll-margin is set to 3 in Theme section
(setq scroll-step 1
      scroll-conservatively 101
      scroll-preserve-screen-position t)
;; Better Scrolling:1 ends here

;; [[file:config.org::*Auto-save Configuration][Auto-save Configuration:1]]
(setq auto-save-default t
      auto-save-timeout 20
      auto-save-interval 200
      make-backup-files nil
      create-lockfiles nil)
;; Auto-save Configuration:1 ends here

;; [[file:config.org::*Multiple Cursors][Multiple Cursors:1]]
(after! multiple-cursors
  ;; Enable evil mode integration (already done by Doom, but ensure it's active)
  (evil-mc-initialize)
  ;; Better integration with evil commands
  (setq evil-mc-enable-bar-cursor t
        evil-mc-cursor-variable-pitch nil))
;; Multiple Cursors:1 ends here

;; [[file:config.org::*Magit Enhancements][Magit Enhancements:1]]
(after! magit
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1
        magit-diff-refine-hunk t
        magit-save-repository-buffers 'dontask))
;; Magit Enhancements:1 ends here

;; [[file:config.org::*Undo Navigation][Undo Navigation:1]]
(after! undo-fu
  (setq undo-fu-ignore-keyboard-quit t
        undo-fu-allow-undo-in-region t))
;; Undo Navigation:1 ends here

;; [[file:config.org::*Dashboard][Dashboard:1]]
(after! doom-dashboard
  (setq +doom-dashboard-banner-padding '(4 . 4)
        +doom-dashboard-menu-sections
        '(("Recently opened files" :icon
           (nerd-icons-faicon "nf-fa-file_text" :face 'doom-dashboard-menu-title)
           :action recentf-open-files)
          ("Open project" :icon
           (nerd-icons-octicon "nf-oct-repo" :face 'doom-dashboard-menu-title)
           :action projectile-switch-project)
          ("Jump to bookmark" :icon
           (nerd-icons-octicon "nf-oct-bookmark" :face 'doom-dashboard-menu-title)
           :action bookmark-jump)
          ("Open private configuration" :icon
           (nerd-icons-octicon "nf-oct-gear" :face 'doom-dashboard-menu-title)
           :action doom/open-private-config))))
;; Dashboard:1 ends here

;; [[file:config.org::*Which-key Styling][Which-key Styling:1]]
(after! which-key
  (setq which-key-idle-delay 0.3
        which-key-idle-secondary-delay 0.05
        which-key-popup-type 'side-window
        which-key-side-window-location 'bottom
        which-key-side-window-max-height 0.25
        which-key-max-description-length 40
        which-key-allow-imprecise-window-fit t
        which-key-separator " → "))
;; Which-key Styling:1 ends here

;; [[file:config.org::*Vertico Styling][Vertico Styling:1]]
(after! vertico
  (setq vertico-count 12
        vertico-cycle t
        vertico-resize nil))

(after! marginalia
  (setq marginalia-align 'right
        marginalia-max-relative-age 0))
;; Vertico Styling:1 ends here

;; [[file:config.org::*Popup Rules][Popup Rules:1]]
(after! popup
  (set-popup-rules!
    '(("^\\*helpful" :size 0.4 :select t :quit t)
      ("^\\*Help" :size 0.4 :select t :quit t)
      ("^\\*doom:vterm" :size 0.35 :vslot -4 :select t :quit nil :ttl nil)
      ("^\\*Warnings\\*" :size 0.25 :select nil :quit t)
      ("^\\*compilation\\*" :size 0.35 :select nil :quit t))))
;; Popup Rules:1 ends here

;; [[file:config.org::*Zen Mode][Zen Mode:1]]
(after! writeroom-mode
  (setq +zen-text-scale 0.8
        writeroom-width 100
        writeroom-extra-line-spacing 0.5
        writeroom-mode-line t))
;; Zen Mode:1 ends here

;; [[file:config.org::*Visual Polish][Visual Polish:1]]
;; Smoother startup and performance
(setq inhibit-compacting-font-caches t
      read-process-output-max (* 1024 1024)  ;; 1mb for LSP performance
      gcmh-high-cons-threshold (* 128 1024 1024))

;; Better visual feedback for yanks/deletes/changes
(after! evil-goggles
  (setq evil-goggles-duration 0.2
        evil-goggles-pulse t
        evil-goggles-enable-delete t
        evil-goggles-enable-change t
        evil-goggles-enable-yank t
        evil-goggles-enable-paste t)
  ;; Use diff faces for better visibility
  (custom-set-faces!
    '(evil-goggles-delete-face :inherit diff-removed)
    '(evil-goggles-change-face :inherit diff-changed)
    '(evil-goggles-yank-face :inherit diff-added)
    '(evil-goggles-paste-face :inherit diff-added)))

;; Development hooks for all programming modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'smartparens-strict-mode)

;; Highlight matching parentheses with better visibility
(after! paren
  (setq show-paren-delay 0
        show-paren-style 'parenthesis
        show-paren-highlight-openparen t
        show-paren-when-point-inside-paren t
        show-paren-when-point-in-periphery t))

;; Better diff/git gutter highlighting with colors
(after! diff-hl
  (setq diff-hl-draw-borders nil
        diff-hl-margin-symbols-alist
        '((insert . "▎") (delete . "▎") (change . "▎")
          (unknown . "▎") (ignored . "▎")))
  ;; Use fringe indicators
  (diff-hl-margin-mode -1)
  (diff-hl-flydiff-mode 1))

;; Better VC gutter faces
(after! vc-gutter
  (setq +vc-gutter-default-style t))

;; Pulse line on jump for visual feedback
(after! pulsar
  (setq pulsar-pulse t
        pulsar-delay 0.05
        pulsar-iterations 10))

;; Better visual-fill for writing modes
(after! visual-fill-column
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t))

;; Nerd icons for dired
(after! nerd-icons-dired
  (add-hook 'dired-mode-hook #'nerd-icons-dired-mode))
;; Visual Polish:1 ends here

;; [[file:config.org::*Org-Mode Aesthetics][Org-Mode Aesthetics:1]]
(after! org
  (setq org-hide-emphasis-markers t
        org-pretty-entities t
        org-pretty-entities-include-sub-superscripts t
        org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t
        org-ellipsis " ▾"
        org-auto-align-tags nil
        org-tags-column 0
        org-catch-invisible-edits 'show-and-error
        org-insert-heading-respect-content t
        org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+"))
        org-agenda-tags-column 0
        org-agenda-block-separator ?─
        org-agenda-current-time-string "← now ────────────────────"
        org-image-actual-width '(600)
        org-startup-with-inline-images t))

(use-package! org-modern
  :hook ((org-mode . org-modern-mode) (org-agenda-finalize . org-modern-agenda))
  :config
  (setq org-modern-star 'replace
        org-modern-replace-stars '("⁖" "◉" "○" "✸" "✿")
        org-modern-list '((?+ . "➤") (?- . "–") (?* . "•"))
        org-modern-checkbox '((?X . "☑") (?- . "◐") (?\  . "☐"))
        org-modern-tag t org-modern-priority t org-modern-todo t
        org-modern-table t org-modern-block-fringe t
        org-modern-horizontal-rule "─────────────────────────────────────────────────"))
;; Org-Mode Aesthetics:1 ends here

;; [[file:config.org::*Org-Mode Aesthetics][Org-Mode Aesthetics:2]]
(custom-set-faces!
  '(org-level-1 :height 1.4 :weight bold)
  '(org-level-2 :height 1.25 :weight bold)
  '(org-level-3 :height 1.15 :weight semi-bold)
  '(org-level-4 :height 1.1 :weight semi-bold)
  '(org-document-title :height 1.6 :weight bold)
  '(org-block :background "#1e1e2e")
  '(org-block-begin-line :foreground "#585b70" :slant italic)
  '(org-block-end-line :foreground "#585b70" :slant italic)
  '(org-done :strike-through t)
  '(org-headline-done :strike-through t))
;; Org-Mode Aesthetics:2 ends here

;; [[file:config.org::*Final Touches][Final Touches:1]]
;; Start maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Better buffer naming
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/")

;; Focus new windows when opened
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; Native compilation for better performance
(when (native-comp-available-p)
  (setq native-comp-async-report-warnings-errors 'silent))
;; Final Touches:1 ends here

;; [[file:config.org::*Cursor & Navigation Excellence][Cursor & Navigation Excellence:1]]
;; Beacon - Flash cursor on scroll/jump (never lose it!)
(use-package! beacon
  :config
  (beacon-mode 1)
  (setq beacon-blink-when-point-moves-vertically 10  ;; Flash when moving 10+ lines
        beacon-blink-when-point-moves-horizontally nil
        beacon-blink-when-window-scrolls t
        beacon-blink-when-window-changes t
        beacon-blink-when-focused t
        beacon-blink-duration 0.3
        beacon-blink-delay 0.1
        beacon-size 40
        beacon-color "#61afef"))  ;; Match doom-one accent

;; Enhanced pulsar configuration
(use-package! pulsar
  :config
  (pulsar-global-mode 1)
  (setq pulsar-pulse t
        pulsar-delay 0.04
        pulsar-iterations 8
        pulsar-face 'pulsar-magenta
        pulsar-highlight-face 'pulsar-yellow)
  ;; Pulse on these actions
  (add-hook 'next-error-hook #'pulsar-pulse-line)
  (add-hook 'minibuffer-setup-hook #'pulsar-pulse-line)
  (add-to-list 'pulsar-pulse-functions #'evil-scroll-down)
  (add-to-list 'pulsar-pulse-functions #'evil-scroll-up)
  (add-to-list 'pulsar-pulse-functions #'recenter-top-bottom))
;; Cursor & Navigation Excellence:1 ends here

;; [[file:config.org::*Focus Mode][Focus Mode:1]]
;; Dimmer - Dim inactive buffers
(use-package! dimmer
  :config
  (dimmer-mode 1)
  (setq dimmer-fraction 0.35  ;; 35% dimmed (subtle but noticeable)
        dimmer-adjustment-mode :foreground
        dimmer-use-colorspace :oklab  ;; Best color blending
        dimmer-watch-frame-focus-events nil)
  ;; Don't dim these buffers
  (dimmer-configure-which-key)
  (dimmer-configure-magit)
  (dimmer-configure-org)
  (dimmer-configure-posframe)
  (add-to-list 'dimmer-buffer-exclusion-regexps "^\\*Minibuf")
  (add-to-list 'dimmer-buffer-exclusion-regexps "^\\*cider-repl")
  (add-to-list 'dimmer-buffer-exclusion-regexps "^\\*vterm"))
;; Focus Mode:1 ends here

;; [[file:config.org::*Completion UI Excellence][Completion UI Excellence:1]]
;; Kind-icon for beautiful completion icons
(use-package! kind-icon
  :after corfu
  :config
  (setq kind-icon-default-face 'corfu-default
        kind-icon-blend-background t
        kind-icon-blend-frac 0.08
        kind-icon-use-icons t)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

;; Nerd-icons for corfu (alternative rich icons)
(use-package! nerd-icons-corfu
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

;; Enhanced corfu styling
(after! corfu
  (setq corfu-auto t
        corfu-auto-delay 0.1
        corfu-auto-prefix 2
        corfu-cycle t
        corfu-quit-no-match 'separator
        corfu-preselect 'prompt
        corfu-scroll-margin 3
        corfu-count 12
        corfu-max-width 80
        corfu-min-width 20
        ;; Better popup styling
        corfu-popupinfo-delay '(0.5 . 0.2)
        corfu-popupinfo-max-height 15)
  (corfu-popupinfo-mode 1))

;; Premium corfu faces
(custom-set-faces!
  '(corfu-default :background "#21242b" :foreground "#bbc2cf")
  '(corfu-current :background "#3d4451" :foreground "#eceff4" :weight bold)
  '(corfu-border :background "#3d4451")
  '(corfu-bar :background "#61afef"))
;; Completion UI Excellence:1 ends here

;; [[file:config.org::*Which-Key Posframe][Which-Key Posframe:1]]
;; Which-key in a floating frame (modern look)
(use-package! which-key-posframe
  :after which-key
  :config
  (which-key-posframe-mode 1)
  (setq which-key-posframe-poshandler #'posframe-poshandler-frame-bottom-center
        which-key-posframe-border-width 2
        which-key-posframe-font nil  ;; Use default font
        which-key-posframe-parameters
        '((left-fringe . 8)
          (right-fringe . 8))))
;; Which-Key Posframe:1 ends here

;; [[file:config.org::*Doom Themes Extras][Doom Themes Extras:1]]
;; Doom themes visual bell and extras
(after! doom-themes
  ;; Flash modeline on errors (visual bell)
  (doom-themes-visual-bell-config)
  ;; Better org-mode styling
  (doom-themes-org-config)
  ;; Better treemacs icons
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config))
;; Doom Themes Extras:1 ends here

;; [[file:config.org::*Premium Window Management][Premium Window Management:1]]
;; Better window dividers with theme colors
(after! frame
  (setq window-divider-default-right-width 1
        window-divider-default-bottom-width 1
        window-divider-default-places t)
  (window-divider-mode 1))

;; Ace-window with better styling
(after! ace-window
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-scope 'frame
        aw-background t
        aw-minibuffer-flag t)
  (custom-set-faces!
    '(aw-leading-char-face :foreground "#ff6c6b" :height 2.5 :weight bold)))
;; Premium Window Management:1 ends here

;; [[file:config.org::*Premium Cursor][Premium Cursor:1]]
;; Premium cursor configuration
(setq-default cursor-type '(bar . 3)  ;; Sleek bar cursor
              cursor-in-non-selected-windows 'hollow
              blink-cursor-blinks 10
              blink-cursor-interval 0.4
              blink-cursor-delay 0.2)

;; Different cursor for different states
(after! evil
  (setq evil-normal-state-cursor '(box "#61afef")
        evil-insert-state-cursor '((bar . 3) "#98c379")
        evil-visual-state-cursor '(hollow "#c678dd")
        evil-replace-state-cursor '((hbar . 4) "#e06c75")
        evil-emacs-state-cursor '(box "#d19a66")
        evil-operator-state-cursor '(box "#56b6c2")))

;; Blink cursor in GUI
(when (display-graphic-p)
  (blink-cursor-mode 1))
;; Premium Cursor:1 ends here

;; [[file:config.org::*Devdocs Configuration][Devdocs Configuration:1]]
(after! devdocs
  ;; Where to store downloaded docs
  (setq devdocs-data-dir (expand-file-name "devdocs" doom-data-dir))

  ;; Auto-install docs for common languages on first lookup
  (defvar +devdocs-auto-install-alist
    '((python-mode . ("python~3.12"))
      (python-ts-mode . ("python~3.12"))
      (js-mode . ("javascript" "node"))
      (js-ts-mode . ("javascript" "node"))
      (typescript-mode . ("typescript"))
      (typescript-ts-mode . ("typescript"))
      (go-mode . ("go"))
      (go-ts-mode . ("go"))
      (rust-mode . ("rust"))
      (rust-ts-mode . ("rust"))
      (ruby-mode . ("ruby~3.3" "rails~7.1"))
      (ruby-ts-mode . ("ruby~3.3" "rails~7.1"))
      (c-mode . ("c"))
      (c++-mode . ("cpp"))
      (c-ts-mode . ("c"))
      (c++-ts-mode . ("cpp"))
      (java-mode . ("openjdk~21"))
      (java-ts-mode . ("openjdk~21"))
      (kotlin-mode . ("kotlin~1.9"))
      (swift-mode . ("swift"))
      (css-mode . ("css"))
      (html-mode . ("html"))
      (web-mode . ("html" "css" "javascript"))
      (sh-mode . ("bash"))
      (emacs-lisp-mode . ("elisp"))
      (haskell-mode . ("haskell~9"))
      (nix-mode . ("nix")))
    "Alist mapping major modes to devdocs document slugs.")

  ;; Set devdocs for current buffer based on mode
  (add-hook! '(python-mode-hook python-ts-mode-hook)
    (setq-local devdocs-current-docs '("python~3.12")))

  (add-hook! '(js-mode-hook js-ts-mode-hook)
    (setq-local devdocs-current-docs '("javascript" "node")))

  (add-hook! '(typescript-mode-hook typescript-ts-mode-hook)
    (setq-local devdocs-current-docs '("typescript")))

  (add-hook! '(go-mode-hook go-ts-mode-hook)
    (setq-local devdocs-current-docs '("go")))

  (add-hook! '(rust-mode-hook rust-ts-mode-hook)
    (setq-local devdocs-current-docs '("rust")))

  (add-hook! '(ruby-mode-hook ruby-ts-mode-hook)
    (setq-local devdocs-current-docs '("ruby~3.3" "rails~7.1")))

  (add-hook! 'emacs-lisp-mode-hook
    (setq-local devdocs-current-docs '("elisp"))))

;; Keybindings for documentation lookup (autoloaded)
;; NOTE: SPC d is reserved for debug, devdocs uses SPC D
(map! :leader
      :prefix ("D" . "docs")
      :desc "Lookup at point"   "d" #'devdocs-lookup
      :desc "Search docs"       "s" #'devdocs-search
      :desc "Install docs"      "i" #'devdocs-install
      :desc "Delete docs"       "D" #'devdocs-delete
      :desc "Update all docs"   "u" #'devdocs-update-all
      :desc "Peruse docs"       "p" #'devdocs-peruse)
;; Devdocs Configuration:1 ends here

;; [[file:config.org::*Theme Settings][Theme Settings:1]]
(after! catppuccin-theme
  ;; Use the Mocha flavor (dark, warm) - alternatives: latte, frappe, macchiato
  (setq catppuccin-flavor 'mocha
        catppuccin-enlarge-headings t
        catppuccin-height-title-1 1.4
        catppuccin-height-title-2 1.25
        catppuccin-height-title-3 1.15
        catppuccin-height-doc-title 1.6
        catppuccin-italic-comments t
        catppuccin-highlight-matches t))

(defun +toggle-light-dark-theme ()
  "Toggle between Doom One (Dark) and Doom One Light."
  (interactive)
  (if (eq doom-theme 'doom-one)
      (progn
        (setq doom-theme 'doom-one-light)
        (load-theme 'doom-one-light t))
    (setq doom-theme 'doom-one)
    (load-theme 'doom-one t))
  (message "Switched to %s" doom-theme))

(map! :leader
      :desc "Toggle light/dark theme" "t t" #'+toggle-light-dark-theme)
;; Theme Settings:1 ends here

;; [[file:config.org::*Editing & Navigation Enhancements][Editing & Navigation Enhancements:1]]
;; Focus Mode - Dim surrounding text
(after! focus
  (setq focus-mode-to-thing '((prog-mode . defun) (text-mode . paragraph) (org-mode . org-element))))
(map! :leader :prefix ("F" . "Focus")
      "f" #'focus-mode "r" #'focus-read-only-mode "p" #'focus-pin "u" #'focus-unpin)

;; Centered Cursor - Keep cursor centered
(after! centered-cursor-mode
  (setq ccm-recenter-at-end-of-file t ccm-step-size 2 ccm-step-delay 0.05))
(map! :leader :desc "Toggle centered cursor" "t c" #'centered-cursor-mode)

;; Git Time Machine
(after! git-timemachine (setq git-timemachine-show-minibuffer-details t))
(map! :leader :prefix "g" :desc "Git time machine" "t" #'git-timemachine)

;; Avy - Jump to visible text
(after! avy
  (setq avy-all-windows t avy-background t avy-style 'at-full))
(map! :n "s" #'avy-goto-char-2 :n "S" #'avy-goto-line
      :leader :prefix ("j" . "Jump")
      "j" #'avy-goto-char "J" #'avy-goto-char-2 "w" #'avy-goto-word-1 "l" #'avy-goto-line "r" #'avy-resume)

;; Ace Window - Better window switching
(after! ace-window
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l) aw-scope 'frame aw-dispatch-always t)
  (custom-set-faces! '(aw-leading-char-face :foreground "red" :weight bold :height 2.5)))
(map! :leader :desc "Ace window" "W" #'ace-window :n "M-o" #'ace-window)

;; Olivetti - Distraction-free writing
(after! olivetti (setq olivetti-body-width 90 olivetti-minimum-body-width 70))
(map! :leader :desc "Toggle olivetti" "t o" #'olivetti-mode)

;; Org-Appear - Toggle hidden elements
(after! org-appear
  (setq org-appear-autoemphasis t org-appear-autolinks t org-appear-autosubmarkers t
        org-appear-autoentities t org-appear-autokeywords t org-appear-inside-latex t
        org-appear-trigger 'always))
(add-hook 'org-mode-hook #'org-appear-mode)

;; Symbol Overlay
(after! symbol-overlay (setq symbol-overlay-idle-time 0.2))
(map! :n "M-n" #'symbol-overlay-jump-next :n "M-p" #'symbol-overlay-jump-prev
      :leader :prefix ("s" . "search")
      "o" #'symbol-overlay-put "O" #'symbol-overlay-remove-all)

;; Dumb Jump - LSP fallback
(after! dumb-jump (setq dumb-jump-prefer-searcher 'rg))
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; Which-Key Posframe
(after! which-key-posframe
  (setq which-key-posframe-poshandler #'posframe-poshandler-frame-center
        which-key-posframe-border-width 2))
(when (display-graphic-p) (which-key-posframe-mode 1))

;; Consult-Dir & Wgrep
(after! consult-dir (setq consult-dir-project-list-function #'consult-dir-projectile-dirs))
(map! :leader :prefix "f" :desc "Consult directory" "D" #'consult-dir)
(after! wgrep (setq wgrep-auto-save-buffer t wgrep-change-readonly-file t))
;; Editing & Navigation Enhancements:1 ends here

;; [[file:config.org::*Diagram Preview Utilities][Diagram Preview Utilities:1]]
(defvar +diagram-auto-preview t "Toggle for side-window diagram preview.")

(defun +diagram/render-on-save (command ext)
  (when (and +diagram-auto-preview (buffer-file-name))
    (let ((output (concat (file-name-sans-extension (buffer-file-name)) "." ext)))
      (shell-command (format command (buffer-file-name) output))
      (when (file-exists-p output)
        (let ((buf (find-file-noselect output)))
          (with-current-buffer buf (auto-revert-mode 1))
          (display-buffer buf '((display-buffer-in-side-window) (side . right) (window-width . 0.4))))))))

(after! plantuml-mode
  (setq plantuml-default-exec-mode 'executable)
  (add-hook 'plantuml-mode-hook (lambda () (add-hook 'after-save-hook (lambda () (+diagram/render-on-save "plantuml -tsvg %s" "svg")) nil t))))

(after! mermaid-mode
  (add-hook 'mermaid-mode-hook (lambda () (add-hook 'after-save-hook (lambda () (+diagram/render-on-save "mmdc -i %s -o %s" "png")) nil t))))

(after! d2-mode
  (add-hook 'd2-mode-hook (lambda () (add-hook 'after-save-hook (lambda () (+diagram/render-on-save "d2 %s %s" "svg")) nil t))))

(defun +diagram/toggle-auto-preview ()
  "Toggle auto-preview for diagrams."
  (interactive)
  (setq +diagram-auto-preview (not +diagram-auto-preview))
  (message "Diagram auto-preview: %s" (if +diagram-auto-preview "enabled" "disabled")))

(map! :leader :desc "Toggle auto-preview" "t P" #'+diagram/toggle-auto-preview)
;; Diagram Preview Utilities:1 ends here

;; [[file:config.org::*Treemacs Configuration][Treemacs Configuration:1]]
(after! treemacs
  ;; Make treemacs follow the currently selected file and project
  (treemacs-follow-mode t)
  (treemacs-project-follow-mode t) ;; Ensure we switch projects automatically
  (treemacs-filewatch-mode t)
  (setq treemacs-width 35)

  ;; Keybinding to toggle treemacs (use Doom's smart toggle if available, otherwise standard)
  (map! :leader
        :desc "Toggle Treemacs" "o p" #'+treemacs/toggle))
;; Treemacs Configuration:1 ends here

;; [[file:config.org::*Remote Sync & Deployment][Remote Sync & Deployment:1]]
;; TRAMP Configuration
(after! tramp
  (setq tramp-default-method "ssh"
        tramp-auto-save-directory (concat doom-cache-dir "tramp-auto-save/")))

;; SSH Deploy
(after! ssh-deploy
  (setq ssh-deploy-automatically-detect-remote-changes 1))

(map! :leader
      :prefix "r"
      :desc "Upload file"   "u" #'ssh-deploy-upload-handler
      :desc "Download file" "d" #'ssh-deploy-download-handler
      :desc "Diff remote"   "D" #'ssh-deploy-diff-handler)
;; Remote Sync & Deployment:1 ends here

;; [[file:config.org::*Clojure Development][Clojure Development:1]]
(after! cider
  (setq cider-repl-display-help-banner nil cider-repl-pop-to-buffer-on-connect 'display-only
        cider-repl-use-pretty-printing t cider-repl-history-size 1000
        cider-show-error-buffer 'only-in-repl cider-auto-select-error-buffer nil))

(set-popup-rules!
  '(("^\\*cider-repl" :side right :width 0.45 :quit nil :ttl nil)
    ("^\\*cider-error" :size 0.35 :select t :quit t)
    ("^\\*cider-doc" :size 0.4 :select t :quit t)))

(after! cider-repl
  (setq cider-repl-prompt-function (lambda (ns) (format "%s λ " (cider-abbreviate-ns ns)))))

(custom-set-faces!
  '(cider-result-overlay-face :background nil :foreground "#98c379" :slant italic))

(map! :map clojure-mode-map :localleader
      (:prefix ("e" . "eval") "d" #'cider-eval-defun-at-point "D" #'cider-pprint-eval-defun-to-comment)
      (:prefix ("r" . "repl") "c" #'cider-repl-clear-buffer "i" #'cider-interrupt "l" #'cider-load-buffer)
      (:prefix ("n" . "ns") "r" #'cider-ns-refresh "b" #'cider-browse-ns))
;; Clojure Development:1 ends here

;; [[file:config.org::*Go Development][Go Development:1]]
(after! go-mode
  (setq gofmt-command "goimports" go-ts-mode-indent-offset 4 tab-width 4 indent-tabs-mode t))

(map! :map go-mode-map :localleader
      (:prefix ("t" . "test") "f" #'+go/test-single "F" #'+go/test-file "a" #'+go/test-all)
      (:prefix ("b" . "build") "b" #'+go/build "r" #'+go/run)
      (:prefix ("c" . "code") "i" #'go-import-add "u" #'go-remove-unused-imports "s" #'eglot-code-actions))
;; Go Development:1 ends here

;; [[file:config.org::*Zig Development][Zig Development:1]]
(after! zig-mode
  (setq zig-format-on-save t zig-zig-bin "zig")
  (add-hook 'zig-mode-hook (lambda () (setq-local tab-width 4 indent-tabs-mode nil))))

(map! :map zig-mode-map :localleader
      (:prefix ("b" . "build") "b" #'zig-compile "r" #'zig-run "t" #'zig-test)
      (:prefix ("c" . "code") "f" #'zig-format-buffer "a" #'eglot-code-actions))
;; Zig Development:1 ends here

;; [[file:config.org::*Python Development][Python Development:1]]
(after! python
  (setq python-shell-interpreter "python3"
        python-indent-offset 4
        python-indent-guess-indent-offset-verbose nil))

(map! :map python-mode-map :localleader
      (:prefix ("t" . "test") "f" #'python-pytest-function "F" #'python-pytest-file "a" #'python-pytest)
      (:prefix ("v" . "venv") "a" #'pyvenv-activate "d" #'pyvenv-deactivate "w" #'pyvenv-workon)
      (:prefix ("r" . "repl") "r" #'+python/open-repl "b" #'python-shell-send-buffer "s" #'python-shell-send-region))
;; Python Development:1 ends here

;; [[file:config.org::*Rust Development][Rust Development:1]]
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer
        rustic-format-on-save t
        rustic-flycheck-clippy-params "--message-format=json"))

(map! :map rustic-mode-map :localleader
      (:prefix ("c" . "cargo") "b" #'rustic-cargo-build "r" #'rustic-cargo-run "t" #'rustic-cargo-test "c" #'rustic-cargo-clippy)
      (:prefix ("t" . "test") "t" #'rustic-cargo-current-test "a" #'rustic-cargo-test))
;; Rust Development:1 ends here

;; [[file:config.org::*JS/TS Development][JS/TS Development:1]]
(after! js2-mode (setq js2-basic-offset 2 js-indent-level 2))
(after! typescript-mode (setq typescript-indent-level 2))

(after! format
  (set-formatter! 'prettier '("prettier" "--stdin-filepath" filepath)
    :modes '(js-mode js2-mode typescript-mode typescript-tsx-mode web-mode json-mode css-mode scss-mode)))

(map! :map (js2-mode-map typescript-mode-map typescript-tsx-mode-map) :localleader
      (:prefix ("t" . "test") "f" #'jest-file "t" #'jest-function)
      (:prefix ("n" . "npm") "i" #'npm-mode-npm-install "r" #'npm-mode-npm-run))
;; JS/TS Development:1 ends here

;; [[file:config.org::*Web Frameworks (Angular, Vue, Svelte, Bun)][Web Frameworks (Angular, Vue, Svelte, Bun):1]]
(use-package! add-node-modules-path
  :hook ((js2-mode rjsx-mode typescript-mode typescript-tsx-mode ng2-mode vue-mode svelte-mode) . add-node-modules-path))

;; Angular
(use-package! ng2-mode
  :defer t :config (setq ng2-html-indentation 2))
(add-to-list 'auto-mode-alist '(".*\\.component\\.html\\'" . ng2-html-mode))
(add-to-list 'auto-mode-alist '(".*\\.component\\.ts\\'" . ng2-ts-mode))

(defun +angular/run-command (command) (if (fboundp '+vterm/toggle) (progn (+vterm/toggle t) (vterm-send-string (concat command "\n"))) (async-shell-command command)))
(defun +angular/run (subcommand)
  (interactive)
  (let ((projects (condition-case nil (let ((json (json-read-file (locate-dominating-file default-directory "angular.json")))) (mapcar (lambda (p) (symbol-name (car p))) (cdr (assoc 'projects json)))) (error nil))))
    (+angular/run-command (format "bun run --bun ng %s %s" subcommand (if projects (completing-read (format "%s project: " subcommand) projects) "")))))

(map! :map (ng2-ts-mode-map ng2-html-mode-map) :localleader
      (:prefix ("a" . "angular") "s" (lambda () (interactive) (+angular/run "serve")) "b" (lambda () (interactive) (+angular/run "build")) "t" (lambda () (interactive) (+angular/run "test"))))

;; Vue & Svelte
(use-package! vue-mode :mode "\\.vue\\'" :config (setq mmm-submode-decoration-level 0))
(use-package! svelte-mode :mode "\\.svelte\\'")

;; Bun Integration
(defun +bun/run-cmd (cmd) (interactive) (async-shell-command (format "bun %s" (if (string-empty-p cmd) (read-string "Bun command: ") cmd))))
(map! :map (js2-mode-map typescript-mode-map typescript-tsx-mode-map ng2-ts-mode-map) :localleader
      (:prefix ("b" . "bun") "i" (lambda () (interactive) (+bun/run-cmd "install")) "r" (lambda () (interactive) (+bun/run-cmd (format "run %s" (read-string "Script: ")))) "t" (lambda () (interactive) (+bun/run-cmd "test"))))
;; Web Frameworks (Angular, Vue, Svelte, Bun):1 ends here

;; [[file:config.org::*C/C++ Development][C/C++ Development:1]]
(after! cc-mode
  (setq c-basic-offset 4
        c-default-style '((java-mode . "java") (c-mode . "linux") (c++-mode . "stroustrup") (other . "gnu"))))

(map! :map (c-mode-map c++-mode-map) :localleader
      (:prefix ("c" . "compile") "c" #'compile "r" #'recompile)
      (:prefix ("s" . "switch") "h" #'ff-find-other-file))
;; C/C++ Development:1 ends here

;; [[file:config.org::*Ruby Development][Ruby Development:1]]
(after! ruby-mode (setq ruby-insert-encoding-magic-comment nil ruby-deep-indent-paren nil))
(map! :map ruby-mode-map :localleader
      (:prefix ("t" . "test") "f" #'rspec-verify "t" #'rspec-verify-single "a" #'rspec-verify-all)
      (:prefix ("r" . "rails") "c" #'inf-ruby-console-rails "s" #'projectile-rails-server))
;; Ruby Development:1 ends here

;; [[file:config.org::*Haskell Development][Haskell Development:1]]
(after! haskell-mode
  (setq haskell-stylish-on-save t haskell-process-suggest-remove-import-lines t))

(map! :map haskell-mode-map :localleader
      (:prefix ("r" . "repl") "l" #'haskell-process-load-file "r" #'haskell-interactive-switch)
      (:prefix ("i" . "imports") "a" #'haskell-add-import "s" #'haskell-sort-imports))
;; Haskell Development:1 ends here

;; [[file:config.org::*Java Configuration][Java Configuration:1]]
(after! java-mode
  (setq c-basic-offset 4))

;; Java keybindings
(map! :map java-mode-map
      :localleader
      (:prefix ("c" . "compile")
       :desc "Compile" "c" #'compile
       :desc "Run" "r" #'recompile)
      (:prefix ("t" . "test")
       :desc "Test class" "c" #'+java/run-test))
;; Java Configuration:1 ends here

;; [[file:config.org::*Lua Configuration][Lua Configuration:1]]
(after! lua-mode
  (setq lua-indent-level 2
        lua-indent-nested-block-content-align nil))

;; Lua keybindings
(map! :map lua-mode-map
      :localleader
      (:prefix ("r" . "repl")
       :desc "Send buffer" "b" #'lua-send-buffer
       :desc "Send region" "r" #'lua-send-region
       :desc "Start REPL" "s" #'lua-start-process))
;; Lua Configuration:1 ends here

;; [[file:config.org::*Shell Configuration][Shell Configuration:1]]
(after! sh-mode
  (setq sh-basic-offset 2
        sh-indentation 2))

;; Shell keybindings
(map! :map sh-mode-map
      :localleader
      (:prefix ("r" . "run")
       :desc "Execute buffer" "b" #'executable-interpret
       :desc "Execute region" "r" #'sh-execute-region))
;; Shell Configuration:1 ends here

;; [[file:config.org::*Web Mode Configuration][Web Mode Configuration:1]]
(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-auto-closing t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t))

;; Emmet for fast HTML
(after! emmet-mode
  (add-hook 'web-mode-hook #'emmet-mode)
  (add-hook 'css-mode-hook #'emmet-mode))
;; Web Mode Configuration:1 ends here

;; [[file:config.org::*Claude Code Integration][Claude Code Integration:1]]
(use-package! claude-code
  :init
  (map! :leader :prefix ("m" . "AI")
        "a" #'claude-code "t" #'claude-code-toggle "c" #'claude-code-continue
        "r" #'claude-code-send-region "f" #'claude-code-send-buffer-file
        "e" #'claude-code-fix-error-at-point "/" #'claude-code-slash-commands)
  :config
  (setq claude-code-terminal-backend 'eat
        claude-code-display-window-fn
        (lambda (buf) (display-buffer buf '((display-buffer-in-side-window) (side . right) (window-width . 0.45)))))
  (claude-code-mode 1))
;; Claude Code Integration:1 ends here

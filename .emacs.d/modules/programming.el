;;; modules/programming.el --- Programming setup -*- lexical-binding: t -*-
;;; Commentary:
;; General programming features

(use-package magit
  :bind ("C-x g" . magit-status))

;; Project management
(use-package projectile
  :demand t
  :config
  (setq projectile-completion-system 'default
        projectile-enable-caching t
        projectile-indexing-method 'alien)
  (projectile-mode 1)
  :bind-keymap ("C-c p" . projectile-command-map))

;; Tree-sitter (built-in Emacs 29+)
(setq treesit-font-lock-level 4)

;; Flycheck
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

;; LSP Mode
(use-package lsp-mode
  :straight t
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-signature-auto-activate t
        lsp-signature-render-documentation t
        lsp-completion-provider :none
        lsp-idle-delay 0.5
        lsp-log-io nil
        lsp-enable-file-watchers nil
        lsp-enable-folding nil)
  (setq lsp-clients-clangd-executable "/opt/homebrew/opt/llvm/bin/clangd")
  
  (setq lsp-clients-clangd-args
        '("--background-index"
          "--clang-tidy"
          "--completion-style=detailed"
          "--header-insertion=never"
          "--pch-storage=memory"
          "--log=error"
          "--query-driver=/opt/homebrew/opt/llvm/bin/clang++")
        )
  ;; Force LSP to find compile_commands.json
  (add-to-list 'lsp-clients-clangd-args 
               "--compile-commands-dir=.")  
  (setq lsp-auto-guess-root t)
  (add-to-list 'lsp-language-id-configuration '(c++-mode . "cpp"))
   :hook ((lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-ui
  :after lsp-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-delay 0.5
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-code-actions t))

(use-package dap-mode
  :after lsp-mode
  :commands dap-debug
  :config
  (dap-auto-configure-mode)
  
  ;; Enable helpful UI elements
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (tooltip-mode 1)
  (dap-ui-controls-mode 1)

  ;; Load LLDB adapter
  (require 'dap-lldb t) 
 
   (setq dap-lldb-debug-program 
        (or (executable-find "lldb-dap")
            '("/opt/homebrew/opt/llvm/bin/lldb-dap")))

   (setq dap-lldb-debugged-program-function 
        (lambda () (read-file-name "Select program to debug: ")))
  ;; Enable launch.json support
  (setq dap-auto-configure-features '(sessions locals expressions controls tooltip))
  
  ;; Key bindings
  :bind
  (:map dap-mode-map
        ("<f5>" . dap-debug)
        ("<f9>" . dap-breakpoint-toggle)
        ("<f10>" . dap-next)
        ("<f11>" . dap-step-in)
        ("S-<f11>" . dap-step-out)
        ("<f12>" . dap-continue)))

;; Language-specific adapters
(use-package dap-mode
  :config
 
  ;; Go
  (require 'dap-dlv-go)
  
  ;; C/C++/Rust
  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  
  ;; TypeScript/JavaScript
  (require 'dap-node))

(use-package lsp-java
  :after (lsp-mode dap-mode)
  :demand t 
  :config
  (require 'xml)
  (require 'dap-java))

;; Snippets
(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

;; EditorConfig
(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; Format on save
(use-package format-all
  :hook (prog-mode . format-all-mode)
  :config
  (setq-default format-all-formatters
                '(("Kotlin" ktlint)
                  ("Go" gofmt)
                  ("TypeScript" prettier)
                  ("Dart" dartfmt)
                  ("Rust" rustfmt)
                  ("C" clang-format)
                  ("C++" clang-format))))

(provide 'programming)

;;; programming.el ends here

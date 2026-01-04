
;;; modules/languages.el --- Language-specific configs

;; Kotlin
(use-package kotlin-mode
               :mode "\\.kt\\'"
               :hook (kotlin-mode . lsp-deferred))

; Go
(use-package go-mode
  :mode "\\.go\\'"
  :hook (go-mode . lsp-deferred)
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package go-tag
  :after go-mode
  :bind (:map go-mode-map
              ("C-c t" . go-tag-add)
              ("C-c T" . go-tag-remove)))

;; TypeScript
(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :hook ((typescript-mode . lsp-deferred)
         (tsx-ts-mode . lsp-deferred))
  :config
  (setq typescript-indent-level 2))

;; Dart
(use-package dart-mode
  :mode "\\.dart\\'"
  :hook (dart-mode . lsp-deferred))

(use-package lsp-dart
  :after dart-mode)

;; Zig
(use-package zig-mode
  :mode "\\.zig\\'"
  :hook (zig-mode . lsp-deferred)
  :config
  (setq zig-format-on-save nil)) ;; Using format-all instead


;; C/C++
(use-package cc-mode
  :straight nil
  :mode (("\\.c\\'" . c-mode)
         ("\\.cpp\\'" . c++-mode)
         ("\\.cc\\'" . c++-mode)
         ("\\.cxx\\'" . c++-mode)
         ("\\.h\\'" . c-mode)
         ("\\.hpp\\'" . c++-mode)
         ("\\.hxx\\'" . c++-mode)
         ;; C++20 modules
         ("\\.cppm\\'" . c++-mode)
         ("\\.ixx\\'" . c++-mode)
         ("\\.ccm\\'" . c++-mode))
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred))
  :config
  (setq c-basic-offset 4
        c-default-style "linux")
  
  ;; Better C++20/23 keyword support
  (add-hook 'c++-mode-hook
            (lambda ()
              (setq-local c-basic-offset 4)
              ;; Add C++20/23 keywords
              (font-lock-add-keywords
               nil
               '(("\\<\\(co_await\\|co_return\\|co_yield\\|concept\\|requires\\|consteval\\|constinit\\)\\>" . font-lock-keyword-face)
                 ("\\<\\(import\\|module\\|export\\)\\>" . font-lock-keyword-face))))))


;; Swift
(use-package swift-mode
  :mode "\\.swift\\'"
  :hook (swift-mode . lsp-deferred))

(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable
        "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp"))

;; Rust
(use-package rust-mode
  :mode "\\.rs\\'"
  :hook (rust-mode . lsp-deferred)
  :config
  (setq rust-format-on-save t))

(use-package cargo
  :after rust-mode
  :hook (rust-mode . cargo-minor-mode))

;; TOML (for Cargo.toml)
(use-package toml-mode
  :mode "\\.toml\\'")

;; YAML
(use-package yaml-mode
  :mode "\\.ya?ml\\'")

;; JSON
(use-package json-mode
  :mode "\\.json\\'")

;; Markdown
(use-package markdown-mode
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config
  (setq markdown-command "multimarkdown"))

;; Web mode
(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
         ("\\.css\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(provide 'languages)

;;; languages.el ends here

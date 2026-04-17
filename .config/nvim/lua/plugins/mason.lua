return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Mason setup
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Auto-install linters and formatters
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- JavaScript/TypeScript/Web
        "prettier",              -- JS/TS/CSS/HTML/JSON/YAML/Markdown
        
        -- Go
        "gofumpt",               -- Stricter gofmt
        "goimports",             -- Go imports formatting
        "golines",               -- Go long line formatter
        
        -- Buf
        "buf",

        -- Java
        "google-java-format",    -- Google Java formatter
        
        -- Haskell
        "fourmolu",              -- Haskell formatter (alternative to ormolu)
        
        -- OCaml
        "ocamlformat",           -- OCaml formatter
        
        -- Ruby
        "rubocop",               -- Ruby linter and formatter
        
        -- Python
        "black",                 -- Python formatter
        "isort",                 -- Python import formatter
        "pylint",                -- Python linter
        
        -- Lua
        "stylua",                -- Lua formatter
        
        -- Shell
        "shfmt",                 -- Shell script formatter
        
        -- Clojure
        "zprint",                -- Clojure formatter
        
        -- SQL
        "sqlfluff",              -- SQL formatter and linter
        
        -- CMake
        "cmakelang",             -- CMake formatter
        
        -- Markdown
        "markdownlint",          -- Markdown linter
        
        -- YAML
        "yamllint",              -- YAML linter
        
        -- TOML  
        "taplo",                 -- TOML formatter
        
        -- ========== LINTERS ==========
        
        -- Web/JavaScript/TypeScript
        "eslint_d",              -- Fast ESLint daemon
        "stylelint",             -- CSS/SCSS linter
        
        -- Shell
        "shellcheck",            -- Shell script linter
        
        -- Docker
        "hadolint",              -- Dockerfile linter
        
        -- Note: The following are bundled with their language toolchains:
        -- - rustfmt (bundled with Rust)
        -- - clang-format (usually system package)
        -- - zigfmt (bundled with Zig compiler)
      },
    })
  end,
}

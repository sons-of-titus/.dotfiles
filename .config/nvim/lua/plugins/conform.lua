return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- C/C++
        c = { "clang_format" },
        cpp = { "clang_format" },
        
        -- Go
        go = { "gofumpt", "goimports", "golines" },
        
        -- Rust
        rust = { "rustfmt" },
        
        -- Zig
        zig = { "zigfmt" },
        
        -- Java
        java = { "google-java-format" },
        
        -- Haskell
        haskell = { "fourmolu" },
        
        -- OCaml
        ocaml = { "ocamlformat" },
        
        -- Ruby
        ruby = { "rubocop" },
        
        -- Python
        python = { "isort", "black" },
        
        -- Lua
        lua = { "stylua" },
        
        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        
        -- Clojure
        clojure = { "zprint" },
        
        -- Kotlin
        kotlin = { "ktlint" },
        
        -- JavaScript/TypeScript/Web
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        vue = { "prettier" },
        
        -- CSS/HTML
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        
        -- Data formats
        json = { "prettier" },
        yaml = { "prettier" },
        toml = { "prettier" },
        
        -- Markdown
        markdown = { "prettier" },
        
        -- GraphQL
        graphql = { "prettier" },
        
        -- SQL
        sql = { "sqlfluff" },
        
        -- CMake
        cmake = { "cmakelang" },
        
        -- Protocol Buffers
        proto = { "buf" },
        
        -- Dockerfile
        dockerfile = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
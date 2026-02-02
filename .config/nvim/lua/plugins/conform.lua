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
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "gofmt", "goimports" },
        zig = { "zigfmt" },
        rust = { "rustfmt" },
        haskell = { "ormolu" },
        clojure = { "zprint" },
        kotlin = { "ktlint" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
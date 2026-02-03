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
        "prettier", -- Formatter
        "pylint",   -- Python Linter
      },
    })
  end,
}

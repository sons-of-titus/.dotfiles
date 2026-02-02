-- Improve default vim.ui interfaces
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
        backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
      },
    })
  end,
}

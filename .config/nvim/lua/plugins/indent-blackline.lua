return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = {
        char = "│",
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "dashboard",
          "help",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lspinfo",
          "checkhealth",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",
        },
      },
    })
  end,
}
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
    { "<leader>ef", "<cmd>Neotree reveal<cr>", desc = "Reveal file in Neo-tree" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        hijack_netrw_behavior = "disabled", -- Allow dired.nvim to handle directories
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
    })
  end,
}
return {
  "2KAbhishek/exercism.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "2KAbhishek/utils.nvim",
  },
  cmd = { "Exercism" },
  opts = {
    exercism_workspace = "~/exercism", -- Default workspace
  },
  keys = {
    { "<leader>E", "<cmd>Exercism languages<cr>", desc = "Exercism Dashboard" },
  },
  config = function(_, opts)
    require("exercism").setup(opts)
  end,
}

return {
  "folke/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-project.nvim",
      config = function()
        require("telescope").load_extension("project")
      end,
    },
  },
  keys = {
    { "<leader>fp", "<cmd>Telescope project<cr>", desc = "Projects" },
  },
}
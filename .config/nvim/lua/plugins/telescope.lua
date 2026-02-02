return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = "Telescope",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-dap.nvim",
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
    { "<leader>fg", function() require("telescope.builtin").git_files() end, desc = "Git Files" },
    { "<leader>fw", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
    { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Recent Files" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
    { "<leader>fc", function() require("telescope.builtin").commands() end, desc = "Commands" },
    { "<leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Keymaps" },
    { "<leader>fs", function() require("telescope.builtin").grep_string() end, desc = "Search Selection" },
    { "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = "🔍 ",
        selection_caret = "➜ ",
        file_ignore_patterns = { "node_modules", ".git/", ".cache", "build", "target" },
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-q>"] = require("telescope.actions").send_to_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = false,
        },
        live_grep = {
          additional_args = { "--hidden" },
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("dap")
    -- Load project extension if available
    pcall(function()
      telescope.load_extension("projects")
    end)
  end,
}

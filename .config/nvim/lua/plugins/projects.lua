return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup({
          -- Detection methods
          detection_methods = { "lsp", "pattern" },
          
          -- Patterns to detect project root
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "go.mod", "Cargo.toml", ".projectile", "build.zig1" },
          
          -- Don't show hidden projects
          show_hidden = false,
          
          -- Silent chdir
          silent_chdir = true,
          
          -- Scope chdir (global, tab, win)
          scope_chdir = 'global',
        })
        
        require("telescope").load_extension("projects")
      end,
    },
  },
  keys = {
    { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
  },
}

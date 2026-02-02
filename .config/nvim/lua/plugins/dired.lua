return {
  "X3eRo0/dired.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("dired").setup({
      path_separator = "/",                -- Use '/' as the path separator
      show_hidden = true,                  -- Show hidden files
      show_icons = true,                   -- Show icons (patched font required)
      show_banner = false,                 -- Do not show the banner
      hide_details = false,                -- Show file details by default
      sort_order = "name",                 -- Sort files by name by default
      override_cwd = true,                 -- Override cwd by default

      -- Define keybindings for various 'dired' actions
      keybinds = {
        dired_enter = "<CR>",
        dired_back = "-",
        dired_up = "_",
        dired_rename = "R",
        -- ... (add more keybindings as needed)
        dired_quit = "q",
      },

      -- Define colors for different file types and attributes
      colors = {
        DiredDimText = { link = {}, bg = "NONE", fg = "#908caa", gui = "NONE" }, -- Muted
        DiredDirectoryName = { link = {}, bg = "NONE", fg = "#c4a7e7", gui = "NONE" }, -- Iris
        DiredMoveFile = { link = {}, bg = "NONE", fg = "#ebbcba", gui = "bold" }, -- Rose
        DiredAttribute = { link = {}, bg = "NONE", fg = "#9ccfd8", gui = "NONE" }, -- Foam
        DiredFileName = { link = {}, bg = "NONE", fg = "#e0def4", gui = "NONE" }, -- Text
        DiredLink = { link = {}, bg = "NONE", fg = "#31748f", gui = "italic" }, -- Pine
      },
    })
  end,
}

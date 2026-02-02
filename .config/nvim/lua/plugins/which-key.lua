return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "modern",
      delay = 500,
      win = {
        border = "single",
        no_overlap = false,
        padding = { 1, 2 },
      },
    })
    
    wk.add({
      { "<leader>f", group = "Find/Search", icon = " " },
      { "<leader>p", group = "Projects", icon = " " },
      { "<leader>b", group = "Buffer", icon = " " },
      { "<leader>c", group = "Code", icon = " " },
      { "<leader>g", group = "Git", icon = "󰊢 " },
      { "<leader>h", group = "Hunk", icon = " " },
      { "<leader>t", group = "Terminal", icon = " " },
      { "<leader>u", group = "UI", icon = " " },
      { "<leader>x", group = "Diagnostics", icon = " " },
      { "<leader>d", group = "Debug", icon = " " },
      { "<leader>a", group = "Select All", icon = " " },
      { "<leader>s", group = "Search/Replace", icon = "󰛔 " },
      { "<leader>q", group = "Quit/Session", icon = "󰗼 " },
      { "<leader>e", group = "Explorer", icon = "󰙅 " },
      { "<leader>o", group = "Orgmode", icon = "󱗿 " },
      { "<leader>y", group = "System Yank", icon = "󱘓 " },
      { "<leader>v", group = "System Paste", icon = "󱘔 " },
    })
  end,
}

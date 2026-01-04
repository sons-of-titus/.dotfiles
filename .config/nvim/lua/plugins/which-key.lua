return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      delay = 500,
    })
    
    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Hunk" },
      { "<leader>t", group = "Terminal" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>d", group = "Debug" },
    })
  end,
}

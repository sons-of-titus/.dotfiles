return {
  "nvim-zh/colorful-winsep.nvim",
  event = { "WinNew" },
  config = function()
    require("colorful-winsep").setup({

      -- Custom symbols or defaults
    })
  end,
}

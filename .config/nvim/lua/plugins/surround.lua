return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        -- Base operators
        normal = "ys",
        delete = "<leader>ds", -- Was ds (overlapped d)
        change = "<leader>cs", -- Was cs (overlapped c)
        change_line = "<leader>cS", -- Was cS (overlapped c)
        visual = "S",
        visual_line = "gS",
        
        -- Remap overlapping line commands
        normal_cur = "<leader>ss",      -- Was yss (overlapped ys)
        normal_line = "yS",
        normal_cur_line = "<leader>S", -- Was ySS (overlapped yS)
        
        insert = "<C-g>s",
        insert_line = "<C-g>S",
      },
    })
  end,
}

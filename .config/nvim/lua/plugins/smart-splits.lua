return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  config = function()
    require("smart-splits").setup({
      ignored_filetypes = {
        "nofile",
        "quickfix",
        "qf",
        "prompt",
      },
      ignored_buftypes = { "nofile" },
    })
  end,
  keys = {
    -- Resizing
    { "<A-h>", function() require('smart-splits').resize_left() end, desc = "Resize left" },
    { "<A-j>", function() require('smart-splits').resize_down() end, desc = "Resize down" },
    { "<A-k>", function() require('smart-splits').resize_up() end, desc = "Resize up" },
    { "<A-l>", function() require('smart-splits').resize_right() end, desc = "Resize right" },
    -- Fallback resizing (for iTerm without Option as Meta)
    { "<C-Left>",  function() require('smart-splits').resize_left()  end, desc = "Resize left" },
    { "<C-Down>",  function() require('smart-splits').resize_down()  end, desc = "Resize down" },
    { "<C-Up>",    function() require('smart-splits').resize_up()    end, desc = "Resize up" },
    { "<C-Right>", function() require('smart-splits').resize_right() end, desc = "Resize right" },
    -- Moving between splits
    { "<C-h>", function() require('smart-splits').move_cursor_left() end, desc = "Move to left split" },
    { "<C-j>", function() require('smart-splits').move_cursor_down() end, desc = "Move to below split" },
    { "<C-k>", function() require('smart-splits').move_cursor_up() end, desc = "Move to above split" },
    { "<C-l>", function() require('smart-splits').move_cursor_right() end, desc = "Move to right split" },
    -- Swapping
    { "<leader>Wh", function() require('smart-splits').swap_buf_left() end, desc = "Swap with left" },
    { "<leader>Wj", function() require('smart-splits').swap_buf_down() end, desc = "Swap with below" },
    { "<leader>Wk", function() require('smart-splits').swap_buf_up() end, desc = "Swap with above" },
    { "<leader>Wl", function() require('smart-splits').swap_buf_right() end, desc = "Swap with right" },
  },
}

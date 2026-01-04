return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",           -- Start multi-cursor on word
      ["Find Subword Under"] = "<C-d>",
      ["Skip Region"] = "<C-x>",          -- Skip current and find next
      ["Remove Region"] = "<C-p>",        -- Remove current cursor
      ["Add Cursor Down"] = "<M-j>",      -- Add cursor below
      ["Add Cursor Up"] = "<M-k>",        -- Add cursor above
    }
  end,
}

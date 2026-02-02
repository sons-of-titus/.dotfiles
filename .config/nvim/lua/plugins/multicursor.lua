return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    vim.g.VM_default_mappings = 0 -- Fix <M> overlap
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
      ["Skip Region"] = "<C-x>",
      ["Remove Region"] = "<C-p>",
      ["Add Cursor Down"] = "<C-j>",
      ["Add Cursor Up"] = "<C-k>",
    }
  end,
}

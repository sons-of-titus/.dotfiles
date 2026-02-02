return {
  "numToStr/Comment.nvim",
  config = function()
    local api = require("Comment.api")
    
    -- Toggle mappings
    vim.keymap.set("n", "<leader>/", api.toggle.linewise.current, { desc = "Toggle comment line" })
    vim.keymap.set("n", "<leader>?", api.toggle.blockwise.current, { desc = "Toggle comment block" })
    
    -- Operator mappings (gc / gb)
    -- We need to map `gc` to the operator function.
    -- Comment.nvim usually does this via `mappings = { basic = true }`.
    -- But that also creates `gcc` and `gbc`.
    -- If we want ONLY operators, we can do manual mapping or unmap.
    -- Let's try unmapping `gcc` and `gbc` after setup.
    
    require("Comment").setup({
      mappings = {
        basic = true,
        extra = false,
      },
      toggler = {
        line = nil, -- disable default gcc logic here if possible
        block = nil,
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
    })

    -- Manually unmap the defaults we don't want, if they were created
    pcall(vim.keymap.del, "n", "gcc")
    pcall(vim.keymap.del, "n", "gbc")
  end,
}

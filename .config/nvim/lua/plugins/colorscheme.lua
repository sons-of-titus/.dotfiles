return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("tokyonight")
    -- transparent background
    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'LuaLine', {bg = 'none'})
  end,
}

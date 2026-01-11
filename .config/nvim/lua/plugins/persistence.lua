-- Session management
return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
  keys = {
    { "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], desc = "Restore Session" },
    { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], desc = "Restore Last Session" },
    { "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], desc = "Don't Save Current Session" },
  },
  -- Note: <leader>q is used for quit, but <leader>qs/ql/qd will work via which-key
}

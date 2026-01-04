return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
  },
  keys = {
    { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
    { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Continue" },
    { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Step into" },
    { "<leader>do", "<cmd>lua require('dap').step_over()<cr>", desc = "Step over" },
    { "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", desc = "Step out" },
    { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", desc = "Toggle REPL" },
    { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle UI" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    
    require("nvim-dap-virtual-text").setup()
    require("dap-go").setup()
    
    dapui.setup()
    
    -- Auto open/close UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
    -- Mason integration
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  keys = {
    { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
    { "<leader>dc", "<cmd>lua require('dap').continue()<cr>", desc = "Continue" },
    { "<leader>di", "<cmd>lua require('dap').step_into()<cr>", desc = "Step into" },
    { "<leader>do", "<cmd>lua require('dap').step_over()<cr>", desc = "Step over" },
    { "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", desc = "Step out" },
    { "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>", desc = "Toggle REPL" },
    { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle UI" },
    -- Telescope DAP
    { "<leader>dv", "<cmd>Telescope dap variables<cr>", desc = "Variables" },
    { "<leader>df", "<cmd>Telescope dap frames<cr>", desc = "Frames" },
    { "<leader>dlb", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Breakpoints" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    
    require("nvim-dap-virtual-text").setup()
    require("dap-go").setup()
    
    -- Setup Mason DAP
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb", "kotlin-debug-adapter" },
      automatic_installation = true,
      handlers = {
        function(config)
           require('mason-nvim-dap').default_setup(config) 
        end,
        -- Custom override for codelldb if needed, but default is usually fine
      },
    })
    
    -- Manual setup for C/C++/Rust using codelldb if default_setup doesn't catch all cases
    -- or to be specific about configurations.
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

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
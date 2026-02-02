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
    require("dap-go").setup({
       delve = {
         path = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
         initialize_timeout_sec = 20,
       },
    })
    
    -- Setup Mason DAP
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb", "kotlin-debug-adapter", "cpptools", "delve" },
      automatic_installation = true,
      handlers = {
        function(config)
           require('mason-nvim-dap').default_setup(config) 
        end,
        codelldb = function(config)
           local mason_registry = require("mason-registry")
           local codelldb = mason_registry.get_package("codelldb")
           if not codelldb:is_installed() then
               require('mason-nvim-dap').default_setup(config) -- Fallback
               return
           end
           local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
           local codelldb_path = extension_path .. "adapter/codelldb"
           local this_os = vim.uv.os_uname().sysname;
           if this_os:find "Windows" then
             codelldb_path = extension_path .. "adapter\\codelldb.exe"
           else
             -- The main executable is the same for Linux/Mac
             codelldb_path = extension_path .. "adapter/codelldb"
           end
           
            local dap = require('dap')
            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = codelldb_path,
                    args = {"--port", "${port}"},
                },
                detached = false,
            }
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
        end,
        cppdbg = function(config)
           local mason_registry = require("mason-registry")
           local cpptools = mason_registry.get_package("cpptools")
           if not cpptools:is_installed() then
               require('mason-nvim-dap').default_setup(config) -- Fallback
               return
           end
           local extension_path = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/"
           local command = extension_path .. "debugAdapters/bin/OpenDebugAD7"
           local this_os = vim.uv.os_uname().sysname;
           if this_os:find "Windows" then
             command = extension_path .. "debugAdapters\\bin\\OpenDebugAD7.exe"
           end

           local dap = require('dap')
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = command,
                options = {
                    detached = false
                }
            }
        end,
      },
    })
    

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
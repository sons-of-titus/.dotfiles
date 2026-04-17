return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- UI Components
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    
    -- Language-specific adapters
    "leoluz/nvim-dap-go",
    
    -- Telescope integration
    "nvim-telescope/telescope-dap.nvim",
    
    -- Mason integration
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  keys = {
    -- Breakpoints
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional Breakpoint" },
    { "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Log Point" },
    { "<leader>dx", function() require("dap").clear_breakpoints() end, desc = "Clear All Breakpoints" },
    
    -- Execution Control
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue/Start" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dR", function() require("dap").restart() end, desc = "Restart" },
    { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    
    -- Stepping
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down Stack" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up Stack" },
    
    -- UI Components
    { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
    { "<leader>de", function() require("dapui").eval() end, mode = {"n", "v"}, desc = "Eval Expression" },
    { "<leader>dE", function() require("dapui").eval(vim.fn.input("Expression: ")) end, desc = "Eval Input" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variables" },
    
    -- Telescope DAP
    { "<leader>dsc", "<cmd>Telescope dap commands<cr>", desc = "DAP Commands" },
    { "<leader>dsb", "<cmd>Telescope dap list_breakpoints<cr>", desc = "List Breakpoints" },
    { "<leader>dsv", "<cmd>Telescope dap variables<cr>", desc = "Variables" },
    { "<leader>dsf", "<cmd>Telescope dap frames<cr>", desc = "Frames" },
    { "<leader>dsg", "<cmd>Telescope dap configurations<cr>", desc = "Configurations" },
    
    -- Language-specific
    { "<leader>dgt", function() require("dap-go").debug_test() end, desc = "Debug Go Test", ft = "go" },
    { "<leader>dgl", function() require("dap-go").debug_last_test() end, desc = "Debug Last Go Test", ft = "go" },
  },
  
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    
    -- =========================================================================
    -- ICONS & SIGNS
    -- =========================================================================
    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DiagnosticError",
      linehl = "",
      numhl = "DiagnosticError",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "",
      texthl = "DiagnosticWarn",
      linehl = "",
      numhl = "DiagnosticWarn",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "",
      texthl = "DiagnosticInfo",
      linehl = "",
      numhl = "DiagnosticInfo",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "",
      texthl = "DiagnosticInfo",
      linehl = "",
      numhl = "DiagnosticInfo",
    })
    vim.fn.sign_define("DapStopped", {
      text = "",
      texthl = "DiagnosticHint",
      linehl = "Visual",
      numhl = "DiagnosticHint",
    })
    
    -- =========================================================================
    -- VIRTUAL TEXT
    -- =========================================================================
    require("nvim-dap-virtual-text").setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      clear_on_continue = false,
      display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == "inline" then
          return " = " .. variable.value
        else
          return variable.name .. " = " .. variable.value
        end
      end,
      virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
    })
    
    -- =========================================================================
    -- DAP UI - Enhanced Layout
    -- =========================================================================
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      element_mappings = {},
      expand_lines = vim.fn.has("nvim-0.7") == 1,
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.35 },
            { id = "breakpoints", size = 0.15 },
            { id = "stacks", size = 0.35 },
            { id = "watches", size = 0.15 },
          },
          size = 0.25,
          position = "left",
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 0.25,
          position = "bottom",
        },
      },
      controls = {
        enabled = true,
        element = "repl",
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "↻",
          terminate = "",
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5,
        border = "rounded",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil,
        max_value_lines = 100,
      },
    })
    
    -- =========================================================================
    -- LANGUAGE CONFIGURATIONS
    -- =========================================================================
    
    -- Go with enhanced features
    require("dap-go").setup({
      dap_configurations = {
        {
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      delve = {
        path = vim.fn.stdpath("data") .. "/mason/packages/delve/dlv",
        initialize_timeout_sec = 20,
        port = "${port}",
        args = {},
        build_flags = "",
        detached = vim.fn.has("win32") == 0,
        cwd = nil,
      },
    })
    
    -- =========================================================================
    -- MASON DAP SETUP
    -- =========================================================================
    require("mason-nvim-dap").setup({
      ensure_installed = {
        "codelldb",              -- C/C++/Rust
        "delve",                 -- Go
        "kotlin-debug-adapter",  -- Kotlin
        "java-debug-adapter",    -- Java
        "js-debug-adapter",      -- JavaScript/TypeScript/Node
        "debugpy",               -- Python
      },
      automatic_installation = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
        
        -- CodeLLDB for C/C++/Rust
        codelldb = function(config)
          local mason_registry = require("mason-registry")
          
          if not mason_registry.is_installed("codelldb") then
            require("mason-nvim-dap").default_setup(config)
            return
          end
          
          local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
          local codelldb_path = extension_path .. "adapter/codelldb"
          local liblldb_path = extension_path .. "lldb/lib/liblldb"
          
          local this_os = vim.uv.os_uname().sysname
          
          if this_os:find("Windows") then
            codelldb_path = extension_path .. "adapter\\codelldb.exe"
            liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
          elseif this_os == "Darwin" then
            liblldb_path = liblldb_path .. ".dylib"
          else
            liblldb_path = liblldb_path .. ".so"
          end
          
          dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
              command = codelldb_path,
              args = { "--port", "${port}" },
            },
          }
          
          local codelldb_config = {
            {
              name = "Launch file",
              type = "codelldb",
              request = "launch",
              program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
              end,
              cwd = "${workspaceFolder}",
              stopOnEntry = false,
            },
            {
              name = "Attach to process",
              type = "codelldb",
              request = "attach",
              pid = require("dap.utils").pick_process,
              args = {},
            },
          }
          
          dap.configurations.cpp = codelldb_config
          dap.configurations.c = codelldb_config
          dap.configurations.rust = codelldb_config
        end,
      },
    })
    
    -- =========================================================================
    -- MANUAL DEBUGGER CONFIGURATIONS
    -- =========================================================================
    -- These debuggers are installed via Mason but configured manually
    
    -- Kotlin Debug Adapter
    local kotlin_debug_adapter_path = vim.fn.stdpath("data") .. "/mason/packages/kotlin-debug-adapter/adapter/bin/kotlin-debug-adapter"
    if vim.fn.has("win32") == 1 then
      kotlin_debug_adapter_path = kotlin_debug_adapter_path .. ".bat"
    end
    
    dap.adapters.kotlin = {
      type = "executable",
      command = kotlin_debug_adapter_path,
      args = {},
    }
    
    dap.configurations.kotlin = {
      {
        type = "kotlin",
        request = "launch",
        name = "Launch kotlin program",
        projectRoot = "${workspaceFolder}",
        mainClass = function()
          return vim.fn.input("Main class: ", "", "file")
        end,
      },
      {
        type = "kotlin",
        request = "attach",
        name = "Attach to kotlin process",
        projectRoot = "${workspaceFolder}",
        hostName = "localhost",
        port = 5005,
        timeout = 2000,
      },
    }
    
    -- Java Debug Adapter
    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
      },
      {
        type = "java",
        request = "launch",
        name = "Debug (Launch) - Current File",
        mainClass = "${file}",
      },
      {
        type = "java",
        request = "launch",
        name = "Debug (Launch) - Main Class",
        mainClass = function()
          return vim.fn.input("Main class: ", "", "file")
        end,
      },
    }
    
    -- JavaScript/TypeScript/Node.js Debug Adapter
    local js_debug_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
    
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { js_debug_path .. "/js-debug/src/dapDebugServer.js", "${port}" },
      },
    }
    
    for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest Tests",
          runtimeExecutable = "node",
          runtimeArgs = {
            "./node_modules/jest/bin/jest.js",
            "--runInBand",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
      }
    end
    
    -- Python Debug Adapter (debugpy)
    dap.adapters.python = {
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
      args = { "-m", "debugpy.adapter" },
    }
    
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python3"
          end
        end,
      },
      {
        type = "python",
        request = "launch",
        name = "Launch file with arguments",
        program = "${file}",
        args = function()
          local args_string = vim.fn.input("Arguments: ")
          return vim.split(args_string, " +")
        end,
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python3"
          end
        end,
      },
    }
    
    -- Note: Telescope DAP extension is loaded by telescope.lua configuration
    
    -- =========================================================================
    -- AUTO UI MANAGEMENT
    -- =========================================================================
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    
    -- =========================================================================
    -- CUSTOM COMMANDS
    -- =========================================================================
    vim.api.nvim_create_user_command("DapUIToggle", function()
      require("dapui").toggle()
    end, {})
    
    vim.api.nvim_create_user_command("DapClearBreakpoints", function()
      require("dap").clear_breakpoints()
      vim.notify("All breakpoints cleared", vim.log.levels.INFO)
    end, {})
    
    vim.api.nvim_create_user_command("DapShowLog", function()
      vim.cmd("split")
      vim.cmd("edit " .. vim.fn.stdpath("cache") .. "/dap.log")
    end, {})
  end,
}
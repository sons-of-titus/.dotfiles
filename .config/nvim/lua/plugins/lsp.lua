return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Mason setup removed (moved to mason.lua)

    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",
        "gopls",
        "zls",
        "lua_ls",
        "rust_analyzer",
        "clojure_lsp",

        "kotlin_language_server",
        "angularls", -- Angular
        "ts_ls", -- TypeScript/Next.js
        "eslint", -- ESLint LSP
      },
      automatic_installation = true,
    })
    
    -- Neodev for better Lua LSP
    require("neodev").setup()
    
    -- LSP capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    
    -- LSP keymaps
    local on_attach = function(client, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end
      
      nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
      -- nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences") -- Removed to avoid conflict with default gra/grn/grr
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("<leader>ds", vim.lsp.buf.document_symbol, "[D]ocument [S]ymbols")
      nmap("<leader>Ws", vim.lsp.buf.workspace_symbol, "[W]orkspace [S]ymbols")
      
      -- Diagnostic keymaps
      nmap("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
      nmap("]d", vim.diagnostic.goto_next, "Next Diagnostic")
      nmap("<leader>ld", vim.diagnostic.open_float, "Show Diagnostics")
      nmap("<leader>lq", vim.diagnostic.setloclist, "Quickfix")
      
      -- Format on save
      if client:supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end
    
    -- Setup language servers
    local lspconfig_configs = require("lspconfig.configs")
    local function setup_server(server, config)
      local ok, definition = pcall(require, "lspconfig.configs." .. server)
      if not ok then return end
      lspconfig_configs[server] = definition
      lspconfig_configs[server].setup(config)
    end
    
    -- Lua
    setup_server("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    
    -- Go
    setup_server("gopls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    -- Zig
    setup_server("zls", {
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    -- C/C++
    setup_server("clangd", {
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    -- Rust
    setup_server("rust_analyzer", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Clojure
    setup_server("clojure_lsp", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Kotlin
    setup_server("kotlin_language_server", {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    local util = require("lspconfig.util")

    -- Angular
    local global_npm_root = "/Users/mohamedabdellahi/.nvm/versions/node/v25.1.0/lib/node_modules"
    setup_server("angularls", {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = util.root_pattern("angular.json", "project.json"),
      cmd = {
        "ngserver",
        "--stdio",
        "--tsProbeLocations", global_npm_root,
        "--ngProbeLocations", global_npm_root,
      },
      on_new_config = function(new_config, new_root_dir)
        new_config.cmd = {
          "ngserver",
          "--stdio",
          "--tsProbeLocations", global_npm_root,
          "--ngProbeLocations", global_npm_root,
        }
      end,
    })

    -- TypeScript / Next.js
    setup_server("ts_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = util.root_pattern("tsconfig.json", "package.json", "bun.lockb", ".git"),
    })

    -- ESLint
    setup_server("eslint", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    
    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✗",
          [vim.diagnostic.severity.WARN] = "⚠",
          [vim.diagnostic.severity.HINT] = "●",
          [vim.diagnostic.severity.INFO] = "ℹ",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
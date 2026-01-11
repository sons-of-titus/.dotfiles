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
    -- Mason setup
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    
    require("mason-lspconfig").setup({
      ensure_installed = { "clangd", "gopls", "zls", "lua_ls", "rust_analyzer" },
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
      nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("<leader>ds", vim.lsp.buf.document_symbol, "[D]ocument [S]ymbols")
      nmap("<leader>ws", vim.lsp.buf.workspace_symbol, "[W]orkspace [S]ymbols")
      
      -- Diagnostic keymaps
      nmap("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
      nmap("]d", vim.diagnostic.goto_next, "Next Diagnostic")
      nmap("<leader>d", vim.diagnostic.open_float, "Show Diagnostics")
      nmap("<leader>q", vim.diagnostic.setloclist, "Quickfix")
      
      -- Format on save
      if client.supports_method("textDocument/formatting") then
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
    local lspconfig = require("lspconfig")
    
    -- Lua
    lspconfig.lua_ls.setup({
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
    lspconfig.gopls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    -- Zig
    lspconfig.zls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    -- C/C++
    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    
    -- Rust (if available)
    local rust_ok, _ = pcall(function()
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end)
    
    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
    
    -- Diagnostic signs
    local signs = { Error = "✗", Warn = "⚠", Hint = "●", Info = "ℹ" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
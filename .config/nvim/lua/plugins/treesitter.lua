return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("nvim-treesitter not loaded", vim.log.levels.WARN)
      return
    end
    
    configs.setup({
      ensure_installed = {
        "c", "cpp", "go", "zig", "lua", "vim", "vimdoc", "query",
        "rust", "haskell", "clojure", "kotlin",
      },
      sync_install = false,
      auto_install = true,
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<bs>",
        },
      },
    })
  end,
}

return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  init = function()
    -- Database UI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_force_echo_notifications = 0
    vim.g.db_ui_win_position = "left"
    vim.g.db_ui_winwidth = 40
    
    -- Use nvim-notify for notifications if available
    vim.g.db_ui_use_nvim_notify = 1
    
    -- Save database queries location
    vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui_queries"
    
    -- Auto execute on save
    vim.g.db_ui_execute_on_save = 0
    
    -- Database drawer settings
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_table_helpers = {
      mysql = {
        Count = "SELECT COUNT(*) FROM {table}",
        Explain = "EXPLAIN {last_query}",
      },
      postgresql = {
        Count = "SELECT COUNT(*) FROM {table}",
        Explain = "EXPLAIN ANALYZE {last_query}",
      },
      sqlite = {
        Count = "SELECT COUNT(*) FROM {table}",
        Explain = "EXPLAIN QUERY PLAN {last_query}",
      },
    }
    
    -- Icons customization
    vim.g.db_ui_icons = {
      expanded = {
        db = "▾ ",
        buffers = "▾ ",
        saved_queries = "▾ ",
        schemas = "▾ ",
        schema = "▾ פּ",
        tables = "▾ 藺",
        table = "▾ ",
      },
      collapsed = {
        db = "▸ ",
        buffers = "▸ ",
        saved_queries = "▸ ",
        schemas = "▸ ",
        schema = "▸ פּ",
        tables = "▸ 藺",
        table = "▸ ",
      },
      saved_query = "",
      new_query = "璘",
      tables = "離",
      buffers = "﬘",
      add_connection = "",
      connection_ok = "✓",
      connection_error = "✕",
    }
  end,
  keys = {
    { "<leader>Dbt", "<cmd>DBUIToggle<cr>", desc = "Toggle Database UI" },
    { "<leader>Dbf", "<cmd>DBUIFindBuffer<cr>", desc = "Find Database Buffer" },
    { "<leader>Dbr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename Database Buffer" },
    { "<leader>Dbi", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
  },
}

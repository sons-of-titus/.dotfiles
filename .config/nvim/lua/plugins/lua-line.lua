return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      blue   = '#89b4fa',
      cyan   = '#89dceb',
      black  = '#181825', -- Mantle
      white  = '#cdd6f4', -- Text
      red    = '#f38ba8',
      violet = '#cba6f7',
      grey   = '#313244', -- Surface0
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },
      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },
      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
        globalstatus = true, -- Use a single global statusline
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 
          'filename', 
          'branch', 
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
          },
        },
        lualine_c = {
          '%=', -- Center alignment
        },
        lualine_x = {
          {
            'diagnostics',
            sources = { "nvim_diagnostic" },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          },
          {
            -- LSP Clients component
            function()
              local msg = 'No Active Lsp'
              local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              local lsps = {}
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  table.insert(lsps, client.name)
                end
              end
              if #lsps > 0 then
                return table.concat(lsps, ", ")
              end
              return msg
            end,
            icon = ' LSP:',
            color = { fg = '#ffffff', gui = 'bold' },
          },
        },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
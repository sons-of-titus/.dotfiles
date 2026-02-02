return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical terminal" },
    { "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", desc = "Toggle LazyGit" },
  },
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    -- LazyGit Integration
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ 
        cmd = "lazygit", 
        hidden = true,
        direction = "float",
        float_opts = {
            border = "curved",
        },
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    -- Terminal keymaps
    function _G.set_terminal_keymaps()
      local opts = {buffer = 0}
      -- Changed to <Esc><Esc> to avoid conflict with standard Esc usage
      vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
  end,
}
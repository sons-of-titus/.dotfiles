return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    { "<leader>uT", "<cmd>Twilight<cr>", desc = "Twilight" },
  },
  dependencies = { "folke/twilight.nvim" },
  opts = {
    window = {
      backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 120, -- width of the Zen window
      height = 0.9, -- height of the Zen window
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        foldcolumn = "0", -- disable fold column
        list = false, -- disable whitespace characters
      },
    },
    plugins = {
      -- disable some global vim options (vim.opt)
      options = {
        enabled = true,
        ruler = false, -- disables the ruler text in the status line
        showcmd = false, -- disables the command in the last line of the screen
      },
      twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = false }, -- disables git signs
      tmux = { enabled = true }, -- disables the tmux statusline
      -- this will change the font size on kitty when in zen mode
      -- to make this work, you need to set the following option in your kitty config
      -- allow_remote_control socket-only
      -- listen_on unix:/tmp/mykitty
      kitty = {
        enabled = false,
        font = "+4", -- font size increment
      },
      -- this will change the font size on alacritty when in zen mode
      -- requires  Alacritty Version 0.10.0 or higher
      -- uses `alacritty msg` subcommand to change font size
      alacritty = {
        enabled = false,
        font = "14", -- font size
      },
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function(win)
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function(win)
    end,
  },
}

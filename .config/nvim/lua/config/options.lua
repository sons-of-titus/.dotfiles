-- =============================================================================
-- NEovim OPTIONS
-- =============================================================================

local opt = vim.opt

-- General ---------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = ","

opt.mouse = "a"           -- Enable mouse support
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.undofile = true       -- Enable persistent undo
opt.undolevels = 10000
opt.updatetime = 250      -- Faster completion
opt.timeoutlen = 300      -- Time to wait for a mapped sequence
opt.completeopt = { "menu", "menuone", "noselect" }
opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|

-- UI / Appearance ------------------------------------------------------------
opt.termguicolors = true  -- True color support
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.signcolumn = "yes"    -- Always show signcolumn
opt.cursorline = true     -- Highlight current line
opt.cursorlineopt = "both"
opt.laststatus = 3        -- Global statusline
opt.showmode = false      -- Don't show mode (lualine does this)
opt.scrolloff = 8         -- Minimum lines to keep above/below cursor
opt.sidescrolloff = 8
opt.smoothscroll = true   -- Enabled in Neovim 0.10+
opt.list = true           -- Show certain invisible characters
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" }
opt.pumheight = 10        -- Maximum number of entries in a popup
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

-- Search ----------------------------------------------------------------------
opt.ignorecase = true     -- Case-insensitive search
opt.smartcase = true      -- ... unless uppercase is used
opt.hlsearch = true       -- Highlight matches
opt.incsearch = true      -- Incremental search

-- Indentation -----------------------------------------------------------------
opt.expandtab = true      -- Use spaces instead of tabs
opt.shiftwidth = 2        -- Size of an indent
opt.tabstop = 2           -- Number of spaces tabs count for
opt.softtabstop = 2
opt.smartindent = true    -- Insert indents automatically
opt.breakindent = true    -- Wrap lines with indent

-- Splits ----------------------------------------------------------------------
opt.splitbelow = true     -- Put new windows below current
opt.splitright = true     -- Put new windows right of current

-- Folding ---------------------------------------------------------------------
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

-- Command line ----------------------------------------------------------------
opt.cmdheight = 1
opt.showcmd = true
opt.wildmenu = true
opt.wildmode = "longest:full,full"

-- Encoding --------------------------------------------------------------------
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- History ---------------------------------------------------------------------
opt.history = 1000

-- Diff ------------------------------------------------------------------------
opt.diffopt:append("vertical")

-- Cursor visibility -----------------------------------------------------------
-- n-v-c-sm: block cursor, i-ci-ve: vertical bar
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"


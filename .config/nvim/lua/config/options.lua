-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.wrap = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,120"
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 0

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Undo
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Files
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.autoread = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Mouse
vim.opt.mouse = "a"

-- Command line
vim.opt.cmdheight = 1
vim.opt.showcmd = true
vim.opt.showmode = false

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- Status
vim.opt.laststatus = 3
vim.opt.ruler = false

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- History
vim.opt.history = 1000

-- Better diff
vim.opt.diffopt:append("vertical")
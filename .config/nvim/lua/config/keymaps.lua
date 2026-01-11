-- Save and quit
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })

-- Buffer navigation
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr><Esc>", { desc = "Clear search highlight" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Better navigation
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Select all
vim.keymap.set("n", "<leader>aa", "ggVG", { desc = "Select all" })

-- Quickfix
vim.keymap.set("n", "<leader>co", "<cmd>copen<cr>", { desc = "Open quickfix" })
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close quickfix" })
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "Next quickfix" })
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<cr>", { desc = "Previous quickfix" })

-- Location list
vim.keymap.set("n", "<leader>lo", "<cmd>lopen<cr>", { desc = "Open location list" })
vim.keymap.set("n", "<leader>lc", "<cmd>lclose<cr>", { desc = "Close location list" })

-- Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

-- Yank to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- Paste in visual mode without yanking
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking (using <leader>D to avoid conflict with LSP diagnostics)
vim.keymap.set("n", "<leader>D", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "<leader>D", '"_d', { desc = "Delete without yanking" })

-- System clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before from system clipboard" })

-- Toggle options
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "Toggle wrap" })
vim.keymap.set("n", "<leader>tn", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<leader>tr", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

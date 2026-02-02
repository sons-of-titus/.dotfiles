-- =============================================================================
-- KEYMAPS CONFIGURATION
-- =============================================================================

local set = vim.keymap.set

-- 1. General (File / Quit) ---------------------------------------------------
set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })

-- 2. Movement & Navigation ----------------------------------------------------
-- Better navigation for search results
set("n", "n", "nzzzv", { desc = "Next search result" })
set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Clear search highlight with Esc
set("n", "<Esc>", "<cmd>nohlsearch<cr><Esc>", { desc = "Clear search highlight" })

-- Buffer navigation
set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })

-- 3. Text Editing & Manipulation ----------------------------------------------
-- Move lines (Normal: Alt+j/k, Visual: J/K)
set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move line down" })
set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move line up" })
set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- Single, joined mapping for J (Join lines while keeping cursor in place)
set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Better indenting (keeps selection)
set("v", "<", "<gv", { desc = "Indent left" })
set("v", ">", ">gv", { desc = "Indent right" })

-- Select all
set("n", "<leader>aa", "ggVG", { desc = "Select all" })

-- Replace word under cursor across file
set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

-- 4. Clipboard & Deletion -----------------------------------------------------
-- System clipboard
set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
set("n", "<leader>v", '"+p', { desc = "Paste from system clipboard" })
set("n", "<leader>V", '"+P', { desc = "Paste before from system clipboard" })

-- Yank to end of line
set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Delete/Paste without losing register
set("n", "<leader>D", '"_d', { desc = "Delete without yanking" })
set("v", "<leader>D", '"_d', { desc = "Delete without yanking" })
set("x", "p", '"_dP', { desc = "Paste without yanking" })

-- 5. UI Toggles ---------------------------------------------------------------
set("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "Toggle wrap" })
set("n", "<leader>un", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
set("n", "<leader>ur", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })

-- 6. Lists & Diagnostics ------------------------------------------------------
-- Quickfix
set("n", "<leader>co", "<cmd>copen<cr>", { desc = "Open quickfix" })
set("n", "<leader>cc", "<cmd>cclose<cr>", { desc = "Close quickfix" })
set("n", "<leader>cn", "<cmd>cnext<cr>", { desc = "Next quickfix" })
set("n", "<leader>cp", "<cmd>cprev<cr>", { desc = "Previous quickfix" })

-- Location list
set("n", "<leader>lo", "<cmd>lopen<cr>", { desc = "Open location list" })
set("n", "<leader>lc", "<cmd>lclose<cr>", { desc = "Close location list" })

-- 7. Terminal -----------------------------------------------------------------
set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

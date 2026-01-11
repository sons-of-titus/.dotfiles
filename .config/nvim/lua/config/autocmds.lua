-- Autocommands

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto create directories when saving
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local file = vim.fn.expand("<afile>")
    local dir = vim.fn.fnamemodify(file, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Format on save (if formatter is available)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = { "*.lua", "*.go", "*.zig", "*.c", "*.cpp", "*.h", "*.hpp" },
  callback = function()
    local ok, conform = pcall(require, "conform")
    if ok then
      conform.format({ async = false, lsp_fallback = true })
    end
  end,
})

-- Resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Close certain file types with q
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = {
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "neotest-output",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Set filetype for specific file patterns
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup,
  pattern = { "*.zig" },
  callback = function()
    vim.bo.filetype = "zig"
  end,
})

-- Auto reload file when changed externally
vim.api.nvim_create_autocmd({ "FocusGained", "TermOpen", "TermEnter" }, {
  group = augroup,
  command = "checktime",
})

-- Disable comment continuation
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Remember folds
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = augroup,
  pattern = "*.*",
  callback = function()
    if vim.fn.expand("%") ~= "" then
      vim.fn.mkdir(vim.fn.expand("~/.local/share/nvim/backup"), "p")
      vim.fn.writefile(vim.fn.split(vim.fn.execute("silent! mkview"), "\n"), vim.fn.expand("~/.local/share/nvim/backup/" .. vim.fn.expand("%:t")))
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup,
  pattern = "*.*",
  callback = function()
    if vim.fn.expand("%") ~= "" then
      local file = vim.fn.expand("~/.local/share/nvim/backup/" .. vim.fn.expand("%:t"))
      if vim.fn.filereadable(file) == 1 then
        vim.fn.execute("silent! source " .. file)
      end
    end
  end,
})

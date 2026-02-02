-- Better escape from insert mode
return {
  "max397574/better-escape.nvim",
  config = function()
    -- Function to replicate clear_empty_lines behavior
    -- The plugin (v2+) typically inserts characters as you type.
    -- If we type 'j', it's in the buffer. Then 'k' triggers this.
    -- We assume the plugin cleans up the trigger keys or we handle it.
    -- The README suggests this pattern for clear_empty_lines:
    local function clear_empty_lines_esc()
      vim.api.nvim_input("<Esc>")
      local current_line = vim.api.nvim_get_current_line()
      -- Check if line matches whitespace followed by one char (the leftovers of trigger)
      -- or just whitespace if the plugin cleared it already.
      if current_line:match("^%s+.$") or current_line:match("^%s*$") then
        vim.schedule(function()
          -- Verify again after Esc has processed (though schedule is fast)
          local line = vim.api.nvim_get_current_line()
          if line:match("^%s+.$") or line:match("^%s*$") then
             vim.api.nvim_set_current_line("")
          end
        end)
      end
    end

    require("better_escape").setup({
      -- Use a reasonable timeout. vim.o.timeoutlen can be too long (1000ms).
      -- 300ms is standard for chorded mappings to feel snappy but allow typing.
      timeout = vim.o.timeoutlen > 300 and 300 or vim.o.timeoutlen, 
      default_mappings = false, 
      mappings = {
        i = {
          j = {
            -- Map both jk and jj to escape and clear empty lines
            k = clear_empty_lines_esc,
            j = clear_empty_lines_esc,
          },
        },
        c = {
          j = {
            k = "<C-c>",
            j = "<C-c>",
          },
        },
        t = {
          j = {
            k = "<C-\\><C-n>",
          },
        },
        v = {
          j = {
            k = "<Esc>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
        },
      },
    })
  end,
}

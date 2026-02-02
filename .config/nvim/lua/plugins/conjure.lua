return {
  "Olical/conjure",
  ft = { "clojure", "fennel", "janet" }, -- Lazy load on these filetypes
  config = function(_, opts)
    require("conjure.main").main()
    require("conjure.mapping")["on-filetype"]()
  end,
  init = function()
    -- Set configuration options here
    -- vim.g["conjure#debug"] = true
    vim.g["conjure#mapping#doc_word"] = "gk" -- Map K to documentation (standard is K, but we use that for hover)
    vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false -- Don't auto-start REPL, let user do it
    vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = {"deftest", "defflow"} -- Add other test macros if needed

    -- Standard local leader for conjure is often comma or space-m.
    -- Since we use Space as leader, we can default to localleader.
    -- Ensure localleader is set if not already (often set to backslash or comma)
    if vim.g.maplocalleader == nil then
      vim.g.maplocalleader = ","
    end
  end,
  dependencies = {
    { "PaterJason/cmp-conjure" }, -- Install cmp-conjure here as dependency
  },
}

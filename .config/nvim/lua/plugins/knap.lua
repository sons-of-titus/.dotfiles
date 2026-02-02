return {
  "frabjous/knap",
  config = function()
    -- Set up global mappings
    local gknap = require("knap")
    vim.keymap.set("n", "<leader>kp", function() gknap.toggle_autopreviewing() end, { desc = "Toggle Knap Preview" })
    vim.keymap.set("n", "<leader>kr", function() gknap.process_once() end, { desc = "Knap Process Once" })

    -- macOS-specific settings
    -- Note: This assumes you have the necessary tools installed (pandoc, pdflatex, groff, etc.)
    local g = vim.g

    g.knap_settings = {
      -- HTML
      htmloutputext = "html",
      htmltohtml = "none",
      htmlviewerlaunch = "open %outputfile%",
      htmlviewerrefresh = "none", -- Most browsers autoreload local files or need extension, or use simple refresh script

      -- Markdown (via Pandoc to HTML)
      mdoutputext = "html",
      mdtohtml = "pandoc --standalone --mathjax -f markdown -t html %docroot% -o %outputfile%",
      mdviewerlaunch = "open %outputfile%",
      mdviewerrefresh = "none",

      -- LaTeX
      texoutputext = "pdf",
      textopdf = "pdflatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
      textopdfviewerlaunch = "open %outputfile%",
      textopdfviewerrefresh = "none", -- Preview.app doesn't auto-refresh well. Skim is recommended for Mac.

      -- Groff
      groffoutputext = "pdf",
      grofftoco = "groff -ms -Tpdf %docroot% > %outputfile%",
      groffviewerlaunch = "open %outputfile%",
      groffviewerrefresh = "none",
    }

    -- Tweaks for better Mac experience if using specific apps (uncomment if you have them)
    -- If using Skim (recommended for LaTeX):
    -- g.knap_settings.textopdfviewerlaunch = "open -a Skim %outputfile%"
    -- g.knap_settings.textopdfviewerrefresh = "pkill -HUP Skim"
  end,
}

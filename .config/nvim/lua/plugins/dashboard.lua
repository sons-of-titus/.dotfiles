return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = "doom",
            config = {
                header = {
                    "",
                    "",
                    "                                                       ",
                    "                                                       ",
                    "                                                       ",
                    "                                                       ",
                    "                                                       ",
                    "                                                       ",
                    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                    "                                                       ",
                    "                                                       ",
                    "                                                       ",
                },
                center = {
                    {
                        icon = "   ",
                        icon_hl = "DashboardIcon",
                        desc = "Find File           ",
                        desc_hl = "DashboardDesc",
                        key = "f",
                        key_hl = "DashboardKey",
                        key_format = " [%s]",
                        action = "lua require('telescope.builtin').find_files()"
                    },
                    {
                        icon = "   ",
                        icon_hl = "DashboardIcon",
                        desc = "Recent Files        ",
                        desc_hl = "DashboardDesc",
                        key = "r",
                        key_hl = "DashboardKey",
                        key_format = " [%s]",
                        action = "lua require('telescope.builtin').oldfiles()"
                    },
                    {
                        icon = "   ",
                        icon_hl = "DashboardIcon",
                        desc = "Find Text           ",
                        desc_hl = "DashboardDesc",
                        key = "g",
                        key_hl = "DashboardKey",
                        key_format = " [%s]",
                        action = "lua require('telescope.builtin').live_grep()"
                    },
                    {
                        icon = "   ",
                        icon_hl = "DashboardIcon",
                        desc = "Projects            ",
                        desc_hl = "DashboardDesc",
                        key = "p",
                        key_hl = "DashboardKey",
                        key_format = " [%s]",
                        action = function()
                          local ok, _ = pcall(function()
                            require("telescope").extensions.project.project{}
                          end)
                          if not ok then
                            vim.cmd("Telescope projects")
                          end
                        end
                    },
                    {
                        icon = "   ",
                        icon_hl = "DashboardIcon",
                        desc = "New File            ",
                        desc_hl = "DashboardDesc",
                        key = "n",
                        key_hl = "DashboardKey",
                        key_format = " [%s]",
                        action = "enew"
                    },
                    {
                        icon = "   ",
                        icon_hl = "DashboardIcon",
                        desc = "Configuration       ",
                        desc_hl = "DashboardDesc",
                        key = "c",
                        key_hl = "DashboardKey",
                        key_format = " [%s]",
                        action = "edit ~/.config/nvim/init.lua"
                    },
                    {
                        icon = "   ",
                        icon_hl = "DashboardIcon",
                        desc = "Lazy Plugin Manager ",
                        desc_hl = "DashboardDesc",
                        key = "l",
                        key_hl = "DashboardKey",
                        key_format = " [%s]",
                        action = "Lazy"
                    },
                    {
                        icon = "   ",
                        icon_hl = "DashboardIcon",
                        desc = "Quit Neovim         ",
                        desc_hl = "DashboardDesc",
                        key = "q",
                        key_hl = "DashboardKey",
                        key_format = " [%s]",
                        action = "quit"
                    },
                },
                footer = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return {
                        "",
                        "",
                        "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━",
                        "",
                        "  Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins  in " .. ms .. "ms",
                        "",
                    }
                end,
            },
            hide = {
                statusline = true,
                tabline = true,
                winbar = true,
            },
        })

        -- Custom highlight groups for a beautiful color scheme
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#89b4fa", bold = true })
        vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#f38ba8", bold = true })
        vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#cdd6f4" })
        vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#a6e3a1", bold = true })
        vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#6c7086", italic = true })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" }
}
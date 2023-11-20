return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({
                terminal_colors = false,
                borders = true,
                diff = { mode = "fg" },
                errors = { mode = "bg" },
                on_highlights = function(highlights, colors)
                    local origin_shade = "#2B303B"

                    local selection = { bg = colors.polar_night.bright }
                    local float_border = { bg = origin_shade, fg = origin_shade }
                    local float_normal = { bg = origin_shade, fg = colors.snow_storm.origin }

                    highlights["TelescopeBorder"] = float_border
                    highlights["TelescopeNormal"] = float_normal
                    highlights["TelescopePromptNormal"] = { bg = colors.polar_night.bright }
                    highlights["TelescopePromptBorder"] = {
                        bg = colors.polar_night.bright,
                        fg = colors.polar_night.bright,
                    }
                    highlights["TelescopePromptTitle"] = { fg = colors.frost.artic_water }
                    highlights["TelescopeSelection"] = selection
                    highlights["Title"] =
                        { fg = colors.frost.artic_water, bg = origin_shade, bold = true }
                    highlights["TelescopeTitle"] = { link = "Title" }
                    highlights["TelescopeMultiIcon"] = { fg = colors.aurora.yellow }
                    highlights["TelescopeMultiSelection"] = { fg = colors.aurora.yellow }

                    highlights["CmpNormal"] = float_normal
                    highlights["CmpBorder"] = float_border
                    highlights["CmpCursorLine"] = selection

                    highlights["FloatBorder"] = float_border
                    highlights["NormalFloat"] = float_normal
                    highlights["Pmenu"] = { bg = origin_shade }
                    highlights["PmenuSel"] = selection
                end,
            })
            vim.cmd.colorscheme("nord")
        end,
    },
}

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

                    highlights["TelescopeResultsNormal"] = { bg = origin_shade }
                    highlights["TelescopeResultsBorder"] = { bg = origin_shade, fg = origin_shade }
                    highlights["TelescopePreviewNormal"] = { bg = origin_shade }
                    highlights["TelescopePreviewBorder"] = { bg = origin_shade, fg = origin_shade }
                    highlights["TelescopePromptNormal"] = { bg = colors.polar_night.bright }
                    highlights["TelescopePromptBorder"] = {
                        bg = colors.polar_night.bright,
                        fg = colors.polar_night.bright,
                    }
                    highlights["TelescopePromptTitle"] = { fg = colors.frost.artic_water }
                    highlights["TelescopeSelection"] = { bg = colors.polar_night.bright }
                    highlights["Title"] = { fg = colors.frost.artic_water, bg = origin_shade }
                    highlights["TelescopeTitle"] = { link = "Title" }
                    highlights["TelescopeMultiIcon"] = { fg = colors.aurora.yellow }
                    highlights["TelescopeMultiSelection"] = { fg = colors.aurora.yellow }

                    highlights["CmpNormal"] = { bg = origin_shade, fg = colors.snow_storm.origin }
                    highlights["CmpBorder"] = { bg = origin_shade, fg = origin_shade }
                    highlights["CmpCursorLine"] = { bg = colors.polar_night.bright }

                    highlights["FloatBorder"] = { bg = origin_shade, fg = origin_shade }
                    highlights["NormalFloat"] = { bg = origin_shade }
                end,
            })
            vim.cmd.colorscheme("nord")
        end,
    },
}

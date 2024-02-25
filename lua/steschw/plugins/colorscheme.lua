return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nord").setup({
            terminal_colors = false,
            borders = true,
            diff = { mode = "fg" },
            errors = { mode = "bg" },
            on_highlights = function(hl, c)
                local origin_shade = "#2B303B"

                local selection = { bg = c.polar_night.bright }
                local float_border = { bg = origin_shade, fg = origin_shade }
                local float_normal = { bg = origin_shade, fg = c.snow_storm.origin }

                hl["TelescopeBorder"] = float_border
                hl["TelescopeNormal"] = float_normal
                hl["TelescopePromptNormal"] = { bg = c.polar_night.bright }
                hl["TelescopePromptBorder"] =
                    { bg = c.polar_night.bright, fg = c.polar_night.bright }
                hl["TelescopePromptTitle"] = { fg = c.frost.artic_water }
                hl["TelescopeSelection"] = selection
                hl["Title"] = { fg = c.frost.artic_water, bg = origin_shade, bold = true }
                hl["TelescopeTitle"] = { link = "Title" }
                hl["TelescopeMultiIcon"] = { fg = c.aurora.yellow }
                hl["TelescopeMultiSelection"] = { fg = c.aurora.yellow }

                hl["CmpNormal"] = float_normal
                hl["CmpBorder"] = float_border
                hl["CmpCursorLine"] = selection

                hl["FloatBorder"] = float_border
                hl["NormalFloat"] = float_normal
                hl["Pmenu"] = { bg = origin_shade }
                hl["PmenuSel"] = selection

                hl["StatusLineNC"] = { bg = c.polar_night.origin, fg = c.polar_night.origin }
                hl["StatusLine"] = { bg = c.polar_night.origin }

                hl["FixmeSeverityError"] = { fg = c.aurora.red }
                hl["FixmeSeverityWarn"] = { fg = c.aurora.yellow }
                hl["FixmeSeverityInfo"] = { fg = c.frost.ice }
                hl["FixmeSeverityHint"] = { fg = c.frost.artic_water }
                hl["FixmeFilepath"] = { link = "Directory" }
                hl["FixmeText"] = { fg = c.snow_storm.origin }
                hl["QuickFixLine"] = { bg = c.polar_night.brighter }

                hl["MiniHipatternsTodo"] = { bg = c.frost.ice, fg = c.polar_night.origin }
                hl["MiniHipatternsRefactor"] = { bg = c.aurora.yellow, fg = c.polar_night.origin }
                hl["MiniHipatternsFixme"] = { bg = c.aurora.red, fg = c.snow_storm.origin }
            end,
        })
        vim.cmd.colorscheme("nord")
    end,
}

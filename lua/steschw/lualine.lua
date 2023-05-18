local lualine = require("lualine")

local lsp_icons = require("steschw.lsp.style").icons
local nord = require("steschw.colors.nord")

local nord_theme = require("lualine.themes.nord")
nord_theme.normal.c.bg = nord.polar_night.bright

lualine.setup({
    options = {
        theme = nord_theme,
        globalstatus = true,
        component_separators = "",
        section_separators = "",
    },
    extensions = {
        "nvim-tree",
        "trouble",
        "quickfix",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                sections = { "error", "warn", "info", "hint" },
                symbols = {
                    error = lsp_icons.error .. " ",
                    warn = lsp_icons.warn .. " ",
                    info = lsp_icons.info .. " ",
                    hint = lsp_icons.hint .. " ",
                },
                colored = true,
                update_in_insert = true,
            },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
            {
                "filename",
                file_status = false,
                newfile_status = false,
                path = 4,
                shorting_target = 100,
            },
        },
        lualine_z = {
            {
                "branch",
                icon = "",
            },
        },
    },
})

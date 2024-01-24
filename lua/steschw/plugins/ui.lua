local win_utils = require("steschw.utils.window")

return {
    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {
            input = {
                enabled = true,
                default_prompt = "Input:",
                title_pos = "left",
                insert_only = false,
                start_in_insert = true,
                border = "rounded",
                relative = "cursor",
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                    i = {
                        ["<C-q>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                },
            },
            select = {
                enabled = true,
                backend = { "builtin" },
                trim_prompt = true,
                builtin = {
                    min_width = win_utils.calc_width({ percent = 0.4 }),
                    max_width = win_utils.calc_width({ percent = 0.8 }),
                },
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                    i = {
                        ["<C-q>"] = "Close",
                    },
                },
            },
        },
    },

    -- file marks
    {
        "cbochs/grapple.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            {
                "mm",
                mode = { "n" },
                function()
                    require("grapple").toggle()
                    require("steschw.utils.statusline").update_statusline()
                end,
            },
            {
                "<leader>m",
                mode = { "n" },
                function()
                    require("grapple").popup_tags()
                end,
            },
        },
        opts = {
            popup_options = {
                border = "rounded",
                width = win_utils.calc_width({ percent = 0.7 }),
            },
        },
    },

    -- git
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "│" },
                topdelete = { text = "│" },
                changedelete = { text = "│" },
                untracked = { text = "│" },
            },
            current_line_blame_formatter = "<abbrev_sha>: <author> (<author_time:%a %d.%m.%Y>)",
            update_debounce = 1000,
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 500,
                ignore_whitespace = false,
            },
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require("colorizer").setup({
                filetypes = {
                    "css",
                    "scss",
                },
                user_default_options = {
                    mode = "background",
                    RGB = true, -- #RGB hex codes
                    RRGGBB = true, -- #RRGGBB hex codes
                    names = true, -- "Name" codes like Blue or blue
                    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                },
            })
        end,
    },
}

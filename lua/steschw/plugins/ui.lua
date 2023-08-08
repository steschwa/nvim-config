local win_utils = require("steschw.utils.window")

return {
    -- bufferline
    {
        "romgrk/barbar.nvim",
        version = "^1.0.0",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            animation = false,
            auto_hide = false,
            tabpages = false,
            closeable = false,
            clickable = false,
            focus_on_close = "left",
            icons = {
                button = "",
                filetype = {
                    enabled = false,
                },
                separator = { left = "▎", right = "" },
                modified = { button = "" },
            },
        },
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "cbochs/grapple.nvim",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "nord",
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
                            colored = true,
                            update_in_insert = true,
                        },
                    },
                    lualine_c = {
                        {
                            function()
                                local key = require("grapple").key()
                                return " [" .. key .. "]"
                            end,
                            cond = require("grapple").exists,
                        },
                    },
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
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                        },
                    },
                },
            })
        end,
    },

    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
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
                backend = { "nui" },
                nui = {
                    relative = "editor",
                    position = "50%",
                    min_width = win_utils.calc_width({ percent = 0.4 }),
                    max_width = win_utils.calc_width({ percent = 0.8 }),
                    border = {
                        style = "rounded",
                        padding = { 1, 2 },
                    },
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
}

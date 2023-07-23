local win_utils = require("steschw.utils.window")

return {
    -- bufferline
    {
        "romgrk/barbar.nvim",
        version = "^1.0.0",
        event = "VeryLazy",
        dependencies = {
            "lewis6991/gitsigns.nvim",
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
        },
        opts = {
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
                        --symbols = {
                        --    error = lsp_icons.error .. " ",
                        --    warn = lsp_icons.warn .. " ",
                        --    info = lsp_icons.info .. " ",
                        --    hint = lsp_icons.hint .. " ",
                        --},
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
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                    },
                },
            },
        },
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
                get_config = function(opts)
                    if opts.kind == "codeaction" then
                        return {
                            backend = "nui",
                            nui = {
                                min_width = win_utils.calc_width({ percent = 0.4 }),
                                max_width = win_utils.calc_width({ percent = 0.8 }),
                            },
                        }
                    end
                end,
            },
        },
    },
}

return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        config = function()
            local telescope = require("telescope")
            local telescope_actions = require("telescope.actions")
            local transform_mod = require("telescope.actions.mt").transform_mod

            local mod_qflist = {}
            mod_qflist.smart_send_to_qflist = function(bufnr)
                actions.smart_send_to_qflist(bufnr)
            end
            mod_qflist.open_qflist = function()
                vim.cmd("Trouble quickfix")
            end
            mod_qflist = transform_mod(mod_qflist)
            local action_qflist = mod_qflist.smart_send_to_qflist + mod_qflist.open_qflist

            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    multi_icon = " ",
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--trim",
                    },
                    path_display = { "tail" },
                    dynamic_preview_title = true,
                    cache_picker = false,
                    layout_strategy = "vertical",
                    layout_config = {
                        vertical = {
                            width = 0.5,
                            preview_cutoff = 0,
                        },
                    },
                    mappings = {
                        n = {
                            ["q"] = telescope_actions.close,
                            ["<C-q>"] = action_qflist,
                        },
                        i = {
                            ["<C-j>"] = telescope_actions.move_selection_next,
                            ["<C-k>"] = telescope_actions.move_selection_previous,
                            ["<C-q>"] = action_qflist,
                        },
                    },
                },
                pickers = {
                    find_files = {
                        find_command = {
                            "fd",
                            "--color=never",
                            "--hidden",
                            "--exclude",
                            "node_modules",
                            "--exclude",
                            ".git",
                            "--type",
                            "f",
                            "--strip-cwd-prefix",
                        },
                    },
                    live_grep = {
                        max_results = 20,
                        disable_coordinates = true,
                        layout_config = {
                            preview_height = 10,
                        },
                    },
                    lsp_document_symbols = {
                        previewer = false,
                        symbol_width = 0.5,
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "ignore_case",
                    },
                },
            })
        end
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        dependencies = {
            "nvim-telescope/telescope.nvim"
        }
    }
}
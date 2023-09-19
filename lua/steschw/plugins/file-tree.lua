return {
    {
        "nvim-tree/nvim-tree.lua",
        pin = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", "n" },
        },
        init = function()
            vim.g.loaded = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        config = function()
            local nvim_tree = require("nvim-tree")
            local map = require("steschw.utils.keys").map

            local function on_attach(bufnr)
                local api = require("nvim-tree.api")

                local opts = { buffer = bufnr }

                map("n", "q", api.tree.close, opts)
                map("n", "v", api.node.open.vertical, opts)
                map("n", "P", api.node.navigate.parent, opts)
                map("n", "K", api.node.navigate.sibling.first, opts)
                map("n", "J", api.node.navigate.sibling.last, opts)
                map("n", "I", api.tree.toggle_gitignore_filter, opts)
                map("n", "H", api.tree.toggle_hidden_filter, opts)
                map("n", "W", api.tree.collapse_all, opts)
                map("n", "E", api.tree.expand_all, opts)
                map("n", "<CR>", api.node.open.edit, opts)
                map("n", "l", api.node.open.edit, opts)
                map("n", "h", api.node.navigate.parent_close, opts)
                map("n", "a", api.fs.create, opts)
                map("n", "d", api.fs.remove, opts)
                map("n", "r", api.fs.rename, opts)
                map("n", "y", api.fs.copy.node, opts)
                map("n", "x", api.fs.cut, opts)
                map("n", "p", api.fs.paste, opts)
                map("n", "f", api.live_filter.start, opts)
                map("n", "F", api.live_filter.clear, opts)
                map("n", "m", api.node.open.preview, opts)
                map("n", "o", api.node.run.system, opts)
            end

            nvim_tree.setup({
                on_attach = on_attach,
                sort_by = "case_sensitive",
                select_prompts = true,
                view = {
                    width = {
                        min = 30,
                        max = -1,
                        padding = 4,
                    },
                },
                renderer = {
                    root_folder_label = false,
                    group_empty = false,
                    add_trailing = true,
                    highlight_opened_files = "name",
                    indent_width = 3,
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        show = {
                            folder_arrow = false,
                        },
                        glyphs = {
                            folder = {
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                            },
                        },
                    },
                    special_files = {},
                },
                filters = {
                    dotfiles = true,
                },
            })
        end,
    },
    {
        "antosha417/nvim-lsp-file-operations",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-tree.lua",
        },
        config = true,
    },
}

return {
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
        local keymap = require("steschw.utils.keys").keymap

        local function on_attach(bufnr)
            local api = require("nvim-tree.api")

            local opts = { buffer = bufnr }

            keymap("n", "q", api.tree.close, opts)
            keymap("n", "v", api.node.open.vertical, opts)
            keymap("n", "P", api.node.navigate.parent, opts)
            keymap("n", "K", api.node.navigate.sibling.first, opts)
            keymap("n", "J", api.node.navigate.sibling.last, opts)
            keymap("n", "I", api.tree.toggle_gitignore_filter, opts)
            keymap("n", "H", api.tree.toggle_hidden_filter, opts)
            keymap("n", "W", api.tree.collapse_all, opts)
            keymap("n", "E", api.tree.expand_all, opts)
            keymap("n", "<CR>", api.node.open.edit, opts)
            keymap("n", "l", api.node.open.edit, opts)
            keymap("n", "h", api.node.navigate.parent_close, opts)
            keymap("n", "a", api.fs.create, opts)
            keymap("n", "d", api.fs.remove, opts)
            keymap("n", "r", api.fs.rename, opts)
            keymap("n", "y", api.fs.copy.node, opts)
            keymap("n", "x", api.fs.cut, opts)
            keymap("n", "p", api.fs.paste, opts)
            keymap("n", "f", api.live_filter.start, opts)
            keymap("n", "F", api.live_filter.clear, opts)
            keymap("n", "m", api.node.open.preview, opts)
            keymap("n", "o", api.node.run.system, opts)
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
}

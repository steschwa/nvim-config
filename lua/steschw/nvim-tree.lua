vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree = require("nvim-tree")

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local opts = {
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
    }

    vim.keymap.set("n", "q", api.tree.close, opts)
    vim.keymap.set("n", "v", api.node.open.vertical, opts)
    vim.keymap.set("n", "P", api.node.navigate.parent, opts)
    vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts)
    vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts)
    vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts)
    vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts)
    vim.keymap.set("n", "W", api.tree.collapse_all, opts)
    vim.keymap.set("n", "E", api.tree.expand_all, opts)
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts)
    vim.keymap.set("n", "l", api.node.open.edit, opts)
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
    vim.keymap.set("n", "a", api.fs.create, opts)
    vim.keymap.set("n", "d", api.fs.remove, opts)
    vim.keymap.set("n", "r", api.fs.rename, opts)
    vim.keymap.set("n", "y", api.fs.copy.node, opts)
    vim.keymap.set("n", "x", api.fs.cut, opts)
    vim.keymap.set("n", "p", api.fs.paste, opts)
    vim.keymap.set("n", "f", api.live_filter.start, opts)
    vim.keymap.set("n", "F", api.live_filter.clear, opts)
    vim.keymap.set("n", "m", api.node.open.preview, opts)
    vim.keymap.set("n", "o", api.node.run.system, opts)
end

nvim_tree.setup({
    on_attach = on_attach,
    sort_by = "case_sensitive",
    select_prompts = true,
    git = {
        enable = false,
    },
    view = {
        width = {
            min = 30,
            max = -1,
            padding = 4,
        },
        hide_root_folder = true,
    },
    renderer = {
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
                }
            }
        },
        special_files = {},
    },
    filters = {
        dotfiles = true,
    },
})

require("lsp-file-operations").setup()

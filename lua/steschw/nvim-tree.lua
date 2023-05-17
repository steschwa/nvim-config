vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree = require("nvim-tree")
local km = require("steschw.utils.keymap")

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local opts = { buffer = bufnr }

    km.n("q", api.tree.close, opts)
    km.n("v", api.node.open.vertical, opts)
    km.n("P", api.node.navigate.parent, opts)
    km.n("K", api.node.navigate.sibling.first, opts)
    km.n("J", api.node.navigate.sibling.last, opts)
    km.n("I", api.tree.toggle_gitignore_filter, opts)
    km.n("H", api.tree.toggle_hidden_filter, opts)
    km.n("W", api.tree.collapse_all, opts)
    km.n("E", api.tree.expand_all, opts)
    km.n("<CR>", api.node.open.edit, opts)
    km.n("l", api.node.open.edit, opts)
    km.n("h", api.node.navigate.parent_close, opts)
    km.n("a", api.fs.create, opts)
    km.n("d", api.fs.remove, opts)
    km.n("r", api.fs.rename, opts)
    km.n("y", api.fs.copy.node, opts)
    km.n("x", api.fs.cut, opts)
    km.n("p", api.fs.paste, opts)
    km.n("f", api.live_filter.start, opts)
    km.n("F", api.live_filter.clear, opts)
    km.n("m", api.node.open.preview, opts)
    km.n("o", api.node.run.system, opts)
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

require("lsp-file-operations").setup()

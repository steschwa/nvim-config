vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree = require("nvim-tree")

local reset_default_mappings = {
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "" },
    { key = "<C-e>", action = "" },
    { key = "O", action = "" },
    { key = { "<C-]>", "<2-RightMouse>" }, action = "" },
    { key = "<C-v>", action = "" },
    { key = "<C-x>", action = "" },
    { key = "<C-t>", action = "" },
    { key = "<", action = "" },
    { key = ">", action = "" },
    { key = "P", action = "" },
    { key = "<BS>", action = "" },
    { key = "<Tab>", action = "" },
    { key = "K", action = "" },
    { key = "J", action = "" },
    { key = "I", action = "" },
    { key = "H", action = "" },
    { key = "U", action = "" },
    { key = "R", action = "" },
    { key = "a", action = "" },
    { key = "d", action = "" },
    { key = "D", action = "" },
    { key = "r", action = "" },
    { key = "<C-r>", action = "" },
    { key = "x", action = "" },
    { key = "c", action = "" },
    { key = "p", action = "" },
    { key = "y", action = "" },
    { key = "Y", action = "" },
    { key = "gy", action = "" },
    { key = "[e", action = "" },
    { key = "[c", action = "" },
    { key = "]e", action = "" },
    { key = "]c", action = "" },
    { key = "-", action = "" },
    { key = "s", action = "" },
    { key = "f", action = "" },
    { key = "F", action = "" },
    { key = "q", action = "" },
    { key = "W", action = "" },
    { key = "E", action = "" },
    { key = "S", action = "" },
    { key = ".", action = "" },
    { key = "<C-k>", action = "" },
    { key = "g?", action = "" },
    { key = "m", action = "" },
    { key = "bmv", action = "" },
}

local override_mappings = function(override)
    local mappings = reset_default_mappings

    for _, value in pairs(override) do
        table.insert(mappings, value)
    end

    return mappings
end

nvim_tree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 50,
        adaptive_size = true,
        mappings = {
            list = override_mappings({
                { key = "q", action = "close" },
                --[[ Movement ]]
                { key = "v", action = "vsplit" },
                { key = "P", action = "parent_node" },
                { key = "K", action = "first_sibling" },
                { key = "J", action = "last_sibling" },
                { key = "I", action = "toggle_git_ignored" },
                { key = "H", action = "toggle_dotfiles" },
                { key = "W", action = "collapse_all" },
                { key = "E", action = "expand_all" },
                --[[ File actions ]]
                { key = "<CR>", action = "edit" },
                { key = "l", action = "edit" },
                { key = "h", action = "close_node" },
                { key = "a", action = "create" },
                { key = "d", action = "remove" },
                { key = "r", action = "rename" },
                { key = "y", action = "copy" },
                { key = "x", action = "cut" },
                { key = "p", action = "paste" },
                { key = "m", action = "toggle_mark" },
                { key = "bm", action = "bulk_move" },
                --[[ Search ]]
                { key = "f", action = "live_filter" },
                { key = "F", action = "clear_live_filter" },
            })
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

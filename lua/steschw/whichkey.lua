local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
    return
end

whichkey.setup({
    plugins = {
        marks = false,
        registers = false,
    },
    key_labels = {
        ["<space>"] = "Space",
        ["<leader>"] = "Space",
        ["<cr>"] = "Enter",
        ["<tab>"] = "Tab",
    }
})

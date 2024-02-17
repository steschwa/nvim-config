local sign = "▎"

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufEnter" },
    opts = {
        signs = {
            add = { text = sign },
            change = { text = sign },
            delete = { text = sign },
            topdelete = { text = sign },
            changedelete = { text = sign },
            untracked = { text = sign },
        },
        update_debounce = 1000,
        current_line_blame = false,
    },
}

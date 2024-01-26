return {
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
}

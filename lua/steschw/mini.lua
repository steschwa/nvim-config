require("mini.comment").setup({
    options = {
        ignore_blank_lines = true,
        start_of_line = false,
        pad_comment_parts = true,
        custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring()
        end,
    },
    mappings = {
        comment = "gc",
        comment_line = "gcc",
        textobject = "gc",
    },
})

require("mini.pairs").setup({
    modes = {
        insert = true,
        command = false,
        terminal = false,
    },
})

require("mini.surround").setup({
    mappings = {
        add = "sa",
        delete = "sd",
        replace = "sr",
        update_n_lines = "",
        find = "",
        find_left = "",
        highlight = "",
        suffix_last = "",
        suffix_next = "",
    },
})

require("mini.move").setup({
    options = {
        reindent_linewise = false,
    },
    mappings = {
        -- visual mode
        left = "<C-h>",
        right = "<C-l>",
        down = "<C-j>",
        up = "<C-k>",

        -- normal mode
        line_left = "",
        line_right = "",
        line_down = "",
        line_up = "",
    },
})

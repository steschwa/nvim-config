require("mini.comment").setup({
    options = {
        ignore_blank_lines = true,
        start_of_line = false,
        pad_comment_parts = true,
    },
    mappings = {
        comment = "gc",
        comment_line = "gcc",
        textobject = "gc",
    },
    hooks = {
        pre = function()
            require("ts_context_commentstring.internal").update_commentstring()
        end,
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

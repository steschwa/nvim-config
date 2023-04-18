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

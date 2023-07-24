return {
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "windwp/nvim-ts-autotag" },
    {
        "echasnovski/mini.comment",
        version = "*",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        opts = {
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
        },
    },
    {
        "echasnovski/mini.pairs",
        version = "*",
        opts = {
            modes = {
                insert = true,
                command = false,
                terminal = false,
            },
        },
    },
    {
        "echasnovski/mini.surround",
        version = "*",
        opts = {
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
        },
    },
    {
        "echasnovski/mini.move",
        version = "*",
        opts = {
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
        },
    },
}

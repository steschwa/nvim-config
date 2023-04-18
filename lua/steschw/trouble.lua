local trouble = require("trouble")

trouble.setup({
    position = "bottom",
    height = 15,
    icons = true,
    mode = "document_diagnostics",
    fold_open = "",
    fold_closed = "",
    group = true,
    padding = false,
    action_keys = {
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = {"<cr>", "l"},
        open_split = {},
        open_vsplit = {},
        open_tab = {},
        jump_close = {"o"},
        toggle_mode = {},
        toggle_preview = {},
        hover = {},
        preview = "p",
        close_folds = {"W"},
        open_folds = {"E"},
        toggle_fold = {"h"},
        previous = "k",
        next = "j"
    },
    indent_lines = false,
    auto_open = false,
    auto_close = true,
    auto_preview = true,
    auto_fold = false,
    auto_jump = {},
    signs = {
        other = "●"
    },
    use_diagnostic_signs = true,
})

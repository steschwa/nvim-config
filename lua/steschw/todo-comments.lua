local todo_comments = require("todo-comments")

-- https://github.com/folke/todo-comments.nvim#%EF%B8%8F-configuration
todo_comments.setup({
    signs = true,
    keywords = {
        TODO = { icon = " ", color = "info" },
        REFACTOR = { icon = "פֿ ", color = "warning" },
        FIXME = { icon = " ", color = "error" },
    },
    colors = {
        error = { "DiagnosticError" },
        warning = { "DiagnosticWarn" },
        info = { "DiagnosticInfo" },
        hint = { "DiagnosticHint" },
    },
    gui_style = {
        fg = "NONE",
        bg = "BOLD",
    },
})

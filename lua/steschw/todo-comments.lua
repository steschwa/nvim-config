local todo_comments = require("todo-comments")

-- https://github.com/folke/todo-comments.nvim#%EF%B8%8F-configuration
todo_comments.setup({
    signs = true,
    keywords = {
        FIXME = { icon = " ", color = "error" },
        TODO = { icon = " ", color = "info" },
        REFACTOR = { icon = "פֿ ", color = "warning" },
    },
    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
    },
    gui_style = {
        fg = "NONE",
        bg = "BOLD",
    },
})

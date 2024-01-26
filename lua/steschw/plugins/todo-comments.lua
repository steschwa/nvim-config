return {
    "folke/todo-comments.nvim",
    version = "^1.0.0",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
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
    },
}

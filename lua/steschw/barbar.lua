local barbar = require("bufferline")

barbar.setup({
    animation = false,
    auto_hide = false,
    tabpages = false,
    closeable = false,
    clickable = false,
    focus_on_close = "left",
    icons = {
        button = "",
        filetype = {
            enabled = false
        },
        separator = { left = "▎", right = "" },
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
            [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
            [vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
            [vim.diagnostic.severity.HINT] = { enabled = false, icon = " " },
        },
        modified = { button = "●" },
    },
})

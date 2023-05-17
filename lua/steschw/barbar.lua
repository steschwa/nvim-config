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
            enabled = false,
        },
        separator = { left = "▎", right = "" },
        modified = { button = "" },
    },
})

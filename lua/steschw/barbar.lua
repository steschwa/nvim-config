local barbar = require("bufferline")

local lsp_icons = require("steschw.lsp.style").icons

local function get_diagnostic(icon)
    return {
        enabled = true,
        icon = icon .. " ",
    }
end

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
            [vim.diagnostic.severity.ERROR] = get_diagnostic(lsp_icons.error),
            [vim.diagnostic.severity.WARN] = get_diagnostic(lsp_icons.warn),
            [vim.diagnostic.severity.INFO] = get_diagnostic(lsp_icons.info),
            [vim.diagnostic.severity.HINT] = get_diagnostic(lsp_icons.hint),
        },
        modified = { button = "●" },
    },
})

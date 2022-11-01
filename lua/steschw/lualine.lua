local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup({
    options = {
        --[[ theme = "catppuccin" ]]
        theme = "nord"
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                sections = { 'error', 'warn', 'info', 'hint' },
                colored = true,
            }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "branch" },
        lualine_z = {
            {
                "filename",
                path = 1,
                shorting_target = 100
            }
        },
    }
})

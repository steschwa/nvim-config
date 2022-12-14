local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup({
    options = {
        theme = "catppuccin",
        section_separators = '',
        component_separators = '',
        globalstatus = true
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
        lualine_y = {
            {
                "filename",
                path = 1,
                shorting_target = 100
            }
        },
        lualine_z = { "branch" },
    }
})

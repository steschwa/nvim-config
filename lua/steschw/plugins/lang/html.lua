local deps = require("steschw.utils.dependencies")

return {
    {
        "stevearc/conform.nvim",
        dependencies = {
            deps.mason_tool("prettierd"),
        },
        opts = function(_, opts)
            opts.formatters_by_ft.html = {
                "prettierd",
            }
        end,
    },
}

local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason_tool("css-lsp"),
        },
        opts = function(_, opts)
            opts.servers.cssls = {}
        end,
    },
    {
        "stevearc/conform.nvim",
        dependencies = {
            deps.mason_tool("prettierd"),
        },
        opts = function(_, opts)
            local formatter = { "prettierd" }

            opts.formatters_by_ft.css = formatter
            opts.formatters_by_ft.scss = formatter
        end,
    },
}

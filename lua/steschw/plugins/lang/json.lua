local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "b0o/schemastore.nvim",
            deps.mason_tool("json-lsp"),
        },
        opts = function(_, opts)
            opts.servers.jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            }
        end,
    },
    {
        "stevearc/conform.nvim",
        dependencies = {
            deps.mason_tool("prettierd"),
        },
        opts = function(_, opts)
            opts.formatters_by_ft.json = {
                "prettierd",
            }
        end,
    },
    {
        "b0o/schemastore.nvim",
    },
}

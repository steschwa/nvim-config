return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "b0o/schemastore.nvim",
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
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, "json-lsp")
            table.insert(opts.tools, "prettierd")
        end,
    },
    {
        "b0o/schemastore.nvim",
    },
}

local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "b0o/schemastore.nvim",
            deps.with_mason("json-lsp"),
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
    deps.formatter("prettierd", { "json" }),
    {
        "b0o/schemastore.nvim",
    },
}

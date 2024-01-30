local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason_tool("gopls"),
        },
        opts = function(_, opts)
            opts.servers.gopls = {}
        end,
    },
    {
        "stevearc/conform.nvim",
        dependencies = {
            deps.mason_tool("goimports"),
        },
        opts = function(_, opts)
            opts.formatters_by_ft.go = {
                "goimports",
            }
        end,
    },
    {
        "mfussenegger/nvim-lint",
        dependencies = {
            deps.mason_tool("revive"),
        },
        opts = function(_, opts)
            opts.linters_by_ft.go = {
                "revive",
            }
        end,
    },
}

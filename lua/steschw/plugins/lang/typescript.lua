local deps = require("steschw.utils.dependencies")

return {
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            require("typescript-tools").setup({
                root_dir = lspconfig.util.root_pattern("package.json"),
                single_file_support = false,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        dependencies = {
            deps.mason_tool("prettierd"),
        },
        opts = function(_, opts)
            local formatters = { "prettierd" }

            opts.formatters_by_ft.javascript = formatters
            opts.formatters_by_ft.javascriptreact = formatters
            opts.formatters_by_ft.typescript = formatters
            opts.formatters_by_ft.typescriptreact = formatters
        end,
    },
    {
        "mfussenegger/nvim-lint",
        dependencies = {
            deps.mason_tool("eslint_d"),
        },
        opts = function(_, opts)
            local linters = { "eslint_d" }

            opts.linters_by_ft.javascript = linters
            opts.linters_by_ft.javascriptreact = linters
            opts.linters_by_ft.typescriptreact = linters
            opts.linters_by_ft.typescriptreact = linters
        end,
    },
}

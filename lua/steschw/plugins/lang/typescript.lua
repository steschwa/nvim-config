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
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, "prettierd")
            table.insert(opts.tools, "eslint_d")
        end,
    },
}

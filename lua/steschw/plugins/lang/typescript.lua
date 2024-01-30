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
    deps.formatter("prettierd", {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    }),
    deps.linter("eslint_d", {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    }),
}

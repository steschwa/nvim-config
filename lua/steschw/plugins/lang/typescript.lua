local deps = require("steschw.utils.dependencies")
local keymap = require("steschw.utils.keys").keymap

return {
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("typescript-tools").setup({
                on_attach = function(_, bufnr)
                    local keymap_opts = { buffer = bufnr }

                    keymap("n", "gu", "<cmd>TSToolsRemoveUnusedImports<cr>", keymap_opts)
                    keymap("n", "go", "<cmd>TSToolsSortImports<cr>", keymap_opts)
                    keymap("n", "gi", "<cmd>TSToolsAddMissingImports<cr>", keymap_opts)
                end,
            })
        end,
    },
    deps.formatter("prettierd", {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    }),
    deps.linter("eslint", {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    }, { install = false }),
}

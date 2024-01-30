return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.cssls = {}
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, "css-lsp")
            table.insert(opts.tools, "prettierd")
        end,
    },
}

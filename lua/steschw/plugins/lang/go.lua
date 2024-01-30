return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.gopls = {}
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, "gopls")
            table.insert(opts.tools, "revive")
            table.insert(opts.tools, "goimports")
        end,
    },
}

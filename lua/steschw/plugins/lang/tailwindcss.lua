return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.tailwindcss = {}
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, "tailwindcss-language-server")
        end,
    },
}

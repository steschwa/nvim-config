return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.nushell = {}
        end,
    },
}

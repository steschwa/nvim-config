return {
    { "folke/lazy.nvim", version = "*" },
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                override = {
                    nu = {
                        icon = "",
                        color = "#3aa675",
                        cterm_color = "65",
                        name = "Nushell",
                    },
                },
            })
        end,
    },
}

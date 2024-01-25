return {
    {
        "folke/flash.nvim",
        version = "^1.0.0",
        keys = {
            {
                "s",
                mode = { "n" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
        },
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
            },
        },
    },
}

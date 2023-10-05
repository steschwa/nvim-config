return {
    { "folke/lazy.nvim", version = "*" },
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        opts = {
            override_by_extension = {
                -- https://github.com/nvim-tree/nvim-web-devicons/blob/master/lua/nvim-web-devicons.lua
                ["Dockerfile"] = {
                    icon = "󰡨",
                    color = "#458ee6",
                    cterm_color = "68",
                    name = "Dockerfile",
                },
                ["hurl"] = {
                    icon = "",
                    color = "#ff0288",
                    cterm_color = "198",
                    name = "Hurl",
                },
            },
        },
        config = true,
    },
}

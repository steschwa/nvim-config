return {
    { 
        "romgrk/barbar.nvim",
        version = '^1.0.0',
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = false,
            auto_hide = false,
            tabpages = false,
            closeable = false,
            clickable = false,
            focus_on_close = "left",
            icons = {
                button = "",
                filetype = {
                    enabled = false,
                },
                separator = { left = "▎", right = "" },
                modified = { button = "" },
            },
        }
    }
}

return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({
                borders = true,
                diff = { mode = "fg" },
                errors = { mode = "bg" },
            })
            vim.cmd("colorscheme nord")
        end,
    },
}

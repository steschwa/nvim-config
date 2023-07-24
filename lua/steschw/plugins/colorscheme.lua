return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            borders = true,
            diff = { mode = "fg" },
            errors = { mode = "bg" },
        },
        config = function(_, opts)
            local nord = require("nord")
            nord.setup(opts)
            vim.cmd("colorscheme nord")
        end,
    },
}

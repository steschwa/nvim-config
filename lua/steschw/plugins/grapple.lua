local win_utils = require("steschw.utils.window")

return {
    "cbochs/grapple.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {
            "mm",
            mode = { "n" },
            function()
                require("grapple").toggle()
                require("steschw.utils.statusline").update_statusline()
            end,
        },
        {
            "<leader>m",
            mode = { "n" },
            function()
                require("grapple").popup_tags()
            end,
        },
    },
    opts = {
        popup_options = {
            border = "rounded",
            width = win_utils.calc_width({ percent = 0.7 }),
        },
    },
}

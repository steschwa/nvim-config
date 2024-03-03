return {
    "cbochs/grapple.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "mm",
            mode = { "n" },
            function()
                require("grapple").toggle()
                vim.cmd("redrawstatus!")
            end,
        },
        {
            "<leader>m",
            mode = { "n" },
            function()
                require("grapple").toggle_tags()
            end,
        },
    },
    opts = {
        icons = false,
        scope = "git_branch",
        tag_title = function()
            return "Grapple"
        end,
        win_opts = {
            width = 0.7,
        },
    },
}

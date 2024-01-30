local augroup = require("steschw.utils.autocmd").augroup

return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        linters_by_ft = {},
    },
    config = function(_, opts)
        local lint = require("lint")
        lint.linters_by_ft = opts.linters_by_ft

        local revive_linter = lint.linters.revive
        revive_linter.args = { "-config", vim.fn.expand("~/.config/revive/revive.toml") }

        vim.api.nvim_create_autocmd({
            "BufReadPost",
            "BufWritePost",
            "InsertLeave",
            "CursorHold",
        }, {
            group = augroup("lint"),
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}

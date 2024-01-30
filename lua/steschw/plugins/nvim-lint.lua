local augroup = require("steschw.utils.autocmd").augroup

return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            typescript = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            javascript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            go = { "revive" },
        }

        local revive_linter = lint.linters.revive
        revive_linter.args = { "-config", vim.fn.expand("~/.config/revive/revive.toml") }

        vim.api.nvim_create_autocmd(
            { "BufReadPost", "BufWritePost", "InsertLeave", "CursorHold" },
            {
                group = augroup("lint"),
                callback = function()
                    require("lint").try_lint()
                end,
            }
        )
    end,
}

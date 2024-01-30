return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        formatters_by_ft = {},
    },
    config = function(_, opts)
        local conform = require("conform")

        local prettierd = require("conform.formatters.prettierd")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = opts.formatters_by_ft,
            formatters = {
                prettierd = vim.tbl_deep_extend("force", prettierd, {
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/dotfiles/.prettierrc"),
                    },
                }),
            },
        })
    end,
}

return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local conform = require("conform")

        local prettierd = require("conform.formatters.prettierd")

        conform.setup({
            notify_on_error = false,
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "goimports" },
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
                html = { "prettierd" },
                css = { "prettierd" },
                scss = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                json = { "prettierd" },
                yaml = { "prettierd" },
            },
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

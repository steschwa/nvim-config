local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local function get_sources()
    local sources = {}

    local add_source = function(source)
        table.insert(sources, source)
    end

    if vim.fn.executable("prettierd") == 1 then
        add_source(formatting.prettierd.with({
            env = {
                PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/dotfiles/.prettierrc")
            }
        }))
    end

    if vim.fn.executable("eslint_d") == 1 then
        add_source(diagnostics.eslint_d)
    end

    if vim.fn.executable("tsc") == 1 then
        add_source(require("typescript.extensions.null-ls.code-actions"))
        add_source(diagnostics.tsc)
    end

    if vim.fn.executable("revive") == 1 then
        add_source(diagnostics.revive)
    end

    if vim.fn.executable("goimports") == 1 then
        add_source(formatting.goimports)
    end

    if vim.fn.executable("black") == 1 then
        add_source(formatting.black)
    end

    return sources
end

null_ls.setup({
    debug = false,
    sources = get_sources(),
})

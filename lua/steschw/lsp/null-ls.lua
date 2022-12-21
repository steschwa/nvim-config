local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local function get_sources()
    local sources = {
        require("typescript.extensions.null-ls.code-actions"),
    }

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

    if vim.fn.executable("dart") == 1 then
        add_source(formatting.dart_format)
    end

    if vim.fn.executable("black") == 1 then
        add_source(formatting.black)
    end

    if vim.fn.executable("eslint_d") == 1 then
        add_source(diagnostics.eslint_d)
    end

    if vim.fn.executable("tsc") == 1 then
        add_source(diagnostics.tsc)
    end

    if vim.fn.executable("revive") == 1 then
        add_source(diagnostics.revive)
    end

    if vim.fn.executable("goimports") == 1 then
        add_source(formatting.goimports)
    end

    if vim.fn.executable("prisma-fmt") == 1 then
        add_source(formatting.prismaFmt)
    end

    return sources
end

null_ls.setup({
    debug = false,
    sources = get_sources(),
})

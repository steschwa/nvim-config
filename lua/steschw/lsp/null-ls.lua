local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
    debug = false,
    sources = {
        require("typescript.extensions.null-ls.code-actions"),
        formatting.prettierd.with({
            env = {
                PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/dotfiles/.prettierrc")
            }
        }),
        formatting.dart_format,
        formatting.black,
        formatting.goimports,
        diagnostics.eslint,
        diagnostics.tsc,
        diagnostics.revive,
    },
}

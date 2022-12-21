local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local options = {
    on_attach = require("steschw.lsp.handlers").on_attach,
    capabilities = require("steschw.lsp.handlers").capabilities,
}

if lspconfig.sumneko_lua ~= nil then
    local sumneko_opts = require("steschw.lsp.settings.sumneko_lua")
    lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", sumneko_opts, options))
end

if lspconfig.tsserver ~= nil then
    local ts_server_status_ok, ts_server = pcall(require, "typescript")
    if ts_server_status_ok then
        ts_server.setup({
            server = options,
        })
    end
end

if lspconfig.cssls ~= nil then
    lspconfig.cssls.setup(options)
end

if lspconfig.tailwindcss ~= nil then
    lspconfig.tailwindcss.setup(options)
end

if lspconfig.gopls ~= nil then
    lspconfig.gopls.setup(options)
end

if lspconfig.jsonls ~= nil then
    local jsonls_opts = require("steschw.lsp.settings.jsonls")
    lspconfig.jsonls.setup(vim.tbl_deep_extend("force", jsonls_opts, options))
end

if lspconfig.pyright ~= nil then
    lspconfig.pyright.setup(options)
end

if lspconfig.prismals ~= nil then
    lspconfig.prismals.setup(options)
end

if lspconfig.dartls ~= nil then
    lspconfig.dartls.setup(options)
end

local lspconfig = require("lspconfig")

local options = {
    on_attach = require("steschw.lsp.handlers").on_attach,
    capabilities = require("steschw.lsp.handlers").capabilities,
}

if lspconfig.lua_ls ~= nil then
    local lua_opts = require("steschw.lsp.settings.lua_ls")
    lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", lua_opts, options))
end

if lspconfig.tsserver ~= nil then
    local ts_server = require("typescript")
    ts_server.setup({
        server = options,
    })
end

if lspconfig.cssls ~= nil then
    lspconfig.cssls.setup(options)
end

if lspconfig.tailwindcss ~= nil then
    local tailwind_opts = require("steschw.lsp.settings.tailwindcss")
    lspconfig.tailwindcss.setup(vim.tbl_deep_extend("force", tailwind_opts, options))
end

if lspconfig.gopls ~= nil then
    lspconfig.gopls.setup(options)
end

if lspconfig.jsonls ~= nil then
    local jsonls_opts = require("steschw.lsp.settings.jsonls")
    lspconfig.jsonls.setup(vim.tbl_deep_extend("force", jsonls_opts, options))
end

if lspconfig.prismals ~= nil then
    lspconfig.prismals.setup(options)
end

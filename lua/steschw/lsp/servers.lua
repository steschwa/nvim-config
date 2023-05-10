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
    lspconfig.tailwindcss.setup(options)
end

if lspconfig.gopls ~= nil then
    lspconfig.gopls.setup(options)
end

if lspconfig.jsonls ~= nil then
    lspconfig.jsonls.setup({
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    })
end

if lspconfig.pylsp ~= nil then
    lspconfig.pylsp.setup(options)
end

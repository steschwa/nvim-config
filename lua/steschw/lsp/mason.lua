local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local server_options = {
    on_attach = require("steschw.lsp.handlers").on_attach,
    capabilities = require("steschw.lsp.handlers").capabilities,
}

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "tsserver",
        "jsonls",
        "cssls",
        "tailwindcss",
        "gopls",
    },
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup(server_options)
        end,
        ["lua_ls"] = function()
            local lua_opts = require("steschw.lsp.settings.lua_ls")
            lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", lua_opts, server_options))
        end,
        ["tsserver"] = function()
            local ts_server = require("typescript")
            ts_server.setup({ server = server_options })
        end,
        ["jsonls"] = function()
            lspconfig.jsonls.setup({
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            })
        end,
    },
})

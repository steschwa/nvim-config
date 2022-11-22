local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
    return
end

mason_lspconfig.setup({
    ensure_installed = { "sumneko_lua", "tsserver", "jsonls", "cssls" }
})

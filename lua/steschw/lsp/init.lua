local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("steschw.lsp.lsp-installer")
require("steschw.lsp.handlers").setup()
require("steschw.lsp.null-ls")


local autotag_status_ok, nvimTsAutotag = pcall(require, "nvim-ts-autotag")
if autotag_status_ok then
    nvimTsAutotag.setup()
end

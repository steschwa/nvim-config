local augroup = require("steschw.utils.autocmd").augroup

local M = {}

M.setup = function()
    local icons = require("steschw.lsp.style").icons
    local signs = {
        { name = "DiagnosticSignError", icon = icons.error },
        { name = "DiagnosticSignWarn", icon = icons.warn },
        { name = "DiagnosticSignInfo", icon = icons.info },
        { name = "DiagnosticSignHint", icon = icons.hint },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            text = sign.icon,
            texthl = sign.name,
            numhl = sign.name,
        })
    end

    vim.diagnostic.config({
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
        },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_highlight_document(client)
    if client.server_capabilities.document_highlight then
        local group = augroup("lsp_document_highlight")

        vim.api.nvim_create_autocmd("CursorHold", {
            group = group,
            buffer = 0,
            callback = function()
                vim.lsp.buf.document_highlight()
            end,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = group,
            buffer = 0,
            callback = function()
                vim.lsp.buf.clear_references()
            end,
        })
    end
end

M.on_attach = function(client)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M

return {
    {
        "neovim/nvim-lspconfig",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        init = function()
            local signs = {
                { name = "DiagnosticSignError", text = "E", texthl = "DiagnosticSignError" },
                { name = "DiagnosticSignWarn", text = "W", texthl = "DiagnosticSignWarn" },
                { name = "DiagnosticSignInfo", text = "I", texthl = "DiagnosticSignInfo" },
                { name = "DiagnosticSignHint", text = "H", texthl = "DiagnosticSignHint" },
            }
            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, sign)
            end

            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                },
            })

            local handlers = { "textDocument/hover", "textDocument/signatureHelp" }
            for _, handler in pairs(handlers) do
                vim.lsp.handlers[handler] = vim.lsp.with(vim.lsp.handlers[handler], {
                    border = "rounded",
                })
            end
        end,
        opts = {
            servers = {},
        },
        config = function(_, opts)
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local server_options = {
                capabilities = capabilities,
            }

            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                local final_opts = vim.tbl_deep_extend("force", config, server_options)
                lspconfig[server].setup(final_opts)
            end
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            tools = {},
        },
        config = function(_, opts)
            require("mason").setup()

            local registry = require("mason-registry")
            registry.refresh(function()
                for _, tool in ipairs(opts.tools) do
                    if not registry.is_installed(tool) then
                        vim.cmd("MasonInstall " .. tool)
                    end
                end
            end)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = true,
    },
}

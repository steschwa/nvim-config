return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local signs = {
                { name = "DiagnosticSignError", icon = "" },
                { name = "DiagnosticSignWarn", icon = "" },
                { name = "DiagnosticSignInfo", icon = "" },
                { name = "DiagnosticSignHint", icon = "" },
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
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, {
                    border = "rounded",
                })

            local on_attach = function(client)
                if client.server_capabilities.document_highlight then
                    local augroup = require("steschw.utils.autocmd").augroup
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

            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities =
                cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

            local server_options = {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

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
                        local lua_opts = {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                    workspace = {
                                        library = {
                                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                            [vim.fn.stdpath("config") .. "/lua"] = true,
                                        },
                                    },
                                },
                            },
                        }
                        lspconfig.lua_ls.setup(
                            vim.tbl_deep_extend("force", lua_opts, server_options)
                        )
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
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "jose-elias-alvarez/typescript.nvim",
            "b0o/schemastore.nvim",
        },
        config = function()
            local null_ls = require("null-ls")

            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics

            local sources = {
                formatting.prettierd.with({
                    env = {
                        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/dotfiles/.prettierrc"),
                    },
                }),
                diagnostics.eslint_d,
                require("typescript.extensions.null-ls.code-actions"),
                diagnostics.revive,
                formatting.goimports,
                formatting.black,
                formatting.stylua,
            }

            null_ls.setup({
                debug = false,
                sources = sources,
            })
        end,
    },

    -- completion
    {
        "hrsh7th/nvim-cmp",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "onsails/lspkind.nvim",
        },
    },
    --use("hrsh7th/cmp-cmdline")

    -- Snippets
    -- use("L3MON4D3/LuaSnip")
    -- use("rafamadriz/friendly-snippets")
}

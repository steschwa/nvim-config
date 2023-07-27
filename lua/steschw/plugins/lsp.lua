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
                    ["yamlls"] = function()
                        lspconfig.yamlls.setup({
                            settings = {
                                yaml = {
                                    schemaStore = {
                                        enable = false,
                                        url = "",
                                    },
                                    schemas = require("schemastore").yaml.schemas(),
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
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            require("luasnip.loaders.from_vscode").lazy_load()

            local function border(hl_name)
                return {
                    { "╭", hl_name },
                    { "─", hl_name },
                    { "╮", hl_name },
                    { "│", hl_name },
                    { "╯", hl_name },
                    { "─", hl_name },
                    { "╰", hl_name },
                    { "│", hl_name },
                }
            end

            local cmp_window = require("cmp.utils.window")
            cmp_window.info_ = cmp_window.info
            cmp_window.info = function(self)
                local info = self:info_()
                info.scrollable = false
                return info
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<Esc>"] = cmp.mapping.abort(),
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        preset = "codicons",
                    }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                window = {
                    completion = {
                        border = border("CmpBorder"),
                        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                    },
                    documentation = {
                        border = border("CmpDocBorder"),
                    },
                },
            })
        end,
    },
}

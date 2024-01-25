local augroup = require("steschw.utils.autocmd").augroup

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
            "b0o/schemastore.nvim",
        },
        config = function()
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
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

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local server_options = {
                capabilities = capabilities,
            }

            --- @param lsp_name string
            --- @param opts table<string, unknown>
            local function setup_lsp(lsp_name, opts)
                local final_opts = vim.tbl_deep_extend("force", opts, server_options)
                return function()
                    local lspconfig = require("lspconfig")
                    lspconfig[lsp_name].setup(final_opts)
                end
            end

            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup(server_options)
                end,
                lua_ls = setup_lsp("lua_ls", {
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
                }),
                jsonls = setup_lsp("jsonls", {
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                        },
                    },
                }),
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            local lspconfig = require("lspconfig")
            require("typescript-tools").setup({
                root_dir = lspconfig.util.root_pattern("package.json"),
                single_file_support = false,
            })
        end,
    },
    {
        "b0o/schemastore.nvim",
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            local prettierd = require("conform.formatters.prettierd")

            conform.setup({
                notify_on_error = false,
                formatters_by_ft = {
                    lua = { "stylua" },
                    go = { "goimports" },
                    javascript = { "prettierd" },
                    javascriptreact = { "prettierd" },
                    html = { "prettierd" },
                    css = { "prettierd" },
                    scss = { "prettierd" },
                    typescript = { "prettierd" },
                    typescriptreact = { "prettierd" },
                    json = { "prettierd" },
                    yaml = { "prettierd" },
                },
                formatters = {
                    prettierd = vim.tbl_deep_extend("force", prettierd, {
                        env = {
                            PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/dotfiles/.prettierrc"),
                        },
                    }),
                },
            })
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                typescript = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                javascript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                go = { "revive" },
            }

            local revive_linter = lint.linters.revive
            revive_linter.args = { "-config", vim.fn.expand("~/.config/revive/revive.toml") }

            vim.api.nvim_create_autocmd(
                { "BufReadPost", "BufWritePost", "InsertLeave", "CursorHold" },
                {
                    group = augroup("lint"),
                    callback = function()
                        require("lint").try_lint()
                    end,
                }
            )
        end,
    },

    -- completion
    {
        "hrsh7th/nvim-cmp",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "onsails/lspkind.nvim",
            "rafamadriz/friendly-snippets",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Esc>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                formatting = {
                    expandable_indicator = false,
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        preset = "codicons",
                    }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                }, {
                    { name = "luasnip" },
                    { name = "path" },
                }),
                window = {
                    completion = cmp.config.window.bordered({
                        winhighlight = "Normal:CmpNormal,CursorLine:CmpCursorLine,Search:None",
                    }),
                    documentation = cmp.config.window.bordered({
                        winhighlight = "Normal:CmpNormal",
                    }),
                },
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        event = { "BufReadPost" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}

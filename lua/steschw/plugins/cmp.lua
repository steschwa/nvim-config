return {
    {
        "hrsh7th/nvim-cmp",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        dependencies = {
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
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
                -- TODO: do not specify mappings here. rather use `keymap` just like in `keymaps.lua`
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Esc>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                    ["<Tab>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item()
                            elseif luasnip.locally_jumpable(1) then
                                luasnip.jump(1)
                            else
                                fallback()
                            end
                        end,
                    }),
                    ["<S-Tab>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item()
                            elseif luasnip.locally_jumpable(-1) then
                                luasnip.jump(-1)
                            else
                                fallback()
                            end
                        end,
                    }),
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
                    { name = "path" },
                    { name = "luasnip" },
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
        config = true,
    },
}

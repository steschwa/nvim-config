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
            local ls = require("luasnip")
            local lspkind = require("lspkind")

            local function jump(dir)
                return function(fallback)
                    if cmp.visible() then
                        if dir == 1 then
                            cmp.select_next_item()
                        else
                            cmp.select_prev_item()
                        end
                    elseif ls.locally_jumpable(dir) then
                        ls.jump(dir)
                    else
                        fallback()
                    end
                end
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        ls.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<c-k>"] = cmp.mapping.select_prev_item(),
                    ["<c-j>"] = cmp.mapping.select_next_item(),
                    ["<c-u>"] = cmp.mapping.scroll_docs(-5),
                    ["<c-d>"] = cmp.mapping.scroll_docs(5),

                    ["<tab>"] = cmp.mapping(jump(1)),
                    ["<s-tab>"] = cmp.mapping(jump(-1)),

                    ["<c-space>"] = cmp.mapping.complete(),
                    ["<esc>"] = cmp.mapping.abort(),
                    ["<cr>"] = cmp.mapping.confirm({ select = false }),
                },
                formatting = {
                    fields = { "abbr", "menu", "kind" },
                    expandable_indicator = false,
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        preset = "codicons",
                    }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
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
        config = function()
            require("luasnip").setup()

            require("luasnip.loaders.from_lua").load({
                paths = { vim.fn.stdpath("config") .. "/snippets" },
            })
        end,
    },
}

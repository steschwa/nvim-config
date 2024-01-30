return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers.lua_ls = {
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
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, "lua-language-server")
            table.insert(opts.tools, "stylua")
        end,
    },
    -- TODO: investigate folke/neodev.nvim
}

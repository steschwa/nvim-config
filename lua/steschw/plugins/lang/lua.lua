local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason("lua-language-server"),
            "folke/neodev.nvim",
        },
        opts = function(_, opts)
            opts.servers.lua_ls = {
                settings = {
                    Lua = {
                        workspace = {
                            library = {
                                vim.fn.expand("$VIMRUNTIME/lua"),
                                vim.fn.stdpath("config") .. "/lua",
                            },
                        },
                    },
                },
            }
        end,
    },
    deps.formatter("stylua", { "lua" }),
    {
        "folke/neodev.nvim",
        opts = {},
    },
}

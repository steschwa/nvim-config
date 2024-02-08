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
                        runtime = {
                            version = "LuaJIT",
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

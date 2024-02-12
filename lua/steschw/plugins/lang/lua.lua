local deps = require("steschw.utils.dependencies")

return {
    {
        "folke/neodev.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            deps.mason("lua-language-server"),
        },
        ft = { "lua" },
        config = function()
            require("neodev").setup({
                setup_jsonls = false,
            })

            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                    },
                },
            })
        end,
    },
    deps.formatter("stylua", { "lua" }),
}

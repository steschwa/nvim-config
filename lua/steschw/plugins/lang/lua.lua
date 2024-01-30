local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason_tool("lua-language-server"),
        },
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
        "stevearc/conform.nvim",
        dependencies = {
            deps.mason_tool("stylua"),
        },
        opts = function(_, opts)
            opts.formatters_by_ft.lua = {
                "stylua",
            }
        end,
    },
    -- TODO: investigate folke/neodev.nvim
}

local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason_tool("css-lsp"),
        },
        opts = function(_, opts)
            opts.servers.cssls = {}
        end,
    },
    deps.formatter("prettierd", { "css", "scss" }),
}

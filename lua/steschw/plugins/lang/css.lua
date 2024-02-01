local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason("css-lsp"),
            deps.mason("tailwindcss-language-server"),
        },
        opts = function(_, opts)
            opts.servers.cssls = {}
            opts.servers.tailwindcss = {}
        end,
    },
    deps.formatter("prettierd", { "css", "scss" }),
}

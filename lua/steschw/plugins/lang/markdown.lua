local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason("marksman"),
        },
        opts = function(_, opts)
            opts.servers.marksman = {}
        end,
    },
    deps.formatter("prettierd", { "markdown" }),
}

local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason("gopls"),
        },
        opts = function(_, opts)
            opts.servers.gopls = {}
        end,
    },
    deps.formatter("goimports", { "go" }),
    deps.linter("revive", { "go" }),
}

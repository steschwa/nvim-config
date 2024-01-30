local deps = require("steschw.utils.dependencies")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            deps.mason_tool("tailwindcss-language-server"),
        },
        opts = function(_, opts)
            opts.servers.tailwindcss = {}
        end,
    },
}

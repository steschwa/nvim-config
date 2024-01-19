local augroup = require("steschw.utils.autocmd").augroup

vim.api.nvim_create_autocmd("User", {
    group = augroup("LazyVim"),
    pattern = "VeryLazy",
    callback = function()
        require("steschw.config.keymaps")
        require("steschw.config.autocmds")
        require("steschw.config.commands")
    end,
})

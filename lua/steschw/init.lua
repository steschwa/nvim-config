vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
    pattern = "VeryLazy",
    callback = function()
        require("steschw.config.keymaps")
        require("steschw.config.autocmds")
        require("steschw.config.hl")
    end,
})

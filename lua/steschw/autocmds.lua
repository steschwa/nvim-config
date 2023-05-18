local km = require("steschw.utils.keymap")
local augroup = require("steschw.utils.autocmd").augroup

vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "help",
        "lspinfo",
        "qf",
        "Trouble",
        "DressingSelect",
        "harpoon",
        "vim",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        km.n("q", "<cmd>close<cr>", { buffer = event.buf })
    end,
})

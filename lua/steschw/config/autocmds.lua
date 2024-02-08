local keymap = require("steschw.utils.keys").keymap
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
        "vim",
        "lazy",
        "mason",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        keymap("n", "q", "<cmd>close<cr>", { buffer = event.buf })
    end,
})
vim.api.nvim_create_autocmd("CmdwinEnter", {
    group = augroup("close_cmdwin_with_q"),
    callback = function(event)
        keymap("n", "q", "<cmd>close<cr>", { buffer = event.buf })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("navigate_help"),
    pattern = {
        "help",
    },
    callback = function(event)
        keymap("n", "gd", "<C-]>", { buffer = event.buf })
    end,
})

vim.api.nvim_create_autocmd("WinEnter", {
    group = augroup("show_cursorline_active_win"),
    callback = function()
        local win_id = vim.api.nvim_get_current_win()
        vim.wo[win_id].cursorline = true
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = augroup("hide_cursorline_inactive_win"),
    callback = function()
        local win_id = vim.api.nvim_get_current_win()
        vim.wo[win_id].cursorline = false
    end,
})

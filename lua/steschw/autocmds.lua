local km = require("steschw.utils.keymap")

local M = {}

M.augroup = function(name)
    return vim.api.nvim_create_augroup("steschw_" .. name, { clear = true })
end

M.setup_autocmds = function()
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = M.augroup("highlight_yank"),
        callback = function()
            vim.highlight.on_yank()
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        group = M.augroup("close_with_q"),
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
end

return M

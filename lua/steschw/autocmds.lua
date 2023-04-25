local function augroup(name)
    return vim.api.nvim_create_augroup("steschw_" .. name, { clear = true })
end

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
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("format_on_save"),
    callback = function(event)
        local utils_formatting = require("steschw.utils.formatting")
        utils_formatting.format(event.buf)
    end,
})

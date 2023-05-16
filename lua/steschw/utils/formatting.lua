local M = {}

M.format = function(bufnr)
    pcall(vim.lsp.buf.format, {
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

M.format_write = function(bufnr)
    pcall(function()
        M.format(bufnr)
        vim.cmd("w")
    end)
end

return M

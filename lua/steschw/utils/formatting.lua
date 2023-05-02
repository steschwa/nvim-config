local M = {}

M.format = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

M.format_write = function(bufnr)
    M.format(bufnr)
    vim.cmd("w")
end

return M

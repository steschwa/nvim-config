local M = {}

function M.format(bufnr)
    pcall(vim.lsp.buf.format, {
        filter = function(client)
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
    })
end

function M.format_write(bufnr)
    pcall(function()
        M.format(bufnr)
        vim.cmd("w")
    end)
end

return M

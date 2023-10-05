local M = {}

function M.format(bufnr)
    pcall(function()
        require("conform").format({ bufnr = bufnr })
    end)
end

function M.format_write(bufnr)
    pcall(function()
        require("conform").format({ bufnr = bufnr })
        vim.cmd("w")
    end)
end

return M

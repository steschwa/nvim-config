local M = {}

function M.format(bufnr)
    require("conform").format({ bufnr = bufnr })
end

function M.format_write(bufnr)
    require("conform").format({ bufnr = bufnr })
    vim.cmd("w")
end

return M

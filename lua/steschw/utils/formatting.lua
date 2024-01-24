local M = {}

function M.format(bufnr)
    require("conform").format({
        bufnr = bufnr,
        async = true,
    })
end

function M.format_write(bufnr)
    require("conform").format({
        bufnr = bufnr,
        async = true,
    }, function()
        pcall(vim.cmd.w)
    end)
end

return M

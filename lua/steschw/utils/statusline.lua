local M = {}

function M.update_statusline()
    vim.cmd("redrawstatus!")
end

return M

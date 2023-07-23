local M = {}

function M.augroup(name)
    return vim.api.nvim_create_augroup("steschw_" .. name, {
        clear = true,
    })
end

return M

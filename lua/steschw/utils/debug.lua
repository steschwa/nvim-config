local M = {}

M.debug_print = function(val)
    vim.api.nvim_echo({
        { vim.inspect(val), "None" },
    }, true, {})
end

return M

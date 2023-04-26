local M = {}

M.width = function()
    return vim.o.columns
end

M.padding = function(padding)
    return 2 * padding
end

M.calc_width = function(options)
    local padding = options.padding or 0
    local percent = options.percent or 1

    local width = M.width() * percent

    return width - M.padding(padding or 0)
end

return M

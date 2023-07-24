local M = {}

function M.width()
    return vim.o.columns
end

function M.padding(padding)
    return 2 * math.floor(padding)
end

function M.calc_width(options)
    local padding = options.padding or 0
    local percent = options.percent or 1

    local width = math.floor(M.width() * percent)

    return width - M.padding(padding)
end

return M

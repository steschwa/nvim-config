local M = {}

---@return integer
function M.width()
    return vim.o.columns
end

---@param padding integer
---@return integer
function M.padding(padding)
    return 2 * math.floor(padding)
end

---@param options {padding: integer, percent: number}
---@return integer
function M.calc_width(options)
    local padding = options.padding or 0
    local percent = options.percent or 1

    local width = math.floor(M.width() * percent)

    return width - M.padding(padding)
end

return M

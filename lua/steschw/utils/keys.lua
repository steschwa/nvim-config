local DEFAULT_OPTS = {
    noremap = true,
    silent = true,
    nowait = true,
}

local M = {}

---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? table
function M.keymap(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    --do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts = vim.tbl_extend("force", DEFAULT_OPTS, opts)
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

return M

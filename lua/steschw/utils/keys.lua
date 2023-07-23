local default_opts = {
    noremap = true,
    silent = true,
    nowait = true,
}

local M = {}

function M.map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    --do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts = vim.tbl_extend("force", default_opts, opts)
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

return M

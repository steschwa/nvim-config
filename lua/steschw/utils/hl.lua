local M = {}

--- @param hl string name of the highlight group (e.g. Normal or DiagnosticError)
--- @param attr string
--- @return string?
local function get_hl_attr(hl, attr)
    local hl_id = vim.fn.hlID(hl)
    if hl_id == 0 then
        return
    end

    local syn_id = vim.fn.synIDtrans(hl_id)
    if syn_id == 0 then
        return
    end

    local value = vim.fn.synIDattr(syn_id, attr)
    return value ~= "" and value or nil
end

--- @param hl string name of the highlight group (e.g. Normal or DiagnosticError)
--- @return string?
function M.get_hl_fg(hl)
    return get_hl_attr(hl, "fg")
end

return M

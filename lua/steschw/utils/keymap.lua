local default_opts = {
    noremap = true,
    silent = true,
    nowait = true,
}

local M = {}

M.set = function(mode, keys, cmd, opts)
    local custom_opts = opts or {}
    vim.keymap.set(mode, keys, cmd, vim.tbl_extend("force", default_opts, custom_opts))
end

M.n = function(keys, cmd, opts)
    M.set("n", keys, cmd, opts)
end

M.i = function(keys, cmd, opts)
    M.set("i", keys, cmd, opts)
end

M.v = function(keys, cmd, opts)
    M.set("v", keys, cmd, opts)
end

return M

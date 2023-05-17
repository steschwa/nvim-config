local actions = require("telescope.actions")
local transform_mod = require("telescope.actions.mt").transform_mod

local M = {}

M.qflist = function()
    local mod_qflist = {}
    mod_qflist.smart_send_to_qflist = function(bufnr)
        actions.smart_send_to_qflist(bufnr)
    end
    mod_qflist.open_qflist = function()
        vim.cmd("Trouble quickfix")
    end
    mod_qflist = transform_mod(mod_qflist)

    return mod_qflist.smart_send_to_qflist + mod_qflist.open_qflist
end

return M

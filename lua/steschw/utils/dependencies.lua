local M = {}

function M.mason_tool(...)
    --- @type string[]
    local tools = {}
    if type(...) == "string" then
        tools = { ... }
    else
        tools = ...
    end

    return {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            for _, t in ipairs(tools) do
                table.insert(opts.tools, t)
            end
        end,
    }
end

return M

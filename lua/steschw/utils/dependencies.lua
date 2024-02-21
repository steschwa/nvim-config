local M = {}

--- @param tool string
function M.mason(tool)
    return {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, tool)
        end,
    }
end

--- @class ToolOpts
--- @field install? boolean

--- @param name string
--- @param filetypes string[]
--- @param tool_opts? ToolOpts
function M.formatter(name, filetypes, tool_opts)
    tool_opts = tool_opts or {}

    local deps = {}
    if tool_opts.install == nil or tool_opts.install then
        deps = { M.mason(name) }
    end

    return {
        "stevearc/conform.nvim",
        dependencies = deps,
        opts = function(_, opts)
            for _, ft in ipairs(filetypes) do
                opts.formatters_by_ft[ft] = { name }
            end
        end,
    }
end

--- @param name string
--- @param filetypes string[]
--- @param tool_opts? ToolOpts
function M.linter(name, filetypes, tool_opts)
    tool_opts = tool_opts or {}

    local deps = {}
    if tool_opts.install == nil or tool_opts.install then
        deps = { M.mason(name) }
    end

    return {
        "mfussenegger/nvim-lint",
        dependencies = deps,
        opts = function(_, opts)
            for _, ft in ipairs(filetypes) do
                opts.linters_by_ft[ft] = { name }
            end
        end,
    }
end

return M

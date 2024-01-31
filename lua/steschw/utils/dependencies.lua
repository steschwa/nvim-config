local M = {}

--- @param tool string
function M.with_mason(tool)
    return {
        "williamboman/mason.nvim",
        opts = function(_, opts)
            table.insert(opts.tools, tool)
        end,
    }
end

--- @param name string
--- @param filetypes string[]
function M.formatter(name, filetypes)
    return {
        "stevearc/conform.nvim",
        dependencies = {
            M.with_mason(name),
        },
        opts = function(_, opts)
            for _, ft in ipairs(filetypes) do
                opts.formatters_by_ft[ft] = { name }
            end
        end,
    }
end

--- @param name string
--- @param filetypes string[]
function M.linter(name, filetypes)
    return {
        "mfussenegger/nvim-lint",
        dependencies = {
            M.with_mason(name),
        },
        opts = function(_, opts)
            for _, ft in ipairs(filetypes) do
                opts.linters_by_ft[ft] = { name }
            end
        end,
    }
end

return M

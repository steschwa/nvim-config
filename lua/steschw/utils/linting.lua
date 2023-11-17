local M = {}

function M.lint()
    pcall(function()
        require("lint").try_lint()
    end)
end

return M

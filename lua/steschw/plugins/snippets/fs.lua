local M = {}

--- @return string
function M.filename()
    local path = vim.fn.expand("%")
    return vim.fn.fnamemodify(path, ":t:r")
end

-- compute the relative path `from` -> `to`
--- @param from string
--- @param to string
--- @return string
function M.relpath(from, to)
    local res = vim.fn.systemlist(
        string.format("python3 -c \"import os.path; print(os.path.relpath('%s', '%s'))\"", to, from)
    )
    if #res ~= 1 then
        return ""
    end

    if type(res[1]) ~= "string" then
        return ""
    end

    return res[1]
end

return M

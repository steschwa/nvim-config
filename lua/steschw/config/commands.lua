vim.api.nvim_create_user_command("Dump", function(opts)
    local res = vim.api.nvim_exec2(opts.fargs[1], { output = true })

    local lines = vim.split(res.output, "\n")

    local bufid = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(bufid, 0, -1, false, lines)
    vim.bo[bufid].filetype = "dump"

    vim.cmd("vsplit")
    vim.api.nvim_set_current_buf(bufid)
end, {
    force = false,
    nargs = 1,
    complete = "command",
})

vim.api.nvim_create_user_command("SetQf", function(opts)
    local from = opts.fargs[1] or "clipboard"

    local items = {}
    if from == "clipboard" then
        local clipboard = vim.fn.getreg("*")

        ---@diagnostic disable-next-line: cast-local-type
        local ok, clip_items = pcall(vim.json.decode, clipboard)
        if ok and type(clip_items) == "table" then
            items = clip_items
        else
            return
        end
    end

    if #items == 0 then
        return
    end

    vim.fn.setqflist(items, " ")
    vim.cmd("cw")
end, {
    force = false,
    nargs = "?",
    complete = function(arg_lead)
        local choices = { "clipboard" }

        local matches = {}
        for _, choice in ipairs(choices) do
            if choice:find("^" .. arg_lead) then
                table.insert(matches, choice)
            end
        end

        return matches
    end,
})

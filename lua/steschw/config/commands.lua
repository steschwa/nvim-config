vim.api.nvim_create_user_command("Lines", function(opts)
    local res = vim.api.nvim_exec2(opts.fargs[1], { output = true })

    local lines = vim.split(res.output, "\n")

    local bufid = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(bufid, 0, -1, false, lines)

    vim.cmd("vsplit")
    local winid = vim.api.nvim_get_current_win()

    vim.api.nvim_win_set_buf(winid, bufid)
end, {
    force = false,
    nargs = 1,
    complete = "command",
})

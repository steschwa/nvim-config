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

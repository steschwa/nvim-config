local keymap = require("steschw.utils.keys").keymap

local M = {}

function M.set(buf)
    keymap("n", "<leader>d", M.diagnostics, { buffer = buf })
    keymap("n", "gr", M.references, { buffer = buf })
    keymap("n", "gd", M.definition, { buffer = buf })
    keymap({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, { buffer = buf })
    keymap("n", "gh", vim.lsp.buf.hover, { buffer = buf })
    keymap("n", "gH", vim.diagnostic.open_float, { buffer = buf })
    keymap("n", "gR", vim.lsp.buf.rename, { buffer = buf })
    keymap("n", "ga", vim.lsp.buf.code_action, { buffer = buf })

    local telescope = require("telescope.builtin")
    keymap("n", "<leader>s", telescope.lsp_document_symbols, { buffer = buf })
end

function M.diagnostics()
    local filename = vim.fn.fnamemodify(vim.fn.expand("%"), ":t")

    local diagnostics = vim.diagnostic.get(0)
    local what = {
        title = string.format("Diagnostics (%s)", filename),
        context = "diagnostics",
        nr = "$",
        items = vim.diagnostic.toqflist(diagnostics),
    }

    vim.fn.setqflist({}, " ", what)
    vim.cmd("cw")
end

function M.references()
    local word = vim.fn.expand("<cword>")

    local function on_list(res)
        res.title = string.format('References "%s"', word)
        res.nr = "$"

        vim.fn.setqflist({}, " ", res)
        vim.cmd("cw")
        vim.cmd.wincmd("J")
    end

    vim.lsp.buf.references({ includeDeclaration = false }, {
        on_list = on_list,
    })
end

function M.definition()
    local word = vim.fn.expand("<cword>")

    local function on_list(res)
        if #res.items == 1 then
            local item = res.items[1]

            -- add current pos to jumplist
            vim.cmd("normal! m'")

            local bufnr = vim.fn.bufnr(item.filename, true)
            vim.api.nvim_win_set_buf(0, bufnr)
            vim.api.nvim_win_set_cursor(0, { item.lnum, 0 })
            vim.api.nvim_win_call(0, function()
                vim.cmd.normal("zz")
            end)

            return
        end

        res.title = string.format('Definition "%s"', word)
        res.nr = "$"

        vim.fn.setqflist({}, " ", res)
        vim.cmd("cw")
        vim.cmd.wincmd("J")
    end

    vim.lsp.buf.definition({
        reuse_win = true,
        on_list = on_list,
    })
end

return M

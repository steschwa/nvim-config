local keymap = require("steschw.utils.keys").keymap

keymap({ "n", "v" }, "`", "^")

keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
keymap("n", "<leader>n", "<cmd>noh<cr>")

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- system clipboard helpers
keymap({ "n", "v" }, "<C-c>", '"+')

-- macros
keymap("n", "Q", "@q")

-- windows
keymap("n", "wl", "<C-w>v")
keymap("n", "wc", "<C-w>q")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-=>", "<C-w>+")
keymap("n", "<C-_>", "<C-w>-")

-- leave insert on jk
keymap("i", "jk", "<esc>")

-- better paste
keymap("v", "p", '"_dP')

-- buffers
keymap("n", "<S-h>", "<cmd>b#<cr>")
keymap("n", "<S-l>", "<cmd>b#<cr>")

-- telescope
local telescope = require("telescope.builtin")
keymap("n", "<leader>p", telescope.find_files)
keymap("n", "<leader>f", telescope.live_grep)
keymap("n", "<leader>s", telescope.lsp_document_symbols)
keymap("n", "<leader>h", telescope.help_tags)
keymap("n", "<leader>b", telescope.buffers)
keymap("n", "<leader><leader>", telescope.pickers)

-- lsp
keymap("n", "gh", vim.lsp.buf.hover)
keymap("n", "gH", vim.diagnostic.open_float)
keymap("n", "gR", vim.lsp.buf.rename)
keymap("n", "ga", vim.lsp.buf.code_action)
keymap({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help)
keymap("n", "[d", function()
    vim.diagnostic.goto_next({ float = false })
end)
keymap("n", "]d", function()
    vim.diagnostic.goto_prev({ float = false })
end)
keymap("n", "gs", function()
    require("steschw.utils.formatting").format_write()
end)
keymap("n", "gf", function()
    require("steschw.utils.formatting").format()
end)
keymap("n", "gl", function()
    require("steschw.utils.linting").lint()
end)

keymap("n", "<leader>d", function()
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
end)
keymap("n", "gr", function()
    local word = vim.fn.expand("<cword>")

    local function on_list(res)
        res.title = string.format('References "%s"', word)
        res.nr = "$"

        vim.fn.setqflist({}, " ", res)
        vim.cmd("cw")
    end

    vim.lsp.buf.references({ includeDeclaration = false }, {
        on_list = on_list,
    })
end)
keymap("n", "gd", function()
    local word = vim.fn.expand("<cword>")

    local function on_list(res)
        if #res.items == 1 then
            local filename = res.items[1].filename
            vim.cmd.edit(filename)
            return
        end

        res.title = string.format('Definition "%s"', word)
        res.nr = "$"

        vim.fn.setqflist({}, " ", res)
        vim.cmd("cw")
    end

    vim.lsp.buf.definition({
        reuse_win = true,
        on_list = on_list,
    })
end)
keymap("n", "<C-q>", "<cmd>cclose<cr>")
keymap("n", "<leader>t", "<cmd>TodoQuickFix<cr>")

-- git
keymap("n", "gb", "<cmd>Gitsigns blame_line<cr>")
keymap("n", "gp", "<cmd>Gitsigns preview_hunk_inline<cr>")
keymap("n", "[g", "<cmd>Gitsigns next_hunk<cr>")
keymap("n", "]g", "<cmd>Gitsigns prev_hunk<cr>")

-- quickfix
keymap("n", "<leader>q", "<cmd>cw<cr>")
keymap("n", "[q", "<cmd>cnext<cr>")
keymap("n", "]q", "<cmd>cprevious<cr>")

-- misc
keymap("n", "<C-t>", function()
    vim.print(vim.bo.filetype)
end)
keymap("n", "<C-f>", function()
    local filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")
    vim.print(filepath)
    vim.fn.setreg("+", filepath)
end)
keymap("n", "<leader>l", "<cmd>Lazy<cr>")
keymap("n", "?", function()
    local word_under_cursor = vim.fn.expand("<cword>")
    vim.cmd("h " .. word_under_cursor)
end)

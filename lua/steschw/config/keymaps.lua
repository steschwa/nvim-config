local keymap = require("steschw.utils.keys").keymap

keymap("n", "`", "^")

-- better up/down with wrapped lines
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

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
keymap("v", "Q", "<cmd>norm @q<cr>")

-- windows
keymap("n", "wp", "<C-w>v")
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

-- bufferline
keymap("n", "<S-h>", "<cmd>BufferPrevious<cr>")
keymap("n", "<S-l>", "<cmd>BufferNext<cr>")
keymap("n", "<leader>ba", "<cmd>BufferCloseAllButCurrent<cr>")
keymap("n", "<leader>bc", "<cmd>BufferClose<cr>")
keymap("n", "<leader>bh", "<cmd>BufferCloseBuffersLeft<cr>")
keymap("n", "<leader>bl", "<cmd>BufferCloseBuffersRight<cr>")

-- telescope
local telescope = require("telescope.builtin")
keymap("n", "<leader>p", telescope.find_files)
keymap("n", "<leader>f", telescope.live_grep)
keymap("n", "<leader>s", telescope.lsp_document_symbols)
keymap("n", "<leader><leader>", telescope.resume)

-- lsp
keymap("n", "gh", vim.lsp.buf.hover)
keymap("n", "gH", vim.diagnostic.open_float)
keymap("n", "gR", vim.lsp.buf.rename)
keymap("n", "ga", vim.lsp.buf.code_action)
keymap({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help)
keymap("n", "gu", "<cmd>TSToolsRemoveUnusedImports<cr>")
keymap("n", "go", "<cmd>TSToolsSortImports<cr>")
keymap("n", "gi", "<cmd>TSToolsAddMissingImports<cr>")
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

-- trouble
keymap("n", "<leader>d", "<cmd>Trouble document_diagnostics<cr>")
keymap("n", "<leader>q", "<cmd>Trouble quickfix<cr>")
keymap("n", "gr", "<cmd>Trouble lsp_references<cr>")
keymap("n", "gd", "<cmd>Trouble lsp_definitions<cr>")
keymap("n", "<C-q>", "<cmd>TroubleClose<cr>")
keymap("n", "<leader>t", "<cmd>TodoTrouble<cr>")

-- git
keymap("n", "gb", "<cmd>Gitsigns blame_line<cr>")
keymap("n", "gp", "<cmd>Gitsigns preview_hunk_inline<cr>")
keymap("n", "[g", "<cmd>Gitsigns next_hunk<cr>")
keymap("n", "]g", "<cmd>Gitsigns prev_hunk<cr>")

-- misc
keymap("n", "<C-t>", function()
    local bufid = vim.api.nvim_get_current_buf()
    local ft = vim.filetype.match({ buf = bufid })
    print(ft)
end)
keymap("n", "<leader>ui", "<cmd>Inspect<cr>")
keymap("n", "<C-f>", function()
    local filepath = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")

    print(filepath)
    vim.fn.setreg("+", filepath)
end)
keymap("n", "<leader>l", "<cmd>Lazy<cr>")

local keymap = require("steschw.utils.keys").keymap

keymap("n", "`", "^")

-- better up/down with wrapped lines
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- move to window using the <ctrl> hjkl keys
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<C-d>", "<C-d>zz")

-- clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
keymap("n", "<leader>n", "<cmd>noh<cr>")

-- center screen after n/N
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap("n", "n", "'Nn'[v:searchforward]", { expr = true })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true })
keymap("n", "N", "'nN'[v:searchforward]", { expr = true })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true })

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- system clipboard helpers
keymap({ "n", "v" }, "<C-c>", '"+')

-- macros
keymap("n", "<C-x>", "@q")

-- windows
keymap("n", "<leader>wl", "<C-w>v")
keymap("n", "<leader>wq", "<C-w>q")

-- leave insert on jk
keymap("i", "jk", "<esc>")

-- better paste
keymap("v", "p", '"_dP')

-- bufferline
keymap("n", "<S-h>", "<cmd>BufferPrevious<cr>")
keymap("n", "<S-l>", "<cmd>BufferNext<cr>")
keymap("n", "<leader>ba", "<cmd>BufferCloseAllButCurrent<cr>")
keymap("n", "<leader>bq", "<cmd>BufferClose<cr>")
keymap("n", "<leader>bch", "<cmd>BufferCloseBuffersLeft<cr>")
keymap("n", "<leader>bcl", "<cmd>BufferCloseBuffersRight<cr>")

-- telescope
local telescope = require("telescope.builtin")
keymap("n", "<leader>p", telescope.find_files)
keymap("n", "<leader>f", telescope.live_grep)
keymap("n", "<leader>s", telescope.lsp_document_symbols)

-- lsp
keymap("n", "gh", vim.lsp.buf.hover)
keymap("n", "gH", vim.diagnostic.open_float)
keymap("n", "gR", vim.lsp.buf.rename)
keymap("n", "ga", vim.lsp.buf.code_action)
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
    require("lint").try_lint()
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
    print(vim.bo.filetype)
end)
keymap("n", "<leader>ui", "<cmd>Inspect<cr>")
keymap("n", "<C-f>", '<cmd>let @+ = expand("%")<cr>')
keymap("n", "<leader>l", "<cmd>Lazy<cr>")

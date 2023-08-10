local map = require("steschw.utils.keys").map

map("n", "`", "^")

-- better up/down with wrapped lines
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
map("n", "<leader>n", "<cmd>noh<cr>")

-- center screen after n/N
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true })
map("x", "n", "'Nn'[v:searchforward]", { expr = true })
map("o", "n", "'Nn'[v:searchforward]", { expr = true })
map("n", "N", "'nN'[v:searchforward]", { expr = true })
map("x", "N", "'nN'[v:searchforward]", { expr = true })
map("o", "N", "'nN'[v:searchforward]", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
    map("n", "<leader>ui", vim.show_pos)
end

-- system clipboard helpers
map({ "n", "v" }, "<C-c>", '"+')
map("n", "<C-f>", '<cmd>let @+ = expand("%")<cr>')

-- macros
map("n", "<C-x>", "@q")

-- windows
map("n", "<leader>wl", "<C-w>v")
map("n", "<leader>wq", "<C-w>q")

-- close insert on jk
map("i", "jk", "<esc>")

-- better paste
map("v", "p", '"_dP')

-- bufferline
map("n", "<S-h>", "<cmd>BufferPrevious<cr>")
map("n", "<S-l>", "<cmd>BufferNext<cr>")
map("n", "<leader>ba", "<cmd>BufferCloseAllButCurrent<cr>")
map("n", "<leader>bq", "<cmd>BufferClose<cr>")
map("n", "<leader>bch", "<cmd>BufferCloseBuffersLeft<cr>")
map("n", "<leader>bcl", "<cmd>BufferCloseBuffersRight<cr>")

-- telescope
local telescope = require("telescope.builtin")
map("n", "<leader>p", telescope.find_files)
map("n", "<leader>f", telescope.live_grep)
map("n", "<leader>s", telescope.lsp_document_symbols)

-- lsp
map("n", "gh", vim.lsp.buf.hover)
map("n", "gH", vim.diagnostic.open_float)
map("n", "gR", vim.lsp.buf.rename)
map("n", "ga", vim.lsp.buf.code_action)
map("n", "gf", function()
    require("steschw.utils.formatting").format()
end)
map("n", "gu", "<cmd>TypescriptRemoveUnused<cr>")
map("n", "go", "<cmd>TypescriptOrganizeImports<cr>")
map("n", "[d", function()
    vim.diagnostic.goto_next({ float = false })
end)
map("n", "]d", function()
    vim.diagnostic.goto_prev({ float = false })
end)
map("n", "gs", function()
    require("steschw.utils.formatting").format_write()
end)

-- trouble
map("n", "<leader>d", "<cmd>Trouble document_diagnostics<cr>")
map("n", "<leader>q", "<cmd>Trouble quickfix<cr>")
map("n", "gr", "<cmd>Trouble lsp_references<cr>")
map("n", "gd", "<cmd>Trouble lsp_definitions<cr>")
map("n", "<C-q>", "<cmd>TroubleClose<cr>")
map("n", "<leader>t", "<cmd>TodoTrouble<cr>")

-- git
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>")
map("n", "<leader>gd", "<cmd>Gitsigns preview_hunk_inline<cr>")
map("n", "[h", "<cmd>Gitsigns prev_hunk<cr>")
map("n", "]h", "<cmd>Gitsigns next_hunk<cr>")

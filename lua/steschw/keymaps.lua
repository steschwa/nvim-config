local map = require("steschw.utils.keys").map

map("n", "`", "^")

-- better up/down with wrapped lines
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

map("n", "<C-u>", "<C-u>zz", { desc = "Go to right window", remap = true })
map("n", "<C-d>", "<C-d>zz", { desc = "Go to upper window", remap = true })

-- clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- center screen after n/N
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
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

-- file-tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

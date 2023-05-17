local utils_formatting = require("steschw.utils.formatting")
local km = require("steschw.utils.keymap")

local trouble = require("trouble")
local telescope = require("telescope.builtin")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Remap space as leader key
km.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

km.n("<C-h>", "<C-w>h")
km.n("<C-j>", "<C-w>j")
km.n("<C-k>", "<C-w>k")
km.n("<C-l>", "<C-w>l")
km.n("<leader>q", "@q<cr>")
km.n("<C-d>", "<C-d>zz")
km.n("<C-u>", "<C-u>zz")
km.n("n", "nzz")
km.n("<leader>n", "<cmd>noh<cr>")
km.n("&", "<cmd>:&&<cr>")
km.n("`", "^")
km.n("gs", utils_formatting.format_write)

-- Window management
km.n("<leader>wl", "<C-w>v") -- vertical split
km.n("<leader>wq", "<C-w>q") -- close window

-- Telescope
-- km.n("<leader>o", fzf.oldfiles)
-- km.n("<leader><leader>", fzf.resume)
km.n("<leader>p", telescope.find_files)
km.n("<leader>f", telescope.live_grep)
km.n("<leader>q", telescope.quickfix)
km.n("<leader>s", telescope.lsp_document_symbols)

-- Trouble
km.n("<leader>d", "<cmd>Trouble document_diagnostics<cr>")
km.n("<leader>q", "<cmd>Trouble quickfix<cr>")
km.n("<leader>t", "<cmd>TodoTrouble<cr>")
km.n("gr", "<cmd>Trouble lsp_references<cr>")
km.n("gd", "<cmd>Trouble lsp_definitions<cr>")
km.n("<C-n>", function()
    trouble.next({ jump = true, skip_groups = true })
end)
km.n("<C-p>", function()
    trouble.previous({ jump = true, skip_groups = true })
end)
km.n("<C-q>", "<cmd>TroubleClose<cr>")

-- Nvim Tree
km.n("<leader>e", vim.cmd.NvimTreeFindFileToggle)

-- Buffer management
km.n("<S-h>", vim.cmd.BufferPrevious)
km.n("<S-l>", vim.cmd.BufferNext)
km.n("<leader>bp", vim.cmd.BufferPick)
km.n("<leader>ba", vim.cmd.BufferCloseAllButCurrent)
km.n("<leader>bq", vim.cmd.BufferClose)
km.n("<leader>bch", vim.cmd.BufferCloseBuffersLeft)
km.n("<leader>bcl", vim.cmd.BufferCloseBuffersRight)
km.n("<leader>b1", "<cmd>BufferGoto 1<cr>")
km.n("<leader>b2", "<cmd>BufferGoto 2<cr>")
km.n("<leader>b3", "<cmd>BufferGoto 3<cr>")

-- Harpoon
km.n("<leader>h", harpoon_ui.toggle_quick_menu)
km.n("<leader>a", harpoon_mark.add_file)

-- Marks
km.n("<leader>m", "<cmd>MarksListBuf<cr>")

-- Git
km.n("<leader>g", "<cmd>GitMessenger<cr>")
-- Disable default <Space>gm binding to prevent delay for <Space>g
vim.g.git_messenger_no_default_mappings = true

-- LSP
km.n("gh", vim.lsp.buf.hover)
km.n("gH", vim.diagnostic.open_float)
km.n("gR", vim.lsp.buf.rename)
km.n("ga", vim.lsp.buf.code_action)
km.n("gf", utils_formatting.format)
km.n("gu", "<cmd>TypescriptRemoveUnused<cr>")
km.n("go", "<cmd>TypescriptOrganizeImports<cr>")
km.n("[d", function()
    vim.diagnostic.goto_next({ float = false })
end)
km.n("]e", function()
    vim.diagnostic.goto_prev({ float = false })
end)

km.i("jk", "<Esc>")

-- Trouble
km.i("<C-n>", function()
    trouble.next({ jump = true })
end)
km.i("<C-p>", function()
    trouble.previous({ jump = true })
end)
km.i("<C-q>", "<cmd>TroubleClose<cr>")

km.v("<", "<gv")
km.v(">", ">gv")
km.v("p", '"_dP')

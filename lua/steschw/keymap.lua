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
km.n("<tab>", '"+')

-- Movement
local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
km.n(";", ts_repeat_move.repeat_last_move)
km.n(",", ts_repeat_move.repeat_last_move_opposite)
km.n("f", ts_repeat_move.builtin_f)
km.n("F", ts_repeat_move.builtin_F)
km.n("t", ts_repeat_move.builtin_t)
km.n("T", ts_repeat_move.builtin_T)

-- Window management
km.n("<leader>wl", "<C-w>v") -- vertical split
km.n("<leader>wq", "<C-w>q") -- close window

-- Telescope
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
    pcall(trouble.next, { jump = true })
end)
km.n("<C-p>", function()
    pcall(trouble.previous, { jump = true })
end)
km.n("<C-q>", "<cmd>TroubleClose<cr>")

-- Nvim Tree
km.n("<leader>e", vim.cmd.NvimTreeFindFileToggle)

-- Buffer management
km.n("<S-h>", "<cmd>BufferPrevious<cr>")
km.n("<S-l>", "<cmd>BufferNext<cr>")
km.n("<leader>bp", "<cmd>BufferPick<cr>")
km.n("<leader>ba", "<cmd>BufferCloseAllButCurrent<cr>")
km.n("<leader>bq", "<cmd>BufferClose<cr>")
km.n("<leader>bch", "<cmd>BufferCloseBuffersLeft<cr>")
km.n("<leader>bcl", "<cmd>BufferCloseBuffersRight<cr>")

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
km.n("]d", function()
    vim.diagnostic.goto_prev({ float = false })
end)

km.i("jk", "<Esc>")

-- Trouble
km.i("<C-n>", function()
    pcall(trouble.next, { jump = true })
end)
km.i("<C-p>", function()
    pcall(trouble.previous, { jump = true })
end)
km.i("<C-q>", "<cmd>TroubleClose<cr>")

km.v("<", "<gv")
km.v(">", ">gv")
km.v("p", '"_dP')
km.v("<tab>", '"+')

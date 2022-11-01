vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.iskeyword:append "-"

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<leader>n", ":noh<cr>", opts)

-- VSCode Nvim mappings
keymap("x", "gc", "<Plug>VSCodeCommentary", opts)
keymap("n", "gc", "<Plug>VSCodeCommentary", opts)
keymap("o", "gc", "<Plug>VSCodeCommentary", opts)
keymap("n", "gcc", "<Plug>VSCodeCommentaryLine", opts)

keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
